xmlport 50001 "ADM XMLPort ExportClients"
{
    Direction = Export;
    FieldSeparator = ',';
    FieldDelimiter = '';
    UseRequestPage = true;
    Format = VariableText;

    schema
    {
        textelement(PrimaryNode)
        {
            tableelement(NodeName2; Customer)
            {
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
    //             group(GroupName)
    //             {
    //                 field(Name; SourceExpression)
    //                 {

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
        myInt: Integer;
}