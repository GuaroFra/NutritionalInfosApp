pageextension 50008 "ADM Sales Invoices" extends "Sales Invoice List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast(Release)
        {
            action(ReleaseAllInvoicesAction)
            {
                Image = ReleaseDoc;
                Caption = 'Release All Invoices';
                ApplicationArea = All;
                RunObject = codeunit "ADM Release all Invoices";
            }
        }
    }

    var
        myInt: Integer;
}