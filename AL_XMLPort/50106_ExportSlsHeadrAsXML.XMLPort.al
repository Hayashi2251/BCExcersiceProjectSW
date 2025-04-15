xmlport 50106 "Export Sales Header XMLPort"
{
    Direction = Export;
    Format = Xml;
    UseRequestPage = true;
    Caption = 'Export to XML';
    Description = 'Create XMLPort to Export Sales Order Header & Lines as XML - Reference of Excercise Project 8-7';
    FileName = 'ExportSalesOrder.xml';
    schema
    {
        textelement(RootSlsOdr)
        {
            tableelement(SOH; "Sales Header")
            {
                XmlName = 'SalesHeader';
                RequestFilterFields = "Document Type", "Location Code", Status;
                fieldattribute(Doc_Type; SOH."Document Type") { }
                fieldattribute(No_; SOH."No.") { }
                fieldelement(DocumentDate; SOH."Document Date") { }
                fieldelement(PostingDate; SOH."Posting Date") { }
                fieldelement(Status; SOH.Status) { }
                textelement(Lines)
                {
                    tableelement(SalesLine; "Sales Line")
                    {
                        XmlName = 'SalesLine';
                        RequestFilterFields = "Document Type", "Posting Group";
                        fieldattribute(Doc_Type; SalesLine."Document Type") { }
                        fieldattribute(No; SOH."No.") { }
                        fieldelement(LineNo_; SalesLine."Line No.") { }
                        fieldelement(Description; SalesLine.Description) { }
                        fieldelement(Quantity; SalesLine.Quantity) { }
                        fieldelement(UnitPrice; SalesLine."Unit Price") { }
                    }
                }
            }
        }
    }

    // requestpage
    // {
    //     layout
    //     {
    //         area(content)
    //         {
    //             group(GroupName)
    //             {
    //                 field(Name; SourceExpression)
    //                 {

    //                 }
    //             }
    //         }
    //     }

    //     actions
    //     {
    //         area(processing)
    //         {
    //             action(ActionName)
    //             {

    //             }
    //         }
    //     }
    // }

    var
        myInt: Integer;
}