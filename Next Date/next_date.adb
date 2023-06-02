with ada.text_IO;
with ada.integer_text_IO;
use ada.text_IO;
use ada.integer_text_IO;

procedure next_date is

type month_names is (Jan, Feb, Mar, Apr, May, June, July, Aug, Sept, Oct, Nov, Dec);
package month_IO is new Enumeration_IO(month_names);
subtype days_per_month is integer range 1..31;
subtype years_range is integer range 1900..2100;

type date is record
    month:month_names := Jan;
    day:days_per_month := 1;
    comma:character := ',';
    year:years_range := 1900;
end record;

function getDate return date is
    fecha:date; --fecha is date in Spanish. Wasn't feeling super creative here ;)
begin
    loop
        --get the date. If there is an exception exit the first loop and try again
        --if the date is correct, exit both loops
        put("  Enter dates as mon dd, yyyy: ");
        loop
            begin
                month_IO.get(fecha.month);
            exception
                when Data_Error =>
                    put("    Not a valid month; try again.");
                    new_line(2);
                    skip_line;
                    exit;
            end;

            begin
                get(fecha.day);
                case fecha.month is
                    --when month has 30 days
                    when Apr | June | Sept | Nov =>
                        --check if the user knows how many days can be in a 30 day month
                        if fecha.day < 1 or 30 < fecha.day then
                            put("    Never that many days in ");
                            month_IO.put(fecha.month);
                            put("; try again.");
                            new_line(2);
                            skip_line;
                            exit;
                        end if;
                    --when Feb because Feb is weird
                    when Feb =>
                        --since I can personally guarantee that Feb will never more than 29 days
                        if 29 < fecha.day then
                            put("    Never that many days in ");
                            month_IO.put(fecha.month);
                            put("; try again.");
                            new_line(2);
                            skip_line;
                            exit;
                        end if;
                    when others =>
                        null; --Accounts for months with 31 days. All handled in expception block
                end case;
                
            exception
                when Constraint_Error =>
                    put("    No month has that many days; try again;");
                    new_line(2);
                    skip_line;
                    exit;
                when Data_Error =>
                    put("    Not a valid day (not a number); try again.");
                    new_line(2);
                    skip_line;
                    exit;
            end;
            
            begin
                --check that user can properly punctuate a date
                get(fecha.comma);
                if fecha.comma /= ',' then
                    put("    Expected a comma there between the day and the year; try again.");
                    new_line(2);
                    skip_line;
                    exit;
                end if;
            exception
                when Data_Error =>
                    put("    Expected a comma there between the day and the year; try again.");
                    new_line(2);
                    skip_line;
                    exit;
            end;
            
            begin
                get(fecha.year);
                --check for leap year if Feb and 29, since it's the only day/month with this issue
                if fecha.month = Feb and fecha.day = 29 and fecha.year MOD 4 /= 0 then
                    put("    " & integer'image(fecha.year) & " is not a leap year; try again.");
                    new_line(2);
                    skip_line;
                    exit;
                end if;
                    
            exception
                when Data_Error =>
                    put("    Not a valid year; try again.");
                    new_line(2);
                    skip_line;
                    exit;
                when Constraint_Error =>
                    put("    Not a valid year; try again.");
                    new_line(2);
                    exit;
            end;
            return fecha;
        end loop;  
    end loop;
end getDate;

function nextDay(today:in date) return date is
    tomorrow:date := today;
begin
    put("    The next day is ");
    --in a sense, if it's the last day go to the first day and change the month
    --if it's not the last day go to the next day
    case tomorrow.month is
        --if month has 31 days
        when Jan | Mar | May | July | Aug | Oct | Dec =>
            if today.day < 31 then
                tomorrow.day := today.day + 1;
            else
                tomorrow.day := 1;
                --if it's the beginning of a new year
                if today.month = Dec then
                    tomorrow.month := Jan;
                    tomorrow.year := today.year + 1;
                else
                    tomorrow.month := month_names'succ(today.month);
                end if;    
            end if;
        --if month has 30 days
        when Apr | June | Sept | Nov =>
            if today.day < 30 then
                tomorrow.day := today.day + 1;
            else
                tomorrow.day := 1;
                tomorrow.month := month_names'succ(today.month);
            end if;
        when Feb =>
            --if it's the last day of Feb
            if (today.year MOD 4 = 0 and today.day = 29) or (today.year MOD 4 /= 0 and today.day = 28) then
                tomorrow.day := 1;
                tomorrow.month := month_names'succ(today.month);
            else
                tomorrow.day := today.day + 1;
            end if;
    end case;
    return tomorrow;
end nextDay;

procedure put(some_date:in date) is
begin
    month_IO.put(some_date.month);
    put(" ");
    put(some_date.day, 0);
    put(some_date.comma);
    put(" ");
    put(some_date.year, 0);
end put;

the_date:date;
controlChar:character := 'y';

begin
    put("Enter dates as month day, year. Months are Jan, Feb, Mar, Apr, May, June, July, Aug, Sept, Oct, Nov, and Dec.");
    new_line;
    while controlChar = 'y' loop
        exit when controlChar = 'n';
        new_line;
        put(nextDay(getDate)); --gets a date from the user and then prints the next day's date
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
