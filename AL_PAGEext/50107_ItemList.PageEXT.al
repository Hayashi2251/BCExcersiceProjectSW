pageextension 50107 "Item List PageEXT" extends "Item List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addfirst(reporting)
        {
            group(ExportsMenu)
            {
                Caption = 'SW Exports Act';
                action(ExportXML)
                {
                    Caption = 'Export to XML';
                    ToolTip = 'Create XMLPort to Export Item as XML - Reference of Excercise Project 8-1';
                    ApplicationArea = All;
                    Image = XMLFile;
                    trigger OnAction()
                    var
                        // TempBlob: Codeunit "Temp Blob";

                        ItemXML: XmlPort ExportItemAsXML;

                    // OutStr: OutStream;
                    // InStr: InStream;
                    // FileName: Text;
                    begin
                        // TempBlob.CreateOutStream(OutStr);

                        // ItemXML.SetDestination(OutStr);
                        // ItemXML.Export();

                        // TempBlob.CreateInStream(InStr);
                        // FileName := 'ExportItem.xml';

                        // File.DownloadFromStream(InStr, 'Download', '', '', FileName);

                        ItemXML.Run();
                    end;
                }
                action(ExportCSV)
                {
                    Caption = 'Export to CSV';
                    ToolTip = 'Create XMLPort to Export Item as CSV - Reference of Excercise Project 8-3';
                    ApplicationArea = All;
                    Image = ExportToExcel;
                    trigger OnAction()
                    var
                        ItemCSV: XmlPort ExportItemAsCSV;
                    begin
                        ItemCSV.Run();
                    end;
                }
                action(ExportFixedTXT)
                {
                    Caption = 'Export to Fix TxT';
                    ToolTip = 'Create XMLPort to Export Item as Fixed Text - Reference of Excercise Project 8-5';
                    ApplicationArea = All;
                    Image = ExportFile;
                    trigger OnAction()
                    var
                        ItemFixedText: XmlPort ExportItemAsFixedText;
                    begin
                        ItemFixedText.Run();
                    end;
                }
            }
            group(ImportsMenu)
            {
                Caption = 'SW Imports Act';
                action(ImportXML)
                {
                    Caption = 'Import to XML';
                    ToolTip = 'Create XMLPort to Import Item from XML - Reference of Excercise Project 8-2';
                    ApplicationArea = All;
                    Image = Import;
                    trigger OnAction()
                    var
                        ItemXML: XmlPort ImportItemFromXML;
                    begin
                        ItemXML.Run();
                    end;
                }
                action(ImportCSV)
                {
                    Caption = 'Import to CSV';
                    ToolTip = 'Create XMLPort to Import Item from CSV - Reference of Excercise Project 8-4';
                    ApplicationArea = All;
                    Image = Import;
                    trigger OnAction()
                    var
                        ItemCSV: XmlPort ImportItemFromCSV;
                    begin
                        ItemCSV.Run();
                    end;
                }
                action(ImportFixedText)
                {
                    Caption = 'Import to Fix Txt';
                    ToolTip = 'Create XMLPort to Import Item from Fixed Text - Reference of Excercise Project 8-6';
                    ApplicationArea = All;
                    Image = Import;
                    trigger OnAction()
                    var
                        ItemFixedText: XmlPort ImportItemFromFixedText;
                    begin
                        ItemFixedText.Run();
                    end;
                }
            }
        }
    }

    var
        myInt: Integer;
}