require 'Mo_h_hc'


combyn e: [2,3], f: [3,3], g: [2,4], h: [2,4], i: [2], j: [3,4], k: [4], l: [2], m: [3]



arofhashars=YAML.load_file('C:\ruby\mo\yamls\manz\combined.yaml')
#~ arofhashars.each do |obj|
#~ obj.each do |d| puts d end
#~ end
$fyl.puts arofhashars.inspect

s=Section.new

arofhashars.each do |hshar|
puts hshar
a=loop hshar[0]
b=loop hshar[1]
c=loop hshar[2]
d=loop hshar[3]
e=loop note: 0, beat: 1000100010001000100010001000100010001000100010001000100010001000

s.addon(t(a,b,c,d,e).a(2))

end

s=s.a(4)

s.makechannel 9
s.strt
s.runn

=begin

s=Section.new

x=loop note: 55, beat: 1001010 #55  66
a=loop note: 60, beat: 10011 #60  62
b=loop note: 64, beat: 10101010101
c=loop note: 68,  beat: 10010110001

s.addon(t(x,a,b).a(2),t(x,a,c).a(2))
s=s.a(2)

g=loop note: 69, beat: 10010010010
h=loop note: 65, beat: 101001011

#~ s.addon(t(g,h).a 2)

i=loop note: 67, beat: 10011010010
j=loop note: 63, beat: 101001011

ii=loop note: 66, beat: 10011010010
jj=loop note: 62, beat: 101001011


#~ s.addon(t(i,j).a(2),t(x,a,b).a(2))
#~ s.addon(t(x,a,b).a(2))
#~ s.addon(t(i,j).a(2),t(x,a,b).a(2))

s.makechannel 9
jon=s
t=s.uf
t.makechannel 0
s=t(t,s)


babs=Section.new

x=loop note: 55, beat: 1010100 #55  66
a=loop note: 60, beat: 10101 #60  62
b=loop note: 64, beat: 10010101010
c=loop note: 68,  beat: 10100010010

babs.addon(t(x,a,b).a(2),t(x,a,c).a(2))
babs=babs.a(2)

babs.makechannel 9



#~ s=s.a 4

y=t(g,h).a 2
yy=t(i,j)
yy2=yy.uf.a 2
yyy=t(ii,jj)

blax=s(y,yy2,y.uf,yy2.uf,y.uf,yy,yyy)
s.addon t(blax,babs)
s=s.a 2

s.strt
s.runn

=end