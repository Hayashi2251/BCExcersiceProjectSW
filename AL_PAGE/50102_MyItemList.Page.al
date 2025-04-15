// ======================================
// Title: My Item List Page
// ID: 50102
// Assignment: Project 5-1.3
// ======================================
page 50102 "My Item List"
{
    Caption = 'My Item List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = MyItemCard;
    SourceTable = Item;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                }
            }
        }
    }

    // var
    //     myInt: Integer;
}