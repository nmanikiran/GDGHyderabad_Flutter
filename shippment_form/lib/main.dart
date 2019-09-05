import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Quicksand'),
      home: new MyShipmentForm(),
    );
  }
}

class MyShipmentForm extends StatelessWidget {
  const MyShipmentForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/logo.png'),
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: <Widget>[
          Padding(
            child: CircleAvatar(
              radius: 18.0,
              backgroundImage: AssetImage("assets/images/profile_image.jpeg"),
            ),
            padding: EdgeInsets.all(8.0),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          )
        ],
      ),
      body: MyRegistraion(),
    );
  }
}

class MyRegistraion extends StatefulWidget {
  @override
  MyRegistraionState createState() {
    return MyRegistraionState();
  }
}

class MyRegistraionState extends State<MyRegistraion> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _formHeader(),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  _formStepper(),
                  _mandatoryMessage(),
                  _customFormField('Shipper', true, 'Comany Name'),
                  _customFormField('Location', true, 'Address'),
                  SizedBox(
                    height: 20.0,
                  ),
                  _customFormField('BOL#', true, 'Optional'),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _customSelectField(
                        'Service More',
                        'Select One...',
                        'LTL',
                      ),
                      _customSelectField(
                          'Transit Service', 'Select One...', null),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  _pickUpServices(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _customSelectField(
                          'Date Pickup \nRequested', 'Select Date...', null),
                      _customSelectField(
                          'Date Pickup \nActual', 'Select Date...', null),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  _formActions(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container _formHeader() {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      alignment: Alignment.topLeft,
      color: Colors.grey.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Create Shipment",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 30.0),
          ),
          Text(
            "Step 1 of 6 - Shipper",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0),
          )
        ],
      ));
}

Stack _formStepper() {
  return Stack(
    alignment: Alignment(0, 0),
    children: <Widget>[
      Divider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _step('1', true),
          _step('2', false),
          _step('3', false),
          _step('4', false),
          _step('5', false),
          _step('6', false),
        ],
      )
    ],
  );
}

Container _step(text, isActive) {
  return Container(
    width: 25.0,
    height: 25.0,
    alignment: Alignment.center,
    child: Text(
      text,
      style: TextStyle(color: isActive ? Colors.white : Colors.black),
    ),
    decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.white,
        border: !isActive
            ? new Border.all(
                color: Colors.grey, width: 1.0, style: BorderStyle.solid)
            : null,
        borderRadius: new BorderRadius.all(new Radius.circular(25.0))),
  );
}

Container _mandatoryMessage() {
  return Container(
    padding: EdgeInsets.all(16.0),
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "*",
          style: TextStyle(color: Colors.red),
        ),
        Text(
          " Indiacates Required Fields",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

Container _customFormField(text, isRequired, placeholder) {
  return Container(
    alignment: Alignment.center,
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: 100.0,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: new Border(
                  right: BorderSide(
                      color: Colors.grey,
                      width: 0.2,
                      style: BorderStyle.solid)),
            ),
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          Flexible(
            child: TextField(
              decoration: new InputDecoration(
                focusColor: const Color(0xffff6771),
                contentPadding: EdgeInsets.all(15.0),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 0.0),
                  child: Text(
                    '*',
                    style: TextStyle(color: Colors.red, fontSize: 20.0),
                  ),
                ),
                hintText: placeholder,
                hintStyle: TextStyle(color: Colors.grey[300], fontSize: 20.0),
                hasFloatingPlaceholder: true,
              ),
            ),
          ),
        ]),
    decoration: BoxDecoration(
        border: new Border.all(
            color: Colors.grey, width: 0.3, style: BorderStyle.solid),
        borderRadius: new BorderRadius.all(new Radius.circular(5.0))),
  );
}

Column _pickUpServices() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Padding(
      padding: EdgeInsets.only(left: 12.0, bottom: 12.0),
      child: Text('Pickup Services',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
    ),
    Container(
      child: Column(
        children: <Widget>[
          _customCheckbox('Cunstruction Site', true),
          _customCheckbox('Courier Service', false),
          _customCheckbox('Drayage Serivce', false),
          _customCheckbox('Dropped Trailer', false),
          _customCheckbox('Inside Service', false),
        ],
      ),
    )
  ]);
}

Container _customCheckbox(title, value) {
  return Container(
    padding: EdgeInsets.only(left: 16.0),
    child: Row(
      children: <Widget>[
        Container(
          child: Checkbox(
            value: value,
            checkColor: Colors.white,
            activeColor: Colors.green,
            onChanged: (bool) {},
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    ),
  );
}

Expanded _customSelectField(label, placeholder, selectedval) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          child: Text(
            label,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
          ),
          child: DropdownButtonFormField(
            value: selectedval,
            hint: Text(placeholder),
            items: <String>['LTL', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.grey.shade900),
                ),
              );
            }).toList(),
            onChanged: (val) {},
          ),
        )
      ],
    ),
  );
}

Row _formActions() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Expanded(
        child: FlatButton(
          onPressed: () => null,
          child: Text(
            "Back",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          textColor: Colors.blue,
        ),
      ),
      Expanded(
        child: RaisedButton(
          color: Colors.black,
          onPressed: () {},
          textColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            'Next',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
        ),
      ),
    ],
  );
}
