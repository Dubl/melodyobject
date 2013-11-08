  require './Mo_h_hc'
  require './g_comeon4'
  
#~ this is the one. use wanger2c.rns
$fyl=File.open('ooutputter704.txt','w')
$jfyl=File.open('../treemo/public/fyl.json','w')
#~ $fyl2=File.open('ooutputter51.txt','w')


case ARGV.length
when 1
  x=l_load(ARGV[0],2)
=begin
when 2
  a=l_load(ARGV[0])
  a.nayme
  p a.name+" ll"
  x=a.fynd(ARGV[1])
p x.name+" jj"
=end
when 2
  case ARGV[1][0]
  when '1'
  x=Section.new
    a=l_load(ARGV[0],2)
        x.addon(a.fynd!(ARGV[1]))
  else
    x=Section.new
    a=l_load(ARGV[0],2)
    b=l_load(ARGV[1],2)
    x.addon(a,b)
  end
when 3..10
  a=l_load(ARGV[0],2)
  #a.nayme
  case ARGV[2][0]
  when 'r' #repl
  b=a.fynd!(ARGV[1],2) 
  c=a.fynd!(ARGV[3],2)
   case ARGV[4][0]
   when 'a' #altr
     x=Section.new
     d=a.fynd!(ARGV[1],2).altr
     x.addon(a.fynd(ARGV[1],2).repl(d))
   end
  when '1'
  x=Section.new
    2.upto(ARGV.length) do |i|
      x.addon(a.fynd!(ARGV[i-1]))
    end
  end
end

stopp=x
=begin
stopp=Section.new
z=x.uf
z.nayme
y=x.uf
x.scayle(2,:both)
y.scayle(2,:space)
stopp.addon(x,t(y,z.fynd!('1.1')))
=end
=begin 
kopp=longstroke
lopp=shortstroke
stopp=Section.new
stopp.addon(t(kopp,lopp),x)
=end
  webster=Array.new(6) { (rand(122-97) + 97).chr }.join
  $midi = MIDIator::Interface.new
$midi.autodetect_driver
#stopp.klean
#stopp.nayme
stopp.to_json
$watchlevel=9
g=File.open("trax/xoms/rund-#{webster}.dat",'w') 
 Marshal.dump(stopp,g)
playce=1
p webster 
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
puts $namarr.to_s #"#{if playce<10 then "0"+playce.to_s else playce end}"+" "+
#if playce==64 then playce=1 else playce+=1 end

#~ x+=1
end

rescue Interrupt => e
puts "Note: You will typically use Signal.trap instead."
end