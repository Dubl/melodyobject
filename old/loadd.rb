  require './Mo_h_hc'
  require './g_comeon4'
  
#~ this is the one. use wanger2c.rns
$fyl=File.open('ooutputter704.txt','w')
$jfyl=File.open('../treemo/public/fyl.json','w')
#~ $fyl2=File.open('ooutputter51.txt','w')
ARGV.each do |j|
  p j
end

case ARGV.length
when 1
  x=l_load(ARGV[0])
=begin
when 2
  a=l_load(ARGV[0])
  a.nayme
  p a.name+" ll"
  x=a.fynd(ARGV[1])
p x.name+" jj"
=end
when 2..10
  a=l_load(ARGV[0])
  a.nayme
  x=Section.new
  2.upto(ARGV.length) do |i|
    x.addon(a.fynd!(ARGV[i-1]))
  end
  
end
  
  webster=Array.new(6) { (rand(122-97) + 97).chr }.join
  $midi = MIDIator::Interface.new
$midi.autodetect_driver

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
stopp.nayme
j=stopp.fynd("1.3.1.2.1.1.2").threadout(evener(32,:m))
j.repl(j.a(4))
stopp.to_json
$watchlevel=13
#g=File.open("trax/eoms/rund-#{webster}.dat",'w') 
 #Marshal.dump(stopp,g)
playce=1 
begin
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
puts "#{if playce<10 then "0"+playce.to_s else playce end}"+" "+$namarr.to_s
if playce==64 then playce=1 else playce+=1 end

#~ x+=1
end

rescue Interrupt => e
puts "Note: You will typically use Signal.trap instead."
end
