xmlport 50101 ImportItemFromXML
{
    Direction = Import;
    Format = Xml;
    UseRequestPage = false;
    Caption = 'Import Item(s) to XML';
    Description = 'Create XMLPort to Import Item from XML - Reference of Excercise Project 8-2';
    schema
    {
        textelement(Items)
        {
            tableelement(Item; Item)
            {
                fieldattribute(Number_; Item."No.")
                {
                    XmlName = 'No.';
                }
                fieldattribute(Base_Unit_of_Measure; Item."Base Unit of Measure") { }
                // FIELD ELEMENTS
                fieldelement(Description; Item.Description) { }
                fieldelement(Inventory; Item.Inventory) { }
                fieldelement(BlockedStatus; Item.Blocked) { }
                fieldelement(CommentCount; Item."Comment Count") { }
                tableelement(ItemComments; "Item Comment")
                {
                    XmlName = 'ItemComments';
                    fieldattribute(ItemNo_; ItemComments."Item No.") { }
                    fieldattribute(LineNo_; ItemComments."Line No.") { }
                    fieldattribute(CreatedDate; ItemComments."Created Date") { }
                    fieldelement(Comment; ItemComments.Comment) { }
                }
                textelement(CostPrice)
                {
                    XmlName = 'CostnPrice';
                    fieldelement(Cost; Item."Unit Cost") { }
                    fieldelement(Price; Item."Unit Price") { }
                    fieldelement(PriceVAT; Item."Price Includes VAT") { }
                    fieldelement(Profit; Item."Profit %") { }
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