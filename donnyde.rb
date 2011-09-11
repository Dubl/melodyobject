require './Mo_h_hc'
$variable=48
$direction=:up
$secondvariable=4
$hilimit=60
$lolimit=36




#~ $fyl=File.open('ooutputter1001.txt','w')
#~ 4.times do

a=Section.new
a.sproute
#~ a.to_json
s=Section.new
#~ s.addon a.indx(1,1,2)
x=0

1.times do 


s.addon a.apply(
#~ [x],
[[x,0,0],
[x,1,1,0],
[x,1,2,0],
[x,1,3,0],
[x,1,0,0],
[x,2,0],
[x,2,1,0],
[x,2,2,0],
[x,2,3,0],
[x,2,0,0],
[x,3,0],
[x,3,1,0],
[x,3,2,0],
[x,3,3,0],
[x,3,0,0],
[x,3,0],
[x,0,1,0],
[x,0,2,0],
[x,0,3,0],
[x,0,0,0]]
)
x+=1
end
x=0

u=s.uf
v=s.uf
dd=Section.new
drumz=Section.new
drumz.addon u.a(2)
$variable=50
$secondvariable=6
$lolimit=42
$hilimit=60
b=Section.new
b.sproute
2.times do 

dd.addon b.apply(
#~ [x],
[x,0,0],
[x,1,1,0],
[x,1,2,0],
[x,1,3,0],
[x,1,0,0],
[x,2,0],
[x,2,1,0],
[x,2,2,0],
[x,2,3,0],
[x,2,0,0],
[x,3,0],
[x,3,1,0],
[x,3,2,0],
[x,3,3,0],
[x,3,0,0],
[x,3,0],
[x,0,1,0],
[x,0,2,0],
[x,0,3,0],
[x,0,0,0]
)
x+=1
end
dd.makechannel(1)
s.addon dd

def tst(obj)
 unless obj.class==Ender
  puts obj.class
     unless obj.children.empty?
         obj.children.each do |i|
          tst(i)
          end
      end
  else
  puts "#{obj.val}, #{obj.leng}"
  end
end

jk=a.indx_in_place([x,0,0])
tst(jk)

jk.ends
#~ jk.dubl
jk.ends

s.addon v

q=a.apply(
#~ [x],
[x,0,0],
[x,1,1,0],
[x,1,2,0],
[x,1,3,0],
[x,1,0,0],
[x,2,0],
[x,2,1,0],
[x,2,2,0],
[x,2,3,0],
[x,2,0,0],
[x,3,0],
[x,3,1,0],
[x,3,2,0],
[x,3,3,0],
[x,3,0,0],
[x,3,0],
[x,0,1,0],
[x,0,2,0],
[x,0,3,0],
[x,0,0,0]
)

#~ q.dubl
q.makechannel(9)
drumz.makechannel(9)
t=s.uf
oi=s.uf
oi.children[0].makechannel(3)
oi.children[1].makechannel(2)
g=u
s=Section.new
g=Threadset.new
g.addon(t,drumz)
h=Threadset.new
h.addon(oi,q)

s.addon(g,h)

#~ s=s.a(4)
#~ s=oi.children[1]
s.strt
  s.prg_chg(0,80)
s.runn 
puts 'done'
#~ end