report 50001 "ADM Example PRocessing Report"
{
    UsageCategory = Tasks;
    ApplicationArea = All;
    Caption = 'Aggiorna Met. Pagamento Clienti';
    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem(Customer; Customer)
        {
            trigger OnPreDataItem()
            begin
                Customer.SetRange("Payment Method Code", '');
            end;

            trigger OnAfterGetRecord()
            var
                Customer_Edit: Record Customer;
            begin
                Customer_Edit.Get(Customer."No.");
                Customer_Edit.Validate("Payment Method Code", 'PAYPAL');
                Customer_Edit.Modify(true);
            end;
        }
    }

    var
        myInt: Integer;
}