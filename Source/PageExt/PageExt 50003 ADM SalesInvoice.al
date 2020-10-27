pageextension 50003 "ADM PageExt50003" extends "Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
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