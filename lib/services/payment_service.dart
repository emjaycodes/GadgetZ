import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:oga_bassey/constants.dart';


class PaystackPayment {

  PaystackPayment(this.ctx, this.email, this.price);
  
  BuildContext ctx;

  int price;

  String email;


  PaystackPlugin paystack = PaystackPlugin();

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  PaymentCard _getCardUi(){
    return PaymentCard(number: '', cvc: '', expiryMonth: 0, expiryYear: 0);
  }


  Future initializePlugin() async{
    await paystack.initialize(publicKey: ConstantKey.PAYSTACK_KEY);
  }

  //method charge card
  chargeCardAndMakePayment() async{
    initializePlugin().then((_) async{
      Charge charge = Charge()
      ..amount = price * 100
      ..email 
      ..reference = _getReference()
      ..card = _getCardUi();
      CheckoutResponse response = await paystack.checkout(
        ctx, 
      charge: charge,
      method: CheckoutMethod.card,
      fullscreen: false,
      logo: FlutterLogo(size: 24,)
      );
      print("response ${response}");

      if (response.status == true) {
      print('trasaction successful');
      } else {print('Transaction Failed');}
        
    });
  }

}