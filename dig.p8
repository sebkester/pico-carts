pico-8 cartridge // http://www.pico-8.com
version 18
__lua__

players = {}
blasts = {}

function _init()

 for x=0,127 do
	 for y=0,63 do
			mset(x, y, 1)
	 end 
 end 
 
 add(players, add_player(1))
 add(players, add_player(2))
end

function _update()
 for b in all(blasts) do
	 b.tick += 1;
	 if (b.tick > b.duration) then
	 	del(blasts, b)
	 end
 end
 
	for g in all(players) do
		if g.mining>0 then
			g.mining -=1
		else
		 g.fx = false
		 g.fy = false
		 g.angled = false
		 
		 if (btn(0, g.index-1)) try_x(g, -1)
		 if (btn(1, g.index-1)) try_x(g, 1)
		 if (btn(2, g.index-1)) try_y(g, -1)
		 if (btn(3, g.index-1)) try_y(g, 1)
		end
 end
	// players[1].x += 1
	// players[2].y += 0.5
end

function _draw()
 cls()
	draw_player(players[1], -4)
	draw_player(players[2], 63+4)
	
	
end




-->8
-- player
function add_player(index)
 p = {}
 p.index = index
 p.x = (rnd(120) + 4) * 8
 p.y = (rnd(56) + 4) * 8
 p.v = 1
 p.sprite = 15 + index
 p.mining = 0
 p.mine_time = 10
 
 p.facing = 0
 return p
end

function draw_player(p, sy)
 tx = flr(p.x / 8 - 8)
 ty = flr(p.y / 8 - 4)
 
 ox = p.x % 8
 oy = p.y % 8
 
 clip( 0, sy, 128, 64 )
 map(tx,ty,-ox,sy-oy,17,9)

	for g in all(players) do
	 spr(g.sprite + g.facing,g.x - tx*8 - ox - 4, sy + g.y - ty*8 -oy - 4)
	end
	
	for b in all(blasts) do
	 spr(blast_sprite(b), b.tx*8 - tx*8 - ox, sy + b.ty*8 - ty*8 -oy)
  print(blast_sprite(b))
	end


end


function try_x(p, d)
 if (d==1) then
  p.facing = 2
 else
  p.facing = 6
 end
 
	x = p.x + d * p.v
 tx = flr((x + 4*d) / 8)
 ty = flr((p.y+4) / 8)

 if maybe_blast(p, tx, ty) then
  return
 end
 
 p.x += p.v * d
end

function try_y(p, d)

 if (d==1) then
  p.facing = 4
 else
  p.facing = 0
 end
 
	y = p.y + d * p.v
 tx = flr((p.x + 4) / 8)
 ty = flr((p.y + 4*d) / 8)

 if maybe_blast(p, tx, ty) then
  return
 end

 p.y += p.v * d
end

function maybe_blast(p, tx, ty)
 t = mget(tx, ty)
	if (t==1) then
		mset(tx, ty, 0)
		p.mining = p.mine_time
		add_blast(tx, ty, 10, 48, 5)
		return true
	end
	
	return false
end

-->8
-- blast
function add_blast(tx, ty, duration, sprite, sprite_count)
 b = {}
 b.tx = tx
 b.ty = ty
 b.duration = duration
 b.tick = 0
 b.sprite = sprite
 b.sprite_count = sprite_count
 
 add(blasts, b)
end

function blast_sprite(b)
 return b.sprite + b.tick/b.duration*b.sprite_count
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
00600600000d0700d5d5d0000005d000dd0000dd000d5000000d5d5d0070d00000600600000d0600d5d5d0000005d000dd0000dd000d5000000d5d5d0060d000
0060060000d57000d5d5d00000005d00551aa15500d50000000d5d5d00075d000060060000d56000d5d5d00000005d00551bb15500d50000000d5d5d00065d00
000110000d5011070111006600a105d0dd1111dd0d501a0066001110701105d0000110000d5011060111006600b105d0dd1111dd0d501b0066001110601105d0
dd0aa0ddd50aa1700a1aa100501aa05d551aa155d50aa105001aa1a0071aa05ddd0bb0ddd50bb1600b1bb100501bb05d551bb155d50bb105001bb1b0061bb05d
551aa155501aa05d0a1aa100d50aa170dd0aa0dd071aa05d001aa1a0d50aa105551bb155501bb05d0b1bb100d50bb160dd0bb0dd061bb05d001bb1b0d50bb105
dd1111dd00a105d0011100660d50110700011000701105d0660011100d501a00dd1111dd00b105d0011100660d50110600011000601105d0660011100d501b00
551aa15500005d00d5d5d00000d570000060060000075d00000d5d5d00d50000551bb15500005d00d5d5d00000d560000060060000065d00000d5d5d00d50000
dd0000dd0005d000d5d5d000000d0700006006000070d000000d5d5d000d5000dd0000dd0005d000d5d5d000000d0600006006000060d000000d5d5d000d5000
0000aaaa0000bbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000aaaa0000bbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000aaaa0000bbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000aaaa0000bbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aaaa0000bbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aaaa0000bbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aaaa0000bbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aaaa0000bbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00500500005000000050000000500000000000000000000000000000000000000050000000500000000000000000000000000000000000000000000000000000
00000050700908500009000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00a0500000005000000050a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0050000000500a0a0080000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
50007000007907000000098000000900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000505090000050000000500000005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05800000050897000508000000900000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00050050000500500000005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
