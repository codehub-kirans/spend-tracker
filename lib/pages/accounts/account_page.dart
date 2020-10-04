import 'package:flutter/material.dart';
import 'package:spend_tracker/pages/icons/icon_list.dart';
import 'package:spend_tracker/pages/index.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Map<String, dynamic> _data = Map<String, dynamic>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  IconData _newIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Account'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                if (!_formKey.currentState.validate()) return;
                _formKey.currentState.save();
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    var iconData = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IconsPage(),
                      ),
                    );
                    setState(() {
                      _newIcon = iconData;
                    });
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.blueGrey,
                      ),
                    ),
                    child: Icon(
                      _newIcon = _newIcon == null ? Icons.add : _newIcon,
                      size: 60,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  // ignore: missing_return
                  validator: (String value) {
                    if (value.isEmpty) return 'Required';
                  },
                  onSaved: (String value) => _data['name'] = value,
                ),
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Balance',
                  ),
                  // ignore: missing_return
                  validator: (String value) {
                    if (value.isEmpty) return 'Required';
                    if (double.tryParse(value) == null) return "Invalid number";
                  },
                  onSaved: (String value) =>
                      _data['balance'] = double.parse(value),
                ),
              ],
            ),
          ),
        ));
  }
}
