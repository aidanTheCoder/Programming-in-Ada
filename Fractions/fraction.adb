with ada.text_IO;
with fraction_operations;
use ada.text_IO;
use fraction_operations;

procedure fraction is
    value_1:fraction_operations.fraction;
    value_2:fraction_operations.fraction;
    operator:character;
begin
    loop
        get(value_1);
        loop
            get(operator);
            exit when operator /= ' ';
        end loop;
        get(value_2);
        put(value_1);
        put(" " & operator & " ");
        put(value_2);
        put(" = ");
        if operator = '*' then
            fraction_operations.put(value_1 * value_2);
        elsif operator = '+' then
            fraction_operations.put(value_1 + value_2);
        end if;
        new_line(2);
    end loop;
end fraction;
