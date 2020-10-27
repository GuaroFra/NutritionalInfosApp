pageextension 50002 "ADM PageExt 50002" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
        addafter("No.")
        {
            field("Payment Method Code"; "Payment Method Code")
            {
                ApplicationArea = ALL;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addlast("&Customer")
        {
            action(PrintCustomCustomerListAction)
            {
                ApplicationArea = All;
                Caption = 'Stampa Lista Clienti Custom';
                Image = Print;

                trigger OnAction()
                var
                    ExampleReport: Report "ADM Report Example";

                    Customer: Record Customer;
                begin
                    CurrPage.SetSelectionFilter(Customer);

                    // Report.Run(50000, false, false, Customer);

                    ExampleReport.SetExternalText('Testo inserito dall''esterno');
                    ExampleReport.SetTableView(Customer);
                    ExampleReport.Run();

                end;
            }
            action(ExportCustomerList)
            {
                ApplicationArea = All;
                Caption = 'Export customer list';
                Image = ExportDatabase;
                RunObject = xmlport "ADM XMLPort ExportClients";
            }
            action(ImportCustomerList)
            {
                ApplicationArea = All;
                Caption = 'Import customer list';
                Image = Import;
                RunObject = xmlport "ADM Import Customers";
            }
        }
    }

    var
        myInt: Integer;
}