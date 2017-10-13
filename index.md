---
layout: fullpage
permalink: /
---

<main id="fullpage">
  <div class="section page main_photo" style="background-color:#2C292F" id="home">
    <div class="title_card">
      <h1>Juliann Ma</h1>
      Pianist ℘ Interdisciplinary Artist
    </div>
    <div class="bottom"><a class="scroll_arrow" href="#about"></a></div>
  </div>
  <div class="section page" style="background-color:#2C292F" id="about">
    {% capture raw_about %}{% include about.md %}{% endcapture %}
    {{ raw_about | markdownify }}
  </div>
  <div class="section page" style="background-color:#140E1B" id="media">
    {% capture raw_media %}{% include media.md %}{% endcapture %}
    {{ raw_media | markdownify }}
  </div>
  <div class="section page" style="background-color:#1B131A" id="events">
    {% capture raw_events %}{% include events.md %}{% endcapture %}
    {{ raw_events | markdownify }}
  </div>
  <div class="section page" style="background-color:#14131A" id="contact">
    {% capture raw_contact %}{% include contact.md %}{% endcapture %}
    {{ raw_contact | markdownify }}
    <div class="bottom">Copyright © {{ 'now' | date: "%Y" }} <a href="{{ site.url }}">JULIANN MA</a>. All Rights Reserved.</div>
  </div>
</main>

{% include plumbing/nav_header.html sections="home,about,media,events,contact" %}

<!--
<script>
  fullpage.initialize('#fullpage', {
    anchors: ['home', 'about', 'media', 'events', 'contact'],
    menu: '#menu',
    css3:true
  });
</script>
-->
