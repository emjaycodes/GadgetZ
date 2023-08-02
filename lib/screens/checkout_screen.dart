import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:oga_bassey/components/checkout_button.dart';
import 'package:oga_bassey/constants.dart';
import 'package:oga_bassey/services/location_service.dart';

class CheckoutScreen extends StatefulWidget {
  static String id = 'cart_screen';
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final checkController = TextEditingController();
  late Future<void> position;
  late Future<void> address;
  late LocationService locationService;

  @override
  void initState() {
  locationService = LocationService();
  position = LocationService().getPosition();
  address = LocationService().getAddressFromCoordinates();

    super.initState();
  }

  @override
  Widget build(BuildContext context) { 
    print(locationService.latitude);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Shipping Address',
          style: TextStyle(color: kprimaryColor),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: kprimaryColor),
      ),
      body: Column(
        children: [
          kbigSizedbox,
          // text saying shipping address
           Text(
            'Enter Shipping Address',
            style: TextStyle(fontSize: 15),
          ),
          kbigSizedbox,
          // text field to enter shipping address
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: checkController,
                    decoration: InputDecoration(
                        hintText: 'Lagos, Nigeria',
                        filled: true,
                        fillColor: ktertiaryColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))
                        // border: InputBorder.none
                        ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.location_pin,
                  size: 30,
                  color: kprimaryColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Spacer(),
          const CheckoutButton(buttonText: 'Pay'),
          ksmallSizedbox,
        ],
      ),
    );
  }
}
