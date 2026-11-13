+++
title = "{{ replace .File.ContentBaseName "-" " " | title }}"   # not shown, just for you
image = "slider/{{ .File.ContentBaseName }}.jpg"   # picture in static/img/slider/ (wide pictures work best)
source = ""                                        # credit shown on the image, e.g. "Rondi-Reig lab, Sorbonne Université"
# source_link = "https://..."                      # optional: the credit becomes a link
weight = 10                                        # order in the slider (smaller numbers come first)
# fit = "contain"                                  # optional: show the whole picture instead of filling the frame
draft = true
+++
