import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<String> contacts;

  const ContactList(this.contacts, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, index) {
        return ListTile(
          tileColor: Colors.grey[300],
          contentPadding: const EdgeInsets.all(8),
          title: Text(contacts[index].toString()),
        );
      },
      separatorBuilder: (ctx, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: contacts.length,
    );
  }
}
