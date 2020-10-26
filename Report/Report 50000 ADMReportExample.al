report 50000 "ADM Report Example"
{
    Caption = 'Lista Clienti';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ADMReportExample.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(IdField; Customer."No.")
            {

            }
            column(NameField; Customer.Name)
            {

            }
            column(PaymentMethodCodeField; Customer."Payment Method Code")
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
                group(Options)
                {
                    Caption = 'Options';
                    field(ShowAllField; ShowAll)
                    {
                        ApplicationArea = All;
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
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        ShowAll: Boolean;
}