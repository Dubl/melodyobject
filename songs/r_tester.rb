
 require  'Generators'

include Generators

#~ $fyl=File.open('ooutputter717.txt','w')
$jfyl=File.open('fyl.json','w')
#~ $fyl2=File.open('ooutputter51.txt','w')
  
  webster=Array.new(6) { (rand(122-97) + 97).chr }.join
  $midi = MIDIator::Interface.new
$midi.autodetect_driver


#~ stopp=makeinstances('sta',8).array_out(8)

def tester(noote,widdth)
    timingary=[]
  noteary=[]
  fee=15
  1.upto(16) {|v| timingary.push(v)}
  x=GotimeObject.new(timingary)
  topp=Section.new(x)
  0.upto(fee) {noteary.push(noote)}
  noteary.each {|d| topp.addon g_comeon41(d)}
return topp
end

def tester2(noote,widdth)
    timingary=[]
  noteary=[]
  fee=15
  1.upto(fee+1) {timingary.push(widdth)}
  x=GotimeObject.new(timingary)
  topp=Section.new(x)
  0.upto(fee) {noteary.push(noote)}
  noteary.each {|d| topp.addon g_comeon41(d)}
return topp
end


def tester3(noote,widdth)
    timingary=[]
  noteary=[]
  fee=15
  1.upto(fee+1) {timingary.push(widdth)}
  x=widdth
  topp=Section.new(x)
  0.upto(fee) {noteary.push(noote)}
  noteary.each {|d| topp.addon g_comeon41(d)}
return topp
end

def g_comeon41(v,len=1)
topp=Section.new
topp.name=v.to_s
topp.create_specific_notes(v,len)
return topp
end


#~ stopp=t(tester2(44,6),tester2(48,4))
stopp=s(t(tester3(44,6),tester3(48,4)))

#~ set_trace_func lambda {|event, file, line, id, binding, classname|
 #~ $fyl.printf "%8s %s:%-2d %-15s %-15s\n", event, file, line, classname, id}

#~ stopp=l_load('rund-yygood')

#~ g=File.open("trax/eoms/rund-#{webster}.dat",'w') 
#~ Marshal.dump(stopp,g)

#~ stopp=stopp.array_out(4)
#~ stopp.to_json

until Midistack.done
$g=0.5
x=Time.now.to_f
#gopp.chggran(i)
stopp.go_down
#~ stopp.spaceout
#~ $fyl.puts''
#~ stop=true
#~ $fyl2.puts Midistack.ticker
h=x+$g-0.01
while Time.now.to_f<h
sleep 0.01
end
Midistack.play
#~ x+=1
end