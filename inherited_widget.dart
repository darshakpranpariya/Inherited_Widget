import 'package:flutter/material.dart';

//Step#1 Implementing InheritedWidget 
class DataHolderAndProvider extends InheritedWidget{
  
  final data;
  
  DataHolderAndProvider({this.data,Widget child}):super (child:child);

  @override
  bool updateShouldNotify(DataHolderAndProvider oldWidget) {
    return data!=oldWidget.data;
  }

  static DataHolderAndProvider of(BuildContext context){
    return context.inheritFromWidgetOfExactType(DataHolderAndProvider);
  }

}
//Step#2 Use InheritedWidget as a root widget
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple IW Eample'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Text('below we are using IW'),
            Divider(height: 2, color: Colors.amber,),
            DataHolderAndProvider(
                data: ['Coding','Hive'],
                child:FirstChildOfIW())
          ],
        ),
      ),
    );
  }
}

//Step#3 Get data in child widget
class FirstChildOfIW extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final data=DataHolderAndProvider.of(context).data;

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text('FirstChildOfIW: User First Name: ${data[0]}'),
          ],
        ),
      );
  }
