// ======================================
// Title: Salesperson Headline Part
// ID: 50106
// Assignment: Project 5-3
// ======================================
page 50106 "Salesperson Headline Part"
{
    Caption = 'Salesperson Headline Part';
    PageType = HeadlinePart;
    // PageType = CardPart;
    SourceTable = "Salesperson/Purchaser";
    // SourceTableView = where(Code = const('BTR'));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field(Headline1; Greeting)
            {
                ApplicationArea = All;
            }
            // field(Headline2; Rec."Total Sales")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Total Sales';
            // }
            // field(Headline3; Rec."Avg Sales")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Average Sales';
            // }
            // field(Headline4; Rec."Max Sales")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Maximum Sales';
            // }
            // field(Headline5; Rec."Min Sales")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Minimum Sales';
            // }
            // ==============================
            field(Headline2; TotalSales)
            {
                ApplicationArea = All;
                Caption = 'Total Sales';
            }
            field(Headline3; AvgSales)
            {
                ApplicationArea = All;
                Caption = 'Average Sales';
            }
            field(Headline4; MaxSales)
            {
                ApplicationArea = All;
                Caption = 'Maximum Sales';
            }
            field(Headline5; MinSales)
            {
                ApplicationArea = All;
                Caption = 'Minimum Sales';
            }
        }
    }

    trigger OnOpenPage()
    var
        UserID: Code[50];
        SalesTransRec: Record "Sales Transaction"; // Ganti dengan nama tabel transaksi penjualan
        SalespersonRec: Record "Salesperson/Purchaser";
        UserApprovalSetupRec: Record "User Setup";
    begin
        UserApprovalSetupRec.Get(UserId());
        // UserApprovalSetupRec.Get('BTR');
        // Message('Nilai dari USER ID: %1, dengan Salesperson yang di-get terakhir ialah: %2', UserApprovalSetupRec."User ID", UserApprovalSetupRec."Salespers./Purch. Code");
        SalespersonRec.Get(UserApprovalSetupRec."Salespers./Purch. Code");
        SalespersonRec.CalcFields("Total Sales", "Max Sales", "Min Sales", "Avg Sales", "Sales Count", "Sales Exist");
        Greeting := 'Good Morning, ' + UserId();
        TotalSales := 'Total Sales: ' + Format(Round(SalespersonRec."Total Sales", 0.01));
        AvgSales := 'Average Sales: ' + Format(Round(SalespersonRec."Avg Sales", 0.01));
        MaxSales := 'Maximal Sales: ' + Format(SalespersonRec."Max Sales");
        MinSales := 'Minimal Sales: ' + Format(SalespersonRec."Min Sales");
    end;

    var
        Greeting: Text[100];
        TotalSales: Text[50];
        AvgSales: Text[50];
        MaxSales: Text[50];
        MinSales: Text[50];
}
