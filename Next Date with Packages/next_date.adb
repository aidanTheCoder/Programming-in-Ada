with ada.text_IO;
with ada.integer_text_IO;
with date_IO;
use ada.text_IO;
use ada.integer_text_IO;

procedure next_date is

use date_IO;
controlChar:character := 'y';

begin
    put("Enter dates as month day, year. Months are Jan, Feb, Mar, Apr, May, June, July, Aug, Sept, Oct, Nov, and Dec.");
    new_line;
    while controlChar = 'y' loop
        exit when controlChar = 'n';
        new_line;
        date_IO.put(date_IO.nextDay(date_IO.getDate)); --gets a date from the user and then prints the next day's date
        new_line(2);
        loop
            begin
                put("  Again? [y/n]: ");
                get(controlChar);
                if controlChar = 'y' or controlChar = 'n' then
                    exit;
                else
                    skip_line;
                    new_line;
                    put("    Not a valid control input.");
                end if;
            exception
                when Data_Error =>
                    skip_line;
                    new_line;
                    put("    Not a valid control input.");
            end;
        end loop;
    end loop;
end next_date;
