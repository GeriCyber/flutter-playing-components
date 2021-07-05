import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _sliderValue = 200.0;
  bool? _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider')
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
        children: [
          _createSlider(),
          _createCheckbox(),
          _createSwitch(),
          Expanded(child: _createImage()),
        ]),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.cyan,
      label: 'Image size',
      // divisions: 20,
      value: _sliderValue,
      min: 200.0,
      max: 400.0,
      onChanged: (_blockCheck != null && _blockCheck == true) ? null : (value) =>
        setState(() => _sliderValue = value),
    );
  }

  Widget _createImage() {
    return FadeInImage(
      placeholder: AssetImage('assets/jar-loading.gif'),
      fadeInDuration: Duration(milliseconds: 200), 
      image: NetworkImage('https://www.freepnglogos.com/uploads/macbook-png/macbook-cleanmymac-the-best-mac-cleanup-app-for-macos-get-32.png'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckbox() {
    return CheckboxListTile(
      title: Text('Block Slider'),
      value: _blockCheck, 
      onChanged: (value) => setState(() => _blockCheck = value)
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Block Slider'),
      value: _blockCheck as bool, 
      onChanged: (value) => setState(() => _blockCheck = value)
    );
  }
}