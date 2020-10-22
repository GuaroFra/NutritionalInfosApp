pageextension 50001 "ADM PageExt50001" extends "Item List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast(processing)
        {
            action("Total Calories")
            {
                ApplicationArea = All;
                Caption = 'Total Calories';
                Image = NewSum;
                ToolTip = 'Show the sum of calories for every item';

                trigger OnAction()
                var
                    TotalCalories: Decimal;
                begin
                    Rec.CalcSums("total calories");
                    TotalCalories := Rec."total calories";
                    Message('The sum of calories for every item is %1', TotalCalories);
                end;
            }
        }
    }

    var
        myInt: Integer;
}