import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:concord/ui/widgets/concord_tiles.dart';
import 'package:concord/ui/widgets/layout_widgets.dart';
import 'package:concord/ui/theme/theme.dart';
import 'package:concord/core/models/theme_model.dart';
import 'package:stacked/stacked.dart';
import 'package:concord/ui/widgets/submit_button.dart';

// images from the carousel pulled from this list
final List<String> imgList = [
  'https://images.unsplash.com/photo-1592502712628-c5219bf0bc12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80',
  'https://images.unsplash.com/photo-1560963689-b9e9773ff232?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1290&q=80',
  'https://images.unsplash.com/photo-1513159446162-54eb8bdaa79b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
  'https://images.unsplash.com/photo-1529525843055-a5131c66fbad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80',
  'https://images.unsplash.com/photo-1514416432279-50fac261c7dd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80',
  'https://images.unsplash.com/photo-1494438043283-22a3c46831a4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
];

// image text information
final List<String> imgInfo = [
  'Houston Food Bank',
  'Soup Kitchen of America',
  'Katy Hospice Care',
  'Central Houston Dog Walking',
  'Scribe America Scribing',
  'Spring Nursing Home'
];

class OrganizationsPage extends StatefulWidget {
  @override
  _OrganizationsPageState createState() => _OrganizationsPageState();
}

TextEditingController editingController = TextEditingController();

// Test organization list
final List<String> duplicateItems = [
  'Apple Bottom Jeans',
  'Apple Bottom Jeans of America',
  'Apple Bottom Jeans',
  'Apple Bottom Jeans',
  'Apple Bottom Jeans',
  'Bapple Bottom Jeans',
  'Bapple Bottom Jeans',
  'Bapple Bottom Jeans of the USA',
  'Capple Bottom Jeans',
  'Capple Bottom Jeans of the USA',
  'Capple Bottom Jeans of America',
  'Bapple Bottom Jeans',
  'Bapple Bottom Jeans',
  'Bapple Bottom Jeans of the USA',
  'Bapple Bottom Jeans',
  'Bapple Bottom Jeans',
  'Bapple Bottom Jeans of the USA',
  'Bapple Bottom Jeans',
  'Bapple Bottom Jeans',
  'Bapple Bottom Jeans of the USA',
];

var items = List<String>();

class _OrganizationsPageState extends State<OrganizationsPage> {
  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThemeViewModel>.reactive(
        // have to wrap the Scaffold in this ViewModelBuilder in order to make use of various themes
        builder: (context, model, child) => Scaffold(
              body: Column(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 50, 8, 0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                    child: null),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Organizations',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Padding(
                              // Search bar
                              padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black, width: 0.0),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    TextField(
                                      onChanged: (value) {
                                        filterSearchResults(value);
                                      },
                                      style: TextStyle(color: Colors.blue),
                                      controller: editingController,
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(
                                              color: model.appTheme.mainColor),
                                          hintText:
                                              'Food Bank, Library, etc...',
                                          prefixIcon: Icon(
                                            Icons.search,
                                            color: model.appTheme.mainColor,
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      color: model.appTheme.mainColor,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SectionBanner(
                        // using standardized widget for as various headers for diff. app sections
                        title: 'Popular Now!',
                        fontSize: 20.0,
                      ),
                      CarouselSlider(
                        // Image Carousel Slider
                        options: CarouselOptions(
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          pageViewKey: PageStorageKey('carousel_slider'),
                        ),
                        items: imageSliders,
                      ),
                    ],
                  ),
                  Column(
                    //More layout for bottom section of screen with All Organizations Header + 'Sorted..'
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 180, 10),
                        child: SectionBanner(
                          title: 'All Organizations',
                          fontSize: 20.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                        child: Text(
                          'Sorted: Alphabetically',
                          style: TextStyle(color: model.appTheme.secondaryText),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    // Listview Builder pulling items from constant list at the top
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            '${items[index]}',
                            style:
                                TextStyle(color: model.appTheme.secondaryText),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        viewModelBuilder: () => ThemeViewModel());
  }

  // method that searches through the list of test organizations
  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  // List of widgets for the image carousel
  // Code pulled from Image Carousel Package
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Container(
                            height: 70,
                            width: 100,
                            color: Colors.white,
                            child: Text(
                              '${imgInfo.elementAt(imgList.indexOf(item))}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF47627E),
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();
}
