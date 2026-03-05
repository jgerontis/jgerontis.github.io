---
layout: page
title: People
---

{% raw %}{% for people in site.people %}
- [{{ people.title }}]({{ people.url }})
{% endfor %}{% endraw %}