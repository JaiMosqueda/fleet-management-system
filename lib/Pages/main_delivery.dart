import 'package:fleet_management/Pages/delivery_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainDelivery extends StatefulWidget {
  const MainDelivery({Key? key}) : super(key: key);

  @override
  State<MainDelivery> createState() => _MainDeliveryState();
}

class _MainDeliveryState extends State<MainDelivery> {

  var deliveries;

  getData () async {
    return await http.get(
      Uri.parse('API LINK)'),
      headers: {
        'Accept': 'application/json'
      },
    );
  }

  @override
  void initState() {
    deliveries = getData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: deliveries.length,
          itemBuilder: (context, index){
            final delivers = deliveries[index] as Map;
            return Card(
              child: ListTile(
                contentPadding:
                const EdgeInsets.only(left: 30.0, right: 30.0),
                title: Text(
                  delivers[index]["title"],
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                subtitle: Text(
                  delivers[index]["description"],
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                trailing: PopupMenuButton(onSelected: (value) async {
                  if (value == 'edit') {
                    var result = await Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryPage()));
                    setState(() {
                      //_getNotes();
                      getData();
                    });
                  } else if (value == 'delete') {
                    //API FOR DELETE
                    setState(() {

                    });
                  };
                },
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem(
                            value: 'edit', child: Text('Edit')),
                        const PopupMenuItem(
                            value: 'delete', child: Text('Delete')),
                      ];
                    }),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryPage()));
      },child: Icon(Icons.add)),
    );
  }
}

