pageextension 50500 SalesOrderListPageEXT extends "Sales Order List"
{
    layout
    {
        addafter("Sell-to Customer No.")
        {
            field("Member ID"; Rec."Member ID")
            {
                ApplicationArea = all;
                Caption = 'Member ID';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}

pageextension 50501 CustListPageExt extends "Customer List"
{
    layout
    {
        addafter("No.")
        {
            field("Member ID"; Rec."Member ID")
            {
                ApplicationArea = all;
                Caption = 'Member ID';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}