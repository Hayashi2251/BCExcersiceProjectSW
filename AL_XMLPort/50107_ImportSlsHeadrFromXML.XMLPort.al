xmlport 50107 "Import Sales Header XMLPort"
{
    Direction = Import;
    Format = Xml;
    UseRequestPage = true;
    Caption = 'Import to XML';
    Description = 'Create XMLPort to Import Sales Order Header & Lines from XML - Reference of Exercise Project 8-8';

    schema
    {
        textelement(RootSlsOdr)
        {
            tableelement(SOH; "Sales Header")
            {
                XmlName = 'SalesHeader';
                // RequestFilterFields = "Document Type", "Location Code", Status;

                fieldattribute(Doc_Type; SOH."Document Type") { }
                fieldattribute(No_; SOH."No.") { }
                fieldelement(LocationCode; SOH."Location Code") { }
                fieldelement(DocumentDate; SOH."Document Date") { }
                fieldelement(PostingDate; SOH."Posting Date") { }
                fieldelement(Status; SOH.Status) { }

                textelement(Lines)
                {
                    tableelement(SalesLine; "Sales Line")
                    {
                        XmlName = 'SalesLine';
                        // LinkFields = "Document Type" = SOH."Document Type", "Document No." = SOH."No.";
                        LinkTable = SOH;
                        LinkFields = "Document Type" = const("Sales Document Type"::Order), "No." = field("No.");

                        fieldattribute(Doc_Type; SalesLine."Document Type") { }
                        fieldattribute(No; SalesLine."Document No.") { }
                        fieldelement(LineNo_; SalesLine."Line No.") { }
                        fieldelement(Description; SalesLine.Description) { }
                        fieldelement(Quantity; SalesLine.Quantity) { }
                        fieldelement(UnitPrice; SalesLine."Unit Price") { }
                    }
                }
            }
        }
    }

    var
        myInt: Integer;
}
