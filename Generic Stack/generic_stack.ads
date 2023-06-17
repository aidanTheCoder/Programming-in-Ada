generic
    type element is private;
package generic_stack is
    type node is private;
    type pointer is access node;
    stack_top:pointer;

    procedure push(item:in element);
    function pop return element;
  private
    type node is record
        data:element;
        next:pointer;
     end record;
end generic_stack;

