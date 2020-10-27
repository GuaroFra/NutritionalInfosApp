xmlport 50002 "ADM Import Items"
{

    Direction = Import;
    FieldSeparator = '<TAB>';
    // FieldDelimiter = '';
    UseRequestPage = false;
    // Format = Xml;
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
    //                 Caption = 'Opzioni';

    //                 field(Name; ExportOnlyFirstTenRecs)
    //                 {
    //                     ApplicationArea = All;
    //                     Caption = 'Esporta solo i primi 10 Records';
    //                 }

    //                 field(DiscountGroupToExportField; DiscountGroupCodeToExport)
    //                 {
    //                     ApplicationArea = All;
    //                     Caption = 'Gruppo Sconto da Esportare';
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


    trigger OnPreXmlPort()
    begin

    end;



    var
        CurrentRecordNumber: Integer;
        ExportOnlyFirstTenRecs: Boolean;

        DiscountGroupCodeToExport: Code[20];
}


