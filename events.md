---
layout: page
title: Private Piano Instruction
# subtitle: hi!
permalink: /events/
---

{% include plumbing/nav_header.html prefix="/" sections="home,about,media,events,contact" %}

Events
======

{% assign upcoming_events = site.events | where_exp: "event", "event.date >= site.time" | sort 'date' | reverse %}
{% assign past_events = site.events | where_exp: "event", "event.date < site.time" | sort 'date' | reverse %}

{% if upcoming_events != empty %}
### Upcoming events
<ul>
{% for event in upcoming_events %}
  {% if event.short_title %}
    {% assign title = event.short_title %}
  {% else %}
    {% assign title = event.title %}
  {% endif %}

  {% if event.short_location %}
    {% assign location = event.short_location %}
  {% else %}
    {% assign location = event.location %}
  {% endif %}

  {% assign excerpt = event.content %}
  {% assign id = event.id | replace_first: '/', '' | replace: '/', '-'%}

  <li>
    <span class="calendar_tile">{{ event.date | date: "%-A, %b %-d, %I:%M%p"}}, </span>
    <b>{% if excerpt %}<a onclick='toggle_block("{{ id }}")'>{{ title }}</a>{% else %}{{ title }}{% endif %}</b>, at {{ location }}
    {% if event.rsvp_link %}(<a href="{{ event.rsvp_link }}">RSVP</a>){% endif %}
    {% if excerpt %}
      <span class="event-detail hidden" id="{{ id }}">{{ excerpt }}<a onclick='toggle_block("{{ id }}")'>(... hide detail)</a></span>
    {% endif %}
  </li>
{% endfor %}
</ul>
{% endif %}


{% if past_events != empty %}
### Notable past events
<ul>
{% for event in past_events %}
  {% if event.short_title %}
    {% assign title = event.short_title %}
  {% else %}
    {% assign title = event.title %}
  {% endif %}

  {% if event.short_location %}
    {% assign location = event.short_location %}
  {% else %}
    {% assign location = event.location %}
  {% endif %}

  {% assign excerpt = event.content %}
  {% assign id = event.id | replace_first: '/', '' | replace: '/', '-'%}

  <li>
    <b>
      {% if excerpt %}<a onclick='toggle_block("{{ id }}")'>{{ title }}</a>{% else %}{{ title }}{% endif %}
    </b>
    , at {{ location }}
    ({{ event.date | date: "%B '%y"}}).
    {% if excerpt %}
      <span class="event-detail hidden" id="{{ id }}">{{ excerpt }}<a onclick='toggle_block("{{ id }}")'>(... hide detail)</a></span>
    {% endif %}
  </li>
{% endfor %}
</ul>
{% endif %}

<script>
  function toggle_block(id) {
  	var text = document.getElementById(id);
    if (text.classList.contains("hidden")) {
      text.classList.remove("hidden");
    } else {
      text.classList.add("hidden");
    }
  }
</script>
