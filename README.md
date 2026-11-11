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
| Site title, banner text, **home page mission synopsis**, menu | `config.toml` |
| **Latest News** (one file per news item) | `content/post/*.md` |
| **Annual Meetings** intro text | `content/meetings/_index.md` |
| **Annual Meetings** (one file per Cerebellum Days) | `content/meetings/*.md` |
| **About the Club**: mission, board, mailing list | `content/about.md` |
| Images | `static/img/` (`banner-cerebellum.jpg` = home banner, `board/`, `meetings/`, `news/`) |
| Page templates / styles | `layouts/`, `static/css/fcc.css` |

Each Markdown file starts with a header between `+++` lines (title, date, ...), followed by the text.

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
