query 50000 "ADM Customer List Query"
{
    QueryType = Normal;
    
    
    elements
    {
        dataitem(CustomerDataItem; Customer)
        {
            column(Customer_No; "No.")
            {
                
            }

            column(Customer_Name; Name)
            {
                
            }

            column(Customer_CountryCode; "Country/Region Code")
            {
                
            }

            dataitem(PaymentMethodDataItem; "Payment Method")
            {
                SqlJoinType = InnerJoin;
                DataItemLink = Code = CustomerDataItem."Payment Method Code";

                column(PaymentMethod_Code; Code)
                {

                }

                column(PaymentMethod_Description; Description)
                {

                }
            }
        }
    }
    
    var
        myInt: Integer;

        
    
    trigger OnBeforeOpen()
    begin
        
        
    end;
}