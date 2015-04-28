#!/usr/bin/env ruby

require_relative 'lib/month'

month = ARGV[0].to_i
year = ARGV[1].to_i
#puts `cal #{month} #{year}`

m = Month.new(month, year)

def arg_error
  print "Date not in acceptable format/range"
end

if ARGV.empty?
  arg_error
else
  m.to_s
end
