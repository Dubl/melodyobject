
#require 'rubygems'
require  'midiator'
require './Level_two'
include Level_two
#~ require './lib/midiator/interface.rb'
class Array
  def alterindx(hash)

    self.each{|t| 
 #     puts "ho #{hash[t.val]}"
      t.val=hash[t.val]||0+t.val}
  end
end


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
     #~ puts 'zero'
     return true 
     else
       #~ puts 'slipped'
    x=Midistack.ticker%@internalgranularity==0
    #~ if x then puts 'yeh' end
     return x
   end
  else
   #~ puts "mt:#{Midistack.ticker} os:#{@offset} cv#{@curraryval}  cvv#{@gotimary[@curraryval]}  t/f: #{Midistack.ticker-@offset==@gotimary[@curraryval]-1}"
   #~ $fyl.puts " #{@offset}, #{@curraryval}, len:#{@gotimary.length} #{@gotimary[@curraryval]}"
   #~ return Midistack.ticker-@offset==@gotimary[@curraryval]-1
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
                  #~ puts d.chn
                  
                  gaga=(d.chn==9) ? 120 : 60
                  #~ puts gaga
                  $midi.note_on(d.val,d.chn,gaga)
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
                  #~ sleep($g)
              @stack.each {|d| $midi.note_off(d.val,d.chn,100)} 
              end
    @ticker+=1
    #~ puts "ticker:#{@ticker}"
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
   attr_accessor :nayme
   attr_accessor :currentchild
   attr_accessor :parent 
   attr_accessor :status
   attr_accessor :situation
   attr_accessor :seeder
   attr_accessor :type
   attr_accessor :gotimeobject
   attr_accessor :chn
   attr_accessor :leng
   attr_accessor :space
   attr_accessor :place
   attr_accessor :started
   attr_accessor :offset



def klean
unless @children==nil
  if @children.length==1 and @children[0].class!=Ender and @parent!=nil
    #tmp=@children[0]
    @children[0].parent=@parent
    @parent.children[parent.children.index(self)]=@children[0]       #children.each {|chile| chile.parent=self}    
  end
   @children.each {|chyle| chyle.klean}
    
end    
end

def threadout(*arr)
     arr.push self.uf

     newsec=t(*arr)
     if self.parent==nil
       s=Section.new
       s.addon(newsec)
       return s
     else
      self.parent.children[parent.children.index(self)]=newsec
      newsec.parent=self.parent
   #   p "a  "+newsec.name
    #  p "a  "+newsec.parent.name
      return newsec
    end
end


def repl(replacer)
  self.parent.children[parent.children.index(self)]=replacer # unless self.parent==nil
  replacer.parent=self.parent # unless self.parent==nil
  return replacer
end


def fynd!(addy)

  innerfynd!(addy)
  return $ss
end



def innerfynd!(addy)
  puts "#{self.class.to_s} #{@name}" if @name.to_s.length<6 and self.class!=Ender
  unless @children.empty?
      @children.each do |d|
          if d.name==addy

            $ss=d.uf
            $ss.parent=nil
          else
            d.innerfynd!(addy)
          end
      end
  else
    # p 'j'
  end

end

def fynd(addy)

  innerfynd(addy)
  return $ss
end



def innerfynd(addy)
  unless @children.empty?
      @children.each do |d|
          if d.name==addy

            $ss=d
          else
            d.innerfynd(addy)
          end
      end
  else
    # p 'j'
  end

