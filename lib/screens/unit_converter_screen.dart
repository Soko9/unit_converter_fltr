import 'package:flutter/material.dart';
import 'package:unit_converter/models/category.dart';
import 'package:unit_converter/widgets/entry.dart';

class UnitConverterScreen extends StatefulWidget {
  final Category category;

  const UnitConverterScreen({
    super.key,
    required this.category,
  });

  @override
  State<UnitConverterScreen> createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  late final TextEditingController _inController;
  late final TextEditingController _outController;

  late double _inConversion;
  late double _outConversion;

  void _calculate({required String trigger}) {
    double conversion = 1.0;

    switch (trigger) {
      case "i":
        if (_inConversion <= 1.0 && _outConversion <= 1.0) {
          conversion /= _outConversion / _inConversion;
          setState(() {
            _outController.text =
                (double.parse(_inController.text.toString()) * conversion)
                    .toStringAsFixed(4);
          });
        } else if (_inConversion < 1.0 && _outConversion > 1.0) {
          conversion *= _outConversion / _inConversion;
          setState(() {
            _outController.text =
                (double.parse(_inController.text.toString()) / conversion)
                    .toStringAsFixed(4);
          });
        } else if (_inConversion > 1.0 && _outConversion < 1.0) {
          conversion *= _inConversion / _outConversion;
          setState(() {
            _outController.text =
                (double.parse(_inController.text.toString()) / conversion)
                    .toStringAsFixed(4);
          });
        } else {
          conversion *= _inConversion * _outConversion;
          setState(() {
            _outController.text =
                (double.parse(_inController.text.toString()) / conversion)
                    .toStringAsFixed(4);
          });
        }
        break;
      case "o":
        if (_inConversion <= 1.0 && _outConversion <= 1.0) {
          conversion /= _outConversion / _inConversion;
          setState(() {
            _inController.text =
                (double.parse(_outController.text.toString()) * conversion)
                    .toStringAsFixed(4);
          });
        } else if (_inConversion < 1.0 && _outConversion > 1.0) {
          conversion *= _outConversion / _inConversion;
          setState(() {
            _inController.text =
                (double.parse(_outController.text.toString()) / conversion)
                    .toStringAsFixed(4);
          });
        } else if (_inConversion > 1.0 && _outConversion < 1.0) {
          conversion *= _inConversion / _outConversion;
          setState(() {
            _inController.text =
                (double.parse(_outController.text.toString()) / conversion)
                    .toStringAsFixed(4);
          });
        } else {
          conversion *= _inConversion * _outConversion;
          setState(() {
            _inController.text =
                (double.parse(_outController.text.toString()) / conversion)
                    .toStringAsFixed(4);
          });
        }
    }
  }

  @override
  void initState() {
    super.initState();
    _inConversion = widget.category.units.units[0]["conversion"];
    _outConversion = widget.category.units.units[1]["conversion"];
    _inController = TextEditingController(text: "1.0");
    _outController = TextEditingController(
        text: widget.category.units.units[1]["conversion"].toString());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            color: widget.category.color,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.category.units.label.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          Entry(
            category: widget.category,
            controller: _inController,
            onchangetext: (value) => _calculate(trigger: "i"),
            conversion: _inConversion,
            onchangeunit: (value) => setState(
              () {
                _inConversion = double.parse(value.toString());
                _calculate(trigger: "i");
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            alignment: Alignment.center,
            child: const RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.compare_arrows_rounded,
                size: 42.0,
              ),
            ),
          ),
          Entry(
            category: widget.category,
            controller: _outController,
            onchangetext: (value) => _calculate(trigger: "o"),
            conversion: _outConversion,
            onchangeunit: (value) => setState(
              () {
                _outConversion = double.parse(value.toString());
                _calculate(trigger: "o");
              },
            ),
          ),
        ],
      ),
    );
  }
}
