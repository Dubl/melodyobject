require 'Mo_h_hc'

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