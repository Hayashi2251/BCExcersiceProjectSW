pageextension 50102 "Customer Card PageEXT" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Member ID"; Rec."Member ID")
            {
                ApplicationArea = All;
                Caption = 'Member ID';
                ShowMandatory = true;
            }
        }
    }
    actions
    {
        addlast(Promoted)
        {
            group(Coba)
            {
                actionref(GenMemID_ActRef; GenerateMemberID) { }
            }
        }
        addlast(Processing)
        {
            action(GenerateMemberID)
            {
                ApplicationArea = All;
                Caption = 'Generate Member ID';
                Image = User;
                trigger OnAction()
                var
                    Cust: Record Customer;
                begin
                    Cust.Get(Rec."No.");
                    Cust.GenerateMemberID();
                    Rec := Cust;
                end;
            }
        }
    }

    var
        myInt: Integer;



}