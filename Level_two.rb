
module Level_two
require './Level_three'
#require 'yaml'
 
#~ class Hash
  #~ # Replacing the to_yaml function so it'll serialize hashes sorted (by their keys)
  #~ #
  #~ # Original function is in /usr/lib/ruby/1.8/yaml/rubytypes.rb
  #~ def to_yaml( opts = {} )
    #~ YAML::quick_emit( object_id, opts ) do |out|
      #~ out.map( taguri, to_yaml_style ) do |map|
        #~ sort.each do |k, v|   # <-- here's my addition (the 'sort')
          #~ map.add( k, v )
        #~ end
      #~ end
    #~ end
  #~ end
#~ end















$fyl=File.open('oout.txt','w')
#      $jfyl=File.open('..\treemo\public\fyl.json','w')
      $lvl=1
attr_accessor :lvl


def apply(*array_of_arrays)
#return a new section which is made up of the array of sections passed this (apply them). Not bound to any object...
s=Section.new
    array_of_arrays.each do |h|
         s.addon indx(h)
    end
     return s
end


def t(*arr)
  #this threads an array of sections together, and puts that threadset under a section. not sure if it needs to be under a section,
  #except that, it's passed as the top-level, it needs to be encapsulated as a section. there should be logic that treats a section
  #with only one threadset as its child as a threadset itself
  don=Section.new
  aadd=Threadset.new
  arr.each{|s|
    aadd.addon(s)}
  don.addon(aadd)
 return don
end

def s(*arr)
  #sectionize an array of sections
  don=Section.new
  arr.each{|d| don.addon(d)}
  return don
end

def indx(dims)
#pulls a copy of a descendant out of a section...based on an array, where first number is child, second: grandchild, and so on
case dims.length
when 1
obj=@children[dims[0]].uf
when 2
obj=@children[dims[0]].children[dims[1]].uf
when 3
obj=@children[dims[0]].children[dims[1]].children[dims[2]].uf
when 4
obj=@children[dims[0]].children[dims[1]].children[dims[2]].children[dims[3]].uf

end
obj.parent=nil
return obj

end

def indx_in_place(dims)
#same as indx, but doesn't pull a copy; instead points to the child itself
case dims.length
when 1
obj=@children[dims[0]]
when 2
obj=@children[dims[0]].children[dims[1]]
when 3
obj=@children[dims[0]].children[dims[1]].children[dims[2]]
when 4
obj=@children[dims[0]].children[dims[1]].children[dims[2]].children[dims[3]]

end
return obj

end


def dubl
  #doubles the notes- makes two for one, each 1/2 the length
  unless self.class==Ender
     unless@children.empty?
         @children.each do |i|
          i.dubl
          end
      end
  else
  val=@val
  chn=@chn
  len=@leng
  yndx=@parent.children.index(self)
  @parent.children[yndx]=Section.new
  @parent.children[yndx].parent=@parent  
  @parent.children[yndx].create_specific_notes([val,val],len/2)
  @parent.children[yndx].makechannel(@chn)
  puts "#{val}, #{val}, #{len/2}"

  end
end

def ends
  #prints out the enders' values and lengths
  unless self.class==Ender
     unless@children.empty?
         @children.each do |i|
          i.ends
          end
      end
  else
puts "yo #{@val}, #{@leng}"
  end

end

def hasharr
a=[]
a[0]=:var
a[1]=:dir
a[2]=:secvar
a[3]=:hi
a[4]=:lo
return a
end

def sproute(arghash={})
  #this is passed a third-party container, which it gives its own object. (the 'fanx' object), along with an optional block (for timing)
  # 4 levels of children are sprouted down...like branches- all being passed the same container and the fanx.
  # at the bottom level, specific notes are created based on the fanx.
  # the note given is fanx.fanx... and the length is either yielded from the block, or a hash argument, or default of 12
  # the goal is to encapsulate the logic for the notes in the fanxobj. this only applies the fanxobj to a bunch of different sections
  # presumably so that you could then manipulate the different sections later in section-specific ways.
  # so there would be a fanx-based logic, and then a section-based logic. theoretically you could then build a separate treatment
  # for the sections... globally affecting each one in whatever way
    val=0
       @lvl||=0
       
        arghash[:fanx]=Fanxobj.new(arghash) if @lvl==0
        
       #~ @lvl.times do str=str+" " end
       #~ puts " oh yeah" if block_given?
          #~ $fyl.puts str+self.to_s
          x=Proc.new if block_given?
          #~ puts 'uo'
       4.times do addon(Section.new) end
       @children.each do |d| d.lvl=@lvl+1 end

          if @lvl<3 then
            @children.each do |kid| block_given? ? kid.sproute(arghash,&x) : kid.sproute(arghash) end
            else
            #~ puts block_given? ? "yes" : "none"
            @children.each do |kid| 
            #~ puts val
            kid.create_specific_notes([arghash[:fanx].fanx,arghash[:fanx].fanx],block_given? ? yield(val) : arghash[:flag]||=12)
            val+=1
            end
            
          end
end

def spaceout(spacer=' ')
  if self.class==Ender
       nam=spacer+@name.to_s+" "+self.to_s+" val:"+@val.to_s+" #{@status}"+"]"
     else
     nam=spacer+"["+@name.to_s+" "+self.to_s+" status:"+@status.to_s.upcase+" situation:"+@situation.to_s+" children:"+@children.length.to_s
     end
  $fyl.print nam
  unless @children.empty?  
        @children.each do |d|    
        d.spaceout(spacer)       
        end                      
        end                      
end
    
def inspectout(spacer='')    
nam=self.inspect             
#~ $fyl.puts nam             
                            
end                          

