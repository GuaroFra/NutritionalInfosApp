pageextension 50000 "ADM PageExt50000" extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(content)
        {
            group(NutritionalInfos)
            {
                Caption = 'Nutritional Infos';
                field("Total Calories"; "Total Calories")
                {
                    ApplicationArea = All;
                    Caption = 'Total Calories';

                    trigger OnAssistEdit()
                    var
                        ADMNutritionalInfo: Record "ADM Nutritional Information";
                        totalCal: Decimal;
                    begin
                        if Confirm('Do you want to recalculate the amount of total calories ?') then begin
                            ADMNutritionalInfo.Reset();
                            ADMNutritionalInfo.SetRange("Item No.", Rec."No.");
                            if ADMNutritionalInfo.FindSet() then
                                repeat
                                    totalCal += ADMNutritionalInfo.Amount;
                                until ADMNutritionalInfo.Next() = 0;
                            Rec."Total Calories" := (totalCal * Rec."Net Weight") / 100;
                            Rec.Modify();

                            //instead of repeat until you can use the CalcSums method
                        end;
                    end;
                }
            }
        }

        addfirst(factboxes)
        {
            part("ADM Nutr. Info FactBox"; "ADM Nutr. Info FactBox")
            {
                Caption = 'Nutritional Infos';
                ApplicationArea = all;
                SubPageLink = "Item No." = field("No.");
            }
        }
    }

    actions
    {

        addlast(navigation)
        {
            group(NutritionalInfo)
            {
                Caption = 'Item Nutritional Infos';
                action(Nutritionals)
                {
                    ApplicationArea = All;
                    Caption = 'Show Nutritional Infos';
                    //Promoted = true;
                    //PromotedCategory = Process;
                    //PromotedIsBig = true;
                    Image = RelatedInformation;

                    trigger OnAction()
                    var
                        ADMNutritionalInfo: Record "ADM Nutritional Information";
                        ADMNutritionalInfoPage: Page "ADM Nutritional Info";
                        TotCal: Decimal;
                        locitem: Record item;
                    begin
                        ADMNutritionalInfo.SetRange("Item No.", "No.");
                        ADMNutritionalInfoPage.SetTableView(ADMNutritionalInfo);
                        ADMNutritionalInfoPage.RunModal();

                        TotCal := 0;
                        ADMNutritionalInfo.Reset();
                        ADMNutritionalInfo.SetRange("Item No.", "No.");
                        if ADMNutritionalInfo.FindSet() then
                            repeat
                                TotCal += ADMNutritionalInfo.Amount;
                            until ADMNutritionalInfo.Next() = 0;

                        locitem.Get("No.");
                        locitem."Total Calories" := TotCal;
                        locitem.Modify();

                    end;
                }
            }
        }
    }
}