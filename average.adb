with ada.text_IO;
with ada.integer_text_IO;
with ada.float_text_IO;
use ada.text_IO;
use ada.integer_text_IO;
use ada.float_text_IO;

procedure average is

subtype valid_integer is integer range 0..50;
user_input:valid_integer := 0;

good_inputs:integer := 0;
bad_inputs:integer := 0;
average:float := 0.0;

begin
    loop
        begin
            put("Enter an integer between 0 and 50: ");
            get(user_input);
            exit when user_input = 0;
            good_inputs := good_inputs + 1;
            average := average + float(user_input);
        exception
            when Constraint_Error =>
                put("  Invalid input value; Try again.");
                new_line;
                bad_inputs := bad_inputs + 1;
        end;
    end loop;
    new_line;
    average := average / float(good_inputs);
    put("While making ");
    put(bad_inputs, 0);
    put(" mistakes, you ultimately entered ");
    put(good_inputs, 0);
    put(" good values; their average is ");
    put(average, aft => 0, exp => 0);
end average;
