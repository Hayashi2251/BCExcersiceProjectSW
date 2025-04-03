pageextension 50100 "Salesperson Card PageEXT" extends "Salesperson/Purchaser Card"
{
    layout
    {
        addafter(Invoicing)
        {
            group("Sales Transaction")
            {
                Caption = 'Sales Transaction';
                // field("Sales Type Filter"; Rec."Sales Type Filter")
                // {
                //     ApplicationArea = All;

                //     trigger OnValidate()
                //     begin
                //         UpdateSalesData();
                //     end;
                // }

                // field("Total Sales"; Rec."Total Sales")
                // {
                //     ApplicationArea = All;
                //     Editable = false;
                //     Visible = ShowTotal;
                // }

                // field("Max Sales"; Rec."Max Sales")
                // {
                //     ApplicationArea = All;
                //     Editable = false;
                //     Visible = ShowMax;
                // }

                // field("Min Sales"; Rec."Min Sales")
                // {
                //     ApplicationArea = All;
                //     Editable = false;
                //     Visible = ShowMin;
                // }

                // field("Avg Sales"; Rec."Avg Sales")
                // {
                //     ApplicationArea = All;
                //     Editable = false;
                //     Visible = ShowAvg;
                // }

                // field("Sales Count"; Rec."Sales Count")
                // {
                //     ApplicationArea = All;
                //     Editable = false;
                //     Visible = ShowCount;
                // }

                // field("Sales Exist"; Rec."Sales Exist")
                // {
                //     ApplicationArea = All;
                //     Editable = false;
                //     Visible = ShowExist;
                // }
                field("Sales Type Filter"; Rec."Sales Type Filter")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        SalesTransaction: Record "Sales Transaction";
                        TotalSales, MaxSales, MinSales, AvgSales : Decimal;
                        SalesCount: Integer;
                    begin
                        SalesTransaction.SetRange("Salesperson Code", Rec."Code");

                        case Rec."Sales Type Filter" of
                            Rec."Sales Type Filter"::"Total Sales":
                                begin
                                    SalesTransaction.CalcSums("Sales Amount");
                                    varNilaiTempDecimal := SalesTransaction."Sales Amount";
                                end;
                            Rec."Sales Type Filter"::"Max Sales":
                                begin
                                    if SalesTransaction.FindSet() then begin
                                        MaxSales := 0;
                                        repeat
                                            if SalesTransaction."Sales Amount" > MaxSales then
                                                MaxSales := SalesTransaction."Sales Amount";
                                        until SalesTransaction.Next() = 0;
                                        varNilaiTempDecimal := MaxSales;
                                    end;
                                end;
                            Rec."Sales Type Filter"::"Min Sales":
                                begin
                                    if SalesTransaction.FindSet() then begin
                                        MinSales := SalesTransaction."Sales Amount";
                                        repeat
                                            if SalesTransaction."Sales Amount" < MinSales then
                                                MinSales := SalesTransaction."Sales Amount";
                                        until SalesTransaction.Next() = 0;
                                        varNilaiTempDecimal := MinSales;
                                    end;
                                end;
                            Rec."Sales Type Filter"::"Avg Sales":
                                begin
                                    TotalSales := 0;
                                    SalesCount := 0;
                                    if SalesTransaction.FindSet() then begin
                                        repeat
                                            TotalSales += SalesTransaction."Sales Amount";
                                            SalesCount += 1;
                                        until SalesTransaction.Next() = 0;
                                        if SalesCount > 0 then
                                            varNilaiTempDecimal := TotalSales / SalesCount;
                                    end;
                                end;
                            Rec."Sales Type Filter"::"Sales Count":
                                begin
                                    SalesTransaction.SetFilter("Salesperson Code", Rec."Code");
                                    varNilaiTempDecimal := SalesTransaction.Count;
                                end;
                            Rec."Sales Type Filter"::"Sales Exist":
                                begin
                                    if SalesTransaction.FindFirst() then begin
                                        varNilaiTempDecimal := 1;
                                    end else begin
                                        varNilaiTempDecimal := 0;
                                    end;
                                end;
                        end;
                    end;
                }

                field("Sales Data"; varNilaiTempDecimal)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        ShowTotal: Boolean;
        ShowMax: Boolean;
        ShowMin: Boolean;
        ShowAvg: Boolean;
        ShowCount: Boolean;
        ShowExist: Boolean;
        varNilaiTempDecimal: Decimal;

    trigger OnOpenPage()
    begin
        UpdateSalesData();
    end;

    local procedure UpdateSalesData()
    begin
        ShowTotal := Rec."Sales Type Filter" = Rec."Sales Type Filter"::"Total Sales";
        ShowMax := Rec."Sales Type Filter" = Rec."Sales Type Filter"::"Max Sales";
        ShowMin := Rec."Sales Type Filter" = Rec."Sales Type Filter"::"Min Sales";
        ShowAvg := Rec."Sales Type Filter" = Rec."Sales Type Filter"::"Avg Sales";
        ShowCount := Rec."Sales Type Filter" = Rec."Sales Type Filter"::"Sales Count";
        ShowExist := Rec."Sales Type Filter" = Rec."Sales Type Filter"::"Sales Exist";

        CurrPage.Update();
    end;
}