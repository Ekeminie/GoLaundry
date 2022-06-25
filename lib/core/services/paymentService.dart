import 'package:anywash/constant/constants.dart';
import 'package:anywash/utils/color.dart';
import 'package:anywash/utils/loader.dart';
import 'package:anywash/widgets/custom_messages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';

class PaymentService {
  Function? callback;
  PaymentService({this.callback});
  flutterWavePay(BuildContext context,
      {String? phone,
      String? email,
      String? name,
      num? amount,
      String? ref}) async {
    final style = FlutterwaveStyle(
        appBarText: "Checkout",
        buttonColor: kMainColor,
        appBarIcon: Icon(Icons.money),
        buttonTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        appBarColor: kMainColor,
        dialogCancelTextStyle: const TextStyle(
          color: Colors.redAccent,
          fontSize: 18,
        ),
        dialogContinueTextStyle: TextStyle(
          color: kMainColor,
          fontSize: 18,
        ));
    final Customer customer = Customer(
      name: name!,
      phoneNumber: phone!,
      email: email!,
    );

    final Flutterwave flutterwave = Flutterwave(
        context: context,
        style: style,
        publicKey: publicKey,
        currency: "NGN",
        txRef: ref!,
        amount: amount.toString(),
        customer: customer,
        paymentOptions: "ussd, card, barter, payattitude",
        customization: Customization(
          title: "LONDREE",
        ),
        isTestMode: true);

    hideLoader();
    try {
      final ChargeResponse response = await flutterwave.charge();
      if (response.txRef != null) {
        if (kDebugMode) {
          print(response.toJson());
        }
        if (response.success!) {
          // Call the verify transaction endpoint with the transactionID returned in `response.transactionId` to verify transaction before offering value to customer
          //top up user wallet
          await callback!();
        } else {
          showCustomToast("Transaction Failed");
          // Transaction not successful
        }
      } else {
        showCustomToast("Payment Cancelled");

        // User cancelled
      }
    } catch (e) {
      showCustomToast("Payment Cancelled");
    }
  }

  String getReference() => "";
}
