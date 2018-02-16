<div class="flex-ribbon">
{% for link in site.inline.links %}
  <div class="narrow_thirds_tile">
    {% if link.url %}
      <h3><a href="{{ link.url }}">{{ link.title }}</a></h3>
    {% else %}
      <h3>{{ link.title }}</h3>
    {% endif %}
    <p>{{ link.text | markdownify }}</p>
  </div>
{% endfor %}
</div>
