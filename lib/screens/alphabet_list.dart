import 'package:contact/resources/constants.dart';
import 'package:flutter/material.dart';

class AlphabetList extends StatefulWidget {
  final Function(String) onAlphabetClicked;
  const AlphabetList({required this.onAlphabetClicked, super.key});

  @override
  State<StatefulWidget> createState() {
    return _AlphabetListState();
  }
}

class _AlphabetListState extends State<AlphabetList> {
  var selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemBuilder: (ctx, index) {
          return Alphabet(
              alphabets[index],
              selectedIndex == index,
              (text) => {
                    setState(() => {selectedIndex = alphabets.indexOf(text)}),
                    widget.onAlphabetClicked(alphabets[index])
                  });
        },
        itemCount: alphabets.length,
        separatorBuilder: (ctx, index) {
          return const SizedBox(
            width: 10,
          );
        },
      ),
    );
  }
}

class Alphabet extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function(String) onClick;

  const Alphabet(this.text, this.isSelected, this.onClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick(text);
      },
      child: CircleAvatar(
        radius: 20,
        backgroundColor: isSelected ? Colors.white : Colors.blueGrey,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: isSelected ? Colors.blueGrey : Colors.white,
          ),
        ),
      ),
    );
  }
}
