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
            'Block_Customers':
                AutoBlockCustomers();
        end;
    end;

    /// <summary> 
    /// Description for AutoBlockItems.
    /// </summary>
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

    /// <summary> 
    /// Description for AutoBlockCustomers.
    /// </summary>
    procedure AutoBlockCustomers()
    var
        Customer: Record Customer;
        CustomerLedgerEntry: Record "Cust. Ledger Entry";
    begin
        if Customer.FindSet() then
            repeat
                CustomerLedgerEntry.Reset();
                CustomerLedgerEntry.SetRange(Open, true);
                CustomerLedgerEntry.SetRange("Customer No.", Customer."No.");
                CustomerLedgerEntry.SetFilter("Due Date", '<%1', WorkDate());
                if CustomerLedgerEntry.IsEmpty then begin
                    Customer.Validate(Blocked, Customer.Blocked::All);
                    Customer.Modify(true);
                end;
            until Customer.Next() = 0;
    end;

    var
        myInt: Integer;
}