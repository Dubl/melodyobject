require './Mo_h_hc'
#~ $fyl=File.open('tmp.txt','w')


#~ aer=[]
#~ 1000.times {aer.push (rand(4)+1)*6}


s=Section.new
tmp=qanx

a=Section.new
a.sproute var: 48,dir: :up, secvar: 7,hi: 60,lo: 36  #{|indux| aer[indux]}

b=Section.new
b.sproute var: 60, dir: :down, secvar: 7,hi: 72,lo: 48

c=Section.new
c.sproute var: 60, dir: :down, secvar: 4,hi: 72,lo: 48
csection=c.apply(*tmp)

d=Section.new
d.sproute var: 60, dir: :up, secvar: 4,hi: 72,lo: 48
dsection=d.apply(*tmp)

e=Section.new
e.sproute var: 60, dir: :up, secvar: 6,hi: 84,lo: 48
esection=e.apply(*tmp)

f=Section.new
f.sproute var: 60, dir: :down, secvar: 6,hi: 60,lo: 36
fsection=f.apply(*tmp)

g=Section.new
g.sproute var: 66, dir: :down, secvar: 4,hi: 72,lo: 48
gsection=g.apply(*tmp)

h=Section.new
h.sproute var: 66,dir: :up,secvar: 4,hi: 72,lo: 48
hsection=h.apply(*tmp)

i=Section.new
i.sproute var: 64, dir: :up, secvar: 4,hi: 68,lo: 44
isection=i.apply(*tmp)

j=Section.new
j.sproute var: 64, dir: :down, secvar: 4,hi: 68,lo: 44
jsection=j.apply(*tmp)



one=a.apply(*tmp)
one.makechannel(3)

two=b.apply(*tmp)

#~ onetwo=t(one,two)

#~ puts "HIJ #{tmp.inspect}"
#~ tmp=qanx
three=a.apply(*tmp)


ga=fsection.uf
ga.makechannel(4)
#~ a.to_json

s.addon s(t(one.uf,two.uf),three.uf).a(4)

s.addon s(t(csection.uf,dsection.uf),t(esection.uf,ga)).a(4)

ia=isection.uf
ia.makechannel(4)
ia.dubl

ha=gsection.uf
ha.makechannel(4)
ha.dubl

s.addon s(t(hsection.uf,ha),t(jsection.uf,ia)).a(4)


#~ s.addon 

s=s.a(2)



$secondvariable=3

=begin
a=Section.new
a.sproute


tmp=qanx
#~ puts tmp.inspect
one=a.apply(*tmp)
tmp=qanx
#~ puts tmp.inspect
two=a.apply(*tmp)
tmp=qanx
#~ puts tmp.inspect
three=a.apply(*tmp)
tmp=qanx
#~ puts tmp.inspect
four=a.apply(*tmp)
s.addon one.uf,two.uf,one.uf,two.uf,three.uf,three.uf,four.uf
#~ s=s.a(2)
$secondvariable=4

a=Section.new
a.sproute


tmp=qanx
#~ puts tmp.inspect
one=a.apply(*tmp)
tmp=qanx
#~ puts tmp.inspect
two=a.apply(*tmp)
tmp=qanx
#~ puts tmp.inspect
three=a.apply(*tmp)
tmp=qanx
#~ puts tmp.inspect
four=a.apply(*tmp)
s.addon one.uf,two.uf,one.uf,two.uf,three.uf,three.uf,four.uf
=end
#~ s=s.a(4)
#~ s=Section.new
#~ s.addon(bratz)
s.to_json

s.strt
s.runn