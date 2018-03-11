---
layout: page
title: Concerts and Gatherings
# subtitle: hi!
permalink: /concerts-gatherings/
---

Concerts and Gatherings
=======================

{% assign upcoming_events = site.events | where_exp: "event", "event.date >= site.time" | sort 'date' %}
{% assign past_events = site.events | where_exp: "event", "event.date < site.time" | sort 'date' | reverse %}

{% if upcoming_events != empty %}
  <h2>Upcoming</h2>
  <ul>
    {% for event in upcoming_events %}
      {% include plumbing/event.html event=event longdate=true time=true rsvp=true %}
    {% endfor %}
  </ul>
{% endif %}

{% if past_events != empty %}
  <h2>Notable</h2>
  <ul>
    {% for event in past_events %}
      {% include plumbing/event.html event=event time=false %}
    {% endfor %}
  </ul>
{% endif %}

<!-- Script to show/hide events -->
{% include plumbing/event_hide_script.html %}
