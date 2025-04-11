pageextension 50104 "Post.Sales Shipment PageEXT" extends "Posted Sales Shipment"
{
    layout
    {
        addlast(General)
        {
            // ======================================
            // Title: Add "Member ID" in Tables EXTENSION
            // Description: Member ID in Sales Order is automatically filled with Member ID of Customer. Member ID in Posted Sales Shipment & Posted Sales Invoice are automatically filled with Member ID of Sales Order
            // Assignment: Project 4-4
            // ======================================
            field("Member ID"; Rec."Member ID")
            {
                ApplicationArea = All;
                Caption = 'Member ID';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}