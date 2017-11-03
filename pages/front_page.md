---
layout: default
permalink: /
---

<main id="fullpage">
  <div class="section page main_photo" style="background-color:#2C292F" id="home">
    <div class="title_card">
      <h1>Juliann Ma</h1>
      Pianist ℘ Interdisciplinary Artist
    </div>


    {% assign next_event = site.events | where_exp: "event", "event.date >= site.time" | sort 'date' | first %}
    {% if next_event %}
      {% if next_event.short_title %}
        {% assign title = next_event.short_title %}
      {% else %}
        {% assign title = next_event.title %}
      {% endif %}

      {% if next_event.short_location %}
        {% assign location = next_event.short_location %}
      {% else %}
        {% assign location = next_event.location %}
      {% endif %}

      <div class="title_announcement">
        <h1><a href="#concerts">{{ title }}</a></h1>
        <p>
          at {{ location }}
          <br>{{ next_event.date | date: "%-A, %b %-d, %I:%M%p"}}.
          {% if next_event.rsvp_link %}<br><a href="{{ next_event.rsvp_link }}">RSVP</a>{% endif %}
        </p>
      </div>
    {% endif %}

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
