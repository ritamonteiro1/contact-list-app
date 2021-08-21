import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Contact> contactList = [];

  @override
  void initState() {
    super.initState();
    contactList.add(Contact(('Nome'), '9999-9999', ContactType.CELL_PHONE));
    contactList.add(Contact(('Nome'), '9999-9999', ContactType.JOB));
    contactList.add(Contact(('Nome'), '9999-9999', ContactType.FAVORITE));
    contactList.add(Contact(('Nome'), '9999-9999', ContactType.FAVORITE));
    contactList.add(Contact(('Nome'), '9999-9999', ContactType.CELL_PHONE));
    contactList.add(Contact(('Nome'), '9999-9999', ContactType.JOB));
    contactList.add(Contact(('Nome'), '9999-9999', ContactType.CELL_PHONE));
    contactList.add(Contact(('Nome'), '9999-9999', ContactType.JOB));
    contactList.add(Contact(('Nome'), '9999-9999', ContactType.CELL_PHONE));
    contactList.add(Contact(('Nome'), '9999-9999', ContactType.CELL_PHONE));
    contactList.add(Contact(('Nome'), '9999-9999', ContactType.CELL_PHONE));

    contactList.sort((a, b) => a.name.compareTo(b.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de contatos'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          var contact = contactList[index];
          return ListTile(
            leading: CircleAvatar(
              child: ContactHelper.getIconByContactType(contact.type),
              backgroundColor: Colors.grey[200],
            ),
            title: Text(contact.name),
            subtitle: Text(contact.telephone),
            trailing: IconButton(
              icon: Icon(Icons.call),
              onPressed: () => {},
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: contactList.length,
      ),
    );
  }
}

class Contact {
  final String name;
  final String telephone;
  final ContactType type;

  Contact(this.name, this.telephone, this.type);
}

enum ContactType {
  CELL_PHONE,
  JOB,
  FAVORITE,
  HOME
}

class ContactHelper {
  static Icon getIconByContactType(ContactType type) {
    switch (type) {
      case ContactType.CELL_PHONE:
        return Icon(Icons.phone_android, color: Colors.green[700]);
      case ContactType.JOB:
        return Icon(Icons.work, color: Colors.red[600]);
      case ContactType.FAVORITE:
        return Icon(Icons.star, color: Colors.yellow[600]);
      case ContactType.HOME:
        return Icon(Icons.home, color: Colors.purple[600]);
    }
  }
}
