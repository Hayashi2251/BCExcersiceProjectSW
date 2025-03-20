table 50100 "Sales Transaction"
{
    DataClassification = CustomerContent;
    // Menandai jenis data yang tersimpan dalam tabel berdasarkan regulasi data (misalnya, GDPR).
    Caption = 'Sales Transaction Table';
    // CAPTION menentukan teks tampilan yang digunakan untuk tabel dalam UI
    DataCaptionFields = "Line No.", "Salesperson Code";
    //DataCaptionFields menentukan field mana yang akan ditampilkan sebagai LABEL.
    DataPerCompany = true;
    // DataPerCompany mengatur apakah data BERLAKU untuk semua atau hanya satu perusahaan
    LookupPageId = "Sales Transaction List";
    // LookPageId Menentukan halaman LOOKUP default
    DrillDownPageId = "Sales Transaction List";
    // Menentukan halaman yang akan dibuka saat pengguna menggunakan fitur DRILLDOWN (Open Reference) dari laporan atau halaman terkait.

    fields
    {
        field(1; "Line No."; Integer) // Primary Key
        {
            DataClassification = SystemMetadata;
            Caption = 'Line No.';
        }
        field(2; "Salesperson Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser".Code WHERE("Commission %" = FILTER(> 0));
        }
        field(3; "Sales Type"; Enum "Sales Type Enum")
        {
            DataClassification = CustomerContent;
            Caption = 'Sales Type';
        }
        field(4; "No."; Code[20]) // Mungkin Document No.
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
            TableRelation =
                IF ("Sales Type" = const("Item")) "Item"."No."
            ELSE IF ("Sales Type" = const("G/L Account")) "G/L Account"."No.";
        }
        field(5; "Customer Group"; Enum "Customer Group Enum")
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Group';
        }
        field(6; "Sales Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Sales Amount';
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        SalesTransRec: Record "Sales Transaction";
    begin
        if "Line No." = 0 then begin
            if SalesTransRec.FindLast() then
                "Line No." := SalesTransRec."Line No." + 1
            else
                "Line No." := 1;
        end;
    end;
}