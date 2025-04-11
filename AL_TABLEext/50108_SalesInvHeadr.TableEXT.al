tableextension 50108 "Sales InvHeadr.TableEXT" extends "Sales Invoice Header"
{
    fields
    {
        // ======================================
        // Title: Add "Member ID" in Tables EXTENSION
        // Description: Member ID in Sales Order is automatically filled with Member ID of Customer. Member ID in Posted Sales Shipment & Posted Sales Invoice are automatically filled with Member ID of Sales Order
        // Assignment: Project 4-4
        // TFIELD Range: 50100
        // ======================================
        field(50100; "Member ID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Member ID';
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}