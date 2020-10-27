xmlport 50002 "ADM Import Items"
{
    Direction = Import;
    FieldSeparator = '<TAB>';
    //FieldDelimiter = '';
    UseRequestPage = false;
    Format = VariableText;
    DefaultFieldsValidation = true;


    schema
    {
        textelement(PrimaryNode)
        {
            tableelement(ItemNode; Item)
            {
                AutoUpdate = true;
                fieldattribute(NodeName3; ItemNode."No.")
                {

                }
                fieldattribute(NodeName4; ItemNode.Description)
                {

                }
                fieldattribute(NodeName5; ItemNode."Base Unit of Measure")
                {

                }
                fieldattribute(NodeName6; ItemNode."Gross Weight")
                {

                }
                fieldattribute(NodeName7; ItemNode."Net Weight")
                {

                }
                fieldattribute(NodeName8; ItemNode."Item Category Code")
                {

                }
                fieldattribute(NodeName9; ItemNode."Item Disc. Group")
                {

                }
            }
        }
    }

    // requestpage
    // {
    //     layout
    //     {
    //         area(content)
    //         {
    //             group(Options)
    //             {
    //                 Caption = 'Options';
    //                 field(Name; ExportOnlyFirstTen)
    //                 {
    //                     ApplicationArea = All;
    //                     Caption = 'Export only first 10 records';
    //                 }

    //                 field(DiscountGroupCodeToExport; DiscountGroupCodeToExport)
    //                 {
    //                     ApplicationArea = All;
    //                     Caption = 'Gruppo sconto da esportare';
    //                     TableRelation = "Item Discount Group";
    //                 }
    //             }
    //         }
    //     }

    //     actions
    //     {
    //         area(processing)
    //         {
    //             action(ActionName)
    //             {

    //             }
    //         }
    //     }
    // }


    var
        CurrentRecordNumber: Integer;
        ExportOnlyFirstTen: Boolean;
        DiscountGroupCodeToExport: Code[20];
}