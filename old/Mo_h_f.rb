module Mo_h_f
#~ require 'rubygems'
require  'midiator'
require 'Level_two'
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
     #~ $fyl.puts "#{@curraryval}=0"
  else
    @gotimary=v
    @curraryval=0
         #~ $fyl.puts "#{@curraryval}=0"
  end
end

  def granularity
    @internalgranularity#+rand(2)
  end
  
 def status
  if @gotimary.nil?
   if Midistack.ticker==0
     return true 
     else

     x=(Midistack.ticker-@offset)%@internalgranularity==0
     return x
   end
  else
   if Midistack.ticker-@offset==0 then 
   return true 
   else
   return Midistack.ticker-@offset==@gotimary[@curraryval] #-1
   end
 end
end

end

class Midistack
  $lvl=0
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
  str=Midistack.ticker.to_s
  
        #~ harvestechostack
    unless @internaldone
        @stack.each {|d| 
        d.inc+=1

                if d.turned_on==false 
                  d.turned_on=true
                  str<<" "+d.val.to_s
                  $midi.note_on(d.val,d.chn,100)
                  #~ if d.chn==0
                    #~ e=d.uf
                    #~ e.inc=0
                    #~ e.turned_on=false
                    #~ @echostack.push e if e.running
                    #~ puts "pushing to echostack #{e.val}"
                  #~ end
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
  #~ $fyl.puts str
  end
  
end



class MelodyObject

include Level_two

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
   #~ puts "self: #{self} down offset=#{@gotimeobject.offset} currarray=#{@gotimeobject.curraryval} that array val: #{if @gotimeobject.gotimary.nil? then "fuck" else @gotimeobject.gotimary[@gotimeobject.curraryval] end}  #{@gotimeobject.gotimary.to_s}" unless @gotimeobject.gotimary.nil?
          #~ $fyl.puts "#{self} child #{@currentchild}"
          if @currentchild==0 then
          
          #~ $fyl.puts "turning val to 0 for #{self}"
                  @gotimeobject.curraryval=0
                  #~ $fyl.puts "#{@curraryval}=0"
                  @gotimeobject.offset=Midistack.ticker
          end
          
          if gotime
          #~ $fyl.puts "gotime for #{self}"
          else 
          #~ $fyl.puts "not gotime for #{self}"
          return
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
                      #~ $fyl.puts "      in go_up, #{self.name}'s status is #{@status}, going to checkchildstatus"
      checkchildstatus(data)
    end

    def checkchildstatus(data)
      
                                     #~ $fyl.puts "         in checkchildstatus, #{self.name}'s status is #{@status} and his childtypestatus is #{childtypestatus}"

              case childtypestatus
                  when {:lastchild=>:done}
                    #nochange

                                    #~ $fyl.puts "             in checkchildstatus, #{self.name}'s status changing to :done"
                      @status=:done 
                      @currentchild=0
 
                    pass(data)
                  when {:lastchild=>:notdone}
                    #~ nochange
                          #~ $fyl.puts "             in checkchildstatus, #{self.name}'s status changing to :notdone"
                      @status=:notdone 
                    pass(data)
                  when {:notlastchild=>:done} #youre moving on to the next child though you wait
                    #~ nochange
     
                          #~ $fyl.puts "             in checkchildstatus, it says it's gotime, so #{self.name}'s status changing to :notdone"
                      @status=:notdone 
                      @currentchild+=1
     
                    pass(data)
                  when {:notlastchild=>:notdone}
                      
                      #~ nochange
                            #~ $fyl.puts "             in checkchildstatus, #{self.name}'s status changing to :notdone"
                        @status=:notdone
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
              #~ i.detrip

        end
        
      end
    
    pass(data) #unless data.val.empty?
    
    end

    def pass(data)
      #~ puts "#{@name} sez #{@status}, #{gotime}"
      if gotime then 
      #~ $fyl.puts "gotime for #{self}"
      #~ $fyl.puts "incrementing curraryval for #{self}"
        @gotimeobject.curraryval+=1
        #~ $fyl.puts "curraryval=#{@curraryval}"
        if lastchild
        else
         @gotimeobject.curraryval+=1
         #~ $fyl.puts "curraryval=#{@curraryval}"
         end
      @gotimeobject.offset=Midistack.ticker
        #~ @gotimeobject.offset=Midistack.ticker+1
        else
        #~ $fyl.puts "not gotime for #{self}"
        end
      if @parent.nil?
        unless @status==:wait
        #~ puts "#{@gotimeobject.offset} bouncer:#{data.val}"
         #~ puts "sez not waiting"
         
          midifeed(data)
          Midistack.done=true if @status==:done
        end
      else
        #~ puts "#{@name} sez going to parent"
        @parent.go_up(data)
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


end








