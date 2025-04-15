table 50103 "Top 10 Customer Transaction"
{
    DataClassification = CustomerContent;
    Caption = 'Top 10 Customer Transaction';


    fields
    {
        field(10; "Row No."; Integer)
        {
            AutoIncrement = true;
        }
        field(20; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(30; "Customer Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(40; "Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50; "Posting Date"; Integer)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Row No.")
        {
            Clustered = true;
        }
    }
}
