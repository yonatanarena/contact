import 'package:collection/collection.dart';
import 'package:contact/resources/constants.dart';
import 'package:flutter/material.dart';

import 'alphabet_list.dart';
import 'contact_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<String> _contacts = List.empty();

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    _contacts = names.toList();
    _contacts.sort((a, b) => a.compareTo(b));
  }

  void onAlphabetClicked(String alphabet) {
    setState(() {
      if (alphabet == "All") {
        init();
        return;
      }
      _contacts = names.where((element) {
        if (element.startsWith(alphabet)) {
          return true;
        } else {
          var fullNames = element.split(RegExp('\\s+'));
          var name = fullNames.firstWhereOrNull((s) => s.startsWith(alphabet));
          return name != null;
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Challenge"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: AlphabetList(
              onAlphabetClicked: onAlphabetClicked,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(child: ContactList(_contacts))
        ],
      ),
    );
  }
}
