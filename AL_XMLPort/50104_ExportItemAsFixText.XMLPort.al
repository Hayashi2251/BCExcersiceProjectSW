xmlport 50104 ExportItemAsFixedText
{
    Caption = 'Export Item(s) Fix TXT';
    Description = 'Create XMLPort to Export Item as Fixed Text - Reference of Excercise Project 8-5';
    Format = FixedText;
    Direction = Export;
    TextEncoding = UTF8;
    UseRequestPage = false;
    FileName = 'ExportItemFixed.txt';

    schema
    {
        textelement(Root)
        {
            tableelement(Item; Item)
            {
                XmlName = 'Item';
                fieldelement(No; Item."No.")
                {
                    Width = 10;
                    MinOccurs = Once;
                }
                fieldelement(Description; Item.Description)
                {
                    Width = 30;
                    MinOccurs = Once;
                }
                fieldelement(Type; Item.Type)
                {
                    Width = 10;
                    MinOccurs = Once;
                }
                fieldelement(Inventory; Item.Inventory)
                {
                    Width = 10;
                    MinOccurs = Once;
                }
                fieldelement(BaseUnitofMeasure; Item."Base Unit of Measure")
                {
                    Width = 10;
                    MinOccurs = Once;
                }
                fieldelement(UnitCost; Item."Unit Cost")
                {
                    Width = 12;
                    MinOccurs = Once;
                }
                fieldelement(UnitPrice; Item."Unit Price")
                {
                    Width = 12;
                    MinOccurs = Once;
                }
            }
        }
    }
}