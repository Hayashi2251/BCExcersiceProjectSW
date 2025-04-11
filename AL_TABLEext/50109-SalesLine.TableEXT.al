// ======================================
// Title: Sales Line Table EXTENSION
// ID: 50109
// Assignment: Project 4-6
// Reference: Sales Line
// TFIELD Range: 50100
// ======================================
tableextension 50109 "SalesLn.TableEXT" extends "Sales Line"
{
    fields
    {
        field(50100; "Discount Member %"; Decimal)
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

    trigger OnInsert()
    var
        SalesHeader: Record "Sales Header";
        Setup: Record "Sales & Receivables Setup";
    begin
        if "Document Type" = "Document Type"::Order then begin
            if SalesHeader.get("Document Type", "Document No.") then begin
                if SalesHeader."Member ID" <> '' then begin
                    Setup.Get();
                    "Discount Member %" := Setup."Discount Member %";
                end;
            end;
        end;
    end;

    trigger OnModify()
    var
        SalesHeader: Record "Sales Header";
        Customer: Record Customer;
        Setup: Record "Sales & Receivables Setup";
    begin
        if ("Document Type" = "Document Type"::Order) and (Rec."No." <> xRec."No.") then begin
            if SalesHeader.get("Document Type", "Document No.") then begin
                if SalesHeader."Member ID" <> '' then begin
                    Setup.Get();
                    "Discount Member %" := Setup."Discount Member %";
                    "Line Discount %" := "Discount Member %";
                end;
            end;
        end;
    end;
}