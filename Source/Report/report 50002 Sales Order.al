report 50002 "Sales Order Vendors"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'SalesOrderLayout.rdl';
    Caption = 'SalesOrderReport';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = where("document type" = filter(Order));
            column(No_Order; "No.")
            {

            }
            column(No_Customer; "Sell-to Customer No.")
            {

            }
            column(No_Customer_Name; CustomerName)
            {

            }
            trigger OnAfterGetRecord()
            var
                Customer_Record: Record Customer;
            begin
                Customer_Record.Get("Sell-to Customer No.");
                CustomerName := Customer_Record.Name;
            end;
        }
    }

    var
        CustomerName: Text;
}