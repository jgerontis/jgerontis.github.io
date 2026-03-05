---
layout: page
title: Sessions
---

{% assign sorted_sessions = site.sessions | sort: "session_number" %}

{% for session in sorted_sessions %}

### Session {{ session.session_number }} — [{{ session.title }}]({{ session.url }})

*{{ session.date | date: "%B %d, %Y" }}*

{% endfor %}