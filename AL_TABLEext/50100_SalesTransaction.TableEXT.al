// ======================================
// Title: Sales Transaction Table EXTENSION
// ID: 50100
// Assignment: Project 3-(1-4)
// Reference: Sales Transaction
// TFIELD Range: 7-8
// ======================================

tableextension 50100 "Sales Transaction TableEXT" extends "Sales Transaction"
{
    fields
    {
        field(7; "Description"; Text[100])
        {
            // Field Description is automatically filled with Description from Table Item or G/L Account Name when field No. is updated
            Caption = 'Description';
        }
        field(8; "Salesperson Name"; Text[100])
        {
            // This field is not updated by User, but automatically calculated by system
            Caption = 'Salesperson Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Salesperson/Purchaser".Name where("Code" = field("Salesperson Code")));
            Editable = false;
        }
        modify("Salesperson Code")
        {
            Caption = 'Salesperson';
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