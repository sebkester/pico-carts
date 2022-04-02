pico-8 cartridge // http://www.pico-8.com
version 18
__lua__

players = {}

function _init()

 for x=0,127 do
	 for y=0,63 do
			mset(x, y, 1)
	 end 
 end 
 
 add(players, add_player())
 add(players, add_player())
 
end

function _update()
	players[1].x += 1
	players[2].y += 0.5
end

function _draw()
 cls()
	draw_player(players[1], -4)
	draw_player(players[2], 63+4)
	
	
end




-->8
-- player
function add_player()
 p = {}
 p.x = (rnd(120) + 4) * 8
 p.y = (rnd(56) + 4) * 8
 
 return p
end

function draw_player(p, sy)
 tx = flr(p.x / 8 - 8)
 ty = flr(p.y / 8 - 4)
 
 ox = p.x % 8
 oy = p.y % 8
 
 clip( 0, sy, 128, 64 )
 map(tx,ty,-ox,sy-oy,17,9)

	print (ox)

end
__gfx__
00000000005005006060005000100010000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000050000500050650011011000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000050000506500000000000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000005000050005006000000100000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000500050000600060500111010000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000005055600050010000000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000050000000006050601100001006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000500500050500500000000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00600600006006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00600600006006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00011000000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dd0aa0dddd0bb0dd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
551aa155551bb1550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dd1111dddd1111dd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
551aa155551bb1550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dd0000dddd0000dd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000aaaa0000bbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000aaaa0000bbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000aaaa0000bbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000aaaa0000bbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aaaa0000bbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aaaa0000bbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aaaa0000bbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aaaa0000bbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0103030101010202010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0103030301010102020201010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0103030101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
