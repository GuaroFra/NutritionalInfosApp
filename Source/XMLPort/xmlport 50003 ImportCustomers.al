xmlport 50003 "ADM Import Customers"
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
            tableelement(NodeName2; Customer)
            {
                AutoUpdate = true;
                fieldattribute(NodeName3; NodeName2."No.")
                {

                }
                fieldattribute(NodeName4; NodeName2."Name")
                {

                }
                fieldattribute(NodeName5; NodeName2."Address")
                {

                }
                fieldattribute(NodeName6; NodeName2."Country/Region Code")
                {

                }
                fieldattribute(NodeName7; NodeName2."Contact")
                {

                }
                fieldattribute(NodeName8; NodeName2."E-Mail")
                {

                }
                fieldattribute(NodeName9; NodeName2."Customer Disc. Group")
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