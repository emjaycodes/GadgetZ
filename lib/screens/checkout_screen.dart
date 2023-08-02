import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oga_bassey/blocs/location_bloc/location_bloc.dart';
import 'package:oga_bassey/components/checkout_button.dart';
import 'package:oga_bassey/constants.dart';

class CheckoutScreen extends StatefulWidget {
  static String id = 'cart_screen';
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final checkController = TextEditingController();
  //  

  @override
  Widget build(BuildContext context) {
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
          const Text(
            'Enter Shipping Address',
            style: TextStyle(fontSize: 15, color: kprimaryColor),
          ),
          kbigSizedbox,
          // text field to enter shipping address
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<LocationBloc, LocationState>(
                    builder: (context, state) {
                      if (state is LocationLoadedState) {
                        checkController.text = state.address;
                      } else if (state is LocationErrorState) {
                        // Show an error message
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)));
                      }
                      return TextFormField(
                         enableSuggestions: true,
                        controller: checkController,
                        decoration: InputDecoration(
                            hintText: 'Lagos, Nigeria',
                            filled: true,
                            fillColor: ktertiaryColor,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))
                            // border: InputBorder.none
                            ),
                      );
                    },
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.location_pin,
                  size: 30,
                  color: kprimaryColor,
                ),
                onPressed: (){
                  BlocProvider.of<LocationBloc>(context).add(FetchLocationEvent());
                },
              ),
            ],
          ),
          const Spacer(),
          const CheckoutButton(buttonText: 'Pay'),
          ksmallSizedbox,
        ],
      ),
    );
  }
}
