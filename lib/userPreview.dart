
import 'dart:io';
import 'package:pdf/widgets.dart' as pdfWidget;
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';

class UserPreview extends StatelessWidget{
  String fullName='',organization='',empId='',mobile='',email='',idCardPath='';
  // Constructor
  UserPreview(String fullName,String organization,String empId,String mobile,String email,String idCardPath){
    this.fullName = fullName;
    this.organization = organization;
    this.empId = empId;
    this.mobile = mobile;
    this.email = email;
    this.idCardPath = idCardPath;
  }

  void saveAsPDF() async{
    print("Saving the Registration Preview Data As PDF");
    final doc = pdfWidget.Document();
    doc.addPage(
        pdfWidget.Page(build:(context){
          return pdfWidget.Text("Registration Preview Document");
        })
    );
    Directory applicationDirectory = await getApplicationDocumentsDirectory();
    String path = applicationDirectory.path;
    final file = File("$path/registration_Preview_$empId.pdf");
    file.writeAsBytesSync(doc.save());
    print("PDF complete at $path");

    /*
    Printing.directPrintPdf(printer: Printer() , onLayout: null);
    print("directPrintPdf");
    FlutterPdfPrinter.printFile("$path/registration_preview.pdf");
    print("flutter pdf printer");

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());

    var downloadPath = await ExtStorage.getExternalStoragePublicDirectory(ExtStorage.DIRECTORY_DOWNLOADS);
    final downloadFile = File("$path/registration_Preview_$empId.pdf");
    downloadFile.writeAsBytesSync(doc.save());
    print("PDF complete at $downloadPath");
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text("Registration Preview")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // ID Card show with Image Preview
            FlatButton(
                onPressed: (){
                  Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context){
                  return PhotoView(
                    imageProvider: AssetImage(idCardPath),
                  );
                })
      );},
                child: Image(image: AssetImage(idCardPath))
      ),

      Center(
      child:Text("Registration Details"),
      heightFactor: 2.5,
      ),
      Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.baseline,

      border: TableBorder.all(
      color: Colors.white54,
      style: BorderStyle.solid,
      ),
      children: [
      TableRow(
      children: <Widget>[
      TableCell(child: Text("Full Name : ")),
      TableCell(child: Text(fullName)),
      ],
      ),
      TableRow(
      children: [
      TableCell(child: Text("Organization : ")),
      TableCell(child: Text(organization)),
      ],
      ),
      TableRow(
      children: [
      TableCell(child: Text("Employee ID : ")),
      TableCell(child: Text(empId)),
      ],
      ),
      TableRow(
      children: [
      TableCell(child: Text("Mobile Number : ")),
      TableCell(child: Text(mobile)),
      ],
      ),
      TableRow(
      children: [
      TableCell(child: Text("Email Address : ")),
      TableCell(child: Text(email)),
      ],
      ),
      ],
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RaisedButton(
              child: Text("PRINT"),
              onPressed: (){
                // PRINT the Registration Page as a PDF and download it on the USER System / Mobile
                this.saveAsPDF();
              }
              ),
          RaisedButton(
              child: Text("EDIT"),
              onPressed: (){
                Navigator.pop(context);
              }
              )
        ],
      ),

      ],
      )

      ),
    );
  }

  Widget pageForPdf(){

  }

}