import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({Key? key}) : super(key: key);

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  final _driverNameController = TextEditingController();
  final _truckNameController = TextEditingController();
  String _selectedTruckType = 'Outsource';
  String? _selectedImageFileName;

  void _showForm() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _driverNameController,
                  decoration: InputDecoration(labelText: 'Driver Name'),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _truckNameController,
                  decoration: InputDecoration(labelText: 'Truck Name'),
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: _selectedTruckType,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedTruckType = value!;
                    });
                  },
                  items: ['Outsource', 'Owned'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(labelText: 'Truck Type'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      final image = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                      );

                      if (image != null) {
                        setState(() {
                          _selectedImageFileName = image.name;
                        });
                      }
                    } catch (e) {
                      print('Error picking image: $e');
                    }
                  },
                  child: _selectedImageFileName != null
                      ? Text('Selected Image: $_selectedImageFileName')
                      : Text('Add Picture'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _submitForm();
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _submitForm() {
    // Handle form submission here
    // Access data using _driverNameController.text, _truckNameController.text, etc.
    // You can also use _selectedImage.path for the image path.
    // For simplicity, I'm just printing the values.
    print('Driver Name: ${_driverNameController.text}');
    print('Truck Name: ${_truckNameController.text}');
    print('Truck Type: $_selectedTruckType');
    if (_selectedImageFileName != null) {
      print('Selected Image: $_selectedImageFileName');
    }

    // Close the modal bottom sheet after submission
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt'),
      ),
      body: Center(
        child: Text('Receipt'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showForm,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ReceiptPage(),
  ));
}
