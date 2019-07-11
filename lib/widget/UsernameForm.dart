import 'package:flutter/material.dart';

class UsernameForm extends StatefulWidget {
  @override
  UsernameFormState createState() {
    return UsernameFormState();
  }
}

class UsernameFormState extends State<UsernameForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            initialValue: "misterfifi",
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter your username';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              elevation: 4.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}