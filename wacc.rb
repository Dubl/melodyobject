require 'Mo_h_hc'

s=Section.new

x=loop note: 55, beat: 1001010
a=loop note: 60, beat: 10011
b=loop note: 64, beat: 10101010101
c=loop note: 68,  beat: 10010110001

s.addon(t(x,a,b).a(2),t(x,a,c).a(2))
s=s.a(2)

g=loop note: 69, beat: 10010010010
h=loop note: 65, beat: 101001011

s.addon(t(g,h).a 2)

i=loop note: 67, beat: 10011010010
j=loop note: 63, beat: 101001011

s.addon(t(i,j).a(2),t(x,a,b).a(2))

s=s.a 4
s.strt
s.runn