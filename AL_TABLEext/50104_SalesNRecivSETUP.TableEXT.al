// ======================================
// Title: Sales & Recievable SETUP Table EXTENSION
// ID: 50104
// Assignment: Project 4-1
// Reference: Sales & Receivables Setup
// TFIELD Range: 50100
// ======================================
tableextension 50104 "SalesnRecivSETUP TableEXT" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Member Nos."; Code[20])
        {
            Caption = 'Member Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        // ======================================
        // Title: Add "Discount Member %" in Table EXTENSION
        // Assignment: Project 4-5
        // TFIELD Range: 50101
        // ======================================
        field(50101; "Discount Member %"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Discount Member %';
            DecimalPlaces = 0 : 2;
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