with ada.text_IO;
with ada.float_text_IO;
use ada.text_IO;
use ada.float_text_IO;

package body cartesian is

    procedure put(point:in coordinate) is
    begin
        put("[");
        put(point.x, 0, aft => 2, exp => 0);
        put(",");
        put(point.y, aft => 2, exp => 0);
        put("]");
        new_line;
    end put;

    procedure get(point:out coordinate) is
        garbage:character;
    begin
        get(point.x);
        get(garbage);
        get(point.y);
    end get;

end cartesian;
