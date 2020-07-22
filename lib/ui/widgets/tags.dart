import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import '../../utils/locator.dart';
import '../theme/theme.dart';

class TagPicker extends StatefulWidget {
  final bool textFieldEnabled;
  final bool removable;
  final Color chipColor;
  final Color borderColor;
  final Color removeButtonColor;
  final Color textColor;
  final List<String> initTags;
  final List<String> suggestions;
  final bool horizontalScrollEnabled;
  final String hintText;
  List<String> tags;

  TagPicker(
    {Key key,
    this.initTags,
    this.suggestions,
    this.tags,
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

class _TagPickerState extends State<TagPicker> {

  final ConcordThemeData _appTheme = locator<ConcordThemeManager>().theme;

  @override
  void initState(){
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
        onSubmitted: (String string){
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
              onRemoved: (){
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
