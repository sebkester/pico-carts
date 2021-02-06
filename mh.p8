pico-8 cartridge // http://www.pico-8.com
version 18
__lua__

function draw_horde(h)
 spr(h.s,h.x*12, (9-h.y)*12)
end

function r()
 return flr(rnd()*8)+1
end

function s()
 return flr(rnd()*13)+1
end

horde_1 = {x=r(),y=r(),s=s()}
horde_2 = {x=r(),y=r(),s=s()}

cls()
--draw_horde(horde_1)

mongolian_hordes={horde_1,horde_2}

function draw_hordes()
 for gir in all(mongolian_hordes) do
  draw_horde(gir)
 end 
end 

for i=1,30 do
 ho = {x=r(),y=r(),s=s()}
 add(mongolian_hordes,ho)
end

function draw_tile(n,x,y)
 spr(n, x*8, y*8)
end

map()

draw_tile(14,3,4)
draw_tile(14,7,4)
draw_tile(14,3,7)
draw_tile(14,4,8)
draw_tile(14,5,8)
draw_tile(14,6,8)
draw_tile(14,7,7)

draw_hordes()

--print( s())


__gfx__
0000000000044006000000000600000006000000f00dd00000000000600000006000000006560000660550006000000006000000000000003b3333333bbbbbbb
00000000000ff0060d0440000604400006004400f00ffd0000044000600650806000000004655000640ff00060056040060440000000000033333333bb4bbbbb
007007000226622f0d0ff0000f0f40000f00ff000ff7ef000f0ff400600f580860555500605ff50005044000400f6404060f4444000000003333333bb454b3bb
000770000f0550000555555000ffff0000fffff0000e70f000f7eff045655600450550500565565004655600056556000fffff0000004400b33b3b33bbbbbbbb
000770000004400000055050000ff0f00000ff0f007eeef0007e7e000006605000055040005665060406605000066050000ff0f00000ff0033333333bbbbbb4b
007007000084480000555500000550000000ff0000e7e700000f0f00000550400050050000655600000550000005504000055000000ffff0333b33b3bb3bb454
00000000088008800050050000f00f000000f0f0000f0ff0000f00f00060060000400400005005000060060000600600000f0f000000ff0033b33333b4bbbbbb
000000000800008000000000004000400000f00f000f000000000000004004000000000000600600005000500040040000040040000f55f033333b3b454b3bbb
bbb3bb3b000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb000333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b3bbbbbb003000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbb3b04330b330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3bb3bbbb033403380000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb433330400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbb3bb004000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111110e1111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111110e0e0e0e0e0e0e1111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
111111110e0e0e0e0e0e100e1111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111110e0e0e0e0e10100e0e0e11111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111110e10100f100e0e0e0e111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111110e0e101010100e1111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111110e0e0e100e0e111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111111111110e0e0e111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100003e2103e2103d2103d2003c200000003c2003c2003c2103b2103b2103a2103a2103a21011210392503a2503a2503a2503925039250392503a2503a2503a2503a2503a2503a25039250000000000000000
