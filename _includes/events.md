Events
======

{% assign upcoming_events = site.events | where_exp: "event", "event.date >= site.time" | sort 'date' | reverse %}
{% assign past_events = site.events | where_exp: "event", "event.date < site.time" | sort 'date' | reverse %}

{% if upcoming_events != empty %}
### Upcoming events
<ul>
{% for event in upcoming_events %}
  <li>{{ event.title }} : <a href="{{ event.location_link }}">{{ event.location }}</a></li>
{% endfor %}
</ul>
{% endif %}


{% if upcoming_events != empty %}
### Past events
<ul>
{% for event in past_events limit:7 %}
  <li>{{ event.title }} : <a href="{{ event.location_link }}">{{ event.location }}</a></li>
{% endfor %}
</ul>
[... more](/events)
{% endif %}
