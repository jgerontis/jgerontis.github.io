---
layout: page
title: People
---

{% for people in site.people %}
- [{{ people.title }}]({{ people.url }})
{% endfor %}