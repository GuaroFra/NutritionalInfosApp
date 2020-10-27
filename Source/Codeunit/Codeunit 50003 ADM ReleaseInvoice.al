codeunit 50003 "ADM Release Invoice"
{
    TableNo = "Sales Header";
    trigger OnRun()
    var
        ReleaseDocument: Codeunit "Release Sales Document";
    begin
        Rec."Customer Reservation No." := 'RESERVED';
        Rec.Modify(true);
        ReleaseDocument.Run(Rec);
    end;

    var
        myInt: Integer;
}