import 'dart:io';

import 'package:pdf/widgets.dart' as pdfWidget;

class MediaSaver{
  static void saveCurrentPageAsPDF( dynamic curPage , String pdfName){
    // saving the current page ad pdf
    // i.e., saving the top page in navigator to make pdf
    print("Saving this page as pdf");
    final doc = pdfWidget.Document();
    doc.addPage(
      pdfWidget.Page(build:(context){return pdfWidget.Text("baba") ;})
    );
    final file = File(pdfName+".pdf");
    file.writeAsBytesSync(doc.save());
  }
  static void saveAsPDF(){
    // save as pdf
  }
  static void savaAsJPG(){
    // save as image in jpg format
  }
}
