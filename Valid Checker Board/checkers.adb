with ada.text_IO;
with ada.integer_text_IO;
use ada.text_IO;
use ada.integer_text_IO;

procedure checkers is

--checker piece enumerations and declarations
type grid_location is (b, RC, RK, BC, BK, E);
piece:grid_location;
package board_location is new Enumeration_IO(grid_location);

--checker board types and declarations
subtype num_columns is integer range 1..8;
board:array(num_columns, num_columns) of grid_location;
legal_board:boolean := true;

--counters for number of each color piece
num_red:integer := 0;
num_black:integer := 0;

begin
    --start the position in the lower left as position 1,1
    --rows are done backwards, columns are forward
    for row in reverse num_columns loop
        put("|---------------------------------------|");
        new_line;
        for column in num_columns loop
            board_location.get(piece);

            --count the number of piece and they are read in
            --Regular checkers count as 1, but for some reason
            --Kings count as 2
            case piece is
                when RC => num_red := num_red + 1;
                when RK => num_red := num_red + 2;
                when BC => num_black := num_black + 1;
                when BK => num_black := num_black + 2;
                when others => null;    
            end case;
    
            --determine where to partition grid locations with '|'
            --if the space is b, replace it with "  "
            case column is
                when num_columns'first => 
                    put("| ");
                    if piece /= b then 
                        board_location.put(piece); 
                    else 
                        put("  "); 
                    end if;
                when num_columns'last => 
                    put(" | ");
                    if piece /= b then 
                        board_location.put(piece); 
                    else 
                        put("  "); 
                    end if;
                    put(" |");
                when others => 
                    put(" | "); 
                    if piece /= b then 
                        board_location.put(piece);
                    else 
                        put("  "); 
                    end if;
            end case;

            --check for legality of a piece locations
            --if the row is odd, then even columns should be empty
            --if it is not then flag that location as an error
            --same holds for even rows and odd columns
            if row MOD 2 = 1 and column MOD 2 = 0 and piece /= b then
                board(row, column) := E;
            elsif row MOD 2 = 0 and column MOD 2 = 1 and piece /= b then
                board(row, column) := E;
            end if;

        end loop;
        new_line;
        if row = num_columns'first then
            put("|---------------------------------------|");
        end if;
    end loop;
    new_line(2);

    --traverse the board
    --print any locations flagged as errors
    for row in reverse num_columns loop
        for column in num_columns loop
            if board(row, column) = E then
                put("Square" & integer'image(row) & "," &
                    integer'image(column) &
                    " should have been blank but wasn't.");
                legal_board := false;
                new_line;
            end if;
        end loop;
    end loop;
    new_line;
    
    --evaluate the number of each color checker for legality
    if num_red > 12 then
        put("There are too many red pieces on the board.");
        legal_board := false;
    elsif num_black > 12 then
        put("There are too many black pieces on the board.");
        legal_board := false;
    end if;
    new_line(2);
    
    if legal_board then
        put("This is a legal board.");
    else
        put("This is not a legal board");
    end if;

end checkers;
