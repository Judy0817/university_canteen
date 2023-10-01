import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:university_canteen/screens/food_descrip.dart';
import 'package:university_canteen/screens/viewCart.dart';

import '../Reusable/reusable.dart';
import 'foodDataModel.dart';

class OpenCanteen extends StatefulWidget {
  const OpenCanteen({Key? key}) : super(key: key);

  @override
  State<OpenCanteen> createState() => _OpenCanteenState();
}

class _OpenCanteenState extends State<OpenCanteen> {
  int quantity = 0;
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
          width: MediaQuery.of(context).size.width * 0.65,
          height: MediaQuery.of(context).size.height * 0.07,
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
          width: MediaQuery.of(context).size.width * 0.04,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              quantity++;
            });
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
                Icons.menu,
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

  static List names = [
    "Parata",
    "Uludu Wade",
    "Thosai",
    "Rice",
    "Koththu",
    "Noodless",
    "Rolls",
    "Sandwidch",
    "Hoppers",
    "Omlet Bun"
  ];
  static List price = [
    "Rs. 200",
    "Rs. 100",
    "Rs. 100",
    "Rs. 100",
    "Rs. 100",
    "Rs. 100",
    "Rs. 100",
    "Rs. 100",
    "Rs. 100",
    "Rs. 100 "
  ];
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
  static List descriptions = [
    "Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.",
    "Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.",
    "Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.",
    "Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.",
    "Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.",
    "Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.",
    "Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.",
    "Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.",
    "Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.",
    "Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil. Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.",
  ];

  final List<FruitDataModel> Fruitdata = List.generate(
      names.length,
      (index) => FruitDataModel(
          '${names[index]}', '${images[index]}', '${descriptions[index]}'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
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
                    horizontal: MediaQuery.of(context).size.height * 0.04,
                    vertical: MediaQuery.of(context).size.height * 0.0775,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Find Your \nFavorite Food",
                            style: TextStyle(
                              fontSize: 30,
                              height: 1,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      SearchBar(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Popular Foods - Open Canteen",
                            style: TextStyle(
                              fontSize: 16,
                              height: 1,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.55,
                        child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            child: Card(
                              elevation: 5,
                              color: Color.fromRGBO(217, 217, 217, 0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.height *
                                          0.0175,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.0175,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          color: Colors.transparent,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          FoodDesc(
                                                            fruitDataModel:
                                                                Fruitdata[
                                                                    index],
                                                          )));
                                            },
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                images[index],
                                              ),
                                              backgroundColor: Colors
                                                  .transparent, // Replace with your asset path
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              names[index],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              price[index],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      width: 40,
                                      // Set the width as needed
                                      height: 40,
                                      // Set the height as needed
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color:
                                            Color(0xfff9a825).withOpacity(0.7),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            quantity++;
                                          });
                                          var snackBar = SnackBar(
                                            content: Text(
                                                'Added to cart:${names[index]} $quantity'),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        },
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                        ),
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const viewCart(),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(14, 0, 20, 0),
                              width: MediaQuery.of(context).size.width * 0.30,
                              height:
                                  MediaQuery.of(context).size.height * 0.0775,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xfff9a825),
                              ),
                              child: Center(
                                child: Text(
                                  'View Cart',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
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
