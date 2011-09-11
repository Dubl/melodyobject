require 'rubygems'
require 'midiator'
#require 'Mo-h-e'

puts 'bye'

#s=Section.new
#s.create_notes 4
$midi=MIDIator::Interface.new
$midi.autodetect_driver