page 50003 "ADM Customer List from Query"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Customer;
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(No; "No.")
                {
                    ApplicationArea = All;

                }

                field(Name; Name)
                {
                    ApplicationArea = All;

                }

                field("Payment Method Code"; "Payment Method Code")
                {
                    ApplicationArea = All;

                }

                field("Payment Method Description"; Address)
                {
                    ApplicationArea = All;

                }

                field("Country/Region Code"; "Country/Region Code")
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    // actions
    // {
    //     area(Processing)
    //     {
    //         action(ActionName)
    //         {
    //             ApplicationArea = All;

    //             trigger OnAction()
    //             begin

    //             end;
    //         }
    //     }
    // }

    var
        myInt: Integer;




    trigger OnOpenPage()
    var
        CustomerListQuery: Query "ADM Customer List Query";

        CustomerRecord: Record Customer temporary;
       
    begin

        //CustomerRecord.Copy(Rec, true);
        // FillRecValues(Rec);

        //CurrPage.Update(true);

        CustomerRecord.Copy(Rec, true);

        CustomerListQuery.Open();

        while CustomerListQuery.Read() do begin

            CustomerRecord.SetRange("No.", CustomerListQuery.Customer_No);

            If CustomerRecord.IsEmpty then begin

                CustomerRecord.Init();
                CustomerRecord."No." := CustomerListQuery.Customer_No;
                CustomerRecord.Name := CustomerListQuery.Customer_Name;
                CustomerRecord."Payment Method Code" := CustomerListQuery.PaymentMethod_Code;
                CustomerRecord.Address := CustomerListQuery.PaymentMethod_Description;
                CustomerRecord."Country/Region Code" := CustomerListQuery.Customer_CountryCode;
                CustomerRecord.Insert();
            end;


        end;

        CustomerListQuery.Close();


    end;


    procedure FillRecValues(TempCustomer: Record Customer temporary)
    var
        CustomerRecord: Record Customer temporary;
        CustomerListQuery: Query "ADM Customer List Query";
    begin
        CustomerRecord.Copy(TempCustomer, true);

        CustomerListQuery.Open();

        while CustomerListQuery.Read() do begin

            CustomerRecord.SetRange("No.", CustomerListQuery.Customer_No);

            If CustomerRecord.IsEmpty then begin

                CustomerRecord.Init();
                CustomerRecord."No." := CustomerListQuery.Customer_No;
                CustomerRecord.Name := CustomerListQuery.Customer_Name;
                CustomerRecord."Payment Method Code" := CustomerListQuery.PaymentMethod_Code;
                CustomerRecord.Address := CustomerListQuery.PaymentMethod_Description;
                CustomerRecord."Country/Region Code" := CustomerListQuery.Customer_CountryCode;
                CustomerRecord.Insert();
            end;


        end;

        CustomerListQuery.Close();
    end;
}