with ada.text_IO;
with ada.integer_text_IO;
use ada.text_IO;
use ada.integer_text_IO;

procedure hw2 is

user_input:integer := 0;
largest:integer := 0;
smallest:integer := 0;
negative_count:integer := 0;
positive_count:integer := 0;
largest_positive:integer := 0;
smallest_positive:integer := 0;
largest_negative:integer := 0;
smallest_negative:integer := 0;

begin
    loop
        put("Enter an integer: ");
        get(user_input);
        if user_input > 0 then 
            positive_count := positive_count + 1;
            
            if user_input > largest or largest = 0 then
                largest := user_input;
            end if;
        
            if user_input < smallest_positive or smallest_positive = 0 then
                smallest_positive := user_input;
            end if;
            
        elsif user_input < 0 then
            negative_count := negative_count + 1;
    
            if user_input < smallest or smallest = 0 then
                smallest := user_input;
            end if;

            if user_input > largest_negative or largest_negative = 0 then
                largest_negative := user_input;
            end if;
            
        end if;
        exit when user_input = 0;
    end loop;
    
    if positive_count + negative_count /= 0 then
        new_line;
        put("In total, you entered ");
        put(negative_count + positive_count, 0);
        put(" numbers");
        new_line;
        put("The largest was ");
        if positive_count /= 0 then
            put(largest, 0);
        else
            put(largest_negative, 0);
        end if;
        put(" The smallest was ");
        if negative_count /= 0 then
            put(smallest, 0);
        else
            put(smallest_positive, 0);
        end if;
        new_line;
    end if;
    
    if positive_count /= 0 then
        put("Total positive numbers: ");
        put(positive_count, 0);
        new_line;
        put("Largest positive number: ");
        put(largest, 0);
        put(" Smallest positive number: ");
        put(smallest_positive, 0);
        new_line;
    end if;
    
    if negative_count /= 0 then
        put("Total negative numbers: ");
        put(negative_count, 0);
        new_line;
        put("Largest negative number: ");
        put(largest_negative, 0);
        put(" Smallest negative number: ");
        put(smallest, 0);
    end if;        

end hw2;




