

#
#
#
#                     top   --> gotimeobject (which dictates when to play the children)
#     _________|________
#     |    |         |             |    |
#
#
#
#
#
#
#
#
#



def makeinstances(fun,num)
  ary=[]

  1.upto(num) {|instance| ary[instance-1]=eval(fun)}
return ary
end

def si(fun,num=1)
  s=makeinstances(fun,num)
  d=Section.new
  s.each{|e| d.addon(e)}
  return d
end

def rd
  rand(5)+40
end

def ssoun
  s(seoun,deoun)
  end

                  def seoun
                    infun('sounn',64,64,60,52,60,52)
                    #~ return s(sounn(34),sounn(30),sounn(34),sounn(30))
                  end

                  def deoun
                    infun('sounn',16,16,71,65,74,65).a 2
                    end


def duom
  infun('sounn',64,128,47)
end

def infun(fun,len,gran,*ary)
  s=Section.new
  ary.each do |i|
    s.addon(eval(fun+"("+i.to_s+","+gran.to_s+","+len.to_s+")"))
  end
  return s
end

  

def sounn(note,gran,len)
  timingary=[]
  noteary=[]
  0.upto(0) {
  noteary.push(note)
  timingary.push(gran)
  }

  a=objfromarys(noteary,timingary,len)
  a.makechannel 3
  return a
end






def g_comeon41(v,len=1)
topp=Section.new
topp.name=v.to_s
topp.create_specific_notes(v,len)
return topp
end

def objfromarys(noteary,timingary,len)
    x=GotimeObject.new(timingary)
  topp=Section.new(x)
  noteary.each {|d| topp.addon g_comeon41(d,len)}
     #~ $fyl.puts timingary.join(',')
  return topp
  
  end
  
  



def sta
  
  timingary=[]
  noteary=[]
  fee=rand(4)+1
  feei=fee
  rdi=rd
  
 0.upto(fee) {timingary.push(16/feei)}
  x=GotimeObject.new(timingary)
  topp=Section.new(x)
  noteary[0]=rd
  1.upto(fee-1) {noteary.push(rdi)}
  noteary.push(rd)
  noteary.each {|d| topp.addon g_comeon41(d)}
     $fyl.puts timingary.join(',')
  return topp

  end

def stedy
    timingary=[]
  noteary=[]
  fee=15
  0.upto(fee) {timingary.push(1)}
  x=GotimeObject.new(timingary)
  topp=Section.new(x)
  0.upto(fee-1) {noteary.push(0)}
  noteary.push(42)
  noteary.each {|d| topp.addon g_comeon41(d)}

  return topp
  end


def t(*arr)
  don=Section.new
  aadd=Threadset.new
  arr.each{|s|
    aadd.addon(s)}
  don.addon(aadd)
return don
  end

def s(*arr)
  don=Section.new
  arr.each{|d| don.addon(d)}
  return don
end

  
  
  def eu
  
r=[4,2,2,2,2,2,2,2,2,2,2,2,2,4]
x=GotimeObject.new(r)
topp=Section.new(x)
topp.name='toppy'

ary=[41,42,42,42,41,42,42,42,41,42,42,42,rand(6)+47,47]
ary.each {|d|
topp.addon g_comeon41(d)
}
topp.makechannel 1
#~ topp=topp.array_out(8)
return topp
end




def du
  a=g_combin(['wu','g_comeonblu5'])
  return a
end



def wu
  #~ s=Section.new 
  a=g_combin(['g_comeon55','g_comeon51'])
  a=a.array_out(4)
  t=g_combin(['g_comeon55','g_comeon50'])
  t=t.array_out(4)
  z=g_combin(['g_comeon55','g_comeon56'])
  z=z.array_out(64)
  s=Section.new
  s.addon(a,t)
  s=s.array_out(8)
  s.addon(z)
  #~ s=s.array_out 8
   #~ s.addon(g_comeon60,d)
   #~ s.makechannel 1
return s
end

def g_combin(ary)
  don=Section.new
  aadd=Threadset.new
  ary.each{|s|
    aadd.addon(eval(s))}
  don.addon(aadd)
return don
end

def g_comeonblu5
r=[4,6,8,10,12,14,16,18,20,22,24,26,28,32]
x=GotimeObject.new(r)
topp=Section.new(x)
topp.name='toppy'

ary=[41,42,42,42,41,42,42,42,41,42,42,42,49,47]
ary.each {|d|
topp.addon g_comeon41(d)
}
topp.makechannel 1
#~ topp=topp.array_out(8)
return topp
end


def g_comeon77
  s=Section.new
  s.create_notes(4,:none)
  return s
end

def g_comeon55
r=[8,16]
x=GotimeObject.new(r)
topp=Section.new(x)
topp.name='toppy'
ary=[41,41]
ary.each {|d|
topp.addon g_comeon41(d)
}
#~ topp=topp.array_out(8)
return topp
end

def g_comeon51
r=[4,8,14,16]
x=GotimeObject.new(r)
topp=Section.new(x)
topp.name='toppy'
ary=[42,45,43,44]
ary.each {|d|
topp.addon g_comeon41(d)
}
return topp
end

def g_comeon50
r=[4,6,8,14,16]
x=GotimeObject.new(r)
topp=Section.new(x)
topp.name='toppy'
ary=[42,42,45,43,44]
ary.each {|d|
topp.addon g_comeon41(d)
}
return topp
end


