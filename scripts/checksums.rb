#!/usr/bin/env ruby

require 'open-uri'

versions = []
checksum_list = []

open("https://releases.hashicorp.com/nomad/index.html") do |u|
  content = u.read
  content.each_line do |line|
    if match = line.match(/^\s*<a.*?>nomad_(.*?)<\/a>$/)
      versions << match.captures.first
    end
  end
end

versions.each do |v|
  url = "https://releases.hashicorp.com/nomad/#{v}/nomad_#{v}_SHA256SUMS"
  begin
    open(url) do |u|
      content = u.read
      content.each_line do |line|
        checksum, fname = line.gsub(/\s+/, ' ').strip.split(' ')
        next if fname.include? 'windows'
        checksum_list << "'#{fname}' => '#{checksum}'"
      end
    end
  rescue OpenURI::HTTPError
    next
  end
end

puts checksum_list.join(",\n")
