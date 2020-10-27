tableextension 50001 "ADM TableExt50001" extends "Sales Header" //36
{
    fields
    {
        field(50000; "Customer Reservation No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Nr. Prenotazione Cliente';
        }
    }

    var
        myInt: Integer;
}