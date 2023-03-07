import 'package:flutter/material.dart';
import 'package:unit_converter/models/category.dart';

class Entry extends StatelessWidget {
  final Category category;
  final TextEditingController controller;
  final void Function(String)? onchangetext;
  final double conversion;
  final void Function(Object?)? onchangeunit;
  final bool input;

  const Entry({
    super.key,
    required this.category,
    required this.controller,
    required this.onchangetext,
    required this.conversion,
    required this.onchangeunit,
    this.input = true,
  });

  @override
  Widget build(BuildContext context) {
    final InputBorder border = OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: category.color),
      borderRadius: BorderRadius.circular(8.0),
    );

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: category.color["background"],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            controller: controller,
            onChanged: onchangetext,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.black87),
            cursorColor: category.color,
            decoration: InputDecoration(
              labelText: input ? "Input" : "Output",
              labelStyle: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.black87),
              border: border,
              focusedBorder: border,
              enabledBorder: border,
            ),
          ),
          const SizedBox(height: 24.0),
          DropdownButtonFormField(
            items: category.units.units
                .map(
                  (item) => DropdownMenuItem(
                    value: item["conversion"],
                    child: Text(item["name"]),
                  ),
                )
                .toList(),
            value: conversion,
            elevation: 4,
            isExpanded: true,
            isDense: true,
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            iconSize: 32.0,
            decoration: InputDecoration(
              border: border,
              focusedBorder: border,
              enabledBorder: border,
              filled: true,
              fillColor: category.color["background"],
            ),
            borderRadius: BorderRadius.circular(8.0),
            style: Theme.of(context).textTheme.headlineSmall,
            onChanged: onchangeunit,
          ),
        ],
      ),
    );
  }
}
