// ======================================
// Title: Add "Member ID" in Tables EXTENSION
// Description: Member ID in Sales Order is automatically filled with Member ID of Customer. Member ID in Posted Sales Shipment & Posted Sales Invoice are automatically filled with Member ID of Sales Order
// Assignment: Project 4-4
// TFIELD Range: 50100
// ======================================
codeunit 50100 "CusttoSalesHeadrMemberID"
{
    // trigger OnRun()
    // begin

    // end;

    // var
    //     myInt: Integer;
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnBeforeSetCustomerLocationCode', '', false, false)]
    local procedure FillMemberIDFromCustomer(var SalesHeader: Record "Sales Header"; SellToCustomer: Record Customer)
    begin
        Message('GW sudah dijaankan!!! \( >_< )/');
        if SalesHeader."Member ID" = '' then
            if SellToCustomer.Get(SalesHeader."Sell-to Customer No.") then begin
                SalesHeader."Member ID" := SellToCustomer."Member ID";
                SalesHeader.Modify(true);
            end;
        // SetMemberIDFromCustomer(Rec);
    end;
}