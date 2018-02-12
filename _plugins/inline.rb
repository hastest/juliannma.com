module Jekyll
  module Tags
    class InlineTagError < StandardError
      attr_accessor :path

      def initialize(msg, path)
        super(msg)
        @path = path
      end
    end

    class InlineTag < Liquid::Tag
      VALID_SYNTAX = %r!
        ([\w-]+)\s*=\s*
        (?:"([^"\\]*(?:\\.[^"\\]*)*)"|'([^'\\]*(?:\\.[^'\\]*)*)'|([\w\.-]+))
      !x

      def initialize(tag_name, markup, tokens)
        super
        @data = Liquid::Template.parse(markup)
        @tag_name = tag_name
      end

      def syntax_example
        "{% #{@tag_name} file=path/to/file param='value' param2='value' %}"
      end

      def parse_params(markup, context)
        params = {}
        while (match = VALID_SYNTAX.match(markup))
          markup = markup[match.end(0)..-1]
          value = if match[2]
                    match[2].gsub(%r!\\"!, '"')
                  elsif match[3]
                    match[3].gsub(%r!\\'!, "'")
                  elsif match[4]
                    context[match[4]]
                  end

          params[match[1]] = value
        end
        params
      end

      def validate_file_name(file)
        if file !~ %r!^[a-zA-Z0-9_/\.-]+$! || file =~ %r!\./! || file =~ %r!/\.!
          raise ArgumentError, <<-MSG
Invalid syntax for inline tag. File contains invalid characters or sequences:

  #{file}

Valid syntax:

  #{syntax_example}

MSG
        end
      end

      # Grab file read opts in the context
      def file_read_opts(context)
        context.registers[:site].file_read_opts
      end

      # Render the variable if required
      def render_variable(context)
        if @file.match(VARIABLE_SYNTAX)
          partial = context.registers[:site]
            .liquid_renderer
            .file("(variable)")
            .parse(@file)
          partial.render!(context)
        end
      end

      def tag_inline_dirs(context)
        ["."].freeze
      end

      def locate_inline_file(context, file, safe)
        inlines_dirs = tag_inline_dirs(context)
        inlines_dirs.each do |dir|
          path = File.join(dir.to_s, file.to_s)
          return path if valid_inline_file?(path, dir.to_s, safe)
        end
        raise IOError, could_not_locate_message(file, inlines_dirs, safe)
      end

      def render(context)
        data = parse_params(@data.render(context).strip, context)
        file = data["file"]

        site = context.registers[:site]

        validate_file_name(file)

        path = locate_inline_file(context, file, site.safe)
        return unless path

        add_inline_to_dependency(site, path, context)

        partial = load_cached_partial(path, context)

        context.stack do
          begin
            # partial.render!(context)
            partial = Page.new(site, site.source, '', path)
            site.site_payload["site"]["inline"] = data
            partial.render(site.layouts, site.site_payload)
            partial.output
          rescue Liquid::Error => e
            e.template_name = path
            e.markup_context = "inlined " if e.markup_context.nil?
            raise e
          end
        end
      end

      def add_inline_to_dependency(site, path, context)
        if context.registers[:page] && context.registers[:page].key?("path")
          site.regenerator.add_dependency(
            site.in_source_dir(context.registers[:page]["path"]),
            path
          )
        end
      end

      def load_cached_partial(path, context)
        context.registers[:cached_partials] ||= {}
        cached_partial = context.registers[:cached_partials]

        if cached_partial.key?(path)
          cached_partial[path]
        else
          unparsed_file = context.registers[:site]
            .liquid_renderer
            .file(path)
          begin
            cached_partial[path] = unparsed_file.parse(read_file(path, context))
          rescue Liquid::Error => e
            e.template_name = path
            e.markup_context = "inlined " if e.markup_context.nil?
            raise e
          end
        end
      end

      def valid_inline_file?(path, dir, safe)
        !outside_site_source?(path, dir, safe) && File.file?(path)
      end

      def outside_site_source?(path, dir, safe)
        safe && !realpath_prefixed_with?(path, dir)
      end

      def realpath_prefixed_with?(path, dir)
        File.exist?(path) && File.realpath(path).start_with?(dir)
      rescue StandardError
        false
      end

      # This method allows to modify the file content by inheriting from the class.
      def read_file(file, context)
        File.read(file, file_read_opts(context))
      end

      private

      def could_not_locate_message(file, inlines_dirs, safe)
        message = "Could not locate the inlined file '#{file}' in any of "\
          "#{inlines_dirs}. Ensure it exists in one of those directories and"
        message + if safe
                    " is not a symlink as those are not allowed in safe mode."
                  else
                    ", if it is a symlink, does not point outside your site source."
                  end
      end
    end
  end
end

Liquid::Template.register_tag("inline", Jekyll::Tags::InlineTag)
