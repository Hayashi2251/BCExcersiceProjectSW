pageextension 50108 "Sales Order List PageEXT" extends "Sales Order List"
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
                    ToolTip = 'Create XMLPort to Export Sales Order Header & Lines as XML - Reference of Excercise Project 8-7';
                    ApplicationArea = All;
                    Image = XMLFile;
                    trigger OnAction()
                    var
                        SOHXML: XmlPort "Export Sales Header XMLPort";
                    begin
                        SOHXML.Run();
                    end;
                }
            }
            group(ImportsMenu)
            {
                Caption = 'SW Imports Act';
                action(ImportXML)
                {
                    Caption = 'Import to XML';
                    ToolTip = 'Create XMLPort to Import Sales Order Header & Lines from XML - Reference of Excercise Project 8-8';
                    ApplicationArea = All;
                    Image = XMLFile;
                    trigger OnAction()
                    var
                        SOHXML: XmlPort "Import Sales Header XMLPort";
                    begin
                        SOHXML.Run();
                    end;


                    // trigger OnAction()
                    // var
                    //     FromFile: Text; //choose the file in the file explorer
                    //     Instr: InStream;
                    //     xmldoc: XmlDocument;
                    //     tab: XmlElement;
                    //     nodelist: XmlNodeList;
                    //     nodee: XmlNode;
                    //     nodee1: XmlNode;
                    //     SalesHead: Record "Sales Header";
                    //     nodelistsec: XmlNodeList;
                    //     element: XmlElement;

                    // //to get the xml file from the user
                    // begin
                    //     if UploadIntoStream('Upload XML file', '', '', FromFile, Instr) then
                    //         XmlDocument.ReadFrom(Instr, xmldoc)
                    //     else
                    //         Error('Not an XML File');

                    //     //to find the root element
                    //     if xmldoc.GetRoot(tab) then
                    //         nodelist := tab.GetChildElements();

                    //     foreach nodee in nodelist do begin
                    //         SalesHead.Init();
                    //         element := nodee.AsXmlElement();
                    //         nodelistsec := element.GetChildElements();

                    //         foreach nodee1 in nodelistsec do begin
                    //             case nodee1.AsXmlElement().Name of
                    //                 'No.':
                    //                     SalesHead.Validate(SalesHead."No.", nodee1.AsXmlElement().InnerText);
                    //                 'Name':
                    //                     SalesHead.Validate(SalesHead.Name, nodee1.AsXmlElement().InnerText);
                    //                 'Address':
                    //                     SalesHead.Validate(SalesHead.Address, nodee1.AsXmlElement().InnerText);
                    //             end;

                    //         end;

                    //         Customer.Insert()
                    //     end;
                    //     Message('Successfully Uploaded');
                    // end;
                }
            }
        }
    }

    var
        myInt: Integer;
}