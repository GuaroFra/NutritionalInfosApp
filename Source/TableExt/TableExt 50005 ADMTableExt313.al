tableextension 50005 "ADM TableExt50005" extends "Inventory Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Auto Bl. Items Par.St. Task"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Stringa Parametro Blocco Automatico Articoli';
        }
    }

    var
        myInt: Integer;
}