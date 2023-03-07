import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:unit_converter/models/category.dart';
import 'package:unit_converter/models/unit.dart';
import 'package:unit_converter/utils/colors.dart';
import 'package:unit_converter/utils/images.dart';
import 'package:unit_converter/widgets/category_tile.dart';
import 'package:unit_converter/widgets/custom_app_bar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool isLoading = false;
  final List<Category> _categories = [];

  void _retrieveCategories() async {
    setState(() {
      isLoading = true;
    });
    final json = DefaultAssetBundle.of(context)
        .loadString("assets/data/regular_units.json");

    const decoder = JsonDecoder();
    final data = decoder.convert(await json);

    for (String key in data.keys) {
      List<Map<String, dynamic>> units = Unit.toListOfMap(data[key]);
      Unit unit = Unit(label: key, units: units);
      _categories.add(
        Category(
            color: CustomColors.colors(category: key),
            img: CustomImages.images(category: key),
            units: unit),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _retrieveCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorBG,
      appBar: customAppBar(
        context: context,
        title: "units converter",
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: CustomColors.colorBG,
                color: Colors.black87,
                strokeWidth: 6.0,
              ),
            )
          : _body(),
      resizeToAvoidBottomInset: true,
    );
  }

  OrientationBuilder _body() {
    return OrientationBuilder(
        builder: (context, orientation) => ListView.builder(
              itemBuilder: (context, index) =>
                  CategoryTile(category: _categories[index]),
              itemCount: _categories.length,
              physics: const BouncingScrollPhysics(),
            ));
  }
}
