require 'Mo_h_hc'
$fyl=File.open('tmp.txt','w')

$variable=48
$direction=:up
$secondvariable=7
$hilimit=60
$lolimit=36
aer=[]
1000.times {aer.push (rand(4)+1)*6}


a=Section.new
a.sproute #{|indux| aer[indux]}
puts 'lo'
s=Section.new

$variable=60
$direction=:down
$secondvariable=7
$hilimit=72
$lolimit=48

b=Section.new
tmp=qanx
puts tmp.inspect
b.sproute #{|indx| aer[indx]}
zwei=b.apply(*tmp)
puts tmp.inspect


#~ puts tmp.inspect
oner=a.apply(*tmp)
zwei=b.apply(*tmp)
oner.makechannel(3)
#~ $fyl.puts "#{zwei} #{oner}"
one=t(zwei,oner)
tmp=qanx
puts "HIJ #{tmp.inspect}"
two=a.apply(*tmp)
tmp=qanx
puts "HIJ #{tmp.inspect}"
#~ puts tmp.inspect
three=a.apply(*tmp)
tmp=qanx
#~ puts tmp.inspect
four=a.apply(*tmp)
bratz=one.uf
s.addon one.uf,two.uf #,one.uf,two.uf,three.uf,two.uf
#~ s=s.a(2)

$secondvariable=3

a=Section.new
a.sproute

=begin
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