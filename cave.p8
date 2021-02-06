pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- game stuff
function _init()
 running=true

 init_sub()
 draw_cave()
 move_to_start()
end

function _update()
 if (running==false) then
  if (btnp(4)) _init()
  return
 end
 
 update_sub()
 if (check_crash()) then
  explode()
  return
 end
 if x>=128 then
  level_up()
 end
end

function _draw()
 if (running==false) return

 erase_sub()
 move_sub()
 draw_sub()
end

function level_up()
 speed = speed + 0.2
 score = score + 1

 draw_cave()
 move_to_start()
end

function game_over()
 running=false
 print("game over",21,21,0)
 print("game over",20,20,7)
end

-->8
-- cave stuff

function draw_cave()
 -- draw the background
 for i=0,128 do
  line(0,i,128,i,i)
 end

 -- cave params
 h=16
 y=64-h/2
 s=6

 -- draw the cave 
 for x=0,128 do
  line(x,y,x,y+h,0)
  y=y+rnd(s)-s/2
 end
 
 s = "level "..score..": "..ceil(speed*100).. " miles per hour"
 print(s,2,4,0)
 print(s,1,3,7)
end

-->8
-- sub stuff

function init_sub()
 speed=0.4
 score = 0
end

function move_to_start()
 x=0
 y=64
 vx=1
 vy=0
 health=10
 our_color=11
end

function update_sub()
 vx=speed
 vy=0
 if btn(2) then vy=-speed end
 if btn(3) then vy=speed end
 if (btnp(5) and speed<3) then
  score = score - 1
  level_up()
 end 
end

function move_sub()
 x=x+vx
 y=y+vy
end

function draw_sub()
 pset(x,y,our_color)
end

function erase_sub()
 pset(x,y,0)
end

function check_crash()
 c = pget(flr(x+vx), flr(y+vy))
 c = pget(x+vx, y+vy)
 if c != 0 and c != our_color then
  return true
 end
 
 return false
end

function explode()
 sfx(0)
 health=health-1
 if (health < 7) our_color=10
 if (health < 3) our_color=8
 if (health < 1) game_over()
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100001e65023650276502c6502e6502b650216501e65023650246501b650176501665017650186501865017650166501b650266502e6502e6502b65028650216501a65015650136500f6500f6500000000000
