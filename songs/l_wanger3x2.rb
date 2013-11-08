  require './Mo_h_hc'
  require './g_comeon4'
  
#~ this is the one. use wanger2c.rns
$fyl=File.open('ooutputter704.txt','w')
$jfyl=File.open('../treemo/public/fyl.json','w')
#~ $fyl2=File.open('ooutputter51.txt','w')
  
  webster=Array.new(6) { (rand(122-97) + 97).chr }.join
  $midi = MIDIator::Interface.new
$midi.autodetect_driver
=begin
 sopp=si('sta',8).a(4)
sopp.makechannel 3

ssoun=si("stedy",2)
 sbopp=t(sopp,ssoun)

  sopp=si('sta',8).a(4)
 sopp.makechannel 3
skopp=si('sta',8).a(4)
 ssoun=si("stedy",2)
  scopp=t(sopp,ssoun,skopp)
stopp=s(sbopp,scopp).a(2)


#take the existing sections.. and alter

stopp=l_load('rund-cxemns')
stopp.children[0].name+="firstpart"
stopp.children[1].name+="secondpart"
stopp.children[0].children[0].name+="firstdrums"
stopp.children[0].children[1].name+="firstnotes"
stopp.children[1].children[0].name+="seconddrums"
stopp.children[1].children[1].name+="secondnotes"




qopp=si('sta',8).a(4)
qopp.makechannel 4
stopp.children[1].children[1].children[0].addon qopp
stopp.children[0].children[1].children[0].addon qopp.uf

stopp.children[1].children[1].children[0].children[0].alter(5)
stopp.children[1].children[1].children[0].children[0].makechannel 6
stopp.children[1].children[1].children[0].children[1].dubl
stopp.children[0].children[1].children[0].children[0].alter(5)
stopp.children[0].children[1].children[0].children[0].makechannel 6
=end
#stopp.children[0].children[1].children[0].children[3].name+="newnotes"
#scopp=t(scopp,qopp)
stopp=l_load('rund-bkpgeuaaa')
#stopp=s(stopp.uf,stopp.uf.alteri)
#stopp=s(stopp.uf.firstsections.halved,stopp.uf.alteri)
=begin
g=File.open("trax/eoms/rund-#{webster}.dat",'w') 
 Marshal.dump(stopp,g)
=end
#~ stopp=stopp.array_out(4)
stopp.nayme
stopp.to_json

until Midistack.done
$g=0.2
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