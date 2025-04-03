page 50101 "Sales Transaction Card"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Sales Transaction";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    NotBlank = true;
                }
                // modify("Salesperson Code")
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                }
                field("Sales Type"; Rec."Sales Type")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Rec."No." := '';
                        Rec.Description := '';
                    end;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    // trigger OnLookup(var Text: Text): Boolean
                    // var
                    //     ItemRec: Record "Item";
                    //     ItemPage: Page "Item List";
                    //     GLRec: Record "G/L Account";
                    //     GLPage: Page "G/L Account List";
                    // begin
                    //     if (Rec."Sales Type" = Rec."Sales Type"::Item) then begin
                    //         if Page.RunModal(Page::"Item List", itemRec) = Action::LookupOK then begin
                    //             Rec."No." := ItemRec."No.";
                    //             Rec.Description := ItemRec.Description;
                    //         end;
                    //     end else if (Rec."Sales Type" = Rec."Sales Type"::"G/L Account") then begin
                    //         if Page.RunModal(Page::"G/L Account List", GLRec) = Action::LookupOK then begin
                    //             Rec."No." := GLRec."No.";
                    //             Rec.Description := GLRec.Name;
                    //         end;
                    //     end;
                    // end;

                    trigger OnValidate()
                    var
                        ItemRec: Record "Item";
                        GLRec: Record "G/L Account";
                    begin
                        if (Rec."Sales Type" = Rec."Sales Type"::Item) then begin
                            if ItemRec.Get(Rec."No.") then begin
                                Rec.Description := ItemRec.Description;
                            end;
                        end else if (Rec."Sales Type" = Rec."Sales Type"::"G/L Account") then begin
                            if GLRec.Get(Rec."No.") then begin
                                Rec.Description := GLRec.Name;
                            end;
                        end;
                    end;
                }
                field("Customer Group"; Rec."Customer Group")
                {
                    ApplicationArea = All;
                }
                field("Sales Amount"; Rec."Sales Amount")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Salesperson Name"; Rec."Salesperson Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Resource Card")
            {
                ApplicationArea = All;
                ToolTip = 'Open the Salesperson / Purchaser Card';
                RunObject = Page "Salesperson/Purchaser Card";
                RunPageLink = Code = FIELD("Salesperson Code");
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Process;
            }
        }
    }
}

// var
//     "Costing Method": Enum "Costing Method";
//                           "Vendor No.": Code[20];
//                           "Vendor Item No.": Text[50];