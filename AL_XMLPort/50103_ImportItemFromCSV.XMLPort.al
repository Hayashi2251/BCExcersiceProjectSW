xmlport 50103 ImportItemFromCSV
{
    Caption = 'Import Item(s) to CSV';
    Description = 'Create XMLPort to Import Item as CSV - Reference of Excercise Project 8-4';
    Format = VariableText;
    Direction = Import;
    TextEncoding = UTF8;
    UseRequestPage = false;
    TableSeparator = '<NewLine>';

    schema
    {
        textelement(Root)
        {
            tableelement(Item; Item)
            {
                XmlName = 'Item';
                RequestFilterFields = "No.";
                fieldelement(No; Item."No.")
                {
                    XmlName = 'No.';
                }
                fieldelement(Description; Item.Description)
                {
                    XmlName = 'Description';
                }
                fieldelement(Type; Item.Type)
                {
                    XmlName = 'Type';
                }
                fieldelement(Inventory; Item.Inventory)
                {
                    XmlName = 'Inventory';
                }
                fieldelement(BaseUnitofMeasure; Item."Base Unit of Measure")
                {
                    XmlName = 'Base_Unit_of_Measure';
                }
                fieldelement(UnitCost; Item."Unit Cost")
                {
                    XmlName = 'Unit_Cost';
                }
                fieldelement(UnitPrice; Item."Unit Price")
                {
                    XmlName = 'Unit_Price';
                }
            }
        }
    }
}