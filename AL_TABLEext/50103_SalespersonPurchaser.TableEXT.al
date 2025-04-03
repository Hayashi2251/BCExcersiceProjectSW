// ======================================
// Title: Sales Transaction Table EXTENSION
// ID: 50100
// Assignment: Project 3-(1-4)
// Reference: Sales Transaction
// TFIELD Range: 50100-50106
// ======================================

tableextension 50103 "Salesperson/Purchaser TableEXT" extends "Salesperson/Purchaser"
{
    fields
    {
        field(50100; "Sales Type Filter"; Option)
        {
            Caption = 'Sales Type Filter';
            DataClassification = CustomerContent;
            OptionMembers = "Total Sales","Max Sales","Min Sales","Avg Sales","Sales Count","Sales Exist";
            OptionCaption = 'Total Sales, Max Sales, Min Sales, Avg Sales, Sales Count, Sales Exist';
        }
        field(50101; "Total Sales"; Decimal)
        {
            Caption = 'Total Sales';
            FieldClass = FlowField;
            CalcFormula = sum("Sales Transaction"."Sales Amount" where("Salesperson Code" = field(Code)));
            Editable = false;
        }
        field(50102; "Max Sales"; Decimal)
        {
            Caption = 'Maximal Sales';
            FieldClass = FlowField;
            CalcFormula = max("Sales Transaction"."Sales Amount" where("Salesperson Code" = field(Code)));
            Editable = false;
        }
        field(50103; "Min Sales"; Decimal)
        {
            Caption = 'Minimal Sales';
            FieldClass = FlowField;
            CalcFormula = min("Sales Transaction"."Sales Amount" where("Salesperson Code" = field(Code)));
            Editable = false;
        }
        field(50104; "Avg Sales"; Decimal)
        {
            Caption = 'Average Sales';
            FieldClass = FlowField;
            CalcFormula = average("Sales Transaction"."Sales Amount" where("Salesperson Code" = field(Code)));
            Editable = false;
        }
        field(50105; "Sales Count"; Integer)
        {
            // This formula count the RECORD
            Caption = 'Sales Count';
            FieldClass = FlowField;
            CalcFormula = count("Sales Transaction" where("Salesperson Code" = field(Code)));
            Editable = false;
        }
        field(50106; "Sales Exist"; Boolean)
        {
            // This formula count the RECORD
            Caption = 'Sales Exist';
            FieldClass = FlowField;
            CalcFormula = exist("Sales Transaction" where("Salesperson Code" = field(Code)));
            Editable = false;
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
}