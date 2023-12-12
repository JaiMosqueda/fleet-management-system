import 'package:flutter/material.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({Key? key}) : super(key: key);

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {

  var formKey = GlobalKey<FormState>();

  TextEditingController truckerName = TextEditingController();
  TextEditingController truckerID = TextEditingController();
  TextEditingController plateNo = TextEditingController();
  TextEditingController driver = TextEditingController();
  TextEditingController helper = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery'),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Form(
              autovalidateMode: AutovalidateMode. onUserInteraction,
              child: Column(
               children:[
              Text('LTS | LOLONG TRUCKING SERVICES'),
              Text('Has No.'),
              Text('TRUCKER INFORMATION'),
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  Flexible(child: TextFormField(
                    controller: truckerName,
                    decoration: InputDecoration(hintText: 'Trucker Name:'),
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  Flexible(child: TextFormField(
                    controller: truckerID,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Trucker ID:'),
                  )),
                  Flexible(child: TextFormField(
                    controller: plateNo,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Plate No.:'),
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  Flexible(child: TextFormField(
                    controller: driver,
                    decoration: InputDecoration(hintText: 'Driver:'),
                  )),
                  Flexible(child: TextFormField(
                    controller: helper,
                    decoration: InputDecoration(hintText: 'Helper:'),
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
            )),
          ),
        ),
    );
  }
}
