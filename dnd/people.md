---
layout: page
title: People
---

<p><a href="/dnd">&larr; Back to D&D</a></p>

{% for people in site.people %}
- [{{ people.title }}]({{ people.url }})
{% endfor %}