def to_json
  
$jfyl.puts "{id:0,item:["
 to_jsonn
 $jfyl.puts " ]}"
end

def to_jsonn(lvl=0, spacer="",incchk=false)

       nokids=@children.empty?
       if nokids then

         str=spacer+"{id:#{lvl},text:\""+"#{@name} #{self.class.to_s} #{childtypestatus unless self.class==Ender}"+"\"}"#str=spacer+"{id:#{lvl},text:\""+self.to_s.gsub(/[#<>]/,'')+" #{@status} #{@val}"+"\"}"
         $jfyl.puts str
       else
          case lvl
            when 0
                        str="{id:#{$lvl},text:\"#{@name} #{self.class.to_s}\","
            else
              str=spacer+"{id:#{lvl},text:\""+"#{@name} #{self.class.to_s} #{childtypestatus unless self.class==Ender}"+"\","         # str=spacer+"{id:#{$lvl},text:\""+self.to_s.gsub(/[#<>]/,'')+" #{@status} #{@situation} #{@place} child:#{@currentchild}"+"\","
          end
              $jfyl.puts str
              spacer=spacer+'            '
              $jfyl.puts spacer+"item:["
              spacer=spacer+'       '
              @children.each do |kid|
                $lvl+=1
                lastkid=true
                lastkid=false unless kid==@children[@children.length-1]
                kid.to_jsonn($lvl,spacer,lastkid)
                $jfyl.puts spacer+"," unless lastkid
              end
              $jfyl.puts spacer+"]"
              $jfyl.puts spacer+"}"
       end
end
  
  
  
      
def addon(*args)
     args.each do |obj|
       
     obj.parent=self
     @children.push obj
     end
   end
           
def uf
    Marshal::load(Marshal.dump(self))
   end
  
def a(num)
     x=Section.new
     num.times do
       x.addon(self.uf)
     end
     return x
   end
   
def create_notes(num,len=4,lentype=:even,type=:all)
     
     num.times do
            bluci=rand(7)*7 % 12 + rand(8)*12
            while bluci<32
              bluci+=12
            end
            while bluci>100
              bluci-=12
            end
            if lentype==:rand then lenn=rand(len)+(1) else lenn=len end
            addon(Ender.new(bluci,lenn))
     end

    case type
      when :none
        @children.each do |i|
          i.val=nil
        end
      when :all
      when :low
        @children.each do |i|
          while i.val>50
            i.val-=12
          end
        end
      when :high
        @children.each do |i|
          while i.val<85
            i.val+=12
          end
        end

      when :drum1
        @children.each do |i|
          
          while i.val>47
            i.val-=10
          end
          while i.val<36
            i.val+=10
          end
          
        end
      end
    

   end
   
def loop(arghash={})
     a=Section.new
     tmp=Section.new
     tmp.create_specific_notes(60)
     len=tmp.children[0].leng
     #~ arghash.each do |f| puts f end
     #~ puts "ho #{arghash[:note]}"
     note=arghash[:note]
     beat=arghash[:beat].to_s
     #~ puts beat
     #~ sleep 1
     
     lenary=[]
     place=0
     
     begin
     #~ puts beat[place]
       if beat[place].to_i==1 then
       interiorplace=0
         begin
         interiorplace+=1
         place+=1
         #~ puts "#{beat[place].to_i} #{place} #{beat.length}"
         #~ sleep 0.5
         end until beat[place].to_i==1 or place>beat.length-1
       #~ puts "pushing #{interiorplace*len}"
       lenary.push interiorplace*len
       else
               a.create_specific_notes(0,len)
       place+=1
       end
     end until place>beat.length-1
      #~ return lenary
      lenary.each do |l|
        a.create_specific_notes(note,l)
      end
      return a
end
         
def create_specific_notes(arr,len=12)
     if arr.class==Fixnum  
       addon(Ender.new(arr,len))
     else
     p=0
     arr.each do |i|
            if len.class==Fixnum then
            addon(Ender.new(i,len))
            else
            addon(Ender.new(i,len[p])) unless len[p]==0
            p+=1
            end
     end
     end
end
   
def altr(type=:t)
 case type
 when :t
   x=bottomlevel!
   
 end


end
   
def sectionize(hash)
   s=Section.new
   notez=[]
   tymez=[]
       hash.each do|key,val|
        notez=key
        tymez=val
        end
        
       tymez.each do |p|
       stemp=Section.new
       
       stemp.create_specific_notes(notez,p)
       s.addon(stemp)
       end
   return s
end
   
def scayle(times,wich=:both)
  ar=bottomlevel!
  ar.each do |i|
    case wich
    when :both
      i.space*=times
      i.leng*=times
    when :space
      i.space*=times
    when :length
      i.leng*=times
    end
  end
end
   
   def makechannel(chn)
     if self.class==Ender
       @chn=chn
     else
       unless @children.empty?
         @children.each do |i|
           i.makechannel(chn)
         end
       end
     end
     
   end
       
   
   def altered(amount)
     x=self.uf
     x.alter(amount)
     return x
   end
   
   
   def alter(amount)
     unless @children.empty?
        @children.each do |d|
          if d.class==Ender
            d.val=d.val+amount
          else
            d.alter(amount)
          end
        end
      else
        if self.class==Ender then @val=@val+amount end
      end
   end
def chggran(neu)
        
      @seeder.internalgranularity=neu   if @granleader
      @children.each {|j| j.chggran(neu)} unless @children.empty?
    end
    
def combine(*args)
     y=self.uf
    x=Section.new
    x.addon(y)
     args.each do |d|
       x.addon(d)
     end
     return x
   end
   
def copy
     return self.uf
   end
   
end