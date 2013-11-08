
require 'rubygems'
require  'midiator'
#~ require './lib/midiator/interface.rb'

class Bouncer
  attr_accessor :done
  attr_accessor :val
  attr_accessor :running
  attr_accessor :turned_on
  attr_accessor :inc
  attr_accessor :leng
  attr_accessor :del
  attr_accessor :sender
  attr_accessor :chn
  
  def initialize(packet=nil,chn=0,leg=4)
    @running=true
    @inc=0
    @turned_on=false
    @val=packet
    @chn=chn
    leg=4 if leg.nil?
    @leng=leg
    #~ puts @leng
  end
  
 def uf
    Marshal::load(Marshal.dump(self))
 end
  
end


class GotimeObject
  attr_accessor :val
  attr_accessor :internalgranularity
  attr_accessor :offset
  attr_accessor :gotimary
  attr_accessor :curraryval
  
def initialize(v)
  if v.class==Fixnum
    @val=v
    @internalgranularity=v
     @curraryval=0
  else
    @gotimary=v
    @curraryval=0
  end
end

  def granularity
    @internalgranularity#+rand(2)
  end
  
 def status
  if @gotimary.nil?
   if Midistack.ticker==0
     #~ puts 'slipped true'
     return true 
     else
       #~ puts 'slipped'
     x=(Midistack.ticker-@offset)%@internalgranularity==0
     return x
   end
  else
   #~ puts "mt:#{Midistack.ticker} os:#{@offset} cv#{@curraryval}  cvv#{@gotimary[@curraryval]}  t/f: #{Midistack.ticker-@offset==@gotimary[@curraryval]-1}"
   #~ $fyl.puts " #{@offset}, #{@curraryval}, len:#{@gotimary.length} #{@gotimary[@curraryval]}"
   return Midistack.ticker-@offset==@gotimary[@curraryval]-1
 end
end

end

class Midistack
  @stack=[]
  @echostack=[]
  @done=false
  @internaldone=false
  @ticker=0
  class<<self
    attr_reader :stack
    attr_reader :echostack
    attr_reader :done
    attr_reader :ticker
  end

  def self.feed(bouncer)
   @stack.push bouncer    unless bouncer.val.nil?

  end
  
  def self.done=(val)
    @done=val

  end
  
  def self.harvestechostack
    @echostack.each{|i|
    #~ puts "  cycling through #{i.val}"
     if i.inc==3
       #~ puts "    pushing to @stack #{i.val}"
       i.inc=0
       i.running=false
       @stack.push i unless i.val.nil?
     else
       i.inc+=1
     end}
  end
  
  def self.play
        #~ harvestechostack
    unless @internaldone
        @stack.each {|d| 
        d.inc+=1

                if d.turned_on==false 
                  d.turned_on=true
                  $midi.note_on(d.val,d.chn,100)
                  if d.chn==0
                    e=d.uf
                    e.inc=0
                    e.turned_on=false
                    @echostack.push e if e.running
                    #~ puts "pushing to echostack #{e.val}"
                  end
                   #~ $fyl.puts "#{d.val} #{d.chn} #{@ticker}"
                     #~ puts "#{d.val} #{d.chn} #{@ticker}"
                   #~ $fyl2.puts "#{d.val} #{d.chn} #{@ticker}"
                  #~ puts "#{d.val} #{d.chn} #{@ticker}"
                elsif d.inc>d.leng
                  $midi.note_off(d.val,d.chn,100)
                  d.del=true
                end
        }
              @stack.delete_if {|d| d.del}
    
              if @done
                  @internaldone=true
                  sleep($g)
              @stack.each {|d| $midi.note_off(d.val,d.chn,100)} 
              end
    @ticker+=1
    else
    @internaldone=false
  end
  #~ $fyl.puts " "
  #~ puts " "
  end
  
end



class MelodyObject

   attr_accessor :val
   attr_accessor :children
   attr_accessor :name
   attr_accessor :currentchild
   attr_accessor :parent 
   attr_accessor :status
   attr_accessor :situation
   attr_accessor :seeder
   attr_accessor :type
   attr_accessor :gotimeobject
   attr_accessor :chn
   attr_accessor :leng
   attr_accessor :tripped
   
   def detrip
                                         @tripped=false
                          
                      @gotimeobject.curraryval=0 unless @gotimeobject.class==Fixnum
                      unless @children.empty?
                      @children.each{|kid| kid.detrip}
                    end
   end
                  

   def initialize(seder=0)
     @children=[]   
     @name=self.class.to_s
     @currentchild=0
     @situation=:free
     @status=:notdone
     localinit(seder)
   end

    def localinit(x)
      end
  
    def gotime
      @gotimeobject.status
    end

    def statussituation(child)
      {child.status=>child.situation}
    end
      
    def statusempties
      {self.class=>if @children.empty? then :childrenempty else :childrennotempty end}
    end
  
    def go_down
                #~ $fyl.puts "   in go_down, #{self.name}'s status is #{statusempties}"
                #if first time going down, set the gotime objects start position
                unless @tripped 
              #~ $fyl.puts @tripped
                  @tripped=true
                 #~ $fyl.puts @tripped  
                  @gotimeobject.offset=Midistack.ticker
                end
        case statusempties
          
          when {Section=> :childrennotempty}
           @children[@currentchild].go_down
          
          when {Section=> :childrenempty}
          
            @status=:done
            backout
          
          when {Threadset=>:childrenempty}
          
            @status=:wait
            
          when {Threadset=>:childrennotempty}
          
           @children.each {|i| i.go_down}
            
        end
    end
          
    def backout
      
      if parent.nil?
        
        return
        
      else
        
        if self==@parent.children[parent.children.length-1]
          @status=:done
          @parent.status=:done
          @parent.backout
        else
          @status=:done
          @parent.currentchild+=1
          @parent.go_down
        end
        
      end
    end
    
                            
    def go_up(data)

      #~ puts "#{@name} going up"
       @status=:wait unless gotime
                      #~ $fyl.puts "      in go_up, #{self.name}'s status is #{@status}, going to checkchildstatus"
      checkchildstatus(data)
    end

    def checkchildstatus(data)
      
                                     #~ $fyl.puts "         in checkchildstatus, #{self.name}'s status is #{@status} and his childtypestatus is #{childtypestatus}"

              case childtypestatus
                  when {:lastchild=>:done}
                    #nochange
                    
                    if gotime
                                    #~ $fyl.puts "             in checkchildstatus, #{self.name}'s status changing to :done"
                      @status=:done 
                      @currentchild=0
                      @tripped=false
                      @gotimeobject.curraryval=0
                    else 
                                                           #~ $fyl.puts "             in checkchildstatus, #{self.name}'s status changing to :wait"

                      @status=:wait 
                    end
                    pass(data)
                  when {:lastchild=>:notdone}
                    #~ nochange
                    if gotime
                          #~ $fyl.puts "             in checkchildstatus, #{self.name}'s status changing to :notdone"
                      @status=:notdone 
                    else 
                          #~ $fyl.puts "             in checkchildstatus, #{self.name}'s status changing to :wait"
                      @status=:wait 
                    end
                    pass(data)
                  when {:notlastchild=>:done} #youre moving on to the next child though you wait
                    #~ nochange
                    
                    if gotime
                          #~ $fyl.puts "             in checkchildstatus, it says it's gotime, so #{self.name}'s status changing to :notdone"
                      @status=:notdone 
                      @currentchild+=1
                    else 
                          #~ $fyl.puts "             in checkchildstatus, #{self.name}'s status changing to :wait"
                      @status=:wait 
                    end
                    pass(data)
                  when {:notlastchild=>:notdone}
                      
                      #~ nochange
                      if gotime 
                            #~ $fyl.puts "             in checkchildstatus, #{self.name}'s status changing to :notdone"
                        @status=:notdone
                      else 
                            #~ $fyl.puts "             in checkchildstatus, #{self.name}'s status changing to :wait"
                        @status=:wait
                      end
                      pass(data)
                  when {:notlastchild=>:wait},{:lastchild=>:wait}
                      #nochange
                      #nochange
                          #~ $fyl.puts "             in checkchildstatus, #{self.name}'s status changing to :wait"
                      @status=:wait
                      pass(data)
                  when :notallchildrencollected
                      @childhash[@children[@currentchild]]=data #this assumes no sub-threads. if there are any then they blow it up
                       @currentchild+=1
                      #nochange
                      #stopdata
                  
                  when :allchildrencollected
                      @childhash[@children[@currentchild]]=data
                  
                    @children.each {|i| setsituations(i)}
                    @currentchild=0
                    passchildrensdata
                          
              end
    end
  

    
    def setsituations(child)
    if child.status==:done
     if children.length==1
       child.situation=:master
     else
      if child.situation==:free
        
        someone_else_is_a_slave=false
        
        @children.each {|d|
          unless d==child
            if d.situation==:slave
              someone_else_is_a_slave=true #someone else is a slave! you're either a slave or
              #a master!
            end
          end
        }
        
        if not someone_else_is_a_slave #no one else is a slave- you're a slave!
          child.situation=:slave
        else
          #someone else is a slave- are you a slave or maybe the master? youre the master if 
          #everyone else is a slave
          everyone_else_a_slave=true #assume everyone is until someone says theyre not
           @children.each {|d|
              unless d==child
                  if d.situation!=:slave
                    everyone_else_a_slave=false #not everyone else is a slave, so youre a slave
                  end
              end
            }
            
            if everyone_else_a_slave 
              child.situation=:master
            else
              child.situation=:slave
            end
            
        end
 
      end
     end
     
    end
  end
    
    
    
    def passchildrensdata
      #~ $fyl.puts  "              so how many children does #{self.name} think it has?: #{@children.length}"
      data=Bouncer.new
      data.val=Hash.new
      @children.each do |i|
          #~ $fyl.puts "   in passchildrensdata, (child) #{i.name}'s status is #{statussituation(i)}"
        case statussituation(i)
            
          when {:wait=>:master},{:wait=>:slave},{:wait=>:free}
              #nochange
              #nochange
              #stopdata
          
          when {:notdone=>:free},{:notdone=>:slave},{:notdone=>:master}
              #nochange
              #nochange
         
              data.val[i]=@childhash[i]
          when {:done=>:master}
          #~ puts "#{i.name} is done bitch"
              #nochange
              
              @status=:done
              data.val[i]=@childhash[i]
                                   #~ @tripped=false
                      #~ @gotimeobject.curraryval=0
          when {:done=>:slave}
              i.currentchild=0
              i.status=:notdone
              #nochange to self
              data.val[i]=@childhash[i]
              i.detrip

        end
        
      end
    
    pass(data) #unless data.val.empty?
    
    end

    def pass(data)
      #~ puts "#{@name} sez #{@status}, #{gotime}"
      if gotime then 
        @gotimeobject.curraryval+=1 
        @gotimeobject.offset=Midistack.ticker+1
        end
      if @parent.nil?
        unless @status==:wait
         #~ puts "sez not waiting"
          midifeed(data)
          Midistack.done=true if @status==:done
        end
      else
        #~ puts "#{@name} sez going to parent"
        @parent.go_up(data)
      end
    end
    

   def midifeed(bouncer)
     if bouncer.val.class==Hash
          bouncer.val.each_value {|e|
          midifeed(e)}

     else
                #~ $fyl.puts "                        so feeding a bouncer w #{bouncer.val}"
       Midistack.feed(bouncer)
     end
  
      
   end

    
    def lastchild
      @currentchild==@children.length-1
    end

   def spaceout(spacer='')
     if self.class==Ender
       nam=spacer+@name.to_s+" "+self.to_s+" val:"+@val.to_s
       else
     nam=spacer+@name.to_s+" "+self.to_s+" status:"+@status.to_s.upcase+" situation:"+@situation.to_s+" children:"+@children.length.to_s
   end
   $fyl.puts nam
     unless @children.empty?
        @children.each do |d|
        d.spaceout(spacer+' ') end
      end
    end
    
   def inspectout(spacer='')
   nam=self.inspect
     $fyl.puts nam

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
   
   def create_specific_notes(arr,len=4)
     if arr.class==Fixnum  
       addon(Ender.new(arr,len))
     else
   arr.each do |i|
            addon(Ender.new(i,len))
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


