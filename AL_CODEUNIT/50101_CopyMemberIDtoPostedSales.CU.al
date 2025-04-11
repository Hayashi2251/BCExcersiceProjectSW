// ======================================
// Title: Add "Member ID" in Tables EXTENSION
// Description: Member ID in Sales Order is automatically filled with Member ID of Customer. Member ID in Posted Sales Shipment & Posted Sales Invoice are automatically filled with Member ID of Sales Order
// Assignment: Project 4-4
// TFIELD Range: 50100
// ======================================
codeunit 50111 "MemberID Post Subscribers"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeSalesShptHeaderInsert', '', false, false)]
    local procedure SetMemberIDOnShipmentHeader(var SalesShptHeader: Record "Sales Shipment Header"; SalesHeader: Record "Sales Header")
    begin
        SalesShptHeader."Member ID" := SalesHeader."Member ID";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeInsertInvoiceHeader', '', false, false)]
    local procedure SetMemberIDOnInvoiceHeader(var SalesInvHeader: Record "Sales Invoice Header"; SalesHeader: Record "Sales Header")
    begin
        SalesInvHeader."Member ID" := SalesHeader."Member ID";
    end;

    /* 
    ============================================================
    || PAGE EVENT SUBSCRIBER
    ============================================================
     */
    [EventSubscriber(ObjectType::Page, Page::"Posted Sales Invoice", 'OnOpenPageEvent', '', false, false)]
    local procedure SetMemberIDOnOpenPageInvoiceHeader(var Rec: Record "Sales Invoice Header")
    var
        Customer: Record Customer;
    begin
        if Rec."Member ID" = '' then begin
            Rec."Member ID" := Customer.GetMemberID(Rec."Sell-to Customer No.");
            Rec.Modify(true)
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Posted Sales Shipment", OnOpenPageEvent, '', false, false)]
    local procedure SetMemberIDOnOpenPageShipmentHeader(var Rec: Record "Sales Shipment Header")
    var
        Customer: Record Customer;
    begin
        if Rec."Member ID" = '' then begin
            Rec."Member ID" := Customer.GetMemberID(Rec."Sell-to Customer No.");
            Rec.Modify(true)
        end;
    end;
}
