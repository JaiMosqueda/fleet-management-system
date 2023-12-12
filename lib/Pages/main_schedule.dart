import 'package:fleet_management/Pages/schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainSchedule extends StatefulWidget {
  const MainSchedule({Key? key}) : super(key: key);

  @override
  State<MainSchedule> createState() => _MainScheduleState();
}

class _MainScheduleState extends State<MainSchedule> {

  var schedules;

  getData () async {
    return await http.get(
      Uri.parse('API LINK'),
      headers: {
        'Accept': 'application/json'
      },
    );
  }

  @override
  void initState() {
    schedules = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: schedules.length,
          itemBuilder: (context, index){
            final scheds = schedules[index] as Map;
            return Card(
              child: ListTile(
                contentPadding:
                const EdgeInsets.only(left: 30.0, right: 30.0),
                title: Text(
                  scheds[index]["title"],
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                subtitle: Text(
                  scheds[index]["description"],
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                trailing: PopupMenuButton(onSelected: (value) async {
                  if (value == 'edit') {
                    var result = await Navigator.push(context, MaterialPageRoute(builder: (context)=> SchedulePage()));
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
        Navigator.push(context, MaterialPageRoute(builder: (context)=> SchedulePage()));
       },child: Icon(Icons.add)),
    );
  }
}
