import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatefulWidget {
  final String pdfLink;
  PdfScreen({super.key, required this.pdfLink});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  PdfViewerController _pdfViewerController = PdfViewerController();

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  PdfTextSearchResult _searchResult = PdfTextSearchResult();
  TextEditingController search = TextEditingController();

  bool isVertical = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: search,
            decoration: InputDecoration(label: Text("Search")),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                _searchResult = _pdfViewerController.searchText(search.text);
                if (kIsWeb) {
                  setState(() {});
                } else {
                  _searchResult.addListener(() {
                    if (_searchResult.hasResult) {
                      setState(() {});
                    }
                  });
                }
              },
            ),
            Visibility(
              visible: _searchResult.hasResult,
              child: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.black,
                ),
                onPressed: () {
                  _searchResult.previousInstance();
                },
              ),
            ),
            Visibility(
              visible: _searchResult.hasResult,
              child: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
                onPressed: () {
                  _searchResult.nextInstance();
                },
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.bookmark,
                color: Colors.black,
              ),
              onPressed: () {
                _pdfViewerKey.currentState?.openBookmarkView();
              },
            ),
            IconButton(
              icon: Icon(
                Icons.directions,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  isVertical = !isVertical;
                });
              },
            ),
          ],
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: 1000,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: SfPdfViewer.network(
                  key: _pdfViewerKey,
                  controller: _pdfViewerController,
                  scrollDirection: isVertical
                      ? PdfScrollDirection.vertical
                      : PdfScrollDirection.horizontal,
                  widget.pdfLink),
            )));
  }
}
