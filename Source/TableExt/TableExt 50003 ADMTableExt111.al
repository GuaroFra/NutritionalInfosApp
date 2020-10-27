tableextension 50003 "ADM TableExt50003" extends "Sales Shipment Line" //111
{
    fields
    {
        field(50000; "Posting DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            Caption = 'DateTime di Registrazione';
        }
    }
    
    var
        myInt: Integer;
}