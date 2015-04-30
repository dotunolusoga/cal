#!/usr/bin/env ruby

require_relative './lib/month'

month = ARGV[0].to_i
year = ARGV[1].to_i

def arg_error
  puts "Date not in acceptable format/range"
end

if ARGV.empty? || year < 1800 || year > 3000
  arg_error
else
  m = Month.new(month, year)
  puts m.to_s
end
