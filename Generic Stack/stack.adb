with ada.text_IO;
with ada.integer_text_IO;
with generic_stack;
with cartesian;
use ada.text_IO;
use ada.integer_text_IO;

procedure stack is
    type options is (pushPoint, popPoint, pushInteger, popInteger, quit);
    package option_IO is new Enumeration_IO(options);
    use option_IO;
    operation:options;
    someInteger:integer;
    somePoint:cartesian.coordinate;
    package integer_stack is new generic_stack(element => integer);
    package cartesian_stack is new generic_stack(element => cartesian.coordinate);
    use integer_stack;
    use cartesian_stack;
begin
    loop
        begin
            put("What do you want to do (pushPoint, popPoint, pushInteger, or popInteger)? ");
            get(operation);
            
            case operation is
                when pushInteger =>
                    put("  Enter an integer: ");
                    get(someInteger);
                    integer_stack.push(someInteger);
                    new_line;
                
                when popInteger =>
                    begin 
                        someInteger := integer_stack.pop;
                        put(" Value popped was ");
                        put(someInteger, 0);
                    exception
                        when Program_Error => put("Empty stack, cannot pop.");
                    end;
                    new_line(2);

                when pushPoint =>
                    put("  Enter the floating point coordinates of a 2-D point as just x.xx y.yy: ");
                    cartesian.get(somePoint);
                    cartesian_stack.push(somePoint);
                    new_line;
        
                when popPoint =>
                    begin
                        somePoint := cartesian_stack.pop;
                        put(" The point popped is ");
                        cartesian.put(somePoint);
                    exception
                        when Program_Error => put("Stack empty, cannot pop.");
                    end;
                    new_line(2);
            
                when quit =>
                    put(" Bye");
                    exit;
            end case;
        exception
            when Constraint_Error => null;
            when Data_Error => 
                put("Not a legal operation.");
                new_line(2);
        end;
    end loop;
end stack;
