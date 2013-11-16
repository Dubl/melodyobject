require 'unimidi'

class Midi_interface
     
attr_accessor :output

def initialize

@output=UniMIDI::Output.open(0)
  
end

def note_on(note,channel,velocity)     
@output.puts(0x90|channel, note, velocity) # note on

  
end


def note_off(note,channel,velocity)     
@output.puts(0x80|channel, note, velocity) # note on

  
end    

end