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
        // Add changes to table fields here
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        addlast(Brick; "Responsibility Center", "Location Code", Address) { }
    }

    var
        myInt: Integer;
}