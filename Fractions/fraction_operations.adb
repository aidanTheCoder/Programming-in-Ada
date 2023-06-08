with ada.integer_text_IO;
with ada.text_IO;
use ada.integer_text_IO;
use ada.text_IO;

package body fraction_operations is
    procedure get(part:out fraction) is
        slash:character;
    begin
        get(part.numerator);
        get(slash);
        get(part.denominator);
    end get;

    procedure put(part:in fraction) is
    begin
        put(part.numerator, 0);
        put("/");
        put(part.denominator, 0);
    end put;
    
    procedure reduce(unreduced_fraction:in out fraction) is
        n:integer := unreduced_fraction.numerator;
        m:integer := unreduced_fraction.denominator;
        remainder:integer := 0;
        gcd:integer := 0;
    begin
        loop
            exit when n = 0;
            remainder := m MOD n;
            m := n;
            n := remainder;
        end loop;
        
        gcd := m;
        unreduced_fraction.denominator := unreduced_fraction.denominator / gcd;
        unreduced_fraction.numerator := unreduced_fraction.numerator / gcd;
    end reduce;

    function "*"(part_A:in fraction; part_B:in fraction) return fraction is
        out_fraction:fraction;
    begin
        out_fraction.numerator := part_A.numerator * part_B.numerator;
        out_fraction.denominator := part_A.denominator * part_B.denominator;
        reduce(out_fraction);
        return out_fraction;
    end "*";

    function "+"(part_A:in fraction; part_B:in fraction) return fraction is
        out_fraction:fraction;
    begin
        
        out_fraction.numerator := (part_A.numerator * part_B.denominator) + (part_B.numerator * part_A.denominator);
        out_fraction.denominator := part_A.denominator * part_B.denominator;
        if out_fraction.numerator /= out_fraction.denominator then
            reduce(out_fraction);
        else
            out_fraction := (part_A.denominator, part_A.denominator);
        end if;
        return out_fraction;
    end "+";
end fraction_operations;
