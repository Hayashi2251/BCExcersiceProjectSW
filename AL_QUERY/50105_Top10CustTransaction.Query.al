query 50105 "Top 10 Customer Transaction"
{
    QueryType = Normal;
    TopNumberOfRows = 10;
    OrderBy = descending(totalSalesAmount);

    elements
    {
        dataitem(customer;
        Customer)
        {
            // column(systemId; SystemId)
            // {
            //     Caption = 'Id', Locked = true;
            // }
            column(customerNumber; "No.")
            {
                Caption = 'No', Locked = true;
            }
            column(name; Name)
            {
                Caption = 'Name', Locked = true;
            }
            dataitem(custLedgEntry; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = Customer."No.";
                SqlJoinType = LeftOuterJoin;
                DataItemTableFilter = "Document Type" = filter(Invoice |
                                                               "Credit Memo");
                column(totalSalesAmount; "Amount")
                {
                    Caption = 'TotalSalesAmount', Locked = true;
                    Method = Sum;
                    ColumnFilter = totalSalesAmount = filter('>0');
                }
                column(Posting_Date; "Posting Date")
                {
                    Caption = 'Posting Year', Locked = true;
                    Method = Year;
                }
                filter(dateFilter; "Posting Date")
                {
                    Caption = 'DateFilter', Locked = true;
                }
            }
        }

    }


    var
        top: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}