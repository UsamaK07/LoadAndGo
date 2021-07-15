import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';


var kAppBarTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w900,
  fontFamily: 'Poppins-Thin',
  fontSize: 22.00,
);

var kButtonTextStyle = TextStyle(
    fontFamily: 'Poppins-Thin',
    fontWeight: FontWeight.bold,
    fontSize: 10.0,
    color: Colors.white
);

var buttonDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Colors.black54,
      Colors.black,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
  borderRadius:
  BorderRadius.circular(20.00),
);

Widget mapCard = Card(
  elevation: 5.00,
  child: Container(
    height: 200,
    width: 400,
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/map.jpg'),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.15), BlendMode.darken),
            ),
          ),
        ),
        Row(
          children: [
            Icon(Icons.location_on_outlined, color: Colors.red, size: 18.0),
            Text('Order location',
              style: TextStyle(
                  fontSize: 14.00,
                  fontWeight: FontWeight.w600,
                  // fontFamily: 'Poppins-Thin',
                  color: Colors.red
              ),
            ),
          ],
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Icon(Icons.location_on, color: Colors.black, size: 30.0),
          ),
        )
      ],
    ),
  ),
);

Widget movingButton = FabCircularMenu(
  fabColor: Colors.black,
  ringColor: Colors.black,
  fabCloseIcon:  Icon(Icons.close, color: Colors.white),
  fabOpenIcon: Icon(Icons.filter_alt_outlined, color: Colors.white,),
  children: [
    Container(
      height: 50,
      width: 50,
      child: Column(
        children: [
          Icon(Icons.date_range, size: 18 ,color: Colors.white),
          Text('Pickup date',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 8.0,
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontFamily: 'Poppins-Thin',
            ),
          )
        ],
      ),
    ),
    Container(
      height: 50,
      width: 50,
      child: Column(
        children: [
          Icon(Icons.date_range, size: 18 ,color: Colors.white),
          Text('Delivery date',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 8.0,
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontFamily: 'Poppins-Thin',
            ),
          )
        ],
      ),
    ),
    Container(
      height: 50,
      width: 50,
      child: Column(
        children: [
          Icon(Icons.post_add, size: 18 ,color: Colors.white),
          Text('Postal code',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 8.0,
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontFamily: 'Poppins-Thin',
            ),
          )
        ],
      ),
    ),
    Container(
      height: 50,
      width: 50,
      child: Column(
        children: [
          Icon(Icons.person_outline, size: 18 ,color: Colors.white),
          Text('Merchant name',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 8.0,
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontFamily: 'Poppins-Thin',
            ),
          )
        ],
      ),
    ),
  ],
);