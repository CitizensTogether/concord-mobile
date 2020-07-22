import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import '../../utils/locator.dart';
import '../theme/theme.dart';


/// A tags list that allows the user to be able to add and remove tags by default.
/// 
/// This widget is highly customizable and can also be used for static lists of tags by
/// providing a List<String> to the [initTags] argument and marking bools [textFieldEnabled] 
/// and [removable] as false. 
class TagPicker extends StatefulWidget {

  /// Permits user to add chpis to a list by searching in a text field.
  final bool textFieldEnabled;

  /// Permits user to remove tags from a list by pressing a remove button in the chip.
  final bool removable;

  /// The background color of the chips.
  final Color chipColor;

  /// The border color of the chips.
  final Color borderColor;

  /// The color of the remove button (only viewable if [removable] is true).
  final Color removeButtonColor;

  /// The color of the label of a chip.
  final Color textColor;

  /// A list of chips to display before the user adds or removes chips from a list.
  final List<String> initTags;

  /// A list of possible text suggestions that are offered as autocomplete when the user types
  /// in the text field (only viewable if [textFieldEnabled] is true).
  final List<String> suggestions;

  /// Permits the list of chips to be horizontally scrollable.
  final bool horizontalScrollEnabled;

  /// The placeholder text in the text field (only viewable if [textFieldEnabled] is true).
  final String hintText;

  /// The list of tags the user sees. 
  List<String> tags;

  TagPicker(
    {Key key,
    this.initTags,
    this.suggestions,
    this.textFieldEnabled = true,
    this.removable = true,
    this.chipColor,
    this.borderColor,
    this.textColor,
    this.removeButtonColor,
    this.hintText = "Add a skill or certification",
    this.horizontalScrollEnabled = false
  }) : super(key: key);

  
  @override
  _TagPickerState createState() => _TagPickerState();
}

/// Keeps track of the state of TagPicker, in which [List<String> tags] is a state-having object.
class _TagPickerState extends State<TagPicker> {

  final ConcordThemeData _appTheme = locator<ConcordThemeManager>().theme;

  @override
  void initState() {
    super.initState();
    print('init');
    widget.tags = widget.initTags ?? [];
  }

  @override
  Widget build(BuildContext context) {

    return Tags(
      key: Key("tags"),
      symmetry: false,
      columns: 0,
      horizontalScroll: widget.horizontalScrollEnabled,
      runSpacing: 8,
      textField: TagsTextField(
        enabled: widget.textFieldEnabled,
        autofocus: false,
        hintText: widget.hintText,
        hintTextColor: Colors.grey,
        suggestionTextColor: _appTheme.secondaryText,
        suggestions: widget.suggestions ?? null,
        onSubmitted: (String string) {
          setState(() {
            widget.tags.add(string);
          });
        }
      ),
      itemCount: widget.tags != null ? widget.tags.length : 0,
      itemBuilder: (index) {
        final String item = widget.tags[index];
        return ItemTags(
          key: Key(index.toString()),
          index: index,
          title: item,
          pressEnabled: false,
          border: Border.all(
            width: 1,
            color: widget.borderColor ?? _appTheme.secondaryText
          ),
          elevation: 0.0,
          activeColor: widget.chipColor ?? _appTheme.bannerColor,
          borderRadius: BorderRadius.circular(30),
          combine: ItemTagsCombine.onlyText,
          textActiveColor: widget.textColor ?? _appTheme.secondaryText,
          removeButton: widget.removable ?
            ItemTagsRemoveButton(
              backgroundColor: widget.removeButtonColor ?? _appTheme.secondaryText,
              onRemoved: () {
                setState(() {
                  widget.tags.removeAt(index);
                });
                return true;
              }
            ) : null,
        );
      },
    );
  }
}
