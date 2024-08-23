import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:resume_builder_app/utils/globals.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  Future<Uint8List> getPdf() {
    // 1. Generate object
    pw.Document pdf = pw.Document();

    // 2. Add and design Page
    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.all(25),
        build: (pw.Context cnt) => pw.Column(
          children: [
            pw.Container(
              padding: const pw.EdgeInsets.all(16),
              color: PdfColors.grey200,
              child: pw.Row(
                children: [
                  pw.ClipRRect(
                    verticalRadius: 40,
                    horizontalRadius: 40,
                    child: pw.Image(
                      pw.MemoryImage(
                        Globals.image!.readAsBytesSync(),
                      ),
                      fit: pw.BoxFit.cover,
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      width: MediaQuery.sizeOf(context).height * 0.1,
                    ),
                  ),
                  pw.SizedBox(
                    width: 20,
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [
                      pw.Text(
                        // "${Globals.name}",
                        Globals.name ?? "Not Added",
                        style: const pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      pw.Text(
                        // "${Globals.name}",
                        Globals.email ?? "Not Added",
                        style: const pw.TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      pw.Text(
                        // "${Globals.name}",
                        Globals.contact ?? "Not Added",
                        style: const pw.TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            pw.Divider(),
            pw.Expanded(
              child: pw.VerticalDivider(),
            ),
          ],
        ),
      ),
    );

    // 3. Save pdf
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Page"),
      ),
      body: PdfPreview(
        pdfFileName: "RESUME_${Globals.name?.toUpperCase()}",
        build: (format) => getPdf(),
      ),
    );
  }
}