class Sections< MelodyObject
  
     def localinit(gotimobj)  #- when initializing from a structure, first create any gotimobj and deliver
          if gotimobj.class==Fixnum
            gotimobj=1 if gotimobj==0
            @tripped=false
              @gotimeobject=GotimeObject.new(gotimobj)
         else
            @gotimeobject=gotimobj
         end
      
      locallocal
     end
  
  def locallocal
    end
  
  def childtypestatus
      childtype=if @currentchild==@children.length-1 then :lastchild else :notlastchild end
      {childtype=>@children[@currentchild].status}
    end
  
end

class Threadset < Sections
  
   def locallocal
     @childhash=Hash.new
   end
 
    def childtypestatus
      if @currentchild==@children.length-1
        :allchildrencollected
      else
        :notallchildrencollected
      end
    end
 
 
end

class Section < Sections
 def heysection
   end
end

class Ender<MelodyObject
  
   def detrip
     end
  
  def initialize(seder,len)
     @val=seder
     @chn=0
     @leng=len
          @name=seder
          @children=[]
     #~ puts " #{@leng}"
   end
    
   def go_down
           #~ $fyl.puts "   in go_down, #{self.name}'s value is #{@val}"
     @status=:done
     envelope=Bouncer.new(@val,@chn,@leng)
     #~ puts "enderval: #{@val}"
     @parent.go_up(envelope)
   end
   
end













