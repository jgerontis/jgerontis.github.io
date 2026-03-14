#!/usr/bin/env ruby

# Post-build link converter
# This script runs AFTER jekyll build and converts relative links
# in the generated _site/ to absolute Jekyll URLs
#
# Usage: ruby scripts/post_build.rb

SITE_DIR = '_site'

def process_file(filepath)
  content = File.read(filepath)
  original = content.dup
  
  # Convert: href="../_collection/item.md" -> href="/dnd/collection/item"
  content.gsub!(%r{href="\.\./(_)(\w+)/([^"]+)\.md"}, 'href="/dnd/\2/\3"')
  
  if content != original
    File.write(filepath, content)
    puts "✓ Updated #{filepath}"
    return true
  end
  false
end

def process_directory(dir)
  files_found = Dir.glob("#{dir}/**/*.html")
  puts "Found #{files_found.count} HTML files"
  
  updated_count = 0
  files_found.each do |file|
    updated_count += 1 if process_file(file)
  end
  
  puts "Updated #{updated_count} files with converted links"
end

if File.directory?(SITE_DIR)
  puts "Converting relative links in #{SITE_DIR}/"
  process_directory(SITE_DIR)
  puts "Done!"
else
  puts "Error: #{SITE_DIR}/ not found. Run 'jekyll build' first."
  exit 1
end
