#!/usr/bin/env ruby


#$LOAD_PATH<<'./lib'
                 
#require 'midiator'

require 'melody_object'
 


#    $midi = MIDIator::Interface.new
#  $midi.autodetect_driver
  
  
#~ this is the one. use wanger2c.rns
#$fyl=File.open('ooutputter704.txt','w')
#$jfyl=File.open('../treemo/public/fyl.json','w')
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
#$watchlevel=13
  stopp=Section.new       



intro=jstroke(:mid,3)
drums=jjstroke(:mid,0)
drums2=jjstroke(:mid,0)
drums3=jkstroke(:mid,0)
a=bjthstroke(:mid,:low,2,3)
b=bjithstroke(:mid,:low,2,3)  

alldrums=t(drums.uf,drums2.uf,drums3.uf)
ss=Section.new      

ss.addon(alldrums.uf)
      wdrums=t(ss,intro)
         
 
                4.times do
                  inter=jstroke(:mid,3)   
                  stopp.addon(inter.uf) 
                  x=t(inter.uf,drums.uf,drums2.uf)  


                         stopp.addon(x.uf)      

                   inter=jstroke(:mid,3)   
                               x=t(inter.uf,drums.uf,drums2.uf)  

                               stopp.addon(x.uf)      

                               
                               
                        end

#webster=Array.new(6) { (rand(122-97) + 97).chr }.join
#g=File.open("trax/xoms/#{webster}.dat",'w') 
# Marshal.dump(stopp,g)
#playce=1 
            
stopp.beat=0.18

stopp.runn

=begin

begin
 # p webster

until Midistack.done
$g=0.18
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
  
=end