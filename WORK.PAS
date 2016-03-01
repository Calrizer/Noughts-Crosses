program crosses;

uses crt;

var names:array [1..2] of string;
position,symbol:string;
coords:array [1..3, 1..3] of string;
x,y,moves,check,checkX,checkY,win,rand:integer;
taken:boolean;

function getX:integer;
begin
	 if (position[1] = 'A') xor (position[1] = 'a') then
     begin
		x := 7;
        getX := 1;
     end
     else if (position[1] = 'B') xor (position[1] = 'b') then 
	 begin
		x := 11;
		getX := 2;
	 end
	 else if (position[1] = 'C') xor (position[1] = 'c') then 
	 begin
		x := 15;
		getX := 3;
	 end
     else getX := 0;
end;
function getY:integer;
begin
	 if position[2] = '1' then 
	 begin
		y := 11;
		getY := 1;
	 end
     else if position[2] = '2' then 
	 begin
		y := 13;
		getY := 2;
	 end
     else if position[2] = '3' then 
	 begin
		y := 15;
		getY := 3;
	 end
     else getY := 0;
end;

procedure getPos;
begin
     repeat
		 repeat
			GoToXY(1, 18);
			ClrEol;
			GoToXY(1, 20);
			CLrEol;
			GoToXY(1, 18);
			if (moves mod 2) = 0 then writeln(names[rand],' write your position...')
			else 
			begin
				if rand = 2 then writeln(names[1],' write your position...')
				else writeln(names[2],' write your position...');
                        end;
			writeln;
			readln(position);
		until (getX <> 0) and (getY <> 0);
	
		if (coords[getX,getY] = 'O') xor (coords[getX,getY] = 'X') then taken := true;
	 
	 until taken = false;
	 
	 GoToXY(x,y);
	 
	 if (moves mod 2) = 0 then 
	 begin
		symbol := 'O';
		coords[getX,getY] := symbol;
		write(symbol);
	 end
	 else 
	 begin
		symbol := 'X';
		coords[getX,getY] := symbol;
		write(symbol);
	 end;
	 
     moves := moves + 1;

end;

function checkBoard:boolean;
begin
	 for checkX := 1 to 3 do
	 begin
	     win := 0;
		 for checkY := 1 to 3 do if coords[checkX, checkY] = symbol then win := win + 1;
		 if win = 3 then break;
	 end;
	 if win <> 3 then
	 begin
		 for checkY := 1 to 3 do
		 begin
			 win :=  0;
			 for checkX := 1 to 3 do if coords[checkX, checkY] = symbol then win := win + 1;
			 if win = 3 then break;
		 end;
	 end;
	 if win <> 3 then 
	 begin
		 win := 0;
		 for check := 1 to 3 do 
		 begin
			 if coords[check,check] = symbol then win := win + 1;
			 if win = 3 then break;
		 end;
	 end;
	 if win <> 3 then if (coords[3,1] = symbol) and (coords[2,2] = symbol) and (coords[1,3] = symbol) then checkBoard := true;
		 
	 if win = 3 then checkBoard := true;
end;
begin

     Randomize;
     clrscr;
     TextColor(White);

     moves := 0;

     writeln('Welcome to noughts and crosses. Enter your names...');
     writeln;
     write('Player 1: ');
     readln(names[1]);
     writeln;
     write('Player 2: ');
     readln(names[2]);
     writeln;
	
	 rand := random(2) + 1;
	
     writeln(names[rand], ' is starting. You are noughts.');
     writeln;

     writeln('      A   B   C');
     writeln('    ษอออหอออหอออป');
     writeln('  1 บ   บ   บ   บ');
     writeln('    ฬอออฮอออฮอออน');
     writeln('  2 บ   บ   บ   บ');
     writeln('    ฬอออฮอออฮอออน');
     writeln('  3 บ   บ   บ   บ');
     writeln('    ศอออสอออสอออผ');
     writeln;

     repeat
           getpos;
		   checkBoard;
     until (moves = 9) or (checkBoard = true);
	 
	 writeln;
	 GoToXY(1,22);
	 if checkBoard = true then 
	 begin
		if symbol = 'O' then write(names[rand],' won the game!')
		else
		begin
			if rand = 2 then write(names[1],' won the game!')
			else write(names[2],' won the game!');
		end;
	 end
	 else write('The game ended in a tie.');
	 
	 readln;
end.