def g_comeon56
r=[4,6,8,10,12,14,16]
x=GotimeObject.new(r)
topp=Section.new(x)
topp.name='toppy'
ary=[42,42,45,45,45,44,44]
ary.each {|d|
topp.addon g_comeon41(d)
}
return topp
end





def g_comeon40(ary)
topp=Section.new(ary[0])
topp.create_specific_notes(ary[1])
topp.makechannel 1
return topp
end


def g_comeon70

topp=Section.new
x=45
ary=[[1,[45]],[10,[38]],[14,[43]],[1,[44]]]
ary.each {|d|
topp.addon g_comeon40(d)
}
topp.makechannel 0
topp=topp.array_out(8)
return topp
end

def g_comeon60

topp=Section.new

ary=[[4,[41]],[2,[40]],[2,[40]]]
ary.each {|d|
topp.addon g_comeon40(d)
}
topp=topp.array_out(8)
return topp
end



def g_comeon11
  topp=Section.new
  topp=g_comeon10

end




def g_aadd
  aadd=Section.new
2.times do
  # two different a's, which make up aadd
 a=Section.new(16) 
a.create_specific_notes(x=[40])
a.makechannel 1
a=a.array_out(4)
aadd.addon(a)
end
return aadd
end


def g_aadd2
  aadd=Section.new
2.times do
  # two different a's, which make up aadd
 a=Section.new(3) 
a.create_specific_notes(x=[54])
a.makechannel 1
a=a.array_out(4)
aadd.addon(a)
end
return aadd
end



def g_comeon10
  topp=Section.new(5)
  topp.addon(g_comeon5)
return topp
end

def g_comeon9
  topp=Section.new
  ts=Threadset.new
  topp.addon(ts)
  a=[1,16]
  ts.addon(g_comeon8,g_comeon4a(a))
return topp
end



def g_comeon8
  topp=Section.new
  2.times {topp.addon(g_comeon7('g_comeon6'))}
  return topp
end


def g_comeon7(x)
  topp=Section.new
  a=eval(x)  #how do i make the function the variable?
  b=eval(x)
  ary=[a,b,a.uf,b.uf]
 ary.each {|d| topp.addon(d)}
  return topp
end

def g_comeon6
  topp=Section.new(2)
  2.times do topp.addon(g_comeon5) end
  c=topp.array_out(4)
  return c
end



def g_comeon5

topp=Section.new

ary=[[1,1],[1,1],[1,1],[1,1]]
ary.each {|d|
topp.addon g_comeon4(d)
}
return topp
end

def g_comeon4(ary)


topp=Section.new(ary[0])
stopp=Section.new

topp.create_notes(ary[1],:drum1)

stopp=topp

end

def g_comeon4a(ary)


topp=Section.new(ary[0])
stopp=Section.new

topp.create_notes(ary[1],:none)

stopp=topp

end

def g_comeon2


topp=Section.new(6)
stopp=Section.new

topp.create_notes(16,:drum1)

stopp=topp

end






def g_comeon3
  stopp=Section.new
stopp.addon(stopthread)
stopp=stopp.array_out(2)

end

def stopthread
  stopthread=Threadset.new
stopthread.addon(s_topp,aadd)
return stopthread
end
  

def s_topp
  s_topp=Section.new
  2.times do
  t_tset=Threadset.new
t_tset.addon(g_comeon,g_comeon2)
#~ z=z.array_out(2)
#~ stopp.addon(x,y)
s_topp.addon(t_tset)
end
return s_topp
end

def aadd
  aadd=Section.new
2.times do
  # two different a's, which make up aadd
 a=Section.new(4) 
a.create_notes(16,:low)
a.makechannel 1
a=a.array_out(4)
aadd.addon(a)
end
return aadd
end



def g_comeon

topp=Section.new(4)
stopp=Section.new

topp.create_notes(16,:drum1)
stopp=topp
end


def g_comeon2


topp=Section.new(6)
stopp=Section.new

topp.create_notes(16,:drum1)

stopp=topp

end


def l_loaded

stopp=Section.new

dall=['rund-gqscvh']

 dall.each do |f|
   a=File.open("trax/eoms/#{f}.dat") do |g|
     Marshal.load(g)
   end
stopp=a
end
loaded=stopp
end

def l_loaded2

stopp=Section.new

dall=['rund-gud']

 dall.each do |f|
   a=File.open("eooms/#{f}.dat") do |g|
     Marshal.load(g)
   end
stopp=a
end
loaded=stopp
end


def l_load(obj)
  stopp=Section.new
   a=File.open("trax/eoms/#{obj}.dat") do |g|
     Marshal.load(g)
   end
stopp=a
end

def l_loaded3

stopp=Section.new

dall=['rund-nyce']

 dall.each do |f|
   a=File.open("eooms/#{f}.dat") do |g|
     Marshal.load(g)
   end
stopp=a
end
loaded=stopp
end

def g_popp
  popp=Section.new
  popp.addon(l_loaded3,stopthread,l_loaded3)
  return popp
end

def l_loaded4

stopp=Section.new

dall=['rund-fsp']

 dall.each do |f|
   a=File.open("eooms/#{f}.dat") do |g|
     Marshal.load(g)
   end
stopp=a
end
loaded=stopp
end

def l_loaded5

stopp=Section.new

dall=['rund-natt']

 dall.each do |f|
   a=File.open("eooms/#{f}.dat") do |g|
     Marshal.load(g)
   end
stopp=a
end
loaded=stopp
end


def dum
  infun('sounn',16,0)
end

def dunn
  infun('sounn',64,0)
  end
  