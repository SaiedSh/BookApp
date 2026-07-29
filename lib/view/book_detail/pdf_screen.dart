import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatefulWidget {
  final String pdfLink;
  PdfScreen({super.key, required this.pdfLink});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  PdfViewerController _pdfViewerController = PdfViewerController();

  int? _lastPage;
  List<int> _bookmarks = [];
  PdfTextSearchResult _searchResult = PdfTextSearchResult();
  TextEditingController _searchController = TextEditingController();
  bool isVertical = true;
  String url = "";

  @override
  void initState() {
    super.initState();
    _loadLastPage();
    url = widget.pdfLink.toString();
    _loadHighlights();
  }

  _searchText(String searchText) async {
    _searchResult = await _pdfViewerController.searchText(searchText);
    if (mounted) {
      setState(() {});
    }
  }

  Future<String> _getCachedPdfFile(String url) async {
    // استفاده از cache manager برای دانلود و کش کردن فایل
    var file = await DefaultCacheManager().getSingleFile(url);
    return file.path; // مسیر فایل کش شده
  }

  _loadBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _bookmarks =
          prefs.getStringList('bookmarks')?.map((e) => int.parse(e)).toList() ??
              [];
    });
  }

  _addBookmark(int page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!_bookmarks.contains(page)) {
      _bookmarks.add(page);
      prefs.setStringList(
          'bookmarks', _bookmarks.map((e) => e.toString()).toList());
    }
  }

  _removeBookmark(int page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _bookmarks.remove(page);
      prefs.setStringList(
          'bookmarks', _bookmarks.map((e) => e.toString()).toList());
    });
  }

  _goToBookmark(int page) {
    _pdfViewerController.jumpToPage(page);
  }

  _loadLastPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _lastPage = prefs.getInt('lastPage') ?? 1;
    });
    _pdfViewerController.jumpToPage(_lastPage!);
  }

  _saveCurrentPage(int pageNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastPage', pageNumber);
  }

  List<Map<String, dynamic>> _highlights = [];

  Future<void> _loadHighlights() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _highlights = List<Map<String, dynamic>>.from(
        json.decode(prefs.getString('highlights') ?? '[]'),
      );
    });
  }

  Future<void> _saveHighlights() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('highlights', json.encode(_highlights));
  }

  void _addHighlight(int pageNumber, Rect highlightRect) {
    setState(() {
      _highlights.add({
        'pageNumber': pageNumber,
        'left': highlightRect.left,
        'top': highlightRect.top,
        'right': highlightRect.right,
        'bottom': highlightRect.bottom,
      });
    });
    _saveHighlights();
  }
  // @override
  // void dispose() {
  //   _searchController
  //       .dispose(); // اگر تایمر یا کنترلری دارید باید در اینجا پاکسازی شود
  //   _pdfViewerController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: TextField(
        //   controller: search,
        //   decoration: InputDecoration(label: Text("Search")),
        // ),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(
          //     Icons.search,
          //     color: Colors.black,
          //   ),
          //   onPressed: () {
          //     _searchResult = _pdfViewerController.searchText(search.text);
          //     if (kIsWeb) {
          //       setState(() {});
          //     } else {
          //       _searchResult.addListener(() {
          //         if (_searchResult.hasResult) {
          //           setState(() {});
          //         }
          //       });
          //     }
          //   },
          // ),
          // Visibility(
          //   visible: _searchResult.hasResult,
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.keyboard_arrow_up,
          //       color: Colors.black,
          //     ),
          //     onPressed: () {
          //       _searchResult.previousInstance();
          //     },
          //   ),
          // ),
          // Visibility(
          //   visible: _searchResult.hasResult,
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.keyboard_arrow_down,
          //       color: Colors.black,
          //     ),
          //     onPressed: () {
          //       _searchResult.nextInstance();
          //     },
          //   ),
          // ),
          IconButton(
            icon: Icon(Icons.bookmark_add_outlined),
            onPressed: () {
              _addBookmark(_pdfViewerController.pageNumber!);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('این صفحه ذخیره شد'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.list,
              size: 30,
            ),
            onPressed: () {
              _showBookmarkList();
            },
          ),
          // IconButton(
          //   icon: Icon(Icons.search),
          //   onPressed: () {
          //     _showSearchDialog();
          //   },
          // ),
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
      body: FutureBuilder(
        future: _getCachedPdfFile(url),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              // نمایش PDF از فایل کش شده
              return Stack(
                children: [
                  SfPdfViewer.file(
                    onTextSelectionChanged:
                        (PdfTextSelectionChangedDetails details) {
                      if (details.selectedText != null &&
                          details.globalSelectedRegion != null) {
                        final highlightRect = details.globalSelectedRegion!;
                        _addHighlight(
                            _pdfViewerController.pageNumber!, highlightRect);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("متن انتخاب‌شده هایلایت شد")),
                        );
                      }
                    },
                    onPageChanged: (details) {
                      _saveCurrentPage(details.newPageNumber);
                    },
                    controller: _pdfViewerController,
                    scrollDirection: isVertical
                        ? PdfScrollDirection.vertical
                        : PdfScrollDirection.horizontal,
                    File(snapshot.data!),
                  ),
                  ..._highlights.map((highlight) {
                    if (highlight['pageNumber'] ==
                        _pdfViewerController.pageNumber) {
                      return Positioned(
                        left: highlight['left'],
                        top: highlight['top'],
                        child: Container(
                          width: highlight['right'] - highlight['left'],
                          height: highlight['bottom'] - highlight['top'],
                          color: Colors.yellow.withOpacity(0.5),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }).toList(),
                ],
              );
            } else {
              return Center(child: Text('Error loading PDF'));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: _searchResult.hasResult
          ? FloatingActionButton.extended(
              onPressed: () {
                _searchResult.nextInstance();
              },
              label: Text('Next'),
              icon: Icon(Icons.arrow_forward),
            )
          : null,
    );
  }

  _showBookmarkList() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'صفحات ذخیره شده',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _bookmarks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListTile(
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          _removeBookmark(_bookmarks[index]);
                          Navigator.pop(context); // برای بستن لیست بعد از حذف
                          _showBookmarkList(); // باز کردن لیست مجدداً با اطلاعات به‌روز
                        },
                      ),
                      title: Text('صفحه ${_bookmarks[index]}'),
                      onTap: () {
                        Navigator.pop(context);
                        _goToBookmark(_bookmarks[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  // _showSearchDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Search'),
  //         content: TextField(
  //           controller: _searchController,
  //           decoration: InputDecoration(hintText: 'Enter text to search'),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               _searchText(_searchController.text);
  //               Navigator.pop(context);
  //             },
  //             child: Text('Search'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text('Cancel'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
