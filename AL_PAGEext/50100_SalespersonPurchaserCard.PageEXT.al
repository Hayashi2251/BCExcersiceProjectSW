// ======================================
// Title: Salesperson Card Page EXTENSION
// ID: 50100
// Assignment: Project 3-8
// ======================================
pageextension 50100 "Salesperson Card PageEXT" extends "Salesperson/Purchaser Card"
{
    layout
    {
        addafter(Invoicing)
        {
            group("Sales Transaction")
            {
                Caption = 'Sales Transaction';
                field("Sales Type Filter"; Rec."Sales Type Filter")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        UpdateSalesData();
                    end;
                }

                group("Sales Info")
                {
                    Visible = ShowSalesField;
                    Caption = 'Sales Info Data';
                    Description = 'Sales Info Data from the Sales Type Filter';

                    field("Sales Value"; SalesValue)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here if needed
    }

    var
        ShowSalesField: Boolean;
        SalesValue: Decimal;

    trigger OnOpenPage()
    begin
        UpdateSalesData();
    end;

    local procedure UpdateSalesData()
    begin
        Rec.CalcFields("Total Sales", "Max Sales", "Min Sales", "Avg Sales", "Sales Count", "Sales Exist");
        // Dihitung dulu flowfieldnya, baru ditampilkan
        case Rec."Sales Type Filter" of
            Rec."Sales Type Filter"::"Total Sales":
                SalesValue := Rec."Total Sales";
            Rec."Sales Type Filter"::"Max Sales":
                SalesValue := Rec."Max Sales";
            Rec."Sales Type Filter"::"Min Sales":
                SalesValue := Rec."Min Sales";
            Rec."Sales Type Filter"::"Avg Sales":
                SalesValue := Rec."Avg Sales";
            Rec."Sales Type Filter"::"Sales Count":
                SalesValue := Rec."Sales Count";
            Rec."Sales Type Filter"::"Sales Exist":
                // SalesValue := Rec."Sales Exist";
                if Rec."Sales Exist" then begin
                    SalesValue := 1;
                end else begin
                    SalesValue := 0;
                end;
        end;

        ShowSalesField := true;
        Message('Nilai dari Record Filter ialah: %1, dan nilai dari variabel SalesValue ialah: %2', Rec."Sales Type Filter", Rec."Total Sales");
        CurrPage.Update();
    end;
}
