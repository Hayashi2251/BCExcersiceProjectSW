// ======================================
// Title: Item Commentar Table for ListPart Page
// ID: 50102
// Assignment: Project 5-2.6
// ======================================
table 50101 "Item Comment"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(3; "Created Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(4; Comment; Text[250])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Item No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
