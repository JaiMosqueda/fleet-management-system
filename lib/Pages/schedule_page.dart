import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            child: Column(
              children: <Widget>[
                Text('LTS | LOLONG TRUCKING SERVICES'),
                Text('Has No.'),
                Text('TRUCKER INFORMATION'),
                Row(
                  children: <Widget>[
                    Flexible(child: TextFormField(
                      decoration: InputDecoration(hintText: 'Trucker Name:'),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(child: TextFormField(
                      decoration: InputDecoration(hintText: 'Trucker ID:'),
                    )),
                    Flexible(child: TextFormField(
                      decoration: InputDecoration(hintText: 'Plate No.:'),
                    )),
                  ],
                ),
                    Row(
                      children: <Widget>[
                        Flexible(child: TextFormField(
                          decoration: InputDecoration(hintText: 'Driver:'),
                        )),
                        Flexible(child: TextFormField(
                          decoration: InputDecoration(hintText: 'Helper:'),
                        )),
                  ],
                ),
                Text('DELIVERY TO'),
                Row(
                  children: <Widget>[
                    Flexible(child: TextFormField(
                      decoration: InputDecoration(hintText: 'Business Name:'),
                    )),
                  ],
                ),
                    Row(
                      children: <Widget>[
                    Flexible(child: TextFormField(
                      decoration: InputDecoration(hintText: 'Delivery Address:'),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(child: TextFormField(
                      decoration: InputDecoration(hintText: 'Contact Person:'),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(child: TextFormField(
                      decoration: InputDecoration(hintText: 'Contact No.:'),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(child: TextFormField(
                      decoration: InputDecoration(hintText: 'Delivery Date:'),
                    )),
                    Flexible(child: TextFormField(
                      decoration: InputDecoration(hintText: 'Delivery Time:'),
                    )),
                  ],
                ),
                Text('DISPATCH INFORMATION'),
                Row(
                  children: <Widget>[
                    Flexible(child: TextFormField(
                      decoration: InputDecoration(hintText: 'Dispatch By:'),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(child: TextFormField(
                      decoration: InputDecoration(hintText: 'Dispatch Date:'),
                    )),
                    Flexible(child: TextFormField(
                      decoration: InputDecoration(hintText: 'Dispatch Time:'),
                    )),
                  ],
                ),
                Text('DELIVERY ACKNOWLEDGEMENT'),
                Row(
                  children: <Widget>[
                    Flexible(child: TextFormField(
                      decoration: InputDecoration(hintText: 'Received By:'),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(child: TextFormField(
                      decoration: InputDecoration(hintText: 'Received Date:'),
                    )),
                    Flexible(child: TextFormField(
                      decoration: InputDecoration(hintText: 'Received Time:'),
                    )),
                  ],
                ),
                ElevatedButton(onPressed: (){
                }, child: Text('Submit'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
