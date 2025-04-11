codeunit 50102 DiscountMemberSalesLine
{
    // trigger OnRun()
    // begin

    // end;

    // var
    //     myInt: Integer;

    // when CREATE NEW "Sales Order LINE" if "Member ID" in "Sales Order" is not blank
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeGetLocation', '', false, false)]
    local procedure SalesLnGetDiscMem(var SalesLine: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        if SalesLine."Document Type" = SalesLine."Document Type"::Order then begin
            SalesHeader.SetRange("Document Type", SalesLine."Document Type");
            SalesHeader.SetRange("No.", SalesLine."Document No.");
            if SalesHeader.FindFirst() then begin
                if SalesHeader."Member ID" <> '' then begin
                    SalesSetup.Get();
                    SalesLine.Validate("Discount Member %", SalesSetup."Discount Member %");
                end;
            end;
        end;
    end;

    // When user specify No. in Sales Order Line with Type = Item, system fill field Line Discount % with Discount Member %
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', "No.", false, false)]
    local procedure SalesLnGetFillLnDiscwithDiscMem(var Rec: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        if Rec.Type <> Rec.Type::Item then
            exit;

        // Ambil Sales Header terkait
        SalesHeader.SetRange("Document Type", Rec."Document Type");
        SalesHeader.SetRange("No.", Rec."Document No.");
        if not SalesHeader.FindFirst() then
            exit;

        // Cek apakah Member ID di header ada
        if SalesHeader."Member ID" <> '' then begin
            SalesSetup.Get();
            Rec.Validate("Discount Member %", SalesSetup."Discount Member %");
            Rec.Validate("Line Discount %", SalesSetup."Discount Member %");
        end;
    end;
}