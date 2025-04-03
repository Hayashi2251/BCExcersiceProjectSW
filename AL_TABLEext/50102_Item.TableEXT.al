// ======================================
// Title: Item Table Extension
// ID: 50102
// Assignment: Project 3-6
// Reference: Item Master Table
// ======================================

tableextension 50102 "Item TableEXT" extends Item
{
    fields
    {
        // Add changes to table fields here
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        addlast(DropDown; "Costing Method", "Vendor No.", "Vendor Item No.") { }
    }

    var
        myInt: Integer;
}