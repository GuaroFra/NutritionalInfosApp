report 50001 "ADM Example Processing Report"
{
    UsageCategory = Tasks;
    ApplicationArea = All;

    Caption = 'Aggiorna Met. Pagamento Clienti';

    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem(Customer_DataItem; Customer)
        {

            // DataItemTableView = WHERE("Payment Method Code" = filter(''));

            trigger OnPreDataItem()
            begin
                Customer_DataItem.SetRange("Payment Method Code", '');
            end;

            trigger OnAfterGetRecord()
            var
                Customer_Edit: Record Customer;
            begin
                Customer_Edit.Get(Customer_DataItem."No.");
                Customer_Edit.Validate("Payment Method Code", 'PAYPAL');
                // Customer_Edit."Payment Method Code" := 'NONESISTE';
                Customer_Edit.Modify(true);

                EditCounter += 1;
            end;
        }
    }

    trigger OnPostReport()
    begin
        if GuiAllowed() then
            Message('Modificati Nr. ' + Format(EditCounter) + ' Records.');
    end;



    var
        EditCounter: Integer;
}