// ======================================
// Title: My Item Card Page
// ID: 50103
// Assignment: Project 5-2
// ======================================
page 50103 MyItemCard
{
    PageType = Card;
    ApplicationArea = All;
    DataCaptionFields = "No.", Description, "Base Unit of Measure";
    UsageCategory = None;
    SourceTable = Item;
    AboutTitle = 'Welcome to My Item Card';
    AboutText = 'This page lets you view and manage item details including description, units, and pricing.';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = All;
                    Caption = 'Base Unit of Measure';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    Caption = 'Blocked';
                }
                field("Comment Count"; Rec."Comment Count")
                {
                    ApplicationArea = All;
                    Caption = 'Comment Count';
                }
            }
            group("Item Comments")
            {
                part(ItemCommentPart; "Item Comment Page")
                {
                    SubPageLink = "Item No." = field("No.");
                    ApplicationArea = All;
                }
            }
            group(Costing)
            {
                group(Price)
                {
                    field("Unit Price"; Rec."Unit Price")
                    {
                        ApplicationArea = All;
                        Caption = 'Unit Price';
                    }
                    field("Unit Cost"; Rec."Unit Cost")
                    {
                        ApplicationArea = All;
                        Caption = 'Unit Cost';
                    }
                }

                group(Profit)
                {
                    field("Profit %"; Rec."Profit %")
                    {
                        ApplicationArea = All;
                        Caption = 'Profit %';
                    }
                    field("Price/Profit Calculation"; Rec."Price/Profit Calculation")
                    {
                        ApplicationArea = All;
                        Caption = 'Price/Profit Calculation';
                    }
                    field("Price Includes VAT"; Rec."Price Includes VAT")
                    {
                        ApplicationArea = All;
                        Caption = 'Price Includes VAT';
                    }
                }
            }
            group("Total Inventory")
            {
                Caption = 'Total Inventory';
                fixed("Fixed Layout")
                {
                    group("Inventory Summary")
                    {
                        field(Inventory; Rec.Inventory)
                        {
                            ApplicationArea = All;
                            Caption = 'Inventory';
                        }
                        field("Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
                        {
                            ApplicationArea = All;
                            Caption = 'Qty. on Purch. Order';
                        }
                        field("Qty. on Sales Order"; Rec."Qty. on Sales Order")
                        {
                            ApplicationArea = All;
                            Caption = 'Qty. on Sales Order';
                        }
                        field("Qty. on Prod. Order"; Rec."Qty. on Prod. Order")
                        {
                            ApplicationArea = All;
                            Caption = 'Qty. on Prod. Order';
                        }
                    }
                }
            }
        }
        area(FactBoxes)
        {
            part(ItemPictureFactBox; "Item Picture")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("No.");
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            group(Category_New)
            {
                Caption = 'New Document';

                actionref(NewSalesQuote_ActRef; CreateSalesQuote) { }
                actionref(NewSalesOrder_ActRef; CreateSalesOrder) { }
                actionref(NewSalesInvoice_ActRef; CreateSalesInvoice) { }
            }
            // group(Category_Process)
            // {
            //     Caption = 'Process';
            //     Image = Process;
            //     actionref(AdjustCostItemEntries_ActRef; RunAdjustCostItemEntries) { }
            // }
        }
        area(Processing)
        {
            group(Process)
            {
                Caption = 'Process';
                Image = Process;
                action(RunAdjustCostItemEntries)
                {
                    ApplicationArea = All;
                    Caption = 'Adjust Cost - Item Entries';
                    Image = AdjustItemCost;

                    trigger OnAction()
                    var
                        AdjustCostReport: Report "Adjust Cost - Item Entries";
                    begin
                        Report.RunModal(Report::"Adjust Cost - Item Entries", true, true);
                    end;
                }
            }
            group(NewDocument)
            {
                action(CreateSalesQuote)
                {
                    ApplicationArea = All;
                    Caption = 'Sales Quote';
                    Image = Quote;
                    trigger OnAction()
                    var
                        SalesQuote: Page "Sales Quote";
                    begin
                        SalesQuote.RunModal();
                    end;
                }

                action(CreateSalesOrder)
                {
                    ApplicationArea = All;
                    Caption = 'Sales Order';
                    Image = Order;
                    trigger OnAction()
                    var
                        SalesOrder: Page "Sales Order";
                    begin
                        SalesOrder.RunModal();
                    end;
                }

                action(CreateSalesInvoice)
                {
                    ApplicationArea = All;
                    Caption = 'Sales Invoice';
                    Image = Invoice;
                    trigger OnAction()
                    var
                        SalesInvoice: Page "Sales Invoice";
                    begin
                        SalesInvoice.RunModal();
                    end;
                }
            }
        }

        area(Navigation)
        {
            group(Ledger)
            {
                Caption = 'Ledger';
                Image = Ledger;
                action("Ledger Entries")
                {
                    ApplicationArea = Suite;
                    Caption = 'Item Ledger Entries';
                    Image = ItemLedger;

                    RunObject = Page "Item Ledger Entries";
                    RunPageLink = "Item No." = field("No.");
                    RunPageView = sorting("Item No.")
                                      order(descending);
                    Scope = Repeater;
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View the history of transactions that have been posted for the selected record.';
                }
                action("&Value Entries")
                {
                    ApplicationArea = Suite;
                    Caption = '&Value Entries';
                    Image = ValueLedger;
                    RunObject = Page "Value Entries";
                    RunPageLink = "Item No." = field("No.");
                    RunPageView = sorting("Item No.");
                    ToolTip = 'View the history of posted amounts that affect the value of the item. Value entries are created for every transaction with the item.';
                }
            }
        }

        area(Reporting)
        {
            action(InventoryListReport)
            {
                Caption = 'Inventory List';
                ApplicationArea = All;

                trigger OnAction()
                var
                    ItemRec: Record Item;
                begin
                    ItemRec.SetRange("No.", Rec."No.");
                    REPORT.RUNMODAL(Report::"Inventory - List", true, false, ItemRec);
                end;
            }
            action(InventoryTransactionsReport)
            {
                Caption = 'Inventory Transactions';
                ApplicationArea = All;

                trigger OnAction()
                var
                    ItemRec: Record Item;
                begin
                    ItemRec.SetRange("No.", Rec."No.");
                    REPORT.RUNMODAL(Report::"Inventory - Transaction Detail", true, false, ItemRec);
                end;
            }
        }
    }
}