pageextension 50002 "ADM PageExt 50002" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
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
        }
    }

    var
        myInt: Integer;
}