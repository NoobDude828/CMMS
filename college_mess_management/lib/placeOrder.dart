import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({super.key});

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  int itemCount = 3; // Initial number of items
  List<ItemData> itemDataList = List.generate(3, (index) => ItemData());
  String? selectedVendor; 
  String? grandTotalDisplay;// Create a state variable to store the selected value

  List<ItemData> riceAndGrainsItems = List.generate(3, (index) => ItemData());
  List<ItemData> meatAndDairyItems = List.generate(3, (index) => ItemData());
  List<ItemData> vegetableItems = List.generate(3, (index) => ItemData());

Map<String, String> vendorEmails = {
  'Rice and Grains': 'rice@example.com',
  'Vegetables': 'vegetables@example.com',
  'Meat and Dairy': 'meat@example.com',
};
Future<void> sendOrder() async {
if (selectedVendor != null) {
    String vendorEmail = vendorEmails[selectedVendor] ?? ''; // Look up the email address
    if (vendorEmail.isNotEmpty) {
      // Create a subject for the email
      String subject ='Order from CST Mess';

      // Create a table with headers and order details
      String table = '\nDetails:\n\nItem\t\tQuantity\tRate\n';

      for (int i = 0; i < itemDataList.length; i++) {
        String item = (itemDataList[i].itemController.text);
        String quantity = itemDataList[i].quantityController.text;
        String rate = itemDataList[i].rateController.text;

        table +=    '$item''\t\t''$quantity''kg\t\t''Nu.''$rate''/kg\n''';
      }

      // Construct the mailto URL
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: vendorEmail, // Use the vendor's email address as the recipient
        queryParameters: {
          'subject': Uri.decodeComponent(subject),
          'body': Uri.decodeComponent(table),
        },
      );

      // Launch the email app with the mailto URL
      await launch(emailUri.toString());
    } else {
      // Handle the case when the selected vendor does not have a valid email address.
    }
  } else {
    // Handle the case when no vendor is selected.
  }
}

void onOrderSentCallback() {
  // Implement the desired action to be performed after the order is sent
}


  double calculateGrandTotal() {
    double grandTotal = 0.0;
    for (ItemData item in itemDataList) {
      double quantity = double.tryParse(item.quantityController.text) ?? 0.0;
      double rate = double.tryParse(item.rateController.text) ?? 0.0;
      grandTotal += (quantity * rate);
    }
    return grandTotal;
  }


@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'Place Your Order',
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            width: 250,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFF6600),
                            ),
                            child: Center(
                              child: DropdownButton<String>(
                                value: selectedVendor,
                                hint: const Text(
                                  'Select Vendor',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                items: <String>[
                                  'Rice and Grains',
                                  'Vegetables',
                                  'Meat and Dairy',
                                ].map((String value) {
                                  return CustomDropdownMenuItem(
                                    value: value,
                                    child: Center(
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
                                    selectedVendor = newValue;
                                    if (selectedVendor == 'Rice and Grains') {
                                      itemDataList = riceAndGrainsItems;
                                    } else if (selectedVendor == 'Meat and Dairy') {
                                      itemDataList = meatAndDairyItems;
                                    } else if (selectedVendor == 'Vegetables') {
                                      itemDataList = vegetableItems;
                                    }
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
                        if (selectedVendor != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text('Selected Vendor for: $selectedVendor'),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: orders(generateDataRows(itemDataList)),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6600),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: const Size(100, 50),
                  ),
                  onPressed: () {
                    setState(() {
                      itemCount++;
                      itemDataList.add(ItemData());
                    });
                  },
                  child: const Text(
                    "Add Item",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6600),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: const Size(100, 50),
                  ),
                  onPressed: () {
                    if (itemCount > 0) {
                      setState(() {
                        itemCount--;
                        itemDataList.removeLast();
                      });
                    }
                  },
                  child: const Text(
                    "Remove Item",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6600),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: const Size(150, 50),
                  ),
                  onPressed: () {
                    setState(() {
                      grandTotalDisplay = calculateGrandTotal().toStringAsFixed(2);
                    });
                  },
                  child: const Text(
                    "Grand Total",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(width: 20),
                Text( 
                  grandTotalDisplay = 'Nu. ' + (calculateGrandTotal().toStringAsFixed(2)), // Display the grand total text here
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6600),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minimumSize: const Size(100, 50),
              ),
              onPressed: () {
                sendOrder();
              },
              child: const Text(
                'Confirm',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(width: 20),

              ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6600),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minimumSize: const Size(100, 50),
              ),
              onPressed: () {
                sendOrder();
              },
              child: const Text(
                'Send Order',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),

          ],
        ),
      ),
    ),
  );
}

  DataTable orders(List<DataRow> dataRows) {
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
  CustomDropdownMenuItem({super.key, 
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