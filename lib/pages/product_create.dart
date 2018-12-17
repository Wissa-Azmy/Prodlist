import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final int index;
  final Map product;

  ProductCreatePage({this.index, this.addProduct, this.updateProduct, this.product});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreatePageState();
  }
}


class _ProductCreatePageState extends State<ProductCreatePage> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null
  };
  bool acceptedTerms = false;



  void _submitForm() {
    // Run validators in all Fields if not success return.
    if (!_formkey.currentState.validate()) {
      return;
    }

    if (widget.product == null) {
      _formkey.currentState.save();
      widget.addProduct(_formData);
      Navigator.pushReplacementNamed(context, '/products-list');
    } else {
      _formkey.currentState.save();
      widget.updateProduct(widget.index, _formData);
      Navigator.pushReplacementNamed(context, '/products-list');
    }

  }


  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetPadding = deviceWidth > 500 ? deviceWidth * 0.2 : deviceWidth * 0.05;
    final Widget pageContent = GestureDetector(
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
                initialValue: widget.product == null ? '' : widget.product['title'],
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
                initialValue:  widget.product == null ? '' : widget.product['description'],
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
                initialValue:  widget.product == null ? '' : widget.product['price'].toString(),
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
                  child:  widget.product == null ? Text('Save') : Text('Update'),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  onPressed: _submitForm
              ),
            ],
          ),
        ),
      ),
    );

    // TODO: implement build
    return widget.product == null ? pageContent : Scaffold(
      appBar: AppBar(title: Text('Edit Product'),),
      body: pageContent,
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
