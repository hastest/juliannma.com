
all: build

_site: build

build:
	bundle exec jekyll build # && echo "$$!" > $(PID_FILE)

preview: _site
	cd _site && python3 -m http.server 4000 # run preview

refresh:
	#!/bin/sh
	git stash
	git commit --allow-empty -m "forced rebuild"
	git push
	git stash apply
	echo "#############"
	echo "## Done. You can check on the status of this rebuild at:"
	echo "https://gitlab.com/ilebedev/juliannma.com/pipelines"
	echo "#############"

publish:
	git stash
	git pull
	git stash apply
	git add .
	git commit -m "$1"
	git push
	git status
	echo "#############"
	echo '## Above, you should see: "'
	echo ""
	echo "    On branch master"
	echo "    Your branch is up-to-date with 'origin/master'."
	echo "    nothing to commit, working tree clean '"
	echo ""
	echo "( if not, read above to see what went wrong)"

clean:
	rm -rf _site

initial_setup: prerequisites-osx

prerequisites-osx:
	echo "Install HOMEBREW : an package manager for development tools and other open-source components."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	echo "Install RVM"
	gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
	curl -sSL https://get.rvm.io | bash -s stable --ruby
	echo "Install native tools needed for the site"
	brew install imagemagick graphicsmagick exiftool
	echo "Fetch dependencies for the site"
	bundle install
	echo "Install transparent handling of media files"
	brew install git-lfs
	git lfs install
	echo "Fetch media files"
	git lfs fetch
	echo "All done!"
