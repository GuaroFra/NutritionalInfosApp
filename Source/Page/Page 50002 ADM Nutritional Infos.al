page 50002 "ADM Nutr. Infos Page50002"
{
    PageType = List;
    ApplicationArea = All; //do not forget
    UsageCategory = Lists; //do not forget
    SourceTable = "ADM Nutritional Information";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Number"; "Item No.")
                {
                    ApplicationArea = All;

                }
                field("Decription"; "Item description")
                {
                    ApplicationArea = All;

                }
                field("Second Description"; "Item Description 2")
                {
                    ApplicationArea = All;

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