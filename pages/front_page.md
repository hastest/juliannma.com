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
    <div class="title_announcement">
      <h1><a href="#events">Rise, Awaken</a></h1>
      <p>
        at Carnegie Hall, NYC
        <br>
        Thursday, Nov 9, 07:30PM.
        <br>
        <a href="https://www.carnegiehall.org/SiteCode/Purchase/SeatSelectionPerformance.aspx?startWorkflow=true&quickBuy=false&quantity=1&eventId=31030">RSVP</a>
      </p>
    </div>
    <div class="bottom"><a class="scroll_arrow" href="#biography"></a></div>
  </div>
  <div class="section page" style="background-color:#2C292F" id="biography">
    {% capture raw_about %}{% include front_page_sections/about.md %}{% endcapture %}
    {{ raw_about | markdownify }}
  </div>
  <div class="section page" style="background-color:#140E1B" id="work">
    {% capture raw_media %}{% include front_page_sections/media.md %}{% endcapture %}
    {{ raw_media | markdownify }}
  </div>
  <div class="section page" style="background-color:#1B131A" id="concerts">
    {% capture raw_events %}{% include front_page_sections/events.md %}{% endcapture %}
    {{ raw_events | markdownify }}
  </div>
  <div class="section page" style="background-color:#14131A" id="contact">
    {% capture raw_contact %}{% include front_page_sections/contact.md %}{% endcapture %}
    {{ raw_contact | markdownify }}
    <div class="bottom">Copyright © {{ 'now' | date: "%Y" }} <a href="{{ site.url }}">JULIANN MA</a>. All Rights Reserved.</div>
  </div>
</main>

{% include plumbing/nav_header.html sections="biography,work,concerts,contact" %}

<!--
<script>
  fullpage.initialize('#fullpage', {
    anchors: ['home', 'bio', 'media', 'concerts', 'contact'],
    menu: '#menu',
    css3:true
  });
</script>
-->