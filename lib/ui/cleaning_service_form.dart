import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:anywash/ui/base.ui.dart';
import 'package:anywash/ui/cleaning_service/cleaning_service_form.vm.dart';
import 'package:anywash/utils/keyboard-utils.dart';
import 'package:anywash/widgets/bottom_bar.dart';
import 'package:anywash/widgets/entry_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

//register page for registration of a new user
class CleaningServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "CLEANING SERVICE",
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(fontSize: 16.7, fontWeight: FontWeight.w600),
        ),
      ),

      //this column contains 3 textFields and a bottom bar
      body: FadedSlideAnimation(
        CleaningServiceForm(),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

class CleaningServiceForm extends StatefulWidget {
  @override
  _CleaningServiceFormState createState() => _CleaningServiceFormState();
}

class _CleaningServiceFormState extends State<CleaningServiceForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<CleaningServiceViewModel>(
      builder: (context, model, child) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Divider(
                    color: Theme.of(context).cardColor,
                    thickness: 8.0,
                  ),
                  //name textField
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                    child: EntryField(
                      onChanged: (v) => model.setFName(v),
                      textCapitalization: TextCapitalization.words,
                      // controller: _nameController,
                      label: "PHONE NUMBER",
                      image: 'assets/Icons/ic_name.png',
                      controller: model.phoneController,
                      // isCollapsed: true,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                    child: EntryField(
                      onChanged: (v) => model.setLName(v),
                      controller: model.altPhoneNumberController,
                      textCapitalization: TextCapitalization.words,
                      // controller: _nameController,
                      label: "ALTERNATE PHONE NUMBER",
                      image: 'assets/Icons/ic_name.png',
                      // isCollapsed: true,
                    ),
                  ),
                  //email textField
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                    child: EntryField(
                      controller: model.nameController,
                      onChanged: (v) => model.setEmail(v),
                      textCapitalization: TextCapitalization.none,
                      //controller: _emailController,
                      label: "FULL NAME",
                      image: 'assets/Icons/ic_mail.png',
                      keyboardType: TextInputType.emailAddress,
                      // initialValue: '\n' + 'samanthasmith@mail.com',
                      // isCollapsed: true,
                    ),
                  ),

                  //phone textField
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                    child: EntryField(
                      onChanged: (v) => model.setPhone(v),
                      controller: model.addressController,
                      label: "ADDRESS",
                      image: 'assets/Icons/ic_phone.png',
                      keyboardType: TextInputType.streetAddress,
                      // initialValue: '\n' + model.phone!,
                      // isCollapsed: true,
                    ),
                  ),

                  //INSTRUCTION textField
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                    child: EntryField(
                      onChanged: (v) => model.setPhone(v),
                      controller: model.instructionsController,
                      label: "INSTRUCTION",
                      image: 'assets/Icons/ic_phone.png',
                      keyboardType: TextInputType.streetAddress,
                      // initialValue: '\n' + model.phone!,
                      // isCollapsed: true,
                    ),
                  ),

                  //DATE textField
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                    child: EntryField(
                      readOnly: true,
                      onTap: () => showDateTimePicker(
                          context: context, f: (date) => model.setDate(date)),
                      onChanged: (v) => model.setPhone(v),
                      controller: model.dateController,
                      label: "DATE",
                      image: 'assets/Icons/ic_phone.png',
                      keyboardType: TextInputType.streetAddress,
                      // initialValue: '\n' + model.phone!,
                      // isCollapsed: true,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Verify",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 11),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomBar(
              view: model.viewState,
              text: "Continue",
              onTap: () {
                if (model.isValidEntries) {
                  killKeyboard(context);
                  model.sendRequest();
                } else {
                  model.showErrorMessage();
                }
                // Navigator.pushNamed(context, LoginRoutes.verification);
              })
        ],
      ),
    );
  }

  showDateTimePicker({BuildContext? context, ValueChanged<DateTime>? f}) {
    final date = DateTime.now();
    DatePicker.showDateTimePicker(context!,
        showTitleActions: true,
        minTime: date,
        maxTime: DateTime(date.year, date.month + 2), onChanged: (date) {
      print('change $date in time zone ' + date.toIso8601String());
    }, onConfirm: (date) {
      print('confirm $date');
      f!(date);
    }, locale: LocaleType.en);
  }
}
