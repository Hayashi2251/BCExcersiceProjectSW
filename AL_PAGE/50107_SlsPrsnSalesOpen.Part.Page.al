page 50107 "Salesperson OpenSlsment Cue"
{
    PageType = CardPart;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            cuegroup(SalesCues)
            {
                field(OpenQuotes; OpenQuotesCount)
                {
                    ApplicationArea = All;
                    Caption = 'Open Quotes';
                    DrillDown = true;
                    trigger OnDrillDown()
                    var
                    // PageSalesQuotes: Page "Sales Quotes";
                    begin
                        // PageSalesQuotes.Run();
                        Page.RunModal(Page::"Sales Quotes", SalesQuoteRec)
                    end;
                }

                field(OpenOrders; OpenOrdersCount)
                {
                    ApplicationArea = All;
                    Caption = 'Open Orders';
                    DrillDown = true;
                    trigger OnDrillDown()
                    begin
                        Page.RunModal(Page::"Sales Order List", SalesOrderRec)
                    end;
                }
                field(CountTransaction; SlsTransactionCount)
                {
                    ApplicationArea = All;
                    Caption = 'Sales Transaction';
                    DrillDown = true;
                    StyleExpr = 'subordinate'; // Dim
                    // StyleExpr = 'Unfavorable'; // Red
                    // StyleExpr = 'Ambiguous'; // Yellow Line
                    // StyleExpr = 'Favorable'; // Green Line
                    trigger OnDrillDown()
                    begin
                        Page.RunModal(Page::"Sales Transaction List", SalesTransactionRec)
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        // ApprovalUserSetup: Record "";
        SalespersonCode: Code[20];
        CountQuotes: Integer;
        CountOrders: Integer;
        UserApprovalSetupRec: Record "User Setup";
    begin
        if UserApprovalSetupRec.Get(UserId()) then begin
            SalespersonCode := UserApprovalSetupRec."Salespers./Purch. Code";

            // Sales Quotes
            SalesQuoteRec.SetRange("Document Type", SalesQuoteRec."Document Type"::Quote);
            SalesQuoteRec.SetRange(Status, SalesQuoteRec.Status::Open);
            SalesQuoteRec.SetRange("Salesperson Code", SalespersonCode);
            OpenQuotesCount := SalesQuoteRec.Count;

            // Sales Orders
            SalesOrderRec.SetRange("Document Type", SalesOrderRec."Document Type"::Order);
            SalesOrderRec.SetRange(Status, SalesOrderRec.Status::Open);
            SalesOrderRec.SetRange("Salesperson Code", SalespersonCode);
            OpenOrdersCount := SalesOrderRec.Count;

            // Sales Transaction
            SalesTransactionRec.SetRange("Salesperson Code", SalespersonCode);
            SlsTransactionCount := SalesTransactionRec.Count;

        end;
    end;

    var
        OpenQuotesCount: Integer;
        OpenOrdersCount: Integer;
        SlsTransactionCount: Integer;
        SalesQuoteRec: Record "Sales Header";
        SalesOrderRec: Record "Sales Header";
        SalesTransactionRec: Record "Sales Transaction";
}
