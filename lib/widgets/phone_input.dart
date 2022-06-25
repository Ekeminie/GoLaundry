import 'package:anywash/utils/color.dart';
import 'package:anywash/utils/ctextfield.dart';
import 'package:anywash/utils/media.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class MobileInput extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onIsoChanged;
  const MobileInput({this.onIsoChanged, this.onChanged});

  @override
  _MobileInputState createState() => _MobileInputState();
}

class _MobileInputState extends State<MobileInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: <Widget>[
            CountryCodePicker(
              onChanged: (value) {
                widget.onIsoChanged!(value.dialCode!);
              },
              builder: (value) => buildButton(value),
              initialSelection: '+234',
              textStyle: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontWeight: FontWeight.bold),
              showFlag: false,
              showFlagDialog: true,
              favorite: const [
                'GH',
                '+234',
              ],
              onInit: (v) {
                widget.onIsoChanged!(v!.dialCode!);
              },
            ),
            const SizedBox(
              width: 10.0,
            ),
            //takes phone number as input
            Customtextfild.textField(
                "Phone Number", Colors.black87, width / 1.3,
                controller: _controller,
                onChanged: (v) => widget.onChanged!(v),
                keyboardType: TextInputType.phone),
          ],
        ),
      ),
    );
  }

  buildButton(CountryCode? isoCode) {
    return Row(
      children: <Widget>[
        Text(
          '$isoCode',
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
