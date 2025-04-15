page 50108 "Customer Sales List"
{
    // Caption = 'Top 10 Customer Transactions';
    UsageCategory = Lists;
    PageType = List;
    SourceTable = "Top 10 Customer Transaction";
    // SourceTableTemporary = true;
    ApplicationArea = All;
    Caption = 'Top 10 Customer Transactions (from Query)';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Total Sales"; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Load Query Data")
            {
                trigger OnAction()
                begin
                    LoadQueryData();
                end;
            }
        }
    }
    // trigger OnOpenPage()
    // begin
    //     LoadQueryData();
    // end;

    local procedure LoadQueryData()
    var
        TempRec: Record "Top 10 Customer Transaction";
        QueryRes: Query "Top 10 Customer Transaction";
        numberRows: Integer;
    begin
        TempRec.Reset();
        TempRec.DeleteAll();
        numberRows := 0;

        QueryRes.Open();
        while QueryRes.Read() do begin
            TempRec.Init();
            numberRows := numberRows + 1;
            TempRec."Row No." := numberRows;
            TempRec."Customer No." := QueryRes.customerNumber;
            TempRec."Customer Name" := QueryRes.name;
            TempRec.Amount := QueryRes.totalSalesAmount;
            TempRec."Posting Date" := QueryRes.Posting_Date;
            TempRec.Insert();
        end;
        QueryRes.Close();

        CurrPage.Update();
    end;
}
