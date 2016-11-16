---
layout: page
title: Events
# subtitle: ???
permalink: /events/
---

{% assign upcoming_events = site.events | where_exp: "event", "event.date >= site.time" | sort 'date' | reverse %}
{% assign past_events = site.events | where_exp: "event", "event.date < site.time" | sort 'date' | reverse %}

{% if upcoming_events != empty %}
# Upcoming events
{% for event in upcoming_events %}
  <h3>{{ event.title }}</h3>
  <p><a href="{{ event.location_link }}">{{ event.location }}</a></p>
  {{ event.content }}
{% endfor %}
{% endif %}

{% if past_events != empty %}
# Past Events

## 2016

{% for event in past_events %}
  <h3>{{ event.title }}</h3>
  <p><a href="{{ event.location_link }}">{{ event.location }}</a></p>
  {{ event.content }}
{% endfor %}
{% endif %}
