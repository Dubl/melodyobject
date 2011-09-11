require 'Mo_h_hc'

s=Section.new
a=
[[48,:up,7,60,36],
[60,:down,7,72,48],
[60,:down,4,72,48],
[60,:up,4,72,48],
[60,:up,6,84,48],
[60,:down,6,60,36],
[66,:down,4,72,48],
[66,:up,4,72,48],
[64,:up,4,68,44],
[64,:down,4,68,44]]


b=sproutenapply a

tmpj=t(b[0],b[1])
tmpk=t(b[2],b[3])
tmpl=t(b[4],b[5])
tmpm=t(b[6],b[7])
tmpn=t(b[8],b[9])

s.addon tmpj, tmpk, tmpl, tmpm, tmpn
s=s.a(2)

s.strt
s.runn