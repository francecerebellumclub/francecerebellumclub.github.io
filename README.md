# France Cerebellum Club website

Source of the website of the France Cerebellum Club: **https://francecerebellumclub.github.io/**

The site is built with [Hugo](https://gohugo.io/) and the
[hugo-academic-group](https://github.com/biaslab/hugo-academic-group) theme (a git submodule in `themes/`).
Every push to `main` is built and published automatically by GitHub Actions
(`.github/workflows/static.yml`), so there is nothing to build or upload by hand.
The site is also rebuilt every Monday, so finished meetings move to "Past Meetings" on their own.

## Where things are

| What | File(s) |
|------|---------|
| Site title, club name under the slider, **home page mission synopsis**, **home page mailing list** block, menu, copyright | `config.toml` |
| **Home page image slider** (one file per image: `image`, `source`, `weight`) | `content/slider/*.md`, pictures in `static/img/slider/` |
| Slider order: random on every visit (`slider_shuffle = true`), or by `weight` (`false`) | `config.toml` |
| **Latest News** (one file per news item) | `content/post/*.md`, banners in `static/img/news/` |
| **Annual Meetings** intro text | `content/meetings/_index.md` |
| **Annual Meetings** (one file per Cerebellum Days) | `content/meetings/*.md`, logos in `static/img/meetings/`, programme PDFs in `static/docs/meetings/` |
| **Research Teams** intro text and the "your team is missing?" line | `content/teams/_index.md` |
| **Research Teams** (one file per team; grouped by `city`) | `content/teams/*.md`, map positions of the cities in `data/cities.toml` |
| **About the Club**: mission, board, former board members, international networks | `content/about.md`, board photos in `static/img/board/` |
| Logo and browser icons | `static/img/logo.png`, `static/img/favicon.ico`, `favicon-32.png`, `apple-touch-icon.png` |
| Google Analytics and cookie banner | `gtm_id` in `config.toml`, `layouts/partials/gtm.html` |
| Page templates / styles | `layouts/`, `static/css/fcc.css` |

Each Markdown file starts with a header between `+++` lines (title, date, ...), followed by the text.
The templates created by the `make` commands below (`archetypes/`) explain every field.

**Research Teams:** list only the team's *permanent* scientists working on the cerebellum:
maître de conférences (MCF), professeur des universités (PU), chargé de recherche (CR) and
directeur de recherche (DR) at Inserm or CNRS. Do not list engineers, postdocs, PhD students,
emeriti or junior professors (CPJ). A new `city` also needs its coordinates in `data/cities.toml`
to get a pin on the map.

**Meeting programmes:** put the PDF in `static/docs/meetings/` and set
`program = "docs/meetings/2028-programme.pdf"` in the meeting's file (a web address works too).

**Google Analytics:** it loads only after a visitor accepts the cookie banner; "Cookie settings"
in the footer reopens it. To turn Analytics and the banner off, comment out `gtm_id` in `config.toml`.

## Small edits (no installation needed)

Open the file on GitHub, click the pencil icon, edit, and "Commit changes".
The site updates after about one minute (progress in the *Actions* tab).

## Larger edits (local preview)

Requirements: `git` and Hugo **extended** (version 0.154 or newer).

```
git clone --recurse-submodules git@github.com:francecerebellumclub/francecerebellumclub.github.io.git fccWebsite
cd fccWebsite
make preview        # open http://localhost:1313, the page reloads on every save
```

Useful commands (`make help` lists them all):

```
make update                               # get the latest version (site + theme)
make news NAME=2027-01-10-my-news         # new news item (draft) in content/post/
make meeting NAME=2028-cerebellum-days    # new meeting (draft) in content/meetings/
make team NAME=lyon-new-team              # new research team (draft) in content/teams/
make slide NAME=purkinje-cell             # new slider image (draft) in content/slider/; put the picture in static/img/slider/
```

New items are created with `draft = true`: they are hidden (online and in `make preview`)
until you remove that line; `make preview-drafts` shows them locally. The same line hides
any existing news item or meeting. Then publish:

```
make publish MSG="Describe your change"
```

This checks that the site builds (nothing is published if it doesn't), fetches changes made
on GitHub in the meantime, then commits and pushes everything. It is the same as
`git pull --rebase`, `git add -A`, `git commit -m "..."`, `git push`.

## License

Website content: [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) (see `LICENSE`).
Theme: MIT (see `themes/hugo-academic-group/LICENSE.md`).
