
 require  'Generators'

include Generators

#~ $fyl=File.open('ooutputter717.txt','w')
$jfyl=File.open('..\treemo\public\fyl.json','w')
#~ $fyl2=File.open('ooutputter51.txt','w')
  
  webster=Array.new(6) { (rand(122-97) + 97).chr }.join
  $midi = MIDIator::Interface.new
$midi.autodetect_driver


#~ stopp=makeinstances('sta',8).array_out(8)

#~ x=70
#~ y=80

#~ stopp=t(tester2(44,6),tester2(48,4))
#~ a=[]
#~ 1.upto(32) do |i|
#~ a0=[]
#~ a0[0]=x
#~ a0[1]=i
#~ a.push a0
#~ end
#~ stopp=Section.new
#~ 0.upto(a.length-1) do |j|
#~ stopp.addon(g_comeon43(a[j][0],a[j][1]))
#~ end
topp=Section.new

#=begin
1.times do

hash={}
notez=[50,36,50,36]
tym1=[2,1,1,0]
tym2=[3,0,0,1]
tym3=[1,2,0,1]
tym4=[1,2,1,0]
tymez=[tym1,tym2,tym3,tym4]
hash[notez]=tymez

#~ hash.each_value{|v| v.each {|x| x.collect!{|k| k=rand(4)}}}
scayle(tymez,8)

aopp=sectionize(hash)

#~ hash.each_value{|v| v.each {|x| x.collect!{|k| k=rand(4)}}}
#~ scayle(tymez,8)

#~ bopp=sectionize(hash)

topp.addon(aopp,aopp.uf,aopp.uf,aopp.uf)

end
#=end



2.times do

hash={}
notez=[50,36,50,36]
tym1=[3,3,3,3]
tym2=[2,2,2,2]
tym3=[3,3,3,3]
tym4=[1,1,1,1]
tym5=[3,0,3,0]
tym6=[2,2,0,1]
tym7=[1,2,1,0]
tym8=[0,0,0,1]



tymez=[tym1,tym2,tym3]
hash[notez]=tymez

#~ hash.each_value{|v| v.each {|x| x.collect!{|k| k=rand(4)}}}
scayle(tymez,8)

aopp=sectionize(hash)

#~ hash.each_value{|v| v.each {|x| x.collect!{|k| k=rand(4)}}}
#~ scayle(tymez,8)

#~ bopp=sectionize(hash)

topp.addon(aopp,aopp.uf)

end



#~ hash3={}
#~ notez=[45,44,45,44]
#~ tym1=[1,1,1,0]
#~ tym2=[2,1,1,2]
#~ tym3=[1,1,1,1]
#~ tym4=[0,1,1,1]
#~ tymez=[tym1,tym2,tym3,tym4]
#~ hash3[notez]=tymez





#~ scayle(tymez,8)

hash2={}
notez=[70]
tym1=[3,0,0,0]
tym2=[2]
tym3=[1,1,2,2]
tym4=[1,1,0,0]
tymez=[tym2]
puts tymez.class
hash2[notez]=tymez



scayle(tymez,4)



#~ copp=sectionize(hash)
#~ copp=copp.a(3)
bopp=sectionize(hash2)
#~ xopp=sectionize(hash3)




#~ vopp=sectionize(hash)


#~ topp=s(copp,xopp,vopp,xopp,vopp,xopp,vopp)




stopp=t(topp,bopp)

stopp.makechannel(9)

#~ stopp.makechannel(9)



stopp=stopp.a(32)


#~ sopp=g_comeon43([42,43,44,45],[3,4,5,6])
#~ topp=g_comeon42([59,59,59,69],6)
#~ copp=g_comeon42([53,53,53,53],2)
#~ opp=t(sopp,topp)
#~ stopp=Section.new
#~ stopp.addon(opp)
#~ stopp=stopp.a(4)


#~ stopp=sopp
#~ set_trace_func lambda {|event, file, line, id, binding, classname|
 #~ $fyl.printf "%8s %s:%-2d %-15s %-15s\n", event, file, line, classname, id}

#~ stopp=l_load('rund-yygood')

#~ g=File.open("trax/eoms/rund-#{webster}.dat",'w') 
#~ Marshal.dump(stopp,g)
stop=false
      $lvl=1
      $jfyl.puts "{id:0,item:["
#~ stopp=stopp.array_out(4)
 trap('INT') {
 $jfyl.pos=$dpos
 $jfyl.puts ']}'
 stop=true}
until Midistack.done or stop==true
$g=0.001
x=Time.now.to_f
#gopp.chggran(i)[45,45,own
#~ stopp.to_json
#~ $lvl+=1
#~ $jfyl.puts ','
stopp.go_down
#~ stopp.to_json
#~ $lvl+=1
#~ $dpos=$jfyl.pos
#~ $jfyl.puts ','
#~ stopp.spaceout
#~ $fyl.puts''
#~ stop=true
#~ $fyl2.puts Midistack.ticker
h=x+$g  #-0.001
while Time.now.to_f<h
sleep 0.0001
end
Midistack.play
#~ x+=1
end
