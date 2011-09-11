require 'Mo_h_hc'

firstarofhashars=[]

    4.times do
    hashar=[]
              4.times do

              x={}
              x[:note]=rand(24)+48
              ar=""
                        (rand(12)+1).times do
                         preoone=rand(4)+1
                             case preoone
                                 when 1,2,3
                                 oone="0"
                                 else
                                 oone="1"
                             end
                          #~ oone=rand(2).to_s
                        ar.insert(-1,oone)
                        end
              x[:beat]=ar
              hashar.push x
              end
    firstarofhashars.push hashar
    end

File.open( 'animals.yaml', 'w' ) do |out|

    YAML.dump(firstarofhashars, out )
  end

arofhashars=YAML.load_file('canimals.yaml')
arofhashars.each do |obj|
obj.each do |d| puts d end
end


s=Section.new

hshar=arofhashars[2]

a=loop hshar[0]
b=loop hshar[1]
c=loop hshar[2]
d=loop hshar[3]
e=loop note:60, beat: 10001000100010001000100010001000

s.addon(t(a,b,c,d,e).a(16))
#~ s.addon c

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