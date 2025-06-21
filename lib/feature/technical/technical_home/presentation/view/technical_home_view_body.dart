// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/feature/map/presentation/widgets/current_location.dart';
import 'package:splash_app/feature/technical/technical_home/domain/entity/order_entity.dart';
import 'package:splash_app/feature/technical/technical_home/presentation/manger/location_cubit/location_cubit.dart';
import 'package:splash_app/feature/technical/technical_home/presentation/manger/order_cubit/order_cubit.dart';
import 'package:splash_app/feature/technical/technical_home/presentation/manger/tecnical_state/tecniacl_cubit.dart';
import 'package:splash_app/feature/technical/technical_home/presentation/widget/filter_drop_down.dart';
import 'package:splash_app/feature/technical/technical_home/presentation/widget/order_list.dart';
import 'package:splash_app/feature/technical/technical_home/presentation/widget/tecnical_state_switch.dart';

class TechnicalHomeViewBody extends StatefulWidget {
  const TechnicalHomeViewBody({super.key});

  @override
  TechnicalHomeViewBodyState createState() => TechnicalHomeViewBodyState();
}

class TechnicalHomeViewBodyState extends State<TechnicalHomeViewBody> {
  String _selectedFilter = "Filter";
  List<String> filterOptions = ["Filter", "Distance", "Oldest"];
  bool switchValue = true; // Default to true
  LatLng? tecLocation;
  @override


@override
void initState() {
  super.initState();
  BlocProvider.of<OrderCubit>(context).getAllrequestPinding();
  _loadSwitchState();

  _initializeData();
}

Future<void> _initializeData() async {
  tecLocation = await CurrentLocation().getCurrentLocation();
  print("######${tecLocation!.latitude}");
  print(tecLocation!.longitude);

  BlocProvider.of<LocationCubit>(context).setLocation(
    id: "25f5bfc2-a1f8-482f-bc15-3a5df77584c7",
   //id: CacheHelper().getDataString(key: ApiKey.userId)!,
    latitude: tecLocation!.latitude,
    longitude: tecLocation!.longitude,
  );
}

void _loadSwitchState() {
  switchValue = CacheHelper().getDatabool(key: ApiKey.teccniclSwitch) ?? true;
}

  void setSwitchValue(bool value) {
    setState(() {
      switchValue = value;
    });

    CacheHelper().saveData(key: ApiKey.teccniclSwitch, value: value);
  }

  List<OrderEntity> _applyFilter(List<OrderEntity> orders) {
    List<OrderEntity> sortedOrders = List.from(orders);

    if (_selectedFilter == "Distance") {
      sortedOrders.sort((a, b) => a.distance.compareTo(b.distance));
    } else if (_selectedFilter == "Oldest") {
      sortedOrders.sort((a, b) => a.createdOn.compareTo(b.createdOn));
    }
    return sortedOrders;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              height: 70,
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                elevation: .5,
                color: Colors.grey[50],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterDropdown(
                      selectedFilter: _selectedFilter,
                      filterOptions: filterOptions,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedFilter = newValue;
                        });
                      },
                    ),
                    TechnicalStatusSwitch(
                      value: switchValue,
                      onToggle: (val) {
                        if (val) {
                          BlocProvider.of<TecniaclCubit>(context)
                              .setTecnicalActive();
                          customShowSnackBar(
                              context, 'Technical is Activated!!');
                        } else {
                          BlocProvider.of<TecniaclCubit>(context)
                              .setTecnicalInActive();
                          customShowSnackBar(
                              context, 'Technical is Inactivated!!');
                        }
                        setSwitchValue(val); // Save state
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              color: ColorsManager.mainColor,
              onRefresh: () async {
                await BlocProvider.of<OrderCubit>(context)
                    .getAllrequestPinding();
              },
              child: OrderList(applyFilter: _applyFilter),
            ),
          ),

          //Expanded(child: OrderList(applyFilter: _applyFilter)),
        ],
      ),
    );
  }
}
