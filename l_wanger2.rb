  require 'Generators'
  include Generators
  
  
$fyl=File.open('ooutputter508.txt','w')
#~ $fyl2=File.open('ooutputter51.txt','w')
  
  webster=Array.new(6) { (rand(122-97) + 97).chr }.join
  $midi = MIDIator::Interface.new
$midi.autodetect_driver


#~ stopp=makeinstances('sta',8).array_out(8)

sopp=si("si('t(sta,sta,sta,stedy).a(4)',2).a(2).a(2)",2)
stopp=t(sopp,ssoun)


#~ stopp=l_load('rund-yygood')


#~ g=File.open("mo/trax/eoms/rund-#{webster}.dat",'w') 
#~ Marshal.dump(stopp,g)

stopp=stopp.a(2)
stopp.inspectout

until Midistack.done
$g=0.1
x=Time.now.to_f
#gopp.chggran(i)
stopp.go_down
#~ stopp.spaceout
#~ stop=true
#~ $fyl2.puts Midistack.ticker
h=x+$g-0.01
while Time.now.to_f<h
sleep 0.01
end
Midistack.play
#~ x+=1
end