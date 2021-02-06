pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
function _init()
 x0=10
 y0=10
 x1=100
 y1=100
 
	new_speeds()
end

function _update()
 --if (rnd(100) < 2) new_speeds()
 x0 += vx0
 y0 += vy0
 x1 += vx1
 y1 += vy1              
 
 if (x0 > 128 or x0 < 0) vx0 = -vx0
 if (x1 > 128 or x1 < 0) vx1 = -vx1
 if (y0 > 128 or y0 < 0) vy0 = -vy0
 if (y1 > 128 or y1 < 0) vy1 = -vy1
 
 
end

function _draw()
	cls()
 line(x0,y0,x1,y0, 12)
 --line(x1,y0,x0,y1, 12)
 --line(x0,y1,x1,y1, 12)
 line((x0+x1)/2, y0, (x0+x1)/2, y1)
 
end

function new_speeds()
 vx0=(rnd(8)/4-4)
 vy0=(rnd(8)/4-4)
 vx1=(rnd(8)/4-4)
 vy1=(rnd(8)/4-4)
end
__gfx__
00000000005555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000056787650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000c99499c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000056aaa650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000006646600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000007aaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000007a99999a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000007a98889a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000007a98589a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000007a98889a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000007a99999a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000007aaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000050566565600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000050566565600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000060006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
