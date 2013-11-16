
def sproutenapply(ary)
b=[]
ary.each {|d|
f=Section.new
h=Hash.new
d.each_index do |e|
h.store(hasharr[e],d[e])
end
#~ h.each_pair do |d,e| puts "#{d} #{e}" end
f.sproute(h) {(rand(4)+1)*12}
b.push f.apply(*qanx)
#~ sbaby.to_json if d=a[0]
}

return b

end

def combyn(hsh)
combind=[]

#~ s=Section.new
        hsh.each_key do |ltr|
fyl=''        
        fyl<<ltr.to_s+'animals'
                hsh[ltr].each do |sec|
                fyl<<sec.to_s
                end
        fyl<<'.yaml'
        #~ puts File.dirname(__FILE__)
        #~ puts fyl
        tmp=YAML.load_file(fyl)
#~ puts  "HI #{hsh[ltr]}"
                hsh[ltr].each do |sec|
                        yoursec=tmp[sec-1]
                        combind.push yoursec
                end
        end
        
File.open( 'combined.yaml', 'w' ) do |out|

    YAML.dump(combind, out )
  end
        
end
 

def fanx

  if $variable>$hilimit then
  $direction=:down
  $variable-=$secondvariable
  elsif $variable<$lolimit then
  $direction=:up
  $variable+=$secondvariable
  else
    case $direction
    when :up
    $variable+=$secondvariable
    when :down
    $variable-=$secondvariable
    end
  end
  #~ $fyl.puts "#{self} #{$variable}"
  return $variable
end

class Fanxobj

attr_accessor :variable
attr_accessor :hilimit
attr_accessor :secondvariable
attr_accessor :lolimit
attr_accessor :direction


def initialize(hsh={})
@variable=hsh[:var]||=60
@hilimit=hsh[:hi]||=72
@lolimit=hsh[:lo]||=48
@secondvariable=hsh[:secvar]||=5
@direction=hsh[:dir]||=:up
end

def fanx
  if @variable>@hilimit then
  @direction=:down
  @variable-=@secondvariable
  elsif @variable<@lolimit then
  @direction=:up
  @variable+=@secondvariable
  else
    case @direction
    when :up
    @variable+=@secondvariable
    when :down
    @variable-=@secondvariable
    end
  end
  #~ @fyl.puts "#{self} #{@variable}"
  return @variable
end

end


def qanx
a=[]
(4).times do
t=[]
(3).times do
t.push (rand(4))
end
a.push t
end
return a
end

