import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1592502712628-c5219bf0bc12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80',
  'https://images.unsplash.com/photo-1560963689-b9e9773ff232?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1290&q=80',
  'https://images.unsplash.com/photo-1513159446162-54eb8bdaa79b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
  'https://images.unsplash.com/photo-1529525843055-a5131c66fbad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80',
  'https://images.unsplash.com/photo-1514416432279-50fac261c7dd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80',
  'https://images.unsplash.com/photo-1494438043283-22a3c46831a4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
];

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
                                color: Colors.black,
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

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
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
                      padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 0.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              onChanged: (value) {
                                filterSearchResults(value);
                              },
                              style: TextStyle(color: Color(0xFF47627E)),
                              controller: editingController,
                              decoration: InputDecoration(
                                  hintStyle:
                                      TextStyle(color: Color(0xFF47627E)),
                                  hintText: 'Food Bank, Library, etc...',
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Color(0xFF47627E),
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
              color: Color(0xFF47627E),
              width: double.infinity,
            ),
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 50,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 8, 10),
                  child: Text(
                    "Popular Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                color: Color(0xFF47627E),
              ),
              CarouselSlider(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 50,
                width: 220,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 8, 10),
                  child: Text(
                    "All Organizations",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                color: Color(0xFF47627E),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Sort By: Alphabetical'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    '${items[index]}',
                    style: TextStyle(color: Colors.black),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
