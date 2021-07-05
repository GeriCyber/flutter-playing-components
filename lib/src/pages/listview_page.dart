import 'dart:async';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _dummyList = [1,2,3,4];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addImages();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _fetchImages();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy List')
      ),
      body: Stack(
        children: [
        _createList(),
        _loading()
        ],
      )
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getFirstPage,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _dummyList.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _dummyList[index];
          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200), 
            image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
          );
        } 
      ),
    );
  }

  void _addImages() {
    for(var i = 1; i < 10; i++) {
      _lastItem++;
      _dummyList.add(_lastItem);
    }

    setState(() {});
  }

  _fetchImages() {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    return new Timer(duration, httpResponse);
  }

  void httpResponse() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _addImages();
  }

  Widget _loading() {
    if(_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }

  Future<Null> getFirstPage() async {
    final duration = new Duration(seconds: 2);

    new Timer(duration, () {
      _dummyList.clear();
      _lastItem++;
      _addImages();
    });

    return Future.delayed(duration);
  }
}