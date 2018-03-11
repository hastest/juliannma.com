# https://juliannma.com

This site, `juliannma.com` is hosted via [GitLab Pages][glpages], and is generated from [markdown][markdown] (via heavily scripted [Jekyll][jekyll], a blog-friendly high level tool for generating static websites).
Photographs and other image media are handled transparently via [git-lfs][git-lfs], while sound, video, etc. are relegated to the platforms that handle them best: YouTube, Sound Cloud, etc. In odd cases, large static files may be served from elsewhere, such as the [hackartscience.com][] cloud.

hi!

## Warning: privacy  of published information

Anything you publish to the web in general, and with this infrastructure in particular is no longer private.

Published information may be copied, cached by search engines and browsers, and should be considered public forever.
There is no way to reliably "un-publish" information, even if you promptly it from your website, and scrub it from GitLab's history.

Be very careful to avoid publishing unwanted or sensitive information or files. This includes parts of the site that are not easily visible in the browser, such as unlinked files, or `<!-- comments -->`.

If you accidentally publish passwords, sensitive information, etc, you should try to scrub it ASAP, which is tricky and not guaranteed; consider the information compromised (e.g if these are passwords, change them *immediately*).
[This](https://help.github.com/articles/removing-sensitive-data-from-a-repository/) is a guide, but the exact steps will very case by case.

## Feature Requests

- Fix HTML showing in hover text on images.
- Add carousel view.
- Update this readme
- Blog entries, to be discussed with Jules
- Make script to install prerequisites to simplify future installations from scratch.

## Table of Contents

1. [Site architecture, briefly](#site-architecture-briefly)
2. Tutorials for common edits to the site:
   - [Minor edits](#minor-edits)
   - [Creating events](#creating-events)
   - [Editing or deleting events](#editing-or-deleting-events)
   - [Adding/editing pictures in the gallery](#addingediting-pictures-in-the-gallery)
3. [Website chores](#website-chores)
4. Tutorials for basic tools and infrastructure:
   - [Atom editor](#atom-editor)
5. Advanced tutorials, just in case:
   - [ADVANCED: Terminal](#terminal-command-line-mini-tutorial)
   - [ADVANCED: Git (version  control and publishing)](#git-tools-for-version-control-and-publishing-tutorial)
   - [ADVANCED: juliannma.com domain](#juliannmacom-domain-administration-micro-tutorial)
   - [ADVANCED: Jekyll, the website generator](#jekyll-this-website-generator-micro-tutorial)

## Site architecture, briefly

Most pages are in `pages/`, and some special files (like a list of pages for Google) are in `public_files`.
Most pages are written in [Markdown][markdown] ([a cheatsheet][gl-markdown], for your convenience), which makes adding simple styles like headings, paragraphs, lists, quotes, links, pictures, etc. easy  and consistent.

There exist a few distinct layouts:
- A straightforward page (like `seas`, or `lessons`)
- A gallery page (like `photos`)
- A composite page madeof sections of above types (like `performances`, or the front page).

Most content edits you would wish to make can be confined to files inside `pages/`.

There are a few pages that *generate* content based on other things, and are therefore not very useful to edit directly:

- Your events/concerts page (`pages/concerts-gatherings.md`), which reads events from `_events/`.

The website is styled with CSS (Actually, SCSS that gets compiled to CSS, to be precise, but is largely irrelevant), and editing the styles without the help of someone who knows the web media model is probably a frustrating exercise. Feel free to explore! The styles are in `css/main.scss`.
It's a little unfortunate, but there are a _lot_ of knowlegeable individuals with expertise in CSS styles out there.

## Tutorials for website edits

Here, we describe some common tasks.

### Minor edits

Let's add a few words to the `seas` page.

Before we do anything else, let's fetch the latest version of your site from the internet. Your local copy is usually up-to-date, since you are the editor-in-chief, but let's be sure. The system won't allow you to blow away any changes, but it's easiest to avoid conflicts altogether.

In the lower right corner of the Atom window (probably this window), there is a footer with two arrows and a few other things. These interact with [git][git], which is the tool we use to publish your site.

1. Click on the down arrow in the lower right hand corner of this window.
2. Click "pull" on the button that pops up.

Great! You now have the latest copy (In the unlikely case of concurrent edits leading to merge conflicts, you can work through them easily enough).

Open up `pages/seas.md`, and add whatever changes you wish.

See if the site functions correctly with local preview:

1. your local copy of the site will automagically re-build itself every time you save a file in Atom. If this doesn't happen for some reason, run `make` in a terminal at the website folder.
2. A running local preview will serve the up-to-date website after it builds. To start the local preview, run `make preview` in a terminal at the website folder.

Looks great! Let's go ahead and publish it. Press `F8` to bring up the `git` interface in Atom.

1. **Stage** (previously `git add`) the edits you wish to publish. If you want to publish all your edits, "stage all" in the top right is the way to go. Otherwise, cherry pick the files you wish to update on the live website.
2. **Commit** your staged edits, taking care to briefly describe what the edits are (lower right hand corner).
3. **Push** (publish) your edits: press the up arrow in the footer (bottom right), then "Push" button.

The website will now build (at MIT/hackartscience or Amazon cloud, whichever is first available), and will go live in a few minutes.

### Creating events

Let's add an event, for example "Sassy drinks with Juliann" as a new file in `_events/2018/sassy-drinks.md` (file name doesn't matter, as long as it ends in `.md`).
Create yearly folders, as needed (add a `2018` folder if none exists).

At a minimum, `sassy-drinks.md` **must** include some *metatadata* (also called a *"front matter"*), which goes between a pair of `---` markers at the *top* of the event file:

```
---
title: Sassy drinks with Juliann
date: January 2019 19:30
location: The Hawthorne, Boston, MA
---

(event description goes here, in Markdown syntax)

```

The above describes an event titled "Sassy drinks with Juliann" (arbitrary text given by `title`) taking place at The Hawthorne in Bosotn (arbitrary text given by `location`).

The event is scheduled for 7:30 PM, as given by `date`, which *must* be formatted in a machine-readable manner (This is quite flexible in practice, but conservatively, any prefix of `2018-01-24 20:30:00 -0500` works, which encodes the date as `YYYY-MM-DD HH-MM-SS TIMEZONE`), meaning `"tomorrow"` is not a valid date and will cause problems when building the site.

In addition to the 3 metadata entries that are required, a few additional ones are optional:

- `short_title: Sassy drinks`, which is arbitrary text. If given, this is the title that will be displayed in the list of events. The full title will show up in the calendar.
- `short_location: Hawthorne, Boston`, which is arbitrary text. If given, this is the location that will be displayed in the list of events. The full location will be given in the calendar.
- `rsvp_link: https://www.thehawthornebar.com/`, a URL. If present, the website will include a prominent "RSVP" link next to the event. Do be sure the URL links to the right place before you publish. Try to keep the URL short! None of the `?ref=2987bjk23b4jh23g4jh23g4jhg234` garbage at the end, please.

The body of the event itself (everything below the metadata) should be written in the markdown language ([helpful cheatsheet][gl-markdown]), which is great for styling text in simple ways.
If you absolutely must get crazy (think twice before you decide you do), you can add arbitrary HTML inside markdown documents.

For now, let's keep things nice and simple. The entire event:

```
---
title: Sassy drinks with Juliann
date: 2018-01-24 20:30:00 -0500
location: The Hawthorne, Boston, MA
`rsvp_link: https://www.thehawthornebar.com/`
---

Juliann needs a drink! Come keep her company and discuss art, music, life, and your day with her at the excellent Hawthorne cocktail lounge in [snowy](weather.com/weather/tenday/l/USMA0046:1:US) Boston.

![Tiki cocktail](https://theferventshaker.files.wordpress.com/2015/08/mai-tai.jpg)

Rules
-----

The rules for this event are simple. They are:

1. Drinking
2. Magic

Cheers, and see you there.

```

Go ahead and see how this shows up in the local preview, but maybe don't publish this event to the live website.

### Editing or deleting events

Simply edit or delete the event's file from `_events/event-file.md`, substituting whatever is needed for `event-file`.
Refer to event creation tutorial for guidance.

Remember that `date` metadata must be formatted correctly, and preview the changes locally before publishing the site.

### Adding/editing pictures in the gallery

The gallery lives in `pages/photos.md`, and that's the file you want to edit.
This page doesn't have a ton of content, but instead relies on a list of featured photographs (`photos`) in the metadata. Each photograph has three pieces of data that describe it (followed by an empty line):

```
   - title: "The Title for this Photograph"
   - source: "file_in_media_folder.jpg"
   - photo_credit: "Some Person, 1890"

```

When the website builds, it will find this and all other pictures (in `media/`), and will get them ready for the web. Specifically, photo metadata (*taken with an iPhone 4S at 5pm on a Tuesday in Central Park by Juliann Ma*) will be removed, the color space will be converted to a web-friendly one, and the picture will be resized and compressed in a sophisticated way to make it load quickly but look good. Magic!

To add a photo, put it in the `media/` folder, add a mention of it (as described above) in `pages/photos.md` (and/or the relevant front page section).

Check it out in local preview, and if all looks well, publish.

### Adding pictures in other pages

- Small picture: `[This is my picture]({% image_small media/my-favorite-picture.jpg %})`
- Large picture: `[This is my picture]({% image_large media/my-favorite-picture.jpg %})`


## Technical reference for this site

### Prerequisites

You will need a `git` client, `graphicsmagick` (`gm convert`, to be specific), `ruby` (`2.3.6`), `bundler`, and a wealth of ruby gems. On OSX (A macbook, for example), you can make all of this happen as follows:

1. Install [homebrew](https://brew.sh/) - a package manager for various things Apple hasn't included.
2. Install [RVM](https://rvm.io/) - a manager for ruby installations that will prevent this site from messing with other software on your laptop.
3. Install ruby `2.3.6`: `rvm install 2.3.6 && rvm use 2.3.6 --default`
4. Install [git](https://git-scm.com/): `brew install git` - a very common version control system that we will use to publish the site.
5. Install [graphicsmagick](http://www.graphicsmagick.org/) - a library for resizing and compressing images: `brew install graphicsmagick`.
6. Install the ruby gems the website requires (in the website's folder): `bundle install`.

### SSL Certificate
GitLab pages is nice enough to offer custom certificates! We use the excellent and free [letsencrypt.org][letsencrypt] for all of our certificate needs.

## Website chores

- Peek at the [visitor statistics](https://analytics.google.com/analytics/web/#embed/report-home/a62085326w97000748p101157333/) and the [search statistics](https://www.google.com/webmasters/tools/dashboard?hl=en&pli=1&siteUrl=https%3A%2F%2Fjuliannma.com%2F) for this website from time to time, they are sometimes interesting.
- Update the certificate (used for HTTPS) for this site every few months.
- Keep text on the site coherent with the prensent (don't excitedly talk about "future" events that have already passed), update broken links, etc.

## Tool and infrastructure tutorials

### Terminal, command line mini-tutorial

Do be careful, as the terminal won't ask you for confirmations and there is no way to un-delete things if you accidentally move a file over a folder with the same name, for example.

Your file system is a tree rooted in a folder called `/`, with _everything_ in your computer residing in various sub-folders.
A hypothetical `file.txt` in this root folder has the path `/file.txt`, and `/subfolder/another_file.txt` is the epath to a file called `anoter_file.txt` in a subfolder named `subfolder` of the root.
Apple likes to make it seem like a bunch of special and separate folders (`Applications`, `Desktop`, `Downloads`, etc.), but they too are rooted in `/`.
For example, a sub-folder named `juliannma.com` in a folder `projects` on the desktop on my laptop really lives in `/Users/ilebedev/Desktop/projects/juliannma.com`.
Apple's *Finder* app on a Mac lets you see the contents of a folder and go up/down along the tree. It unfortunately makes it difficult to get out of places like `/Users/ilebedev/Desktop` by pretending these paths are special.

The *Terminal* is very similar (it works in one folder at a time), but uses text commands instead of buttons/keys/menus, and does things without confirmations and with no possibility to undo mistakes (no trash can, sorry).

To open a terminal in a given folder:
1. Open up a terminal
2. Type `cd ` (with a space).
3. Drag the folder from a finder/desktop window onto the terminal window. It will paste the path to that folder.
4. Press `enter` on your keyboard.

If that's annoying, there are [shortcuts](https://apple.stackexchange.com/questions/11323/how-can-i-open-a-terminal-window-directly-from-my-current-finder-location).

Now let's see some commands:

- `pwd` - print a path to the current directory.
- `cd path/to/sub-folder` - move the terminal's current directory into subfolders `path`->`to`->`sub-folder` relative to where it starts.
- `cd /absolute/path/to/folder` - replace the current directory path with `/absolute/path/to/folder`.
- `ls` - print the contnets of the folder, omitting hidden (files with naes starting with `.`) files.
- `ls -al` - print everything in the folder, including hidden files, and give a bunch of information about each file.
- `mv existing_file new_file` - rename the file `existing_file` to `new_file`. **Caution**: if a file called `new_file` exists, it will be lost forever.
- `mv -r existing_folder new_folder` - rename the folder `existing_folder` to `new_folder`. **Caution**: if a file called `new_folder` exists, it will be lost forever.
- `mv path/to/file existing_folder/` - move `file` from the folder `path/to` into `existing_folder` **Caution**: same as above.
- `cp existing_file new_file` - copy the file `existing_file` to `new_file`. **Caution**: if a file called `new_file` exists, it will be lost forever.
- `cp -r existing_folder new_folder` - copy the folder `existing_folder` to `new_folder`. **Caution**: if a file called `new_folder` exists, it will be lost forever.
- `rm existing_file`
- `rm -rf existing_folder`

The terminal lets you run one command at a time, and some commands don't stop on thir own when you run them.
To stop slow or continuous jobs, send a `control`+`c` to the terminal window.

For example, run `top`, which shows information about currently running programs. It won't stop until you press `control`+`c` keys.

### Git, tools for version control and publishing, tutorial

Git is a collaboration tool, and is great for making sure your (text) files are backed up, and their history of changes is preserved and available.
Git is a **terrible** place for giant binary files like photos, audio, video, etc. Try not to put these, unless they are tiny (<100KB or so).

One can do a lot of complicated things with Git, but we will use it in a simple way:

- There is a *master* copy of your website, publically hosted by GitLab. It is located at `git@gitlab.com:ilebedev/juliannma.com.git`, and has a [convenient web user interface](https://gitlab.com/ilebedev/juliannma.com).
- There is a *local* copy of your website in some folder, probably `/Users/jsma/Desktop/website`. The local copy knows its *origin*, which is the remote copy. You can pupblish (*push*) your edits to the origin, and you can update your copy from the origin (*pull*).

GitLab is set up to atuomagically re-build your website from the master copy on GitLab:

- Every night at 4 AM (configured [here](https://gitlab.com/ilebedev/juliannma.com/pipeline_schedules)) in order, for example, to keep future/past events coherent with today's date.
- Every time you *push* (publish) from your local copy.

The site is rebuilt using instructions in `.gitlab-ci.yml`, using the first available build server: public servers, which are free for limited use on a first-come-first-served basis, and the dedicated [hackartscience.com][hackartscience.com] build server, which tends to be readily available.
GitLab takes the biuld results and publishes them under juliannma.com, as configured [here](https://gitlab.com/ilebedev/juliannma.com/pages).

### juliannma.com domain administration micro-tutorial

It is the reponsibility of the domain administrator (currently you, on [Google Domains](https://domains.google.com/registrar) to point `juliannma.com` to GitLab's server.
To do this, Google Domanins has a DNS entry `@` of type `A` (address), with the value `52.167.214.135` (GitLab's address).
(`@` is the top-level domain, whereas a `hello` entry would apply to `hello.juliannma.com`).

You can also manage your mail forwarding options for emails sent to `something@juliannma.com` from the same admin tool at Google Domains.

Warning: do be careful editing your domain!
Think twice and don't do things you don't understand fully.
If you allow someone else to take ownership of it, they *will*, very quickly, and you may lose your domain forever (there are automated bots that snatch unlocked domains and try to sell them back to you for a steep fee).

Contact the Google Domains support if you want to transfer ownership of the `juliannma.com` domain, they are very helpful.

### Jekyll, this website generator, micro-tutorial

You will want to see a local preview of your site while you edit, and certainly before publishing it.
To start the local preview (it won't stop on its own), run the following in your website directory in a Terminal:

```
bundle exec jekyll serve
```

You can see the preview by visiting [localhost:4000](localhost:4000), or probably also [127.0.0.1:4000](127.0.0.1:4000), which is generally another way to describe the same address.
This preview is **not visible outside of your computer** (unless you did some very bad and complicated things in your network settings).

To stop the local preview and get your terminal back, press `control`+`c`.

While this command is basically word soup, here's what it means: `bundle exec <command>` runs  `<command>` in an environment defined by `Gemfile` located in this folder (use specific versions of various tools),
and `jekyll serve` builds the site into a sub-folder `_site`, and makes the contents available at `localhost:4000` while the command runs.

While running, the local preview will detect changes to the website files and will re-build the preview as needed.

If an error is found, Jekyll will print (usually in bright colors) a bunch of error messages into the  terminal, and **will not update the preview**.
If you keep refreshing the page, and your edits aren't showing up, you probably made an error  that prevents the  site from building.

Edits to global variables defined in `_config.yml` are only seen if you stop and re-start the local preview.

[glpages]: https://pages.gitlab.io/
[git-lfs]: https://git-lfs.github.com/
[hackartscience.com]: http://hackartscience.com
[files.hackartscience]: http://files.hackartscience.com
[jekyll]: https://jekyllrb.com/
[letsencrypt]: https://letsencrypt.org/
[markdown]: http://kramdown.gettalong.org/
[gl-markdown]: https://docs.gitlab.com/ee/user/markdown.html
