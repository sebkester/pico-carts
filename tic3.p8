pico-8 cartridge // http://www.pico-8.com
version 18
__lua__

function _init()
 players = {}
 add(players, add_player("x"))
 add(players, add_player("o"))

 players[1].other = players[2]
 players[2].other = players[1]

 -- change one into human
 --players[1].strategy = wait_for_input

	ties=0
	
	always_start_middle=false
	
 playing = false
 --restart()
 
 starting = true
 show_start()
end

function restart()
 
 player = players[1]
 delay = 0;
 
	init_board()
 playing=true

 --testing = true


 if (testing) then
  run_test(t_full,player) 
 end
end

function _update()
 if (starting) then
  update_start()
 end
 
 if (not playing) then
  return
 end
 
 delay = delay-1;
 if (playing and delay <= 0) then
	 --print "next turn"
  next_move()

  delay = 1
 end
end

function next_move()
 --p = players[turn]
 p = player
 --print (p)
 move = get_move(board, p)
 if (move != nil) then
  board[move] = p.team
 	draw_board(board)
		print ("", 0, 50)
		print (p.team)
		print (move)
		print (is_win(board,"x"))
		print (is_win(board,"o"))
		if is_win(board, p.team) then
		 win(p)
		 return
		else
		 if count(open_squares(board)) == 0 then
    tie()
    return
			end		 
		end
  player = player.other
	else
	
 	draw_board(board)
 	draw_cursor()
 end
 
 

end

function win(p)
 playing=false
 p.score += 1
 print (p.team .. " wins!",0,100)
 restart()
end

function tie()
 playing=false
 ties += 1
 print ("tie game!",0,100)
 restart()
end
-->8
-- board checking
function init_board()

	board = {"","","","","","","","",""}
	b2 = {"x","","y","","y","","y","x","x"}
 ways = {{1,2,3},
 	{4,5,6},
 	{7,8,9},
 	{1,4,7},
 	{2,5,8},
 	{3,6,9},
 	{1,5,9},
 	{3,5,7}
 	}
end

function is_win(b,p)
 for way in all(ways) do
  if check(b,p,way) then
			return true
  end
 end

	return false
end

function check(b,p,squares)
 for s in all(squares) do
  if b[s] != p then
   return false
  end
 end
 
 return true
end

function open_squares(b)
 open={}
 for i=1,9 do
  if b[i] == "" then
   add(open,i)
   --print(i)
  end
 end
 return open
end

function random_item(box)
 if (count(box) == 0) then
  return nil
 end
 
 i = flr(rnd()*count(box) + 1)
 return box[i]
end

function copy_board(b)
 b2 = {}
 for i=1,count(b) do
  b2[i] = b[i]
 end
 
 return b2
end
-->8
-- drawing
function draw_board(b)
 cls()
 print("",0,0,7)
 print("x:"..players[1].score)
 print("o:"..players[2].score)
 print("")
 print("t:"..ties)
 
 h=16
 padx=7
 pady=6
 for y=0,2 do
  if (y<2) then
	  line(h, (y+1)*h, h*4, (y+1)*h, 12)
  end
  for x=1,3 do
   if (x>1) then
	   line(x*h, 0, x*h, h*3, 12)
   end
   print (b[y * 3 + x], x*h + padx,y*h + pady, 6)
  end
 end
end

function draw_cursor()
 h=16
 cx = (c-1) % 3 + 1
 cy = flr((c-1)/3)
 rect(h*cx, h*cy, h*cx+h, h*cy+h, 10)
end

-->8
-- player code
function add_player(team)
 p = {}
 p.team = team
 p.score = 0
 -- p.strategy = first_move
 -- p.strategy = random_move
 -- p.strategy = win_if_possible
 p.strategy = dont_lose
 return p
end

function get_move(b,p)
 return p.strategy(b,p)
end

-- simplest thing that could work
function first_move(b,p)
 open = open_squares(b)
 return open[1]
end

function random_move(b,p)
 open = open_squares(b)
 return random_item(open)
end

function win_if_possible(b,p)
 open = open_squares(b)
 for s in all(open) do
  b2 = copy_board(b)
  b2[s] = p.team
  if is_win(b2,p.team) then
   return s
  end
 end
 
 return random_item(open)
end


function dont_lose(b,p)
 -- sebby beater:
 if (always_start_middle and b[5]=="") return 5
 
 open = open_squares(b)
 
 -- win?
 for s in all(open) do
  b2 = copy_board(b)
  b2[s] = p.team
  if is_win(b2,p.team) then
   return s
  end
 end

 --bad_moves={}
 --he_wins={}
 for s in all(open) do
  b2 = copy_board(b)
  b2[s] = p.team
  m = win_if_possible(b2,p.other)
  if (m != nil) then
	  b2[m] = p.other.team
	  if is_win(b2,p.other.team) then
	   -- he will win by going here
	   -- so we want to move here
	   return m
	   
	  end
  end
 end
 
 -- this gets overwritten above
 open = open_squares(b)
 return random_item(open)
end

function win_deep(b,p)
 depth = 0
end

-->8
-- tests

function run_test(b,p)
	draw_board(b)
 print (get_move(b,p), 100, 0)
end

t_x_win = {"","","",
											"o","x","",
											"x","o",""}

t_x_win2 = {"","","o",
											"","x","x",
											"x","o",""}

t_o_win = {"o","","o",
											"","x","",
											"x","",""}

t_full =  {"o","x","o",
											"o","x","x",
											"x","o",""}
											
-->8
-- human player

c=5

function wait_for_input(b,p)

 if (btnp(0)) c = (c-1-1)%9+1
 if (btnp(1)) c = (c-1+1)%9+1
 if (btnp(2)) c = (c-1-3)%9+1
 if (btnp(3)) c = (c-1+3)%9+1

 if (btnp(4) and b[c]=="") then
  return c
 end
 return nil

end
-->8
-- start screen

function show_start()
 init_board()
 
 choice=0
end

function update_start()
 cls()
 draw_board(board)

 if (btnp(2)) choice = (choice-1)%3
 if (btnp(3)) choice = (choice+1)%3
 
 rectfill(0, 58+choice*10, 80, 66+choice*10, 10)
 
 print ("play as x", 10, 60, 5)
 print ("play as o", 10, 70, 5)
 print ("computer only", 10, 80, 5)
 
 if (btnp(4)) then
  if (choice == 0) then
   players[1].strategy = wait_for_input
  elseif (choice == 1) then
   players[2].strategy = wait_for_input
  end
	 starting = false
	 restart()
	 delay=2
 end
 
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
