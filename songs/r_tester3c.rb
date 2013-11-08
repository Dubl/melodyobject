
 require  'Generators'

include Generators

$jfyl=File.open('..\treemo\public\fyl.json','w')
  
topp=Section.new
temp=Section.new

1.times do

hash={}
notez=[50,36,50,36]
tym1=[2,1,1,0]
tym2=[3,0,0,1]
tym3=[1,2,0,1]
tym4=[1,2,1,0]
tymez=[tym1,tym2,tym3,tym4]
hash[notez]=tymez

scayle(tymez,8)

aopp=sectionize(hash)

topp.addon(aopp,aopp.uf,aopp.uf,aopp.uf)
temp=aopp
temp=temp.a(8)
end

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

scayle(tymez,8)

aopp=sectionize(hash)

topp.addon(aopp,aopp.uf)

end

topp.addon(temp)

###################
###################

2.times do

hash={}
notez=[44,36,44,33]
tym1=[2,1,1,0]
tym2=[3,0,0,1]
tym3=[1,2,0,1]
tym4=[1,2,1,0]
tymez=[tym1,tym2,tym3,tym4]
hash[notez]=tymez

scayle(tymez,8)

aopp=sectionize(hash)

topp.addon(aopp,aopp.uf,aopp.uf,aopp.uf)

end


2.times do

hash={}
notez=[41,42,41,40]
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

scayle(tymez,8)

aopp=sectionize(hash)

topp.addon(aopp,aopp.uf)

end


###################
###################


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

bopp=sectionize(hash2)

###############
################

nropp=Section.new
notez=[70,74,77,81]
notez.collect!{|v| v-36}
c=3
4.times do
c+=1
hash2={}
puts notez.to_s

notez.collect!{|v| v+c}
tym1=[1,1,1,1]
tym2=[2]
tym3=[1,1,2,2]
tym4=[1,1,0,0]
tymez=[tym1]
puts tymez.class
hash2[notez]=tymez

scayle(tymez,8)

xopp=sectionize(hash2)
nropp.addon(xopp)
end
nnopp=Section.new
nnopp.addon(nropp.a(4))

##################
###################
nsopp=Section.new

notez.shuffle!
c=3
4.times do
c+=2
hash2={}

notez.collect!{|v| v-c}
tym1=[1,1,1,1]
tym2=[2]
tym3=[1,1,2,2]
tym4=[1,1,0,0]
tymez=[tym1]
hash2[notez]=tymez

scayle(tymez,8)

xopp=sectionize(hash2)
nsopp.addon(xopp)
end
nnopp.addon(nsopp.a(4))

nnopp=nnopp.a(2)

##################
##################

ntopp=Section.new
notez=[62,48,58,52]
c=2
4.times do
c=c*-1
hash2={}

notez.collect!{|v| v+c}
tym1=[1,1,1,1]
tym2=[2]
tym3=[1,1,2,2]
tym4=[1,1,0,0]
tymez=[tym1]

hash2[notez]=tymez

scayle(tymez,16)


xopp=sectionize(hash2)
ntopp.addon(xopp)
end
anopp=Section.new
anopp.addon(ntopp)

c=3
notez.shuffle!
nuopp=Section.new

##############################
############################
4.times do
c=c*-1
hash2={}

notez.collect!{|v| v+c}
tym1=[1,1,1,1]
tym2=[2]
tym3=[1,1,2,2]
tym4=[1,1,0,0]
tymez=[tym1]
puts tymez.class
hash2[notez]=tymez

scayle(tymez,16)

xopp=sectionize(hash2)
nuopp.addon(xopp)
end
anopp.addon(nuopp)
anopp=anopp.a(4)
nnopp.addon(anopp)
####################3
###################

topp.makechannel(9)
bopp.makechannel(9)

stopp=t(topp,bopp,nnopp)

stopp=stopp.a(32)

  stopp.strt
  stopp.prg_chg(0,80)
    stopp.runn
