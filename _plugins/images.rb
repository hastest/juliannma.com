module Jekyll
  class GeneratedImageFile < StaticFile
    def initialize(site, src_path, size, name)
      super(site, "/", "static/", "../" + name)
      @src_path = src_path
      @size = size
      @modified_time = Time.now
    end

    def modified_time
      @modified_time
    end

    def write(dest)
      require 'micro_magick'
      p "Working on file %s" % dest
      dest_path = destination(dest)

      #if file is already given, return true
      p "DEST: %s" % dest_path
      if File.file?(dest_path) && (File.mtime(dest_path) > File.mtime(@src_path))
        p "(a recent file already exists)"
        return true
      end

      image = MicroMagick::Image.new(@src_path)

      # Small: High compression (< ~10KB)
      # Large: medium/low compression (< 100KB)
      # Original: unmodified

      case @size
      when "image_small"
        p "Resizing %s (small)" % @src_path
        image.resize("480>").add_output_option("-sampling-factor \"4:2:0\"").intent("Perceptual").quality(80).dither.interlace("Line")
      when "image_large"
        p "Resizing %s (small)" % @src_path
        image.resize("1843>").add_output_option("-sampling-factor \"4:2:0\"").intent("Perceptual").quality(90).dither.interlace("Line")
      else
        p "Leaving image at its original resolution"
      end

      p "writing file... to %s" % dest_path
      FileUtils.mkdir_p(File.dirname(dest_path))
      image.write(dest_path)
      true
    end
  end

  module Tags
    class ImageTag < Liquid::Tag

      def initialize(tag_name, markup, tokens)
        super
        @file = Liquid::Template.parse(markup)
        @tag_name = tag_name

        if tag_name == "image_small"
          @ext = "_S.jpg"
        elsif tag_name == "image_large"
          @ext = "_L.jpg"
        else
          @ext = ".jpg"
        end
      end

      def render(context)
        require 'digest'
        src_path = @file.render(context).strip
        dest_name = Digest::SHA256.hexdigest(src_path)[0..15] + @ext

        # Is this image already generated?
        site = context.registers[:site]
        context["images"] ||= {}

        if context["images"][dest_name]
          p "Image %s already queued for generation!" % dest_name
        else
          p "Queuing image %s (from %s)" % [dest_name, src_path]
          context["images"][dest_name] = true
          site.static_files.push( Jekyll::GeneratedImageFile.new(site, src_path, @tag_name, dest_name) )

        end

        return "/static/"+dest_name
      end
    end
  end

  # A generator is not appropriate for this, as generators are run before the pages are built (but after inventory)

end

Liquid::Template.register_tag("image_small", Jekyll::Tags::ImageTag)
Liquid::Template.register_tag("image_large", Jekyll::Tags::ImageTag)
Liquid::Template.register_tag("image_original", Jekyll::Tags::ImageTag)
