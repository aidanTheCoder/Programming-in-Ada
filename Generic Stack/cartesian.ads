package cartesian is

    type coordinate is record
        x:float;
        y:float;
    end record;

    procedure put(point:in coordinate);
    procedure get(point:out coordinate);

end cartesian;
