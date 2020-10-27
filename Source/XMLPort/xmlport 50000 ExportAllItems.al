xmlport 50000 "ADM Export All Items"
{

    Direction = Export;
    FieldSeparator = '<TAB>';
    // FieldDelimiter = '';
    UseRequestPage = true;
    // Format = Xml;
    Format = VariableText;

    schema
    {
        textelement(PrimaryNode)
        {
            tableelement(ItemNode; Item)
            {
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
                    trigger OnBeforePassField()
                    begin
                        if DiscountGroupCodeToExport <> '' then begin

                            if ItemNode."Item Disc. Group" <> DiscountGroupCodeToExport then
                                ItemNode."Item Disc. Group" := DiscountGroupCodeToExport;

                        end;

                    end;

                }

                trigger OnAfterGetRecord()
                begin

                    if ExportOnlyFirstTenRecs then begin
                        CurrentRecordNumber += 1;

                        if CurrentRecordNumber > 10 then
                            currXMLport.Skip();

                    end;


                end;


            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Opzioni';

                    field(Name; ExportOnlyFirstTenRecs)
                    {
                        ApplicationArea = All;
                        Caption = 'Esporta solo i primi 10 Records';
                    }

                    field(DiscountGroupToExportField; DiscountGroupCodeToExport)
                    {
                        ApplicationArea = All;
                        Caption = 'Gruppo Sconto da Esportare';
                        TableRelation = "Item Discount Group";
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {

                }
            }
        }
    }


    trigger OnPreXmlPort()
    begin

    end;



    var
        CurrentRecordNumber: Integer;
        ExportOnlyFirstTenRecs: Boolean;

        DiscountGroupCodeToExport: Code[20];
}


