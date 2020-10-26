report 50000 "ADM Report Example"
{
    Caption = 'Lista Clienti Custom';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ADMReportExample.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(ExternalText; ExternalText)
            {

            }

            column(ShowPaymentMethodCode; ShowPaymentMethodCode)
            {

            }

            column(CustomerFiltersText; CustomerFiltersText)
            {

            }

            column(Customer_No; Customer."No.")
            {

            }

            column(Customer_Name; Customer.Name)
            {

            }

            column(Customer_PaymentMethodCode; Customer."Payment Method Code")
            {

            }

            dataitem(PaymentMethod; "Payment Method")
            {

                // DataItemLinkReference = Customer;
                DataItemLink = Code = field("Payment Method Code");

                column(PaymentMethod_Code; PaymentMethod.Code)
                {

                }

                column(PaymentMethod_Description; PaymentMethod.Description)
                {

                }
            }

            trigger OnPreDataItem()
            begin
                // Customer.SetFilter("Payment Method Code", '<>%1', '');
                CustomerFiltersText := Customer.GetFilters();
            end;

            trigger OnAfterGetRecord()
            begin
                if not ShowAll then begin
                    CurrentCustomerNumber += 1;
                    if CurrentCustomerNumber > 10 then
                        CurrReport.Skip();
                end;
            end;
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

                    field(ShowPaymentMethodCode; ShowPaymentMethodCode)
                    {
                        ApplicationArea = all;
                        Caption = 'Mostra Codici Met. Pag.';
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


    labels
    {
        ReportTitle_Lbl = 'Lista Clienti';

        CustomerNo_Lbl = 'Nr. Cliente';
        CustomerName_Lbl = 'Nome Cliente';
        CustomerPaymentMethodCode_Lbl = 'Cod. Met. Pag.';

        Page_Lbl = 'Pagina';
    }

    var
        ShowAll: Boolean;
        ShowPaymentMethodCode: Boolean;

        CurrentCustomerNumber: Integer;

        CustomerFiltersText: Text;
        ExternalText: Text;

    // procedure SetExternalText(ValueText: Text)
    // begin
    //     ExternalText := ValueText;
    // end;
}