query 50100 "CustBySlsprsn InnerJoin"
{
    QueryType = Normal;
    OrderBy = ascending(CustSlsprsn_Code);
    elements
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(CustSlsprsn_Code; "Salesperson Code")
            {
            }

            dataitem(Salesperson; "Salesperson/Purchaser")
            {
                SqlJoinType = InnerJoin; // bisa diganti ke LeftOuterJoin, dst.
                DataItemLink = Code = Customer."Salesperson Code";

                column(SP_Name; Name)
                {
                    Caption = 'SP Name';
                }
                column(SP_Comission; "Commission %")
                {
                    Caption = 'SP Comission %';
                }
                column(SP_Email; "E-Mail")
                {
                    Caption = 'SP E-Mail';
                }
                column(SP_PhoneNo_; "Phone No.")
                {
                    Caption = 'SP Phone No.';
                }
                column(SP_Total; "Total Sales")
                {
                    Caption = 'SP Total Sales';
                }
            }
        }
    }
}
