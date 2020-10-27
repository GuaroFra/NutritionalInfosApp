pageextension 50004 "ADM PageExt50004" extends "Posted Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field("Customer Reservation No.";"Customer Reservation No.")
            {
                ApplicationArea = All;
            }
        }
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    var
        myInt: Integer;
}