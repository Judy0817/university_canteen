import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:university_canteen/screens/food_descrip.dart';
import 'package:university_canteen/screens/orderDetails.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Reusable/reusable.dart';
import 'home.dart';
import 'opencanteen.dart';

class AdminOrders extends StatefulWidget {
  const AdminOrders({Key? key}) : super(key: key);

  @override

  State<AdminOrders> createState() => _AdminOrdersState();
}

class _AdminOrdersState extends State<AdminOrders> {
  Widget SearchBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 0.5),
            borderRadius: BorderRadius.circular(50),
          ),
          height: 50,
          width: 300.0,
          child: TextField(
            //controller: _emailTextController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xfff9a825),
                ),
                hintText: 'Search Here',
                hintStyle: TextStyle(color: Colors.white, fontSize: 15)),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {

          },
          child: Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromRGBO(217, 217, 217, 0.5),
            ),
            child: Center(
              child: Icon(
                Icons.notifications,
                color: Color(0xffffffff),
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
  bool isExpanded = false;
  void handleToggle() {
    setState(() {
      isExpanded = !isExpanded; // Toggle the state
    });
  }
  @override
  void initState() {
    super.initState();
    retrieveData();
    _refreshRecord();
  }


  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<Map<String, dynamic>> dataList = [];
  bool _isloading =true;

  // String baseUrl = 'http://10.34.26.42:9090';
  String baseUrl = 'http://192.168.250.221:9090';

  Future<void> insertRecord() async {
    final apiUrl = Uri.parse("$baseUrl/insert_food");
    final title = titleController.text;
    final description = descriptionController.text;
    final price = priceController.text;

    try {
      final response = await http.get(
        Uri.parse(
            '$apiUrl?name=${titleController.text}&description=${descriptionController.text}&price=${priceController.text}'),
      );

      if (response.statusCode == 200) {
        print("Record inserted successfully!");
        // Refresh the list view after insertion
        //retrieveData();
      } else {
        throw Exception('Failed to insert record');
      }
    } catch (e) {
      print("Error: $e");
    }
  }
  Future<void> retrieveData() async {
    final String url = '$baseUrl/retrieve_food';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      setState(() {
        dataList = List<Map<String, dynamic>>.from(data);
      });
    } else {
      print('Error retrieving data: ${response.body}');
    }
  }
  Future<void> updateRecord(int id) async {

    final int recordIdToDelete = id;
    final String name = titleController.text;
    final String description = descriptionController.text;
    double price;

    if (id == 0 || name.isEmpty || description.isEmpty) {
      // Validation: Check if fields are not empty and ID is valid.
      print('Please enter valid data.');
      return;
    }
    try {
      price = double.parse(priceController.text);
    } catch (e) {
      print('Invalid price format');
      return;
    }
    final Uri url = Uri.parse('$baseUrl/update_food/$recordIdToDelete');
    final response = await http.get(
      Uri.parse(
          '$url?name=${titleController.text}&description=${descriptionController.text}&price=$price'),
    );

    if (response.statusCode == 200) {
      print('Record updated successfully');
      _refreshRecord();
    } else if (response.statusCode == 404) {
      print('Record not found');
    } else {
      print('Error: ${response.statusCode}');
    }
  }
  Future<void> deleteRecord(int id) async {
    final int recordIdToDelete = id; // Replace with the ID of the record you want to delete

    final response = await http.get(
      Uri.parse('$baseUrl/delete_food/$recordIdToDelete'), // Replace with your server's URL
    );

    if (response.statusCode == 200) {
      print('Record deleted successfully');
      _refreshRecord();
    } else if (response.statusCode == 404) {
      print('Record not found');
    } else {
      print('Error: ${response.statusCode}');
    }
  }
  Future<void> _refreshRecord() async {
    final data = await retrieveData();
    setState(() {
      // dataList = data;
      _isloading = false;
    });
  }
  static List images = [
    "images/parata.jpg",
    "images/uludu.jpg",
    "images/thosa.jpg",
    "images/rice.jpg",
    "images/kottu.jpg",
    "images/noodle.jpeg",
    "images/rolls.jpg",
    "images/sandwidtch.jpg",
    "images/hoppers.jpg",
    "images/omletBun.jpg",
  ];
  void _showForm(int ? id) async {
    if (id != null) {
      final existingjournal =
      dataList.firstWhere((element) => element['id'] == id);
      titleController.text = existingjournal['name'];
      descriptionController.text = existingjournal['description'];
      priceController.text = existingjournal['price'].toString();
    }else {
      // Clear the text fields when creating a new record
      titleController.text = '';
      descriptionController.text = '';
      priceController.text = '';
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_)=>Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom +120,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(hintText: 'Food Name'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(hintText: 'Description'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(hintText: 'Price'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  if(id==null){
                    await insertRecord();
                    await retrieveData();
                  }
                  if(id !=null){
                    await updateRecord(id);
                  }
                  titleController.text='';
                  descriptionController.text = '';
                  priceController.text='' ;
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xfff9a825), // Change this color to your desired background color
                ),
                child: Text(id==null ? 'Create new' : 'Update'),
              )
            ],
          ),
        )
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/background.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 35.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 240,
                            child: Text(
                              "Orders",
                              style: TextStyle(
                                fontSize: 36,
                                height: 1,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
