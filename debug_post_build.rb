#!/usr/bin/env ruby

# Test what the post-build script sees
filepath = '_site/dnd/sessions/session-0/index.html'
content = File.read(filepath)

# Find lines with _people
lines = content.split("\n").each_with_index do |line, idx|
  if line.include?('_people')
    puts "Line #{idx + 1}: #{line.inspect}"
  end
end

# Test the regex
pattern = /href="\.\.\/(_\w+)\/([^"]+)\.md"/
puts "\nSearching for pattern: #{pattern.inspect}"
matches = content.scan(pattern)
puts "Found #{matches.count} matches:"
matches.each do |match|
  puts "  - #{match.inspect}"
end

# Try the replacement
puts "\nAttempting replacement..."
original = content.dup
content.gsub!(pattern) do |match|
  puts "  Matched: #{match.inspect}"
  "href=\"/dnd/test/test/\""
end

if content != original
  puts "Replacement succeeded!"
else
  puts "No replacements made"
end
