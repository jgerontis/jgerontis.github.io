.PHONY: build serve clean

build:
	bundle exec jekyll build

serve: build
	bundle exec jekyll serve

clean:
	rm -rf _site/
