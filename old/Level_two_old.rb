
module Level_two
require 'Level_three'
      $jfyl=File.open('..\treemo\public\fyl.json','w')
      $lvl=1
attr_accessor :lvl


def apply(*array_of_arrays)
s=Section.new
array_of_arrays.each do |h|
     s.addon indx(h)
     end
     return s
     
end


def indx(dims)

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


    def sproute
    
       @lvl||=0
       str=""
       @lvl.times do str=str+" " end
          #~ $fyl.puts str+self.to_s
       4.times do addon(Section.new) end
       @children.each do |d| d.lvl=@lvl+1 end

          if @lvl<3 then
            @children.each do |kid| kid.sproute end
            else
            @children.each do |kid| kid.create_specific_notes([fanx,fanx]) end
          end
    end


def strt
    $midi = MIDIator::Interface.new
    $midi.autodetect_driver
    end

def prg_chg(track,program)
$midi.program_change(track,program)
end

def runn
 
    g=0.01
    webster=Array.new(6) { (rand(122-97) + 97).chr }.join


    stop=false
    
     trap('INT') {stop=true}
    
    until Midistack.done or stop==true
   
    x=Time.now.to_f

    go_down

    h=x+g  #-0.001
    while Time.now.to_f<h
    sleep 0.0001
    end
    Midistack.play
    #~ x+=1
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
        d.spaceout(spacer) end
      end
    end
    
   def inspectout(spacer='')
   nam=self.inspect
     #~ $fyl.puts nam

   end

      def to_json(lvl=0, spacer="",incchk=false)

     nokids=@children.empty?
     
     if nokids then
       
       str=spacer+"{id:#{lvl},text:\""+self.to_s.gsub(/[#<>]/,'')+" #{@status} #{@place}"+"\"}"
       $jfyl.puts str
     else
        case lvl
          when 0
                      str="{id:#{$lvl},text:\"#{Midistack.ticker}\","
          else
                      str=spacer+"{id:#{$lvl},text:\""+self.to_s.gsub(/[#<>]/,'')+" #{@status} #{@situation} #{@place} child:#{@currentchild}"+"\","
          end
            $jfyl.puts str
            spacer=spacer+'            '
            $jfyl.puts spacer+"item:["
            spacer=spacer+'       '
            @children.each do |kid|
              $lvl+=1
              lastkid=true
              lastkid=false unless kid==@children[@children.length-1]
              kid.to_json($lvl,spacer,lastkid)
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
   
   def create_notes(num,type=:all)
     
     num.times do
            bluci=rand(7)*7 % 12 + rand(8)*12
            while bluci<32
              bluci+=12
            end
            while bluci>100
              bluci-=12
            end
            addon(Ender.new(bluci))
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
            i.val-=12
          end
          while i.val<36
            i.val+=12
          end
          
        end
      end
      
      @children.each do |r|
      end

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
   
   def scayle(ar,v)
   ar.each do |i|
   x=0
   i.each do
   i[x]=i[x]*v
   x+=1
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