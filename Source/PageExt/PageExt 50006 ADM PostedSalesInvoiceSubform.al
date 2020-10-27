pageextension 50006 "ADM PageExt50006" extends "Posted Sales Invoice Subform"
{
    layout
    {
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