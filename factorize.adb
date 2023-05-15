with ada.text_IO;
with ada.integer_text_IO;
use ada.text_IO;
use ada.integer_text_IO;

procedure factorize is

factor:integer := 0;
is_prime:integer := 0;

begin
    for dividend in 3..50 loop
        for i in 2..dividend loop
            if dividend MOD i /= 0 or dividend = i then
                is_prime := 1;
            else
                is_prime := 0;
            end if;
            exit when dividend MOD i = 0;
        end loop;
        if is_prime = 0 then
            put("  The factorization of ");
            put(dividend, 0);
            put(" is ");
            factor := dividend;
            for i in 2..dividend loop
                while factor MOD i = 0 loop
                    factor := factor / i;
                    put(i, 1);
                    if factor /= 1 then
                        put(" * ");
                    end if;
                end loop;
            end loop;
            new_line;
        else
            put(dividend, 0);
            put(" is prime");
            new_line;
        end if;
    end loop;
end factorize;
