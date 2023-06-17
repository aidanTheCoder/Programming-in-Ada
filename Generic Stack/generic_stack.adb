with ada.text_IO;
use ada.text_IO;

package body generic_stack is

    procedure push(item:in element) is
        new_node:pointer := new node;
    begin
        new_node.data := item;
        new_node.next := stack_top;
        stack_top := new_node;
    end push;

    function pop return element is
        value:element;
    begin
        if stack_top /= null then
            value := stack_top.data;
            stack_top := stack_top.next;
            return value;
        end if;
    end pop;

end generic_stack;