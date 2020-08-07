import 'package:concord/core/models/home_model.dart';
import 'package:concord/ui/theme/theme.dart';
import 'package:concord/ui/widgets/request_details_card.dart';
import 'package:concord/ui/widgets/status_indicator.dart';
import 'package:concord/utils/locator.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// The primary landing page for the Concord app.
class HomeScreen extends StatelessWidget {
  final ConcordThemeData _appTheme = locator<ConcordThemeManager>().theme;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: _appTheme.mainMono,
        body: Center(
          child: Text(model.title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: model.updateCounter,
          child: Icon(Icons.add),
          backgroundColor: _appTheme.mainColor,
        ),
        bottomNavigationBar: _bottomSheetPreview(context),
      ),
    );
  }

  Widget _bottomSheetPreview(BuildContext context) {
    return GestureDetector(
      onTap: () => _showConcordBottomSheet(context),
      onVerticalDragStart: (DragStartDetails details) => _showConcordBottomSheet(context),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          color: _appTheme.mainColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: 36,
              height: 2,
              color: _appTheme.bannerColor,
            ),
            _requestPreviewData(),
          ],
        ),
      ),
    );
  }

  // A helper function to be called upon various gestures applied to the bottom sheet preview.
  void _showConcordBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: _appTheme.mainMono,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (BuildContext context) => ConcordBottomSheet(),
    );
  }

  // A helper widget for _bottomSheetPreview() to hold the preview information.
  Widget _requestPreviewData() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          StatusIndicator(
            status: 'Open',
            hideLabelText: true,
            textColor: _appTheme.antiOpposite,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Cat stuck in tree',
                  style: _appTheme.textTheme.headline5.copyWith(
                    color: _appTheme.antiOpposite,
                  ),
                ),
                Text(
                  'Expires May 7',
                  style: _appTheme.textTheme.caption.copyWith(
                    color: _appTheme.bannerColor,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Text(
                'People required',
                style: TextStyle(
                  fontSize: 12,
                  color: _appTheme.backgroundColor,
                ),
              ),
              Text(
                '3 of 7',
                style: _appTheme.textTheme.button.copyWith(
                  color: _appTheme.bannerColor,
                ),
              ),
            ],
          ),
          SizedBox(width: 8.0),
        ],
      ),
    );
  }
}

/// The contents of the bottom sheet for the home screen.
class ConcordBottomSheet extends StatefulWidget {
  @override
  _ConcordBottomSheetState createState() => _ConcordBottomSheetState();
}

/// This keeps track of the state of the bototm sheet for the home screen.
///
/// Here, [itemIndex] is a state-having variable.
class _ConcordBottomSheetState extends State<ConcordBottomSheet> {
  final ConcordThemeData _appTheme = locator<ConcordThemeManager>().theme;

  /// A list of the bulletins the user is signed up for.
  final List<RequestDetailsCard> items = [
    RequestDetailsCard(),
    RequestDetailsCard(),
  ];

  /// A controller for the list of bulletins.
  final PageController _pageController = PageController();

  /// A double to keep track of which page is currently being viewed
  /// in the list of bulletins.
  double itemIndex = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 36,
            height: 2,
            color: _appTheme.mainColor,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.73,
            width: MediaQuery.of(context).size.width * 1,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) => items[index],

              /// When the user swipes on the card, [itemIndex] is updated so that
              /// the DotsIndicator can indicate the change in page view.
              onPageChanged: (int index) {
                setState(() {
                  itemIndex = index.toDouble();
                });
              },
            ),
          ),
          DotsIndicator(
            dotsCount: items.length > 5 ? 5 : items.length,
            position: itemIndex > 4 ? 4 : itemIndex,
            decorator: DotsDecorator(
              color: _appTheme.opposite.withOpacity(0.3),
              activeColor: _appTheme.opposite.withOpacity(0.6),
              spacing: EdgeInsets.all(4.0),
            ),

            /// Updates the state of the current page index and jumps to the
            /// page corresponding to the dot that has been tapped.
            onTap: (double index) {
              setState(() {
                itemIndex = index;
              });
              _pageController.jumpToPage(index.floor());
            },
          ),
          Text('${itemIndex.floor() + 1} / ${items.length}'),
        ],
      ),
    );
  }
}
