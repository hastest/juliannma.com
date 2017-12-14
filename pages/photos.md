---
layout: page
title: Select Photographs
# subtitle: hi!
permalink: /photos/
---

Select Photographs
=========

<div class="photo-ribbon" >

  <a class="gallerey-image"
    href="https://static.hackartscience.com/juliannma/photos/0.jpg">
    <img src="/media/0.jpg"
          title="photo credit: Brian Santich" />
  </a>
  <a class="gallerey-image"
    href="https://static.hackartscience.com/juliannma/photos/carnegie.jpg">
    <img src="/media/carnegie.jpg" />
  </a>
  <a class="gallerey-image"
    href="https://static.hackartscience.com/juliannma/photos/seas_shoot.jpg">
    <img  src="/media/seas_shoot.jpg"
          title="SEAS photoshoot. Photo credit: <a href='https://ilia.hackartscience.com'>Ilia Lebedev</a>"/>
  </a>
  <a class="gallerey-image"
    href="https://static.hackartscience.com/juliannma/photos/carnegie_dancers.jpg">
    <img src="/media/carnegie_dancers.jpg" />
  </a>
  <a class="gallerey-image"
    href="https://static.hackartscience.com/juliannma/photos/1.jpg">
    <img src="https://static.hackartscience.com/juliannma/photos/1.jpg" />
  </a>
  <a class="gallerey-image"
    href="https://static.hackartscience.com/juliannma/photos/2.jpg">
    <img src="https://static.hackartscience.com/juliannma/photos/2.jpg" />
  </a>
  <a class="gallerey-image"
    href="https://static.hackartscience.com/juliannma/photos/3.jpg">
    <img src="https://static.hackartscience.com/juliannma/photos/3.jpg" />
  </a>
  <a class="gallerey-image"
     href="https://static.hackartscience.com/juliannma/photos/4.jpg">
    <img src="https://static.hackartscience.com/juliannma/photos/4.jpg" />
  </a>
  <a class="gallerey-image"
     href="https://static.hackartscience.com/juliannma/photos/5.jpg">
    <img src="https://static.hackartscience.com/juliannma/photos/5.jpg" />
  </a>
  <a class="gallerey-image"
     href="https://static.hackartscience.com/juliannma/photos/6.jpg">
    <img src="/media/6.jpg" />
  </a>
  <a class="gallerey-image"
     href="https://static.hackartscience.com/juliannma/photos/7.jpg">
    <img src="https://static.hackartscience.com/juliannma/photos/7.jpg" />
  </a>
  <a class="gallerey-image"
     href="https://static.hackartscience.com/juliannma/photos/8.jpg">
    <img src="/media/8.jpg" />
  </a>
  <a class="gallerey-image"
     href="https://static.hackartscience.com/juliannma/photos/9.jpg">
    <img src="/media/9.jpg" />
  </a>
  <a class="gallerey-image"
     href="https://static.hackartscience.com/juliannma/photos/10.jpg">
    <img src="/media/10.jpg" />
  </a>
</div>

{% include plumbing/luminous.html %}

<script>
  var luminous_gallerey_options = {
    // Whether pressing the arrow keys should move to the next/previous slide.
    arrowNavigation: true,
  };

  var luminous_options = {
    // Prefix for generated element class names (e.g. `my-ns` will
    // result in classes such as `my-ns-lightbox`. Default `lum-`
    // prefixed classes will always be added as well.
    namespace: null,
    // Which attribute to pull the lightbox image source from.
    sourceAttribute: 'href',
    // Captions can be a literal string, or a function that receives the Luminous instance's trigger element as an argument and returns a string. Supports HTML, so use caution when dealing with user input.
    caption: function(trigger) {
          return trigger.querySelector('img').getAttribute('title');
        },
    // The event to listen to on the _trigger_ element: triggers opening.
    openTrigger: 'click',
    // The event to listen to on the _lightbox_ element: triggers closing.
    closeTrigger: '',
    // Allow closing by pressing escape.
    closeWithEscape: true,
    // Automatically close when the page is scrolled.
    closeOnScroll: true,
    // A selector defining what to append the lightbox element to.
    appendToSelector: 'body',
    // If present (and a function), this will be called
    // whenever the lightbox is opened.
    onOpen: null,
    // If present (and a function), this will be called
    // whenever the lightbox is closed.
    onClose: null,
    // When true, adds the `imgix-fluid` class to the `img`
    // inside the lightbox. See https://github.com/imgix/imgix.js
    // for more information.
    includeImgixJSClass: false,
    // Add base styles to the page. See the "Theming"
    // section of README.md for more information.
    injectBaseStyles: true,
  };

  new LuminousGallery(document.querySelectorAll('.gallerey-image'), luminous_gallerey_options, luminous_options);
</script>
