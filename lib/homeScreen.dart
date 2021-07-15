import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lng/constant.dart';
import 'package:lng/selectionAppBar.dart';

import 'orderDescriptionScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  final gridViewController = DragSelectGridViewController();
  FirebaseFirestore _firebase = FirebaseFirestore.instance;
  bool isLoading = false;
  int addition = 1;
  int addition1 = 1;
  int orderNumber = 12345678;
  int pAddress = 123;
  int dAddress = 123;
  int cPhone = 12345678;
  bool isSelected = false;
  DocumentSnapshot snapshot;
  String id;

  List<String> sorting = <String>[
    'sort by Area code',
    'Delivery date',
    'Pickup date',
    'Merchant name',
  ];
  String selectedSortingQuery;

  List selectedCards = [];

  void scheduleRebuild() {
    gridViewController.addListener(() {
      // scheduleRebuild();
      setState((){
        gridViewController.value.amount < 1?
        isSelected = false:
        isSelected = true;
        print("number of selected Cards " + gridViewController.value.amount.toString());
        print("sle ${gridViewController.value.selectedIndexes}");
        print(selectedCards);
        // if(id != null)scheduleRebuild();
      });

    });
  }



   createOrders() async{
    try{
      Map<String, dynamic> orderData = {
        'order_number': 'N${orderNumber}',
        'description': '1 Carton of water',
        'weight': '500g',
        'quantity': '1',
        'pickup_date' : '1/10/2021',
        'pickup_address' : '${pAddress} Raffles Place',
        'pickup_postal_code' : '101111',
        'delivery_date' : '01/11/2021',
        'delivery_address' : '${dAddress} City Hall',
        'delivery_postal_code' : '546090',
        'customer_fname' : 'Aaron $addition1',
        'customer_lname' : 'Lo',
        'customer_email' : 'aaron.lo@mail.com',
        'customer_phone' : '${cPhone}',
        'merchant_name' : 'Merchant $addition',
        'approval_status' : 'Pending',
      };
      _firebase.collection('Orders').doc('N${orderNumber}').set(orderData)..whenComplete((){
        isLoading = false;
        setState(() {

        });
      });

    }catch(exception){

      print(exception);

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scheduleRebuild();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: key,
      appBar:
      isSelected == true?
      SelectionAppBar(
        function: (){
          setState(() {
            isSelected = false;
            gridViewController.clear();
          });

        },
        deleteFunction: ()async{
          print(selectedCards[gridViewController.value.selectedIndexes.first]);
          print("delete....");
          print(selectedCards.length);
           for(int i = 0; i< gridViewController.value.selectedIndexes.length; i++){
           _firebase.collection('Orders').doc(selectedCards[gridViewController.value.selectedIndexes.elementAt(i)]).delete();

           if(i+1 == gridViewController.value.selectedIndexes.length){
             Fluttertoast.showToast(msg: '${gridViewController.value.selectedIndexes.length} Order(s) deleted',
               backgroundColor: Colors.black,
               textColor: Colors.white,
               toastLength: Toast.LENGTH_SHORT,
               fontSize: 14.00,
               gravity: ToastGravity.BOTTOM,
             );
             setState(() {
               isSelected = false;
               gridViewController.clear();
               selectedCards.clear();
             });
           }
          }
        },
        approvalFunction: () async{
          print(selectedCards[gridViewController.value.selectedIndexes.first]);
          print("updated....");
          print(selectedCards.length);
          for(int i = 0; i< gridViewController.value.selectedIndexes.length; i++){
            _firebase.collection('Orders').doc(selectedCards[gridViewController.value.selectedIndexes.elementAt(i)]).update(
              {
                'approval_status' : 'Approved'
              }
            );

            if(i+1 == gridViewController.value.selectedIndexes.length){
              Fluttertoast.showToast(msg: '${gridViewController.value.selectedIndexes.length} Order(s) approved.',
                backgroundColor: Colors.black,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                fontSize: 14.00,
                gravity: ToastGravity.BOTTOM,
              );
              setState(() {
                isSelected = false;
                gridViewController.clear();
                selectedCards.clear();
              });
            }
          }
        },
        downloadFunction: (){
          Fluttertoast.showToast(msg: 'downloaded to csv file.',
            backgroundColor: Colors.black,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_SHORT,
            fontSize: 14.00,
            gravity: ToastGravity.BOTTOM,
          );
          setState(() {
            isSelected = false;
            gridViewController.clear();
            selectedCards.clear();
          });
        },
        editFunction: (){
          Fluttertoast.showToast(msg: 'Order editing will be from management.',
            backgroundColor: Colors.black,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_SHORT,
            fontSize: 14.00,
            gravity: ToastGravity.BOTTOM,
          );
          setState(() {
            isSelected = false;
            gridViewController.clear();
            selectedCards.clear();
          });
        },
        selection: gridViewController.value,
        title: Text('selected '+ gridViewController.value.toString(),
        style: TextStyle(color:  Colors.white)
        ),
      ):
      AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: GestureDetector(
              onTap: () {
                key.currentState.openDrawer();
              },
              child: Icon(
                Icons.menu,
                    color: Colors.white,
                  // color: Colors.white,
                size: 25.00,
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NeumorphicText(
               'All Orders',
                style: NeumorphicStyle(
                  depth: 1.00,
                  color: Colors.white
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: 22.00,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins-Thin',
                ),
              ),
              NeumorphicText(
                'Load & Go Logistics',
                style: NeumorphicStyle(
                  depth: 1.00,
                  color: Colors.white
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: 8.00,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins-Thin',
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search_outlined, color: Colors.white,),
              // onPressed: SearchDelegate(),
            ),
            PopupMenuButton(
              // initialValue: 2,
              onSelected: (int index) {
                selectedSortingQuery = sorting[index];
                Fluttertoast.showToast(msg: 'Sorted by $selectedSortingQuery',
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                  toastLength: Toast.LENGTH_SHORT,
                  fontSize: 14.00,
                  gravity: ToastGravity.BOTTOM,
                );
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 7.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.more_vert_sharp,
                    color: Colors.white,
                    // color: Colors.white,
                    size: 25.00,
                  ),
                ),
              ),
              itemBuilder: (context) {
                return List.generate(sorting.length, (index) {
                  return PopupMenuItem(
                    value: index,
                    child: Text(sorting[index],
                    style: TextStyle(
                      fontFamily: 'Poppins-Thin',
                      fontWeight: FontWeight.w900,
                      fontSize: 12.0
                    ),
                    ),
                  );
                });
              },
            ),

          ],
        ),
      drawer: SafeArea(
        child: Drawer(
          child: Container(
            height: size.height * 0.9,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black87,
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'My Profile',
                        maxLines: 2,
                        softWrap: false,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Poppins-Thin',
                            fontWeight: FontWeight.w900,
                            fontSize: 22.0,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                        height: 0.3,
                        width: size.width * 0.7,
                        color: Colors.grey),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'User\'s profile will appear here',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins-Thin',
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '@Copyright Load & Go Logistics - 2021',
                    maxLines: 2,
                    softWrap: false,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins-Thin',
                        fontWeight: FontWeight.w900,
                        fontSize: 10.0,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: isLoading?Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),):
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width,
            color: Colors.white54,
            child: StreamBuilder<QuerySnapshot>(
            stream: selectedSortingQuery == 'Merchant name'?FirebaseFirestore.instance.collection('Orders').orderBy('merchant_name').snapshots():
            FirebaseFirestore.instance.collection('Orders').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),);
              }else{
                return DragSelectGridView(
                    itemCount: snapshot.data.docs.length,
                    gridController: gridViewController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10.0,
                        crossAxisCount: 2, childAspectRatio: 0.7),
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                    // scrollDirection: Axis.vertical,
                    itemBuilder: (context, index, isSelected) {
                      DocumentSnapshot course = snapshot.data.docs[index];
                      selectedCards.add(snapshot.data.docs[index].id);
                      return GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
                          child: Container(
                            // height: MediaQuery.of(context).size.height * 0.15,
                            width: 200,
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                color: isSelected? Colors.black45.withOpacity(0.3):Colors.white54,
                                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                                disableDepth: false,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: NeumorphicText(
                                          course.get('order_number'),
                                          style: NeumorphicStyle(
                                              color: Colors.black,
                                              depth: 1.0
                                          ),
                                          textStyle: NeumorphicTextStyle(
                                              fontFamily: 'Poppins-Thin',
                                              fontWeight: FontWeight.w900
                                          ),
                                        ),
                                      ),
                                      Container(
                                          height: 0.2, width: 80, color: Colors.grey),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: NeumorphicText(
                                      course.get('description'),
                                    style: NeumorphicStyle(
                                      color: Colors.grey,
                                      depth: 1.0
                                    ),
                                      textStyle: NeumorphicTextStyle(
                                        fontFamily: 'Poppins-Thin',
                                        fontWeight: FontWeight.w900
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/barcode.png'),
                                        fit: BoxFit.fill
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context){
                                              return OrderDescriptionScreen(orderId: course.id,);
                                            }));
                                          },
                                          child: Card(
                                            elevation: 5.0,
                                            shadowColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(20.00)),
                                            child: Container(
                                              height: 30.00,
                                              width: 80.00,
                                              decoration: buttonDecoration,
                                              alignment: Alignment.center,
                                              child: Text(
                                                'View details',
                                                maxLines: 2,
                                                softWrap: false,
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: kButtonTextStyle,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              }
              },
            ),
      ),
      ),
      floatingActionButton:
      movingButton
      // FloatingActionButton(
      //   onPressed: (){
      //     isLoading = true;
      //       addition == 3 ?
      //           addition = 1: addition = addition + 1;
      //       addition1 = addition1 + 1;
      //        orderNumber = orderNumber + 1;
      //       pAddress = pAddress + 4;
      //       dAddress = dAddress + 1;
      //       cPhone = cPhone + 1;
      //       setState(() {
      //
      //       });
      //       createOrders();
      //   },
      // )
      // movingButton
    );
  }
}
