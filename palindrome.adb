with ada.text_IO;
use ada.text_IO;

procedure palindrome is
    subtype max_chars is integer range 1..10;
    word:string(max_chars);
    word_length:integer := 0;
    rev_char_pos:integer := 0; --reverse character position
    temp_char:character;
    is_palindrome:boolean := true;
begin
    put(" Enter a string: ");
    get_line(word, word_length);
    rev_char_pos := word_length;
    
    for char_pos in 1..(word_length/2) loop
        -- if compared characters are not same then not palindrome
        if word(char_pos) /= word(rev_char_pos) then
            is_palindrome := false;
            --swap characters
            temp_char := word(char_pos);
            word(char_pos) := word(rev_char_pos);
            word(rev_char_pos) := temp_char;
        end if;
        rev_char_pos := rev_char_pos - 1;
    end loop;  

    put(" after reversal, the string is " & word(1..word_length));
    if is_palindrome = true then
        put(", so it is a palindrome");
    else
        put(", so it is not a palindrome");
    end if;
end palindrome;
