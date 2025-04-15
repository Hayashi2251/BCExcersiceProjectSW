// ======================================
// Title: Field Comment Count in Item
// ID: 50100
// Assignment: Project 5-2.5
// ======================================
tableextension 50110 MyItemTableEXT extends Item
{
    fields
    {
        field(50100; "Comment Count"; Integer)
        {
            // DataClassification = CustomerContent;
            Caption = 'Comment Count';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Item Comment"."Line No." WHERE("Item No." = field("No.")));
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}