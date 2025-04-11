// ======================================
// Title: Customer Table Extension
// ID: 50101
// Assignment: Project 3-7
// Reference: Customer Master Table
// ======================================

tableextension 50101 "Customer TableEXT" extends Customer
{
    fields
    {
        // ======================================
        // Title: Add "Member ID" in Table EXTENSION
        // Assignment: Project 4-2
        // TFIELD Range: 50100
        // ======================================
        field(50100; "Member ID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Member ID';
            NotBlank = true;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Assignment: Project 3-7
        addlast(Brick; "Responsibility Center", "Location Code", Address) { }
    }

    var
        myInt: Integer;

    procedure GenerateMemberID()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "NoSeriesManagement";
        NewMemberID: Code[20];
    begin
        if "Member ID" = '' then begin
            SalesSetup.Get();
            if (SalesSetup."Member Nos." = '') then begin
                Message('Field "Member Nos." belum diisi di Sales & Receivables Setup.');
                Message('nilai dari "Member Nos." adalah %1, sedangkan status dari SalesSetup.Get() ialah %2', SalesSetup."Member Nos.", SalesSetup.Get());
                Page.RunModal(Page::"Sales & Receivables Setup");
            end else begin
                NewMemberID := NoSeriesMgt.GetNextNo(SalesSetup."Member Nos.", Today, true);
                "Member ID" := NewMemberID;
                Modify(true);
                Message('Member ID telah berhasil disetting: %1', "Member ID");
            end;
        end else
            Message('Member ID sudah terisi: %1', "Member ID");
    end;

    procedure GetMemberID(CustomerNo: Code[20]): Code[20]
    begin
        if Get(CustomerNo) then begin
            if "Member ID" = '' then begin
                Message('Member ID Customer %1 adalah KOSONG', CustomerNo);
            end else begin
                Message('Member ID Customer %1 adalah %2', CustomerNo, "Member ID");
            end;
            exit("Member ID");
        end else begin
            Message('Customer %1 tidak ditemukan', CustomerNo);
            exit('');
        end;
    end;

    // Akibat salah mengira dan dianggapnya Trigger, jadilah Junk Code disini
    // Harap dimaklumi kalau tidak saya hapus
    // ===============================================================
    // trigger OnInsert()
    // var
    //     SalesSetup: Record "Sales & Receivables Setup";
    //     NoSeriesMgt: Codeunit "NoSeriesManagement";
    //     NewMemberID: Code[20];
    // begin
    //     if "Member ID" = '' then begin
    //         SalesSetup.ReadIsolation := IsolationLevel::ReadUncommitted; // Optional jika versi mendukung
    //         SalesSetup.Get();

    //         if SalesSetup."Member Nos." = '' then
    //             Error('Field "Member Nos." belum diisi di Sales & Receivables Setup.');

    //         NewMemberID := NoSeriesMgt.GetNextNo(SalesSetup."Member Nos.", Today, true);
    //         "Member ID" := NewMemberID;
    //     end;
    // end;

}