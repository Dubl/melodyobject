require './Mo_h_hc'
#~ $fyl=File.open('tmp.txt','w')


#~ aer=[]
#~ 1000.times {aer.push (rand(4)+1)*6}


s=Section.new

a=Section.new
a.sproute var: 48,dir: :up, secvar: 7,hi: 60,lo: 36  #{|indux| aer[indux]}

b=Section.new
b.sproute var: 60, dir: :down, secvar: 7,hi: 72,lo: 48

tmp=qanx

oner=a.apply([3,3,1],[1,2,1],[3,1,2],[0,1,0])
oner.makechannel(3)

zwei=b.apply(*tmp)

one=t(zwei,oner)

#~ puts "HIJ #{tmp.inspect}"
tmp=qanx
two=a.apply(*tmp)

tmp=qanx
three=a.apply(*tmp)

tmp=qanx
four=a.apply(*tmp)

a.to_json

s.addon one.uf,two.uf #,one.uf,two.uf,three.uf,two.uf
#~ s=s.a(2)

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
s=s.a(4)
#~ s=Section.new
#~ s.addon(bratz)
s.strt
s.runn