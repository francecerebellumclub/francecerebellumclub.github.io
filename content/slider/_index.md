+++
title = "Home page slider"
# Each file in this folder is one image of the slider at the top of the home page.
# Nothing here gets a page of its own.
[build]
  render = "never"
  list = "never"
[[cascade]]
  [cascade.build]
    render = "never"
    list = "always"
  [cascade.target]
    kind = "page"
+++
