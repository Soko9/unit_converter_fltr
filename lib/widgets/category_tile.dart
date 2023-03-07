import 'package:flutter/material.dart';
import 'package:unit_converter/models/category.dart';
import 'package:unit_converter/screens/unit_converter_screen.dart';
import 'package:unit_converter/utils/colors.dart';

class CategoryTile extends StatefulWidget {
  final Category category;
  // final Orientation orientation;

  const CategoryTile({
    super.key,
    required this.category,
    // required this.orientation,
  });

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  final double _categoryHeight = 100.0;
  final double _categoryPadding = 8.0;
  final double _categoryRaduis = 8.0;
  // final double _iconSize = 42.0;
  final double _iconPadding = 16.0;
  final double _labelSize = 24.0;

  void _showPanel({
    required BuildContext context,
    required Category category,
  }) =>
      showBottomSheet(
        context: context,
        // backgroundColor: Colors.black,
        // elevation: 8.0,
        enableDrag: true,
        builder: (context) => Container(
          height: MediaQuery.of(context).size.height / 1.05,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: CustomColors.colorBG,
            border: Border(
              top: BorderSide(width: 2.0, color: category.color),
            ),
          ),
          child: OrientationBuilder(
            builder: (context, orientation) =>
                UnitConverterScreen(category: category),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(_categoryPadding),
      // widget.orientation == Orientation.portrait ? _categoryPadding : 0),
      margin: EdgeInsets.all(_categoryPadding),
      // widget.orientation == Orientation.landscape ? _categoryPadding : 0),
      child: Material(
        color: widget.category.color["splash"],
        borderRadius: BorderRadius.circular(_categoryRaduis),
        child: SizedBox(
          height: _categoryHeight,
          child: InkWell(
            splashColor: widget.category.color["splash"],
            highlightColor: widget.category.color["highlight"],
            // radius: _categoryHeight * 10,
            excludeFromSemantics: true,
            borderRadius: BorderRadius.circular(_categoryRaduis),
            onTap: () {
              _showPanel(context: context, category: widget.category);
            },
            child: Row(
              // mainAxisAlignment: widget.orientation == Orientation.portrait
              //     ? MainAxisAlignment.start
              //     : MainAxisAlignment.center,
              children: [
                // if (widget.orientation == Orientation.portrait)
                //   SizedBox(width: _iconPadding),
                Padding(
                  padding: EdgeInsets.all(
                      _iconPadding), // widget.orientation == Orientation.portrait
                  //     ? _iconPadding
                  //     : _iconPadding * 2),
                  child: Image.asset(
                    widget.category.img,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: _iconPadding),
                Text(
                  // widget.category.units.label.contains(" ") &&
                  //         widget.orientation == Orientation.landscape
                  //     ? "${widget.category.units.label.split(" ")[0]}\n${widget.category.units.label.split(" ")[1]}"
                  //     :
                  widget.category.units.label.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: _labelSize,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
