import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lng/constant.dart';


class OrderDescriptionScreen extends StatefulWidget {

  final orderId;

  const OrderDescriptionScreen({Key key, this.orderId}) : super(key: key);

  @override
  _OrderDescriptionScreenState createState() => _OrderDescriptionScreenState();
}

class _OrderDescriptionScreenState extends State<OrderDescriptionScreen> {
  
  final firebase = FirebaseFirestore.instance;
  String orderID;
  String orderName;
  String orderQty;
  String orderWeight;
  String pickupDate;
  String pickupAddress;
  String pickupPostalCode;
  String merchantName;
  String deliveryDate;
  String deliveryAddressOne;
  String deliveryPostalCode;
  String deliveryAddressTwo;
  String customerName;
  String customerLastName;
  String customerPhone;
  String customerCompany;
  String approvalStatus;
  bool isLoading = true;

  
  void gettingOrderDescription() async{
    await firebase.collection('Orders').doc(widget.orderId).get().then((value){
      orderID = value.get('order_number');
      orderName = value.get('description');
      orderQty = value.get('quantity');
      orderWeight = value.get('weight');
      pickupDate = value.get('pickup_date');
      pickupAddress = value.get('pickup_address');
      pickupPostalCode = value.get('pickup_postal_code');
      merchantName = value.get('merchant_name');
      deliveryDate = value.get('delivery_date');
      deliveryAddressOne = value.get('delivery_address');
      deliveryPostalCode = value.get('delivery_postal_code');
      customerName = value.get('customer_fname');
      customerLastName = value.get('customer_lname');
      customerPhone = value.get('customer_phone');
      approvalStatus = value.get('approval_status');
      setState(() {
        isLoading = false;
      });
    });
  }


  @override
  void initState() {
    super.initState();
    gettingOrderDescription();
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Order Description',
        style: kAppBarTextStyle
        ),
      ),
      body: isLoading? Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),):
      SafeArea(
          child: Container(
            height: size.height * 0.9,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    mapCard,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              Text('Order info.',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins-Thin',
                                fontSize: 14.0,
                                fontWeight: FontWeight.w900,
                              ),
                              ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Order number',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins-Thin',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.do_not_disturb_on, color: Colors.black, size: 8),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Text(' ${widget.orderId}',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Thin',
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Order name',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins-Thin',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.do_not_disturb_on, color: Colors.black, size: 8),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Text(' $orderName',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Thin',
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Quantity',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins-Thin',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.do_not_disturb_on, color: Colors.black, size: 8),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Text(' $orderQty',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Thin',
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Weight',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins-Thin',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.do_not_disturb_on, color: Colors.black, size: 8),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Text(' $orderWeight',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Thin',
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: DottedLine(
                              dashColor: Colors.grey,
                              lineLength: size.width * 0.95,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 5, right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              Text('Pickup info.',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins-Thin',
                                fontSize: 14.0,
                                fontWeight: FontWeight.w900,
                              ),
                              ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Pickup date',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins-Thin',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.do_not_disturb_on, color: Colors.black, size: 8),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Text(
                                      ' $pickupDate',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Thin',
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Pickup Address',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins-Thin',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.do_not_disturb_on, color: Colors.black, size: 8),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Text(' $pickupAddress',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Thin',
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Postal code',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins-Thin',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.do_not_disturb_on, color: Colors.black, size: 8),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Text(' $pickupPostalCode',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Thin',
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Merchant name',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins-Thin',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.do_not_disturb_on, color: Colors.black, size: 8),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Text(' $merchantName',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Thin',
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: DottedLine(
                              dashColor: Colors.grey,
                              lineLength: size.width * 0.95,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 5, right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              Text('Delivery info.',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins-Thin',
                                fontSize: 14.0,
                                fontWeight: FontWeight.w900,
                              ),
                              ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Delivery date',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins-Thin',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.do_not_disturb_on, color: Colors.black, size: 8),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Text(
                                      ' $deliveryDate',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Thin',
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Address 1',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins-Thin',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.do_not_disturb_on, color: Colors.black, size: 8),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Text(' $deliveryAddressOne',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Thin',
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Postal code',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins-Thin',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.do_not_disturb_on, color: Colors.black, size: 8),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Text(' $deliveryPostalCode',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Thin',
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Address 2',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins-Thin',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.do_not_disturb_on, color: Colors.black, size: 8),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Text(' $deliveryAddressTwo',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Thin',
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: DottedLine(
                              dashColor: Colors.grey,
                              lineLength: size.width * 0.95,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 5, right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              Text('Customer info.',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins-Thin',
                                fontSize: 14.0,
                                fontWeight: FontWeight.w900,
                              ),
                              ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('First name',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins-Thin',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.do_not_disturb_on, color: Colors.black, size: 8),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Text(
                                           ' $customerName',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Thin',
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Last name',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins-Thin',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.do_not_disturb_on, color: Colors.black, size: 8),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Text(' $customerLastName',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Thin',
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Phone',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins-Thin',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.do_not_disturb_on, color: Colors.black, size: 8),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Text(' $customerPhone',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Thin',
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Company',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins-Thin',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.do_not_disturb_on, color: Colors.black, size: 8),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Text(' Load & Go LTD.',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins-Thin',
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Approval Status',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins-Thin',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.do_not_disturb_on, color: Colors.black, size: 8),
                                        Container(
                                          width: size.width * 0.45,
                                          child: Text(' $approvalStatus',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: approvalStatus == 'Pending'? Colors.red : Colors.green,
                                              fontFamily: 'Poppins-Thin',
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: DottedLine(
                              dashColor: Colors.grey,
                              lineLength: size.width * 0.95,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                    child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/qrcode.png'),
                              fit: BoxFit.fill,
                            )
                        )
                    ),
                  ),
                   
                ],
              ),
            ),
          )
      ),
    );
  }
}
