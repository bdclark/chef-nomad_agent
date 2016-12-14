#!/usr/bin/env ruby

require 'open-uri'

versions = %w(0.2.0 0.2.1 0.2.3 0.3.0 0.3.1 0.3.2 0.4.0 0.4.1 0.5.0 0.5.1)

versions.each do |v|
  url = "https://releases.hashicorp.com/nomad/#{v}/nomad_#{v}_SHA256SUMS"
  begin
    open(url) do |u|
      content = u.read
      content.each_line do |line|
        checksum, fname = line.gsub(/\s+/, ' ').strip.split(' ')
        puts "'#{fname}' => '#{checksum}',"
      end
    end
  rescue OpenURI::HTTPError
    next
  end
end
