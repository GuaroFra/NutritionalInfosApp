report 50002 "ADM Data From Query"
{
    UsageCategory = Lists;
    ApplicationArea = All;
    Caption = 'Lista Clienti da Query';
    DefaultLayout = RDLC;
    RDLCLayout = 'ListaClientiDaQuery.rdl';

    dataset
    {
        dataitem(Customer_DataItem; Customer)
        {

            UseTemporary = true;

            column(Customer_No; "No.")
            {

            }

            column(Customer_Name; Name)
            {

            }

            column(Customer_PaymentMethodCode; "Payment Method Code")
            {

            }

            column(Customer_PaymentMethodDescription; Address)
            {

            }

            column(Customer_CountryCode; "Country/Region Code")
            {

            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;
     


    trigger OnInitReport()
    var
        CustomerListQuery: Query "ADM Customer List Query";
    begin

        CustomerListQuery.SetFilter(Customer_CountryCode, '<>%1', 'IT');
        CustomerListQuery.Open();

        while CustomerListQuery.Read() do begin
            Customer_DataItem.Init();
            Customer_DataItem."No." := CustomerListQuery.Customer_No;
            Customer_DataItem.Name := CustomerListQuery.Customer_Name;
            Customer_DataItem."Payment Method Code" := CustomerListQuery.PaymentMethod_Code;
            Customer_DataItem.Address := CustomerListQuery.PaymentMethod_Description;
            Customer_DataItem."Country/Region Code" := CustomerListQuery.Customer_CountryCode;
            Customer_DataItem.Insert();
        end;

        CustomerListQuery.Close();
    end;

}