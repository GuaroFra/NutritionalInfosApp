page 50000 "ADM Nutritional Info"
{
    PageType = List;
    ApplicationArea = All; //do not forget
    UsageCategory = Lists; //do not forget
    SourceTable = "ADM Nutritional Information";

    layout
    {
        area(Content)
        {
            repeater(NutritionalsInfo)
            {
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                    //FieldPropertyName = FieldPropertyValue
                }
                field("Item Description"; "Item description")
                {
                    ApplicationArea = All;
                    //FieldPropertyName = FieldPropertyValue
                }
                field("Item Description 2"; "Item Description 2")
                {
                    ApplicationArea = All;
                    //FieldPropertyName = FieldPropertyValue
                }
                field("Nutritional Type"; "Nutritional Type")
                {
                    ApplicationArea = All;
                    //FieldPropertyName = FieldPropertyValue
                }
                field(Amount; Amount)
                {
                    ApplicationArea = All;
                    //FieldPropertyName = FieldPropertyValue
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}