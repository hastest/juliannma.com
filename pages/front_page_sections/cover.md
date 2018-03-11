---
layout: partials/section
section-class: "fullpage-section"
---

<div class="page fullpage_photo main_photo" id="home"></div>

<div class="title_card">
  <h1>Juliann Ma</h1>
  Pianist ℘ Interdisciplinary Artist
</div>

{% assign next_event = site.events | where_exp: "event", "event.date >= site.time" | sort 'date' | first %}

{% if next_event %}
  {% if next_event.show-date %}
    {% assign date = next_event.show-date %}
  {% else %}
    {% assign date = next_event.date | date: "%b %-d, %Y, %-I:%M %p" %}
  {% endif %}

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
      <br>{{ date }}.
      {% if next_event.rsvp_link %}<br><a href="{{ next_event.rsvp_link }}">RSVP</a>{% endif %}
    </p>
  </div>
{% endif %}

<div class="bottom"><a class="scroll_arrow" href="#biography"></a></div>
