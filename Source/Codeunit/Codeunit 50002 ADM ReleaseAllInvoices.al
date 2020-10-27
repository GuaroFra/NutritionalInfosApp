codeunit 50002 "ADM Release all Invoices"
{
    trigger OnRun()
    var
        SalesHeader: Record "Sales Header";
        // ReleaseDocument: Codeunit "Release Sales Document";
        ReleaseInvoice: Codeunit "ADM Release Invoice";
    begin
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
        SalesHeader.SetRange(Status, SalesHeader.Status::Open);
        if SalesHeader.FindSet() then
            repeat
                if ReleaseInvoice.Run(SalesHeader) then;
            until SalesHeader.Next() = 0;
    end;

    var
        myInt: Integer;
}