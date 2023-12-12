import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {

  var formKey = GlobalKey<FormState>();

  TextEditingController businessName = TextEditingController();
  TextEditingController deliveryAddress = TextEditingController();
  TextEditingController contactPerson = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  TextEditingController deliveryDate = TextEditingController();
  TextEditingController deliveryTime = TextEditingController();
  TextEditingController dispatchBy = TextEditingController();
  TextEditingController dispatchDate = TextEditingController();
  TextEditingController dispatchTime = TextEditingController();
  TextEditingController receivedBy = TextEditingController();
  TextEditingController receivedDate = TextEditingController();
  TextEditingController receivedTime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scheduling'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: <Widget>[
                Text('LTS | LOLONG TRUCKING SERVICES'),
                Text('Has No.'),
                Text('TRUCKER INFORMATION'),
                SizedBox(height: 20,),
                Text('DELIVERY TO'),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    Flexible(child: TextFormField(
                      controller: businessName,
                      decoration: InputDecoration(hintText: 'Business Name:'),
                    )),
                  ],
                ),
                    Row(
                      children: <Widget>[
                      Flexible(child: TextFormField(
                        controller: deliveryAddress,
                      decoration: InputDecoration(hintText: 'Delivery Address:'),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(child: TextFormField(
                      controller: contactPerson,
                      decoration: InputDecoration(hintText: 'Contact Person:'),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(child: TextFormField(
                      controller: contactNo,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: 'Contact No.:'),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(child: TextFormField(
                      controller: deliveryDate,
                      decoration: InputDecoration(hintText: 'Delivery Date:'),
                    )),
                    Flexible(child: TextFormField(
                      controller: deliveryTime,
                      decoration: InputDecoration(hintText: 'Delivery Time:'),
                    )),
                  ],
                ),
                SizedBox(height: 20,),
                Text('DISPATCH INFORMATION'),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    Flexible(child: TextFormField(
                      controller: dispatchBy,
                      decoration: InputDecoration(hintText: 'Dispatch By:'),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(child: TextFormField(
                      controller: dispatchDate,
                      decoration: InputDecoration(hintText: 'Dispatch Date:'),
                    )),
                    Flexible(child: TextFormField(
                      controller: dispatchTime,
                      decoration: InputDecoration(hintText: 'Dispatch Time:'),
                    )),
                  ],
                ),
                SizedBox(height: 20,),
                Text('DELIVERY ACKNOWLEDGEMENT'),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    Flexible(child: TextFormField(
                      controller: receivedBy,
                      decoration: InputDecoration(hintText: 'Received By:'),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(child: TextFormField(
                      controller: receivedDate,
                      decoration: InputDecoration(hintText: 'Received Date:'),
                    )),
                    Flexible(child: TextFormField(
                      controller: receivedTime,
                      decoration: InputDecoration(hintText: 'Received Time:'),
                    )),
                  ],
                ),
                ElevatedButton(onPressed: (){
                  var isFormValid = formKey.currentState!.validate();
                  if (isFormValid) {
                    // API
                  }

                   }, child: Text('Submit'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
