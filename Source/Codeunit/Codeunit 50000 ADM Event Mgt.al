codeunit 50000 "ADM Event Mgt."
{
    [EventSubscriber(ObjectType::Table, Database::"ADM Nutritional Information", 'OnAfterInsertEvent', '', true, true)]
    /// <summary> 
    /// Description for ADMNutritionalInformation_OnAfterInsert.
    /// </summary>
    /// <param name="Rec">Parameter of type Record "ADM Nutritional Information".</param>
    local procedure ADMNutritionalInformation_OnAfterInsert(var Rec: Record "ADM Nutritional Information")
    var
        ADMNutritionalInformation: Record "ADM Nutritional Information";
    begin
        ADMNutritionalInformation.Reset();
        ADMNutritionalInformation.SetRange("Item No.", Rec."Item No.");
        if not ADMNutritionalInformation.CalcSums(Amount) then
            exit;

        if (ADMNutritionalInformation.Amount + Rec.Amount) > 2000 then
            Message('Careful total calories for item %1 is above 2000 (%2)', Rec."Item No.", ADMNutritionalInformation.Amount);
    end;

    [EventSubscriber(ObjectType::Table, Database::"ADM Nutritional Information", 'OnAfterModifyEvent', '', true, true)]
    /// <summary> 
    /// Description for ADMNutritionalInformation_OnAfterModifyEvent.
    /// </summary>
    /// <param name="Rec">Parameter of type Record "ADM Nutritional Information".</param>
    /// <param name="xRec">Parameter of type Record "ADM Nutritional Information".</param>
    local procedure ADMNutritionalInformation_OnAfterModifyEvent(var Rec: Record "ADM Nutritional Information"; var xRec: Record "ADM Nutritional Information")
    var
        ADMNutritionalInformation: Record "ADM Nutritional Information";
    begin
        ADMNutritionalInformation.Reset();
        ADMNutritionalInformation.SetRange("Item No.", Rec."Item No.");

        if not ADMNutritionalInformation.CalcSums(Amount) then
            exit;

        if (ADMNutritionalInformation.Amount + Rec.Amount - xRec.Amount) > 2000 then
            Message('Careful total calories for item %1 is above 2000 (%2)', Rec."Item No.", ADMNutritionalInformation.Amount);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReleaseSalesDoc', '', false, false)]
    /// <summary> 
    /// Description for C414_OnBeforeReleaseSalesDoc_CheckPrices.
    /// </summary>
    /// <param name="SalesHeader">Parameter of type Record "Sales Header".</param>
    /// <param name="PreviewMode">Parameter of type Boolean.</param>
    /// <param name="IsHandled">Parameter of type Boolean.</param>
    local procedure C414_OnBeforeReleaseSalesDoc_CheckPrices(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var IsHandled: Boolean)
    var
        SalesLine: Record "Sales Line";
        Table: Record "Sales Shipment Header";
        ErrorPricesZero: Label 'Attenzione! Esiste almeno una riga Articolo con prezzo non valorizzato!';
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetFilter("Unit Price", '=%1', 0);
        SalesLine.SetRange(Type, SalesLine.Type::Item);

        if not (SalesLine.IsEmpty) then begin
            Error(ErrorPricesZero);
        end;

        // IsHandled := true;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnBeforeReleasePurchaseDoc', '', false, false)]
    /// <summary> 
    /// Description for C415_OnBeforeReleasePurchaseDoc_CheckPrices.
    /// </summary>
    /// <param name="PreviewMode">Parameter of type Boolean.</param>
    /// <param name="PurchaseHeader">Parameter of type Record "Purchase Header".</param>
    local procedure C415_OnBeforeReleasePurchaseDoc_CheckPrices(PreviewMode: Boolean; var PurchaseHeader: Record "Purchase Header")
    var
        PurchaseLine: Record "Purchase Line";
        ErrorPricesZero: Label 'Attenzione! Esiste almeno una riga Articolo con prezzo non valorizzato!';
    begin
        PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
        PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
        PurchaseLine.SetFilter("Unit Cost", '=%1', 0);
        PurchaseLine.SetRange(Type, PurchaseLine.Type::Item);

        if not (PurchaseLine.IsEmpty) then begin
            Error(ErrorPricesZero);
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeSalesInvLineInsert', '', false, false)]
    /// <summary> 
    /// Description for C80_OnBeforeSalesInvLineInsert_SetPostingDateTime.
    /// </summary>
    /// <param name="CommitIsSuppressed">Parameter of type Boolean.</param>
    /// <param name="SalesInvHeader">Parameter of type Record "Sales Invoice Header".</param>
    /// <param name="SalesLine">Parameter of type Record "Sales Line".</param>
    /// <param name="SalesInvLine">Parameter of type Record "Sales Invoice Line".</param>
    local procedure C80_OnBeforeSalesInvLineInsert_SetPostingDateTime(CommitIsSuppressed: Boolean; SalesInvHeader: Record "Sales Invoice Header"; SalesLine: Record "Sales Line"; var SalesInvLine: Record "Sales Invoice Line")
    begin
        SalesInvLine.Validate("Posting DateTime", CurrentDateTime());
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePostPurchaseDoc', '', false, false)]
    /// <summary> 
    /// Description for C90_OnBeforePostPurchaseDoc_CheckPhoneNumber.
    /// </summary>
    /// <param name="CommitIsSupressed">Parameter of type Boolean.</param>
    /// <param name="PreviewMode">Parameter of type Boolean.</param>
    /// <param name="sender">Parameter of type Codeunit "Purch.-Post".</param>
    /// <param name="HideProgressWindow">Parameter of type Boolean.</param>
    /// <param name="PurchaseHeader">Parameter of type Record "Purchase Header".</param>
    local procedure C90_OnBeforePostPurchaseDoc_CheckPhoneNumber(CommitIsSupressed: Boolean; PreviewMode: Boolean; sender: Codeunit "Purch.-Post"; var HideProgressWindow: Boolean; var PurchaseHeader: Record "Purchase Header")
    var
        vendor: Record Vendor;
        errorLabel: Label 'Manca il numero di telefono';
    begin
        vendor.Get(PurchaseHeader."Buy-from Vendor No.");
        if vendor."Phone No." = '' then
            Error(errorLabel);
    end;


}