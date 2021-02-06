pico-8 cartridge // http://www.pico-8.com
version 18
__lua__

function _init()
 players = {}
 add(players, add_player("x"))
 add(players, add_player("o"))

	ties=0
	
 restart()
end

function restart()
 
 turn=1
 playing=true
 
 
 delay = 0;
 
	init_board()
	cls()
	--draw_board(b2)
--	print ("")
--	print (is_win(b2,"x"))
--	print (is_win(b2,"y"))
	--print (open_squares(board)[1])
--	print (open_squares(b2)[1])
end

function _update()
 delay = delay-1;
 if (playing and delay <= 0) then
	 --print "next turn"
  next_move()

  delay = 1
 end
end

function next_move()
 p = players[turn]
 print (p)
 move = get_move(board, p)
 if (move != nil) then
  board[move] = p.team
 	draw_board(board)
		print ("", 0, 50)
		print (turn)
		print (p.team)
		print (move)
		print (is_win(board,"x"))
		print (is_win(board,"o"))
		if is_win(board, p.team) then
		 win(p)
		else
		 if count(open_squares(board)) == 0 then
    tie()
			end		 
		end
 end
 
 if turn==1 then 
 	turn=2
 else 
 	turn=1
 end
end

function win(p)
 playing=false
 p.score += 1
 print (p.team .. " wins!")
 restart()
end

function tie()
 playing=false
 ties += 1
 print ("tie game!")
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
 print("x:"..players[1].score)
 print("o:"..players[2].score)
 print("")
 print("t:"..ties)
 
 h=16
 padx=7
 pady=6
 for y=0,2 do
  if (y<2) then
	  line(h, (y+1)*h, h*4, (y+1)*h)
  end
  for x=1,3 do
   if (x>1) then
	   line(x*h, 0, x*h, h*3)
   end
   print (b[y * 3 + x], x*h + padx,y*h + pady)
  end
 end
end
-->8
-- player code
function add_player(team)
 p = {}
 p.team = team
 p.score = 0
 -- p.strategy = first_move
 -- p.strategy = random_move
 p.strategy = win_if_possible
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

function win_deep(b,p)
 depth = 0
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
