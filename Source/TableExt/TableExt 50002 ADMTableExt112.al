tableextension 50002 "ADM TableExt50002" extends "Sales Invoice Header"
{
    fields
    {
        field(50000; "Customer Reservation No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Nr. Prenotazione Cliente';
        }

        field(50005; "Received Pallets Count"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Nr. Pallet Ricevuti';
        }
    }
    
    var
        myInt: Integer;
}