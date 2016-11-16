https://juliannma.com
====================
This site, `juliannma.com` is hosted via [GitLab Pages][glpages], and is generated from [markdown][markdown] via heavily scripted [Jekyll][jekyll], a blog-friendly high level tool for generating static websites.

Creating articles
-----------------

To create an article, add a `markdown` document to `_posts/`.
This new file should be named `<DATE>-<TITLE>`, for example `2016-02-03-my_article.md`.
Each file of this format in `_posts/` will be shown on the articles pages of the site in reverse chronological order.

Each article should include a *front matter* (some metadata which the site will use to contextualize the article), much like the following:

    ---
    layout: post
    title:  "My amazing article"
    banner: http://domain.com/picture.jpg
    excerpt_separator: <!--excerpt-->
    ---

The article itself should be written in the markdown language ([helpful cheatsheet][gl-markdown]), which is great at endowing text with some basic content organization tools like sections and itemized lists. The `excerpt separator` defines where to end snippets for article preview views (without it, the first paragraph is the excerpt).

Static resources stored externally
----------------------------------
Images and other resources ill-suited for a `git` repository are linked.
We host images and other external resources via `static.hackartscience.com`, a static file server, which we can manage via a variety of means including an `OwnCloud` portal.

SSL Certificate
---------------
GitLab pages is nice enough to offer custom certificates! We use the excellent and free [letsencrypt.org][letsencrypt] for all of our certificate needs.

[glpages]: https://pages.gitlab.io/
[hackartscience.com]: http://hackartscience.com
[jekyll]: https://jekyllrb.com/
[letsencrypt]: https://letsencrypt.org/
[markdown]: http://kramdown.gettalong.org/
[gl-markdown]: https://docs.gitlab.com/ee/user/markdown.html
