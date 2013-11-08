 require './Mo_h_hc'
  require './g_comeon4'
  
    $midi = MIDIator::Interface.new
  $midi.autodetect_driver
  
  
#~ this is the one. use wanger2c.rns
$fyl=File.open('ooutputter704.txt','w')
$jfyl=File.open('../treemo/public/fyl.json','w')
#~ $fyl2=File.open('ooutputter51.txt','w')

=begin
ARGV.each do |j|
  p j
end

case ARGV.length
when 1
  x=l_load(ARGV[0])
when 2..10
  a=l_load(ARGV[0])
  a.nayme
  x=Section.new
  2.upto(ARGV.length) do |i|
    x.addon(a.fynd!(ARGV[i-1]))
  end
  
end
=end

#stopp.to_json
$watchlevel=13

stopp=Section.new
kop=Section.new
kop.create_notes(7,2,:rand,:low)
kop.makechannel(1)
kop.versionize 4
kop.alter_versions_all(:alter_pitch,"Alter_Pitch_Paramobj",5)
kop.flag.childrenaelist.each{|children| children.each{|ckid| puts ckid.val}}
x=kop.threadout(evener(64))

stopp.addon(x)
#stopp.to_json
=begin
drums=shitstroke(:drum1,0).a(2)
drumsy=shitstroke(:drum1,0).a(2)
drumc=s(drums.uf,drumsy.uf)

druny=shitstroke(:drum1,0).a(2)
drunys=shitstroke(:drum1,0).a(2)
drumd=s(druny.uf,drunys.uf)


a=bothystroke(:mid,:low,2,3).a(2)
b=bothystroke(:mid,:low,2,3).a(2)
woutdrums=s(a.uf,b.uf)

c=bothystroke(:mid,:low,2,3).a(2)
d=bothystroke(:mid,:low,2,3).a(2)
dinwout=s(c.uf,d.uf)
dintro=t(dinwout.uf,drumd.uf)

wdrums=t(woutdrums.uf,drumc.uf)
=end



webster=Array.new(6) { (rand(122-97) + 97).chr }.join
g=File.open("trax/xoms/#{webster}.dat",'w') 
 Marshal.dump(stopp,g)
playce=1 





begin
  p webster

until Midistack.done
$g=0.2
x=Time.now.to_f
#gopp.chggran(i)
$namarr=[]
stopp.go_down

#~ stopp.spaceout
#~ stop=true
#~ $fyl2.puts Midistack.ticker
h=x+$g-0.01
while Time.now.to_f<h
sleep 0.01
end
Midistack.play
#puts "#{if playce<10 then "0"+playce.to_s else playce end}"+" "+$namarr.to_s
#if playce==64 then playce=1 else playce+=1 end

#~ x+=1
end

rescue Interrupt => e
  stopp.to_json
puts "Note: You will typically use Signal.trap instead."
end