end







  def nayme(naymelevel="1")
    @name=naymelevel
    unless @children.empty?
      unless @children[0].class==Ender
        lastnum=naymelevel[naymelevel.length-1].to_i

          inc=1
    @children.each do |kd|

       d=naymelevel+'.'+inc.to_s #after 9 levels, breaks...   
      
      kd.nayme(d)
      
      inc+=1
    end
      end
    end
  end
   
   def bottomlevel
  #  p 'bottomlevel'
     bl=[]
     self.innerbottomlevel(bl)
  #   puts 'now bl'
     return bl
   end
   
   def innerbottomlevel(bl)  
  #   p 'innerbottomlevel'
       unless @children.empty?
          @children.each do |d|
            if d.class==Ender
              bl.push(d.val) unless 0==d.val
            else
              d.innerbottomlevel(bl)
            end
          end
       else
          if self.class==Ender then bl.push(@val) end
       end
   end
   
   
   
   
   def bottomlevel!
 #    p 'bottomlevel!'
     bl=[]
     self.innerbottomlevel!(bl)
     return bl
   end
   
   def innerbottomlevel!(bl)
   #  p 'innerbottomlevel!'
     unless @children.empty?
        @children.each do |d|
          if d.class==Ender
            bl.push(d)
          else
            d.innerbottomlevel!(bl)
          end
        end
     else
        if self.class==Ender then bl.push(self) end
     end   
   
   
   
   end
   
   
   
   
  
   def alteri
p 'alteri'
   #something that alters based on note.
   #first, collect all notes.. then assign an amount to alter each, and apply throughout.

   a=self.bottomlevel
   
   a.each{|d| puts d}
   maphash={}
   a.each{|b| maphash[b]=rand(8)+b}
   p maphash
   self.bottomlevel!.alterindx(maphash)
   return self
   end


  def halved
    if @children.length==2 then
      @children.delete_at(1)
    else
      @children.each do |d|
        d.halved
      end
    end
  end
  
  
   
   def strt
       $midi = MIDIator::Interface.new
       $midi.autodetect_driver
   end

 #  def prg_chg(track,program)

   def runn

       g=0.015
       #webster=Array.new(6) { (rand(122-97) + 97).chr }.join


       stop=false

        trap('INT') {stop=true}

       until Midistack.done or stop==true

       x=Time.now.to_f

       go_down

       h=x+g  #-0.001
       GC.start
       while Time.now.to_f<h
       sleep 0.0001
       end
       Midistack.play
       #~ x+=1
       end
       Midistack.stack.each do |d|
          $midi.note_off(d.val,d.chn,100)
                     d.del=true
       end
       GC.start
   end
                  

   def initialize(seder=0)
     @children=[]   
     @name=self.class.to_s
     @currentchild=0
     @situation=:free
     @status=:notdone
     @started=false
     @space=1
     @offset=0
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
     $namarr.push @name if children[0]==nil or children[0].class==Ender #@name.length==$watchlevel ##
                #~ $fyl.puts "   in go_down, #{self.name}'s status is #{statusempties}"
                #if first time going down, set the gotime objects start position
 
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
    
    def checkwhere
    #~ puts "checking where, self is #{self.class}"
        if self.class==Threadset then
        @place=:both
        elsif self.class==Section then
        @place=:both
        else
            starting=starting?
            ending=ending?
            #~ puts "starting:#{starting} ending:#{ending}"
             case
             when (starting==true and ending==false)
             #~ puts 'y1'
             @place=:starting
             when (starting==true and ending==true)
             #~ puts 'y2'     
             @place=:both
             when (starting==false and ending==true)
              #~ puts 'y3'    
             @place=:ending
             when (starting==false and ending==false)
             #~ puts 'y4'     
             @place=:middle
             end
        end
    end

    def starting?
      if @started
        if Midistack.ticker==@offset
          true
        else
          false
        end
      else
      @offset=Midistack.ticker
      @started=true
      true
      end
    end

def ending?
#~ puts "class:#{self.class} kid ofst:#{@children[@currentchild].offset} kid spc:#{@children[@currentchild].space} ticker:#{Midistack.ticker}"
 #~ puts "HIII #{@offset} #{@space-1}"
 if Midistack.ticker==@offset+@space-1 then
  true
 else
  false
 end
