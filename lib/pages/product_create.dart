import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreatePageState();
  }
}


class _ProductCreatePageState extends State<ProductCreatePage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null
  };
  bool acceptedTerms = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  void _submitForm() {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();

    widget.addProduct(_formData);
    Navigator.pushReplacementNamed(context, '/products-list');
  }


  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetPadding = deviceWidth > 500 ? deviceWidth * 0.2 : deviceWidth * 0.05;

    // TODO: implement build
    return GestureDetector(
      onTap: (){
        // This dismisses the keyboarding by focusing on an empty node.
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        // ListView always take all the available space width or height.
        child: Form(
          key: _formkey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding),
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                onSaved: (String value) {
                    _formData['title'] = value;
                },
                validator: (value){
                  if (value.isEmpty || value.length < 5) {
                    return 'Title is required & 5+ characters';
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: null,
                onSaved: (value) {
                  _formData['description'] = value;
                },
                validator: (value){
                  if (value.isEmpty) {
                    return 'Description is required';
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.numberWithOptions(),
                onSaved: (value) {
                  _formData['price'] = double.parse(value);
                },
                validator: (value) {
                  if (value.isEmpty ||
                      !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
                    return 'Enter a valid number.';
                  }
                },
              ),
              SwitchListTile(
                title: Text('Accept Terms'),
                value: acceptedTerms,
                onChanged: (bool value) {
                  // to reassign the value back to the switch when changed
                  setState(() {
                    acceptedTerms = value;
                  });
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                  child: Text('Save'),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  onPressed: _submitForm
              ),
            ],
          ),
        ),
      ),
    );
    /* Modal
    return Center (
      child: RaisedButton(child: Text('Save') ,onPressed: () {
        showModalBottomSheet(context: context, builder: (context){
          return Center(
            child: Text('This is a test Modal'),
          );
        });
      }),
    );
    */
  }
}
