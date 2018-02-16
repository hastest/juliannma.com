---
layout: partials/section
---

# Concerts and Gatherings
{:id="concerts"}
<!-- The tag above is a navigation link, as expected by the nav bar. Configure the nav bar in _config.yml -->

{% assign upcoming_events = site.events | where_exp: "event", "event.date >= site.time" | sort 'date' %}
{% assign past_events = site.events | where_exp: "event", "event.date < site.time" | sort 'date' | reverse %}

{% if upcoming_events != empty %}
  <h2>Upcoming</h2>
  <ul>
    {% for event in upcoming_events %}
      {% include plumbing/event.html event=event longdate=true rsvp=true %}
    {% endfor %}
  </ul>
{% endif %}

{% if past_events != empty %}
  <h2>Notable</h2>
  <ul>
    {% for event in past_events limit:7 %}
      {% include plumbing/event.html event=event %}
    {% endfor %}
    <li><a href="/concerts-gatherings/">... older events</a></li>
  </ul>
{% endif %}

<!-- Script to show/hide events -->
{% include plumbing/event_hide_script.html %}
