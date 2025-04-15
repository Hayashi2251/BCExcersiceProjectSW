// ======================================
// Title: Role Center Salesperson/Purchaser
// ID: 50105
// Assignment: Project 5-3
// ======================================
page 50105 "Salesperson Role Center"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(RoleCenter)
        {
            part(Headline; "Salesperson Headline Part")
            {
                ApplicationArea = All;
            }
            part(CountSalesOpen; "Salesperson OpenSlsment Cue")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Sections)
        {
            group(Sales)
            {
                Caption = 'Sales';
                Image = Sales;
                // Group Sales : Page Blanket Sales Orders, Sales Quotes, Sales Orders, Sales Invoices, Sales Return Orders, Sales Credit Memos, Posted Sales Shipments, Posted Sales Invoices, Posted Return Receipts, Posted Sales Credit Memos 
                action(BlanketSalesOrder)
                {
                    ApplicationArea = All;
                    Caption = 'Blanket Sales Orders';
                    Image = Reminder;
                    RunObject = Page "Blanket Sales Orders";
                    ToolTip = 'Use blanket sales orders as a framework for a long-term agreement between you and your customers to sell large quantities that are to be delivered in several smaller shipments over a certain period of time. Blanket orders often cover only one item with predetermined delivery dates. The main reason for using a blanket order rather than a sales order is that quantities entered on a blanket order do not affect item availability and thus can be used as a worksheet for monitoring, forecasting, and planning purposes..';
                }
                action(SalesQuotes)
                {
                    ApplicationArea = All;
                    Caption = 'Sales Quotes';
                    RunObject = Page "Sales Quotes";
                    ToolTip = 'Make offers to customers to sell certain products on certain delivery and payment terms. While you negotiate with a customer, you can change and resend the sales quote as much as needed. When the customer accepts the offer, you convert the sales quote to a sales invoice or a sales order in which you process the sale.';
                }
                action(SalesOrders)
                {
                    ApplicationArea = All;
                    Caption = 'Sales Orders';
                    RunObject = Page "Sales Order List";
                    ToolTip = 'Record your agreements with customers to sell certain products on certain delivery and payment terms. Sales orders, unlike sales invoices, allow you to ship partially, deliver directly from your vendor to your customer, initiate warehouse handling, and print various customer-facing documents. Sales invoicing is integrated in the sales order process.';
                }
                action(SalesInvoices)
                {
                    ApplicationArea = All;
                    Caption = 'Sales Invoices';
                    RunObject = Page "Sales Invoice List";
                    ToolTip = 'Register your sales to customers and invite them to pay according to the delivery and payment terms by sending them a sales invoice document. Posting a sales invoice registers shipment and records an open receivable entry on the customer''s account, which will be closed when payment is received. To manage the shipment process, use sales orders, in which sales invoicing is integrated.';
                }
                action(SalesReturnOrders)
                {
                    ApplicationArea = All;
                    Caption = 'Sales Return Orders';
                    RunObject = Page "Sales Return Order List";
                    ToolTip = 'Compensate your customers for incorrect or damaged items that you sent to them and received payment for. Sales return orders enable you to receive items from multiple sales documents with one sales return, automatically create related sales credit memos or other return-related documents, such as a replacement sales order, and support warehouse documents for the item handling. Note: If an erroneous sale has not been paid yet, you can simply cancel the posted sales invoice to automatically revert the financial transaction.';
                }
                action(SalesCreditMemos)
                {
                    ApplicationArea = All;
                    Caption = 'Sales Credit Memos';
                    RunObject = Page "Sales Credit Memos";
                    ToolTip = 'Revert the financial transactions involved when your customers want to cancel a purchase or return incorrect or damaged items that you sent to them and received payment for. To include the correct information, you can create the sales credit memo from the related posted sales invoice or you can create a new sales credit memo with copied invoice information. If you need more control of the sales return process, such as warehouse documents for the physical handling, use sales return orders, in which sales credit memos are integrated. Note: If an erroneous sale has not been paid yet, you can simply cancel the posted sales invoice to automatically revert the financial transaction.';
                }
                action(PostedSalesShipments)
                {
                    ApplicationArea = All;
                    Caption = 'Posted Sales Shipments';
                    Image = PostedShipment;
                    RunObject = Page "Posted Sales Shipments";
                    ToolTip = 'Open the list of posted sales shipments.';
                }
                action(PostedSalesInvoices)
                {
                    ApplicationArea = All;
                    Caption = 'Posted Sales Invoices';
                    RunObject = Page "Posted Sales Invoices";
                    ToolTip = 'Open the list of posted sales invoices.';
                }
                action(PostedReturnReceipts)
                {
                    ApplicationArea = All;
                    Caption = 'Posted Sales Return Receipts';
                    RunObject = Page "Posted Return Receipts";
                    ToolTip = 'Open the list of posted sales return receipts.';
                }
                action(PostedSalesCreditMemos)
                {
                    ApplicationArea = All;
                    Caption = 'Posted Sales Credit Memos';
                    RunObject = Page "Posted Sales Credit Memos";
                    ToolTip = 'Open the list of posted sales credit memos.';
                }
            }
            group(Purchase)
            {
                Caption = 'Purchase';
                Image = Purchasing;
                // Group Purchase : Page Blanket Purchase Orders, Purchase Quotes, Purchase Orders, Purchase Invoices, Purchase Return Orders, Purchase Credit Memos, Posted Purchase Shipments, Posted Purchase Invoices, Posted Return Shipments, Posted Purchase Credit Memos 
                action(BlanketPurchaseOrders)
                {
                    ApplicationArea = All;
                    Caption = 'Blanket Purchase Orders';
                    RunObject = Page "Blanket Purchase Orders";
                    ToolTip = 'Use blanket purchase orders as a framework for a long-term agreement between you and your vendors to buy large quantities that are to be delivered in several smaller shipments over a certain period of time. Blanket orders often cover only one item with predetermined delivery dates. The main reason for using a blanket order rather than a purchase order is that quantities entered on a blanket order do not affect item availability and thus can be used as a worksheet for monitoring, forecasting, and planning purposes.';
                }
                action(PurchaseQuotes)
                {
                    ApplicationArea = All;
                    Caption = 'Purchase Quotes';
                    RunObject = Page "Purchase Quotes";
                    ToolTip = 'Create purchase quotes to represent your request for quotes from vendors. Quotes can be converted to purchase orders.';
                }
                action(PurchaseOrders)
                {
                    ApplicationArea = All;
                    Caption = 'Purchase Orders';
                    RunObject = Page "Purchase Order List";
                    ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
                }
                action(PurchaseInvoices)
                {
                    ApplicationArea = All;
                    Caption = 'Purchase Invoices';
                    RunObject = Page "Purchase Invoices";
                    ToolTip = 'Create purchase invoices to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase invoices dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase invoices can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
                }
                action(PurchaseCreditMemos)
                {
                    ApplicationArea = All;
                    Caption = 'Purchase Credit Memos';
                    RunObject = Page "Purchase Credit Memos";
                    ToolTip = 'Create purchase credit memos to mirror sales credit memos that vendors send to you for incorrect or damaged items that you have paid for and then returned to the vendor. If you need more control of the purchase return process, such as warehouse documents for the physical handling, use purchase return orders, in which purchase credit memos are integrated. Purchase credit memos can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature. Note: If you have not yet paid for an erroneous purchase, you can simply cancel the posted purchase invoice to automatically revert the financial transaction.';
                }
                action(PostedPurchaseShipments)
                {
                    ApplicationArea = All;
                    Caption = 'Receipts';
                    Image = PostedReceipts;
                    RunObject = Page "Posted Purchase Receipts";
                    RunPageView = sorting("Order No.");
                    ToolTip = 'Alternative dari "Posted Purchase Shipments" - View a list of posted purchase receipts for the order.';
                }
                action(PostedPurchaseInvoices)
                {
                    ApplicationArea = All;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                    ToolTip = 'Opens a list of posted purchase invoices.';
                }
                action(PostedPurchaseReturnShipment)
                {
                    ApplicationArea = All;
                    Caption = 'Posted Purchase Return Shipments';
                    RunObject = Page "Posted Return Shipments";
                    ToolTip = 'Opens a list of posted purchase return shipments.';
                }
                action(PostedPuchaseCreditMemos)
                {
                    ApplicationArea = All;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                    ToolTip = 'Opens a list of posted purchase credit memos.';
                }
            }
        }
        area(Embedding)
        {
            // Sales Orders, Items, Customers, Transfer Orders, Item Journals, Cash Receipt Journals, Sales Journals

            action(SalesOrders_Embed)
            {
                ApplicationArea = All;
                Caption = 'Sales Orders';
                RunObject = Page "Sales Order List";
                ToolTip = 'Record your agreements with customers to sell certain products on certain delivery and payment terms. Sales orders, unlike sales invoices, allow you to ship partially, deliver directly from your vendor to your customer, initiate warehouse handling, and print various customer-facing documents. Sales invoicing is integrated in the sales order process.';
            }
            action(Items_Embed)
            {
                ApplicationArea = All;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action(TransferOrders_Embed)
            {
                ApplicationArea = All;
                Caption = 'Transfer Orders';
                RunObject = Page "Transfer Orders";
                ToolTip = 'Move inventory items between company locations. With transfer orders, you ship the outbound transfer from one location and receive the inbound transfer at the other location. This allows you to manage the involved warehouse activities and provides more certainty that inventory quantities are updated correctly.';
            }
            action(ItemJournals_Embed)
            {
                ApplicationArea = All;
                Caption = 'Item Journals';
                RunObject = Page "Item Journal Batches";
                RunPageView = where("Template Type" = const(Item),
                                        Recurring = const(false));
                ToolTip = 'Post item transactions directly to the item ledger to adjust inventory in connection with purchases, sales, and positive or negative adjustments without using documents. You can save sets of item journal lines as standard journals so that you can perform recurring postings quickly. A condensed version of the item journal function exists on item cards for quick adjustment of an items inventory quantity.';
            }
            action(CashRcptJournals_Embed)
            {
                ApplicationArea = All;
                Caption = 'Cash Receipt Journals';
                Image = Journals;
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const("Cash Receipts"),
                                    Recurring = const(false));
                ToolTip = 'Register received payments by manually applying them to the related customer, vendor, or bank ledger entries. Then, post the payments to G/L accounts and thereby close the related ledger entries.';
            }
            action(SalesJournals_Embed)
            {
                ApplicationArea = All;
                Caption = 'Sales Journals';
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const(Sales),
                                        Recurring = const(false));
                ToolTip = 'Post any sales-related transaction directly to a customer, bank, or general ledger account instead of using dedicated documents. You can post all types of financial sales transactions, including payments, refunds, and finance charge amounts. Note that you cannot post item quantities with a sales journal.';
            }
        }
        area(Creation)
        {
            // Add action to create New Sales Quote, Sales Order, Sales Invoice, Sales Return Order, Sales Credit Memo
            action(NewSalesQuote)
            {
                ApplicationArea = All;
                Caption = 'Sales &Quote';
                Image = NewSalesQuote;
                RunObject = Page "Sales Quote";
                RunPageMode = Create;
                ToolTip = 'Create a new sales quote to offer items or services to a customer.';
            }
            action(NewSalesOrder)
            {
                ApplicationArea = All;
                Caption = 'Sales &Order';
                Image = Document;
                RunObject = Page "Sales Order";
                RunPageMode = Create;
                ToolTip = 'Create a new sales order for items or services.';
            }
            action(NewSalesInvoice)
            {
                ApplicationArea = All;
                Caption = 'Sales &Invoice';
                Image = NewSalesInvoice;
                RunObject = Page "Sales Invoice";
                RunPageMode = Create;
                ToolTip = 'Create a new invoice for the sales of items or services. Invoice quantities cannot be posted partially.';
            }
            action(NewSalesReturnOrder)
            {
                ApplicationArea = All;
                Caption = 'Sales &Return Order';
                Image = ReturnOrder;
                RunObject = Page "Sales Return Order";
                RunPageMode = Create;
                ToolTip = 'Compensate your customers for incorrect or damaged items that you sent to them and received payment for. Sales return orders enable you to receive items from multiple sales documents with one sales return, automatically create related sales credit memos or other return-related documents, such as a replacement sales order, and support warehouse documents for the item handling. Note: If an erroneous sale has not been paid yet, you can simply cancel the posted sales invoice to automatically revert the financial transaction.';
            }
            action(NewSalesCreditMemo)
            {
                ApplicationArea = All;
                Caption = 'Sales &Credit Memo';
                Image = CreditMemo;
                RunObject = Page "Sales Credit Memo";
                RunPageMode = Create;
                ToolTip = 'Create a new sales credit memo to revert a posted sales invoice.';
            }
        }
        area(Processing)
        {
            // Add action to run Item Journals, Cash Receipt Journals, Sales Journals in Group Task and area Processing
            action(ProcessItemJournals)
            {
                ApplicationArea = All;
                Caption = 'Item Journals';
                RunObject = Page "Item Journal";
                ToolTip = 'Post item transactions directly to the item ledger to adjust inventory in connection with purchases, sales, and positive or negative adjustments without using documents. You can save sets of item journal lines as standard journals so that you can perform recurring postings quickly. A condensed version of the item journal function exists on item cards for quick adjustment of an items inventory quantity.';
            }
            action(ProcessCashReceiptJournals)
            {
                ApplicationArea = All;
                Caption = 'Cash Receipt Journals';
                Image = Journals;
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const("Cash Receipts"),
                                    Recurring = const(false));
                ToolTip = 'Register received payments by manually applying them to the related customer, vendor, or bank ledger entries. Then, post the payments to G/L accounts and thereby close the related ledger entries.';
            }
            action(ProcessSalesJournals)
            {
                ApplicationArea = All;
                Caption = 'Sales &Journal';
                Image = Journals;
                RunObject = Page "Sales Journal";
                ToolTip = 'Open a sales journal where you can batch post sales transactions to G/L, bank, customer, vendor and fixed assets accounts.';
            }
        }
        area(Reporting)
        {
            group(Customer)
            {
                Caption = 'Customer';
                Image = Customer;
                // Add action to run Report Customer - Top 10 List, Customer - Order Summary in Group Customer and area Reporting
                action(RepCustTop10List)
                {
                    ApplicationArea = All;
                    Caption = 'Customer - &Top 10 List';
                    Image = "Report";
                    RunObject = Report "Customer - Top 10 List";
                    ToolTip = 'View which customers purchase the most or owe the most in a selected period. Only customers that have either purchases during the period or a balance at the end of the period will be included.';
                }
                action(RepCustOrderSummary)
                {
                    ApplicationArea = All;
                    Caption = 'Customer - &Order Summary';
                    Image = "Report";
                    RunObject = Report "Customer - Order Summary";
                    ToolTip = 'View the quantity not yet shipped for each customer in three periods of 30 days each, starting from a selected date. There are also columns with orders to be shipped before and after the three periods and a column with the total order detail for each customer. The report can be used to analyze a company''s expected sales volume.';
                }
            }
            group(Item)
            {
                Caption = 'Item';
                Image = Item;
                // Add action to run Report Vendor - Item Catalog, Inventory - List in Group Item and area Reporting
                action(RepItemCatalog)
                {
                    ApplicationArea = All;
                    Caption = 'Item - &Catalog';
                    Image = "Report";
                    RunObject = Report "Vendor Item Catalog";
                }
                action(RepInventoryList)
                {
                    ApplicationArea = All;
                    Caption = 'Inventory - &List';
                    Image = "Report";
                    RunObject = Report "Inventory - List";
                }
            }
        }
    }
}