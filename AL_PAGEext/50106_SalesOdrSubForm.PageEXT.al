// ======================================
// Title: Sales Order Subform Page EXTENSION
// ID: 50106
// Assignment: Project 4-6
// Reference: Sales Order Subform
// ======================================
pageextension 50106 "SalesOdr Subform PageEXT" extends "Sales Order Subform"
{
    layout
    {
        addlast(content)
        {
            field("Discount Member %"; Rec."Discount Member %")
            {
                ApplicationArea = All;
                Caption = 'Discount Member %';
                DecimalPlaces = 0 : 2;
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