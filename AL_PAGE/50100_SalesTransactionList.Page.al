// ======================================
// Title: Sales Transaction List Page
// ID: 50100
// Assignment: Project 3-5
// ======================================
page 50100 "Sales Transaction List"
{
    Caption = 'Sales Transaction';
    PageType = List;
    Editable = false;
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageId = "Sales Transaction Card";
    SourceTable = "Sales Transaction";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                }
                field("Sales Type"; Rec."Sales Type")
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Group"; Rec."Customer Group")
                {
                    ApplicationArea = All;
                }
                field("Sales Amount"; Rec."Sales Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}