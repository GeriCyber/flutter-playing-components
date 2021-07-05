import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String name = '';
  String email = '';
  String date = '';
  TextEditingController _selectFieldDate = new TextEditingController();
  List<String> _cities = ['Carabobo', 'Maracaibo', 'Maracay', 'Barinas', 'Barquisimeto', 'Caracas'];
  String _selectedCity = 'Carabobo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createNameField(),
          Divider(),
          _createEmailField(),
          Divider(),
          _createPasswordField(),
          Divider(),
          _createSelectField(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson()
        ],
      ),
    );
  }

  Widget _createNameField() {
    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        counter: Text('Chars ${name.length}'),
        hintText: 'Add your name',
        labelText: 'Name',
        helperText: 'Please add a name',
        suffixIcon: Icon(Icons.accessibility_new),
        icon: Icon(Icons.person_pin)
      ),
      onChanged: (value) => setState(() => name = value),
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('The name is: $name'),
      subtitle: Text('Email: $email'),
      trailing: Text(_selectedCity),
    );
  }

  Widget _createEmailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        hintText: 'Add your email',
        labelText: 'Email address',
        helperText: 'Please add a valid email address',
        suffixIcon: Icon(Icons.email_outlined),
        icon: Icon(Icons.alternate_email_outlined)
      ),
      onChanged: (value) => setState(() => email = value),
    );
  }

  Widget _createPasswordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        hintText: 'Add a password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.password),
        icon: Icon(Icons.hide_source)
      ),
    );
  }

  Widget _createSelectField(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _selectFieldDate,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        hintText: 'Birthday',
        labelText: 'Add your birthday',
        suffixIcon: Icon(Icons.cake),
        icon: Icon(Icons.date_range)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectdate(context);
      },
    );
  }

  _selectdate(BuildContext context) async {
    DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2022),
      locale: Locale('es', 'ES')
    );
    
    setState(() {
      date = datePicked.toString();
      print(datePicked);
      _selectFieldDate.text = date;
    });
  }

  List<DropdownMenuItem<String>> getCities() {
    List<DropdownMenuItem<String>> list = [];
    _cities.forEach((c) {
      list.add(DropdownMenuItem(
        child: Text(c),
        value: c
      ));
    });
    return list;
  }

  Widget _createDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _selectedCity,
            items: getCities(),
            onChanged: (opt) {
              setState(() => _selectedCity = opt.toString());
            }
          ),
        ) 
      ]
    );
  }
}