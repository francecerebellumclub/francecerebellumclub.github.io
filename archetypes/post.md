+++
title = "{{ replace .Name "-" " " | title }}"
date = "{{ now.Format "2006-01-02" }}"
short_text = ""                  # one or two sentences shown in "Latest News"
# link = "https://..."           # optional: title and button go here instead of to this news page
#                                #   (a website, or a page of this site such as "/meetings/")
# link_text = "Visit website"    # optional: text of the button
# image = "news/my-image.jpg"    # optional banner (static/img/news/)
draft = true
+++

Full text of the news item (only used when there is no `link`).
