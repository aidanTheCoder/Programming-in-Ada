package fraction_operations is
    type fraction is private; 
    procedure get(part:out fraction);
    procedure put(part:in fraction);
    function "+"(part_A:in fraction; part_B:in fraction) return fraction;
    function "*"(part_A:in fraction; part_B:in fraction) return fraction;
    
private
    type fraction is record
        numerator:integer;
        denominator:integer;
    end record;
end fraction_operations;
