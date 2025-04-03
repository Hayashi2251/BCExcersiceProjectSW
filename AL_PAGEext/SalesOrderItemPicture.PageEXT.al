pageextension 50101 "SalesOrder ItemPict PageEXT" extends "Sales Order"
{
    layout
    {
        addfirst(factboxes)
        {
            part(ItemPicture; "Item Picture")
            {
                ApplicationArea = All;
                Caption = 'Item Picture';
                Provider = SalesLines;
                SubPageLink = "No." = field("No.");
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