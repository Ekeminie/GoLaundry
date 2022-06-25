import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:any_wash/Locale/locales.dart';
import 'package:any_wash/ui/base.ui.dart';
import 'package:any_wash/ui/cleaning_service/cleaning_service_categories/cleaning_service_categories.vm.dart';
import 'package:any_wash/utils/widget_extensions.dart';
import 'package:flutter/material.dart';

class DetailsOfStore {
  final String? name;
  final String address;
  final String rating;
  final String image;
  final String time;

  DetailsOfStore(this.name, this.address, this.rating, this.image, this.time);
}

class CleaningServiceCategoriesPage extends StatelessWidget {
  final String pageTitle;

  CleaningServiceCategoriesPage(this.pageTitle);

  final int noOfStores = 28;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<DetailsOfStore> detailsOfStore = [
      DetailsOfStore(locale.quickWasher, ' 6.4 km | Hemilstone Road', '4.2',
          'assets/Stores/1.png', '08.00 - 20.00'),
      DetailsOfStore('LaundryPoint', ' 6.4 km | City Garden', '4.8',
          'assets/Stores/2.png', '08.00 - 20.00'),
      DetailsOfStore('CleanHouse', ' 6.4 km | Wipro Market', '4.5',
          'assets/Stores/3.png', '08.00 - 20.00'),
      DetailsOfStore('WhiteWash24', ' 6.4 km | Ring road', '3.9',
          'assets/Stores/4.png', '08.00 - 20.00'),
      DetailsOfStore('Laundry24*7', ' 6.4 km | Hemilstone Road', '4.5',
          'assets/Stores/1.png', '08.00 - 20.00'),
      DetailsOfStore('Quickwashers', ' 6.4 km | Hemilstone Road', '4.2',
          'assets/Stores/2.png', '08.00 - 20.00'),
      DetailsOfStore('LaundryPoint', ' 6.4 km | Hemilstone Road', '4.2',
          'assets/Stores/3.png', '08.00 - 20.00'),
    ];
    return BaseView<CleaningServiceCategoriesViewModel>(
      onModelReady: (model) {
        model.fetchCategoryService(context);
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            "CLEANING SERVICE CATEGORIES",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        body: FadedSlideAnimation(
          ListView(
            children: <Widget>[
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: model.servicesCategory.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(left: 20.0, top: 25.3, right: 20.0),
                      child: ListTile(
                        onTap: () {
                          model.selectServiceCategory(
                              model.servicesCategory.data![index]);
                        },
                        leading: FadedScaleAnimation(
                          Image.network(
                            model.servicesCategory.data![index].imageUrl ?? "",
                            scale: 2.5,
                            errorBuilder: (context, _, st) => Image.asset(
                              "assets/londreeicon.png",
                              scale: 2.5,
                            ),
                          ),
                          durationInMilliseconds: 400,
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: width(context) / 1.7,
                              child: Text(
                                model.servicesCategory.data![index]
                                    .subServiceName!
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
