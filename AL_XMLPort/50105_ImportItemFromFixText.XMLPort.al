xmlport 50105 ImportItemFromFixedText
{
    Caption = 'Import Item(s) Fix TXT';
    Description = 'Create XMLPort to Import Item from Fixed Text - Reference of Excercise Project 8-6';
    Format = FixedText;
    Direction = Import;
    TextEncoding = UTF8;
    UseRequestPage = false;

    schema
    {
        textelement(Root)
        {
            tableelement(Item; Item)
            {
                AutoSave = true;
                AutoReplace = true;
                AutoUpdate = true;
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