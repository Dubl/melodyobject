require './Mo_h_hc'
$variable=48
$direction=:up

def fanx

  if $variable>60 then
  $direction=:down
  $variable-=4
  elsif $variable<36 then
  $direction=:up
  $variable+=4
  else
    case $direction
    when :up
    $variable+=4
    when :down
    $variable-=4
    end
  end
  return $variable
end


#~ $fyl=File.open('ooutputter1001.txt','w')
#~ 4.times do

a=Section.new
a.sproute
#~ a.to_json
s=Section.new
#~ s.addon a.indx(1,1,2)
x=0

4.times do 

s.addon a.apply(
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
#~ s=s.a(4)

s.strt
  s.prg_chg(0,80)
s.runn 
puts 'done'
#~ end