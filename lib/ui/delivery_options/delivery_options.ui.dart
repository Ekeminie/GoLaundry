import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Theme/colors.dart';
import 'package:any_wash/ui/base.ui.dart';
import 'package:any_wash/ui/delivery_options/delivery_options.vm.dart';
import 'package:any_wash/utils/string-extensions.dart';
import 'package:flutter/material.dart';

class DetailsOfStore {
  final String? name;
  final String address;
  final String rating;
  final String image;
  final String time;

  DetailsOfStore(this.name, this.address, this.rating, this.image, this.time);
}

class DeliveryOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<DeliveryOptionsViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            "SELECT DELIVERY OPTION",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        body: FadedSlideAnimation(
          ListView(
            children: <Widget>[
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: model.deliverOptionsResponse.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(left: 20.0, top: 25.3, right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          model.selectDeliveryOption(
                              model.deliverOptionsResponse.data![index]);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                FadedScaleAnimation(
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image(
                                      image: AssetImage('assets/Stores/1.png'),
                                      height: 93.3,
                                    ),
                                  ),
                                  durationInMilliseconds: 400,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      model.deliverOptionsResponse.data![index]
                                          .deliveryMethod!
                                          .toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    SizedBox(height: 8.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Icon(
                                          Icons.money,
                                          color: kIconColor,
                                          size: 16,
                                        ),
                                        SizedBox(width: 10.0),
                                        Text(
                                            formatPrice(model
                                                .deliverOptionsResponse
                                                .data![index]
                                                .deliveryPrice!),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                    fontFamily: "Nunito",
                                                    color: kLightTextColor,
                                                    fontSize: 16.0)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
          beginOffset: Offset(0, 0.3),
          endOffset: Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
        ),
      ),
    );
  }
}
