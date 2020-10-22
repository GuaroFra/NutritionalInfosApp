table 50000 "ADM Nutritional Information"
{
    DataClassification = ToBeClassified;
    Caption = 'Nutritional Informations';

    fields
    {
        field(10; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item No.';
            TableRelation = item."No.";
        }

        field(20; "Item description"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item description';
            trigger OnValidate()
            var
                item: Record Item;
            begin
                item.Get("Item No.");
                Rec."Item description" := item.Description;
                Rec.Modify();
            end;
        }

        field(30; "Item Description 2"; Text[50])
        {
            //DataClassification = ; con fieldclass non serve definirla
            Caption = 'Item Description 2';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Description 2" where("No." = field("Item No.")));
            Editable = false;
        }

        field(40; "Nutritional Type"; Enum "ADM Nutritional Info Type")
        {
            DataClassification = ToBeClassified;
        }

        field(50; "Amount"; Decimal)
        {
            Caption = 'Amount';
        }
    }

    keys
    {
        key(PK; "Item No.", "Nutritional Type")
        {
            Clustered = true;
        }
    }
}