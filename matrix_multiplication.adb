with ada.text_IO;
with ada.integer_text_IO;
use ada.text_IO;
use ada.integer_text_IO;

procedure matrix_multiplication is    
    type matrix is array(positive range <>, positive range <>) of integer;

    procedure get(two_d_array:in out matrix) is
    begin
        for i in two_d_array'range(1) loop
            for j in two_d_array'range(2) loop
                get(two_d_array(i, j));
            end loop;
        end loop;
    end get;

    procedure put (two_d_array:in matrix) is
    begin
        for i in two_d_array'range(1) loop
            for j in two_d_array'range(2) loop
                put(integer'image(two_d_array(i, j)) & " ");
            end loop;
            new_line;
        end loop;
    end put;

    function "*" (A_matrix:matrix; B_matrix:matrix) return matrix is
        product:matrix(A_matrix'range(1), B_matrix'range(2)) := (others => (others => 0)); 
    begin
        put("The result of the multiplication is the ");
        put(A_matrix'length(1), 0);
        put("x");
        put(B_matrix'length(2), 0);
        put(" matrix:");
        new_line;
        new_line;
        for i in A_matrix'range(1) loop
            for j in B_matrix'range(2) loop
                for k in B_matrix'range(1) loop
                    product(i, j) := product(i, j) + (A_matrix(i, k) * B_matrix(k, j));
                end loop;
            end loop;
        end loop;
        return product;       
    end "*";

    A_i:positive := 1;
    A_j:positive := 1;
    B_i:positive := 1;
    B_j:positive := 1;
    garbage:character;

begin
    put("Enter size of the first matrix as two integers " 
        & "separated by an 'x' (e.g., NxM): ");
    get(A_i);
    get(garbage);
    get(A_j);
    put("Enter size of the first matrix as two integers " 
        & "separated by an 'x' (e.g., NxM): ");
    get(B_i);
    get(garbage);
    get(B_j);
    declare
        A:matrix(1..A_i, 1..A_j) := (others => (others => 0));
        B:matrix(1..B_i, 1..B_j) := (others => (others => 0));
    begin
        put("For the first matrix, enter " 
            & integer'image(A_i) & " rows of " 
            & integer'image(A_j) & " integers:");
        new_line;
        get(A);
        put("For the second matrix, enter " & integer 'image(B_i) 
            & " rows of " & integer'image(B_j) & " integers:");
        new_line;
        get(B);
        put(A*B);
    end;
end matrix_multiplication;
