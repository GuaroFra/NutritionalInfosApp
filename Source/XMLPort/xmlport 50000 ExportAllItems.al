xmlport 50000 "ADM Export All Items"
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
                    if ExportOnlyFirstTen then begin
                        CurrentRecordNumber += 1;
                        if CurrentRecordNumber < 10 then
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
                    Caption = 'Options';
                    field(Name; ExportOnlyFirstTen)
                    {
                        ApplicationArea = All;
                        Caption = 'Export only first 10 records';
                    }

                    field(DiscountGroupCodeToExport; DiscountGroupCodeToExport)
                    {
                        ApplicationArea = All;
                        Caption = 'Gruppo sconto da esportare';
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
        ExportOnlyFirstTen: Boolean;
        DiscountGroupCodeToExport: Code[20];
}