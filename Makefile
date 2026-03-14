.PHONY: build serve clean

build:
	bundle exec jekyll build
	ruby scripts/post_build.rb

serve: build
	bundle exec jekyll serve

clean:
	rm -rf _site/
