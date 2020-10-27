tableextension 50004 "ADM TableExt50004" extends "Sales Invoice Line" //113
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