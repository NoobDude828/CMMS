import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  int itemCount = 3; // Initial number of items
  List<ItemData> itemDataList = List.generate(3, (index) => ItemData());
  String? selectedVendor; // Create a state variable to store the selected value

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          title: const Text(
            'College Mess Management System',
            style: TextStyle(fontSize: 13.0),
          ),
          backgroundColor: const Color(0xFF0028A8),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Add functionality to navigate back
            },
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (value) {
                // Handle menu item selection
                if (value == 'logout') {
                  // Handle logout action
                } else if (value == 'profile') {
                  // Handle profile action
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Logout'),
                ),
                const PopupMenuItem<String>(
                  value: 'profile',
                  child: Text('Your Profile'),
                ),
              ],
            ),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  'Place Your Orders',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ),
              const SizedBox(height: 10),
                Center(
                  child: Column(
                children: [
                      Center(
                      child: Column(
                        children: [
                          ClipRRect( // Wrap the container with ClipRRect to round its corners
                            borderRadius: BorderRadius.circular(10.0), // Set the border radius as needed
                            child: Container(
                              width: 250, // Set the width to the desired value
                              decoration: const BoxDecoration(
                                color: Color(0xFFFF6600), // Set the background color of the entire dropdown box
                              ),
                              child: Center( // Center the content and button inside the dropdown
                                child: DropdownButton<String>(
                                  value: selectedVendor, // Set the value to the selected value
                                  hint: const Text(
                                    'Select Vendor',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        ),
                                    ),
                                  items: <String>[
                                    'Rice and Grains',
                                    'Vegetables',
                                    'Meat and Dairy',
                                  ].map((String value) {
                                    return CustomDropdownMenuItem( // Use the custom widget
                                      value: value,
                                      child: Center( // Center the content inside the dropdown
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedVendor = newValue; // Update the selected value
                                    });
                                  },
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  dropdownColor: const Color(0xFFFF6600),
                                ),
                              ),
                            ),
                          ),
                          if (selectedVendor != null) // Display the selected value with spacing
                            Padding(
                              padding: EdgeInsets.only(top: 16.0), // Adjust the top padding as needed
                              child: Text('Selected Vendor for: $selectedVendor'),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              // Make the DataTable scrollable
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: editableDataTable(generateDataRows(itemDataList)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Increment itemCount to add a new row
                  setState(() {
                    itemCount++;
                    itemDataList.add(ItemData());
                  });
                },
                child: Text("Add Items"),
              ),
            SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
  DataTable editableDataTable(List<DataRow> dataRows) {
    return DataTable(
      columns: const [
        DataColumn(
          label: Text(
            'Item',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Quantity',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Rate',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
      rows: dataRows,
    );
  }
  List<DataRow> generateDataRows(List<ItemData> items) {
    final List<DataRow> dataRows = [];
    for (int i = 0; i < items.length; i++) {
      dataRows.add(
        DataRow(
          cells: <DataCell>[
            DataCell(
              TextFormField(
                controller: items[i].itemController,
                decoration: const InputDecoration(
                  hintText: 'Item',
                ),
              ),
            ),
            DataCell(
              TextFormField(
                controller: items[i].quantityController,
                decoration: const InputDecoration(
                  hintText: 'in kgs',
                ),
              ),
            ),
            DataCell(
              TextFormField(
                controller: items[i].rateController,
                decoration: const InputDecoration(
                  hintText: '/kg',
                ),
              ),
            ),
          ],
        ),
      );
    }
    return dataRows;
  }
}
class ItemData {
  final TextEditingController itemController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
}
class CustomDropdownMenuItem<T> extends DropdownMenuItem<T> {
  CustomDropdownMenuItem({
    required T value,
    required Widget child,
  }) : super(
          value: value,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45.0), // Set the border radius as needed
            child: child,
          ),
        );
}

//group 11

