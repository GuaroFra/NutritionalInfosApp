pageextension 50005 "ADM PageExt50005" extends "Posted Sales Shpt. Subform" //131
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("Posting DateTime";"Posting DateTime")
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