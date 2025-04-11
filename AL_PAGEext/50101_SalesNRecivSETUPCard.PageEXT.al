// ======================================
// Title: Sales & Recievable SETUP Page EXTENSION
// ID: 50101
// Assignment: Project 4-1
// ======================================
pageextension 50101 "SalesnRecivSETUP PageEXT" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Customer Nos.")
        {
            field("Member Nos."; Rec."Member Nos.")
            {
                Caption = 'Member Nos.';
                ApplicationArea = All;
            }
            // ======================================
            // Title: Add "Discount Member %" in Page EXTENSION
            // Assignment: Project 4-5
            // ======================================
            field("Discount Member %"; Rec."Discount Member %")
            {
                Caption = 'Discount Member %';
                ApplicationArea = All;
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