end







    #~ def starting?
 #~ if @currentchild==0 and not @children[@currentchild].started then
 #~ @children[@currentchild].started=true
 #~ @children[@currentchild].offset=Midistack.ticker
 #~ puts 'starting- first'
 #~ return true
 #~ end
  #~ if @children[@currentchild].started then
    #~ if @children[@currentchild].offset==Midistack.ticker
      #~ puts 'starting'
      #~ return true
    #~ else
      #~ return false
    #~ end
 #~ else
 #~ @children[@currentchild].started=true
 #~ puts 'starting'
 #~ @children[@currentchild].offset=Midistack.ticker
 #~ true
 #~ end
#~ end
 


    
                            
    def go_up(data)
                                      #~ $fyl.puts "         in checkchildstatus, #{self.name}'s status is #{@status} and his childtypestatus is #{childtypestatus}"
#~ puts data.val
#~ puts "at top" if @parent.nil?
              cc.checkwhere
              
              case childtypestatus
                  when {:lastchild=>:done}
                    #nochange
                    
                                    #~ $fyl.puts "             in checkchildstatus, #{self.name}'s status changing to :done"
                    case cc.place
                    when :starting
                      @status=:notdone
                    when :both
                      @status=:done
                      @currentchild=0
                      
                      @children.each {|c|
                          c.status=:notdone
                          c.started=false
                          }
                          
                    when :ending
                      @status=:done
                      @currentchild=0
                      #maybe i just need to add a clause here which says: change @children (if there's a flag on this object)
                      #could it be that fucking easy?
                      #@children=@childrenlist[@flag.currentchildren] unless @flag==nil
                      #and then on the front end, create
                      #@childrenlist full of versions of @children
                      #and @flag which will contain the index of what children is current
                      #
                      #
                      #
                        @children.each {|c|
                          c.status=:notdone
                          c.started=false
                          }
                      
                      
                      data=Bouncer.new
                    when :middle
                      @status=:wait
                    end
                    
                    pass(data)
                    
                  when {:lastchild=>:notdone}
                    #~ nochange
                          #~ $fyl.puts "             in checkchildstatus, #{self.name}'s status changing to :notdone"
                       case cc.place
                       when :starting
                         @status=:notdone
                       when :both
                         @status=:notdone
                       when :ending
                         @status=:notdone
                         data=Bouncer.new
                       when :middle
                         @status=:wait
                       end
                       
                    pass(data)
                    
                  when {:notlastchild=>:done} #youre moving on to the next child though you wait
                    #~ nochange
                    
                          #~ $fyl.puts "             in checkchildstatus, it says it's gotime, so #{self.name}'s status changing to :notdone"
                          #~ puts 'nlc-d'
                        case cc.place
                        when :starting
                        @status=:notdone
                        when :both
                        @currentchild+=1
                        @status=:notdone
                        when :ending
                        @currentchild+=1
                        @status=:notdone
                        data=Bouncer.new
                        when :middle
                        @status=:wait
                        end
                    pass(data)
                  when {:notlastchild=>:notdone}
                      
                      
                      case cc.place
                        when :starting
                        @status=:notdone
                        when :both
                        @status=:notdone
                        when :ending
                        @status=:notdone
                        data=Bouncer.new
                        when :middle
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

        end
        
      end
    
    pass(data) #unless data.val.empty?
    
    end

    def pass(data)
      #~ puts "#{@name} sez #{@status}, #{gotime}"
      if @parent.nil?
      #~ puts "at top, val=#{if data.val.class==Hash then data.val.each_value {|d| d} else data.val end}"
        unless @status==:wait
         #~ puts "sez not waiting, val= #{val}"
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
    
    def cc
      @children[@currentchild]
    end

end


class Sections< MelodyObject
  
     def localinit(gotimobj)  #- when initializing from a structure, first create any gotimobj and deliver
          if gotimobj.class==Fixnum
            gotimobj=1 if gotimobj==0
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
  
  def initialize(seder,len=4)
     @val=seder
     @chn=0
     @space=len
     @leng=len
     @offset=0
          @name=seder
          @children=[]
          @started=false
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
print{"foo"}


