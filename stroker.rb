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
  
  webster=Array.new(6) { (rand(122-97) + 97).chr }.join


stopp=x
#stopp.fynd("1.1")
j=stopp.fynd("1.2.1.1").threadout(evener(32,:m))
j.repl(j.a(4))

#stopp=stopp.fynd!("1.2")
stopp.fynd("1.1").threadout(evener(128,:m))
#stopp.fynd("1.2").threadout(evener(128,:m))

stopp.fynd("1.3").threadout(evener(256,:m))  
stopp.fynd("1.4").threadout(evener(256,:m))
stopp.fynd("1.5").threadout(evener(64))


p 'jk'
p stopp.class
p stopp.name
p 'jo'

j=stopp.fynd("1.3.1.2.1.1.2").threadout(evener(32,:m))
j.repl(j.a(4))
=end
x=l_load('uxgwkb',2)
kopp=longstroke :mid
kopp.makechannel(4)
lopp=x  #shitstroke
stopp=Section.new
#stopp.addon kopp
stopp.addon(t(kopp,lopp))

mopp=longstroke(:drum1)
nopp=shortstroke(:drum1)
fopp=Section.new
fopp.addon(t(mopp,nopp))
fopp.makechannel(0)
stopp=stopp.threadout(mopp)


stopp.nayme
stopp.to_json
$wa
tchlevel=13

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
puts "Note: You will typically use Signal.trap instead."
end
