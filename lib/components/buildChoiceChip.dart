import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyChoiceChip extends StatefulWidget {
  List<String> options;
  List<String>selected;

  MyChoiceChip({this.options,this.selected});
  @override
  _MyChoiceChipState createState() => _MyChoiceChipState();
}

class _MyChoiceChipState extends State<MyChoiceChip> {
  int _selectedIndex;
  

  Widget _buildChips() {
    List<Widget> chips = [];
    for (int i = 0; i < widget.options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
        label: Text(widget.options[i]),
        selectedColor: Colors.blue,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedIndex = i;
              widget.selected.add(widget.options[_selectedIndex]);
            }
          });
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), child: choiceChip));
    }

    return ListView(
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildChips();
  }
}
