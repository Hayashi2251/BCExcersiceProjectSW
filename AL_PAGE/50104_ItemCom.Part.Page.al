// ======================================
// Title: My Item Comment ListPart Page
// ID: 50104
// Assignment: Project 5-2.6
// ======================================
page 50104 "Item Comment Page"
{
    Caption = 'Item Comment Lines';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Item Comment";
    AutoSplitKey = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    Caption = 'Item No';
                    Editable = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    Caption = 'Line No.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                    Caption = 'Commentar Date';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                    Caption = 'Commentar';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;


    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        CurrPage.Update();
    end;
}