preview: ## Local preview at http://localhost:1313, exactly as visitors will see it
	hugo server --disableFastRender
preview-drafts: ## Local preview that also shows items marked draft = true
	hugo server -D --disableFastRender
build: ## Build the site into public/ (only to check; GitHub builds the live site)
	hugo --gc --minify
update: ## Get the latest changes from GitHub (site and theme)
	git pull
	git submodule update --init --recursive
news: ## Create a news item: make news NAME=2027-01-10-my-news
	hugo new content post/$(NAME).md
meeting: ## Create a meeting: make meeting NAME=2028-cerebellum-days
	hugo new content meetings/$(NAME).md
help: ## Show this help
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
.PHONY: preview preview-drafts build update news meeting help
