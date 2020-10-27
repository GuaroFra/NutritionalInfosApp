codeunit 50001 "ADM Tasked Functions"
{
    TableNo = "Job Queue Entry";
    trigger OnRun()
    var
        InventorySetup: Record "Inventory Setup";
    begin
        InventorySetup.Get();
        case "Parameter String" of
            InventorySetup."Auto Bl. Items Par.St. Task":
                AutoBlockItems();
        end;
    end;

    procedure AutoBlockItems()
    var
        Item: Record Item;
    begin
        Item.SetRange(Inventory, 0);
        if Item.IsEmpty then
            Error('Non ci sono articoli da bloccare');
        if Item.FindSet() then
            repeat
                Item.Validate(Blocked, true);
                Item.Modify(true);
            until Item.Next() = 0;
    end;

    var
        myInt: Integer;
}