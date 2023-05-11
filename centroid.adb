with ada.text_IO;
use ada.text_IO;
with ada.float_text_IO;
use ada.float_text_IO;

procedure centroid is

type cartesian_coordinates is record
    x:float;
    y:float;
end record;

type triangle is array(1..3) of cartesian_coordinates;

some_triangle:triangle;

procedure get(three_pt_shape:in out triangle) is
    garbage:character;
begin
    put("Enter vertices as [x.x, y.y]");
    new_line;
    for coordinate in triangle'range(1) loop
        put("   Enter vertex #" & integer'image(coordinate) & ": ");
        get(garbage);
        get(three_pt_shape(coordinate).x);
        get(garbage);
        get(three_pt_shape(coordinate).y);
        get(garbage);
    end loop;
end get;

procedure put(centroid:in cartesian_coordinates) is
begin
    put("[");
    put(centroid.x, 0, aft => 2, exp => 0);
    put(", ");
    put(centroid.y, 0, aft => 2, exp => 0);
    put("]");
end put;

function centroid(three_pt_shape:in triangle) return cartesian_coordinates is
    x_sum:float := 0.0;
    y_sum:float := 0.0;
    triangle_centroid:cartesian_coordinates;
begin
    for coordinate in triangle'range(1) loop
        x_sum := x_sum + three_pt_shape(coordinate).x;
        y_sum := y_sum + three_pt_shape(coordinate).y;
    end loop;
    triangle_centroid.x := x_sum / 3.0;
    triangle_centroid.y := y_sum / 3.0;
    return triangle_centroid;
end centroid;

begin
    get(some_triangle);
    put("The centroid is ");
    put(centroid(some_triangle));
end centroid;
