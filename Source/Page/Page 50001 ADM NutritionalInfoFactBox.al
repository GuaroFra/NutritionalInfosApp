page 50001 "ADM Nutr. Info FactBox"
{
    Caption = 'PageName';
    PageType = ListPart;
    // UsageCategory = Lists;
    // ApplicationArea = All;
    SourceTable = "ADM Nutritional Information";
    //SourceTableView =

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Nutritional Type"; "Nutritional Type")
                {
                    ApplicationArea = All;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = All;
                    //FieldPropertyName = FieldPropertyValue;
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

                trigger OnAction();
                begin

                end;
            }
        }
    }
}