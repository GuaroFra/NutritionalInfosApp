pageextension 50007 "ADM PageExt50007" extends "Inventory Setup"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("Auto Bl. Items Par.St. Task"; "Auto Bl. Items Par.St. Task")
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