
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/technical/technical_home/presentation/manger/order_cubit/order_cubit.dart';
import 'package:splash_app/technical/technical_home/presentation/widget/filter_drop_down.dart';
import 'package:splash_app/technical/technical_home/presentation/widget/order_list_in_all_orders.dart';

class AllOrdersViewBody extends StatefulWidget {
  const AllOrdersViewBody({super.key});

  @override
  AllOrdersViewBodyState createState() => AllOrdersViewBodyState();
}

class AllOrdersViewBodyState extends State<AllOrdersViewBody> 
    with AutomaticKeepAliveClientMixin {
  // Filter state management
  final _filterNotifier = ValueNotifier<String>("All");
  final List<String> statusOptions = const [
    "All",
    "InProgress",
    "Pending",
    "Completed",
    "Canceled",
  ];

  // Widget keys and controllers
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = 
      GlobalKey<RefreshIndicatorState>();
  Timer? _filterDebounce;

  // BLoC instance
  late final OrderCubit _cubit;

  // Memoized widgets
  late final Widget _filterDropdown;
  late final Widget _refreshIndicator;
  late final Widget _filterCard;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<OrderCubit>(context);
    _initializeWidgets();
    _cubit.loadOrders();
  }

  void _initializeWidgets() {
    _filterDropdown = ValueListenableBuilder<String>(
      valueListenable: _filterNotifier,
      builder: (_, filter, __) {
        return FilterDropdown(
          selectedFilter: filter,
          filterOptions: statusOptions,
          onChanged: _handleFilterChange,
        );
      },
    );

    _refreshIndicator = RefreshIndicator(
      color: ColorsManager.mainColor,
      key: _refreshIndicatorKey,
      onRefresh: _handleRefresh,
      child: const OrderListInAllOrders(),
    );

    _filterCard = Card(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      elevation: .5,
      color: Colors.grey[50],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_filterDropdown],
      ),
    );
  }

  void _handleFilterChange(String newValue) {
    _filterNotifier.value = newValue;
    _filterDebounce?.cancel();
    _filterDebounce = Timer(const Duration(milliseconds: 300), () {
      _loadOrdersBasedOnFilter(newValue);
    });
  }

  Future<void> _loadOrdersBasedOnFilter([String? filter]) async {
    final currentFilter = filter ?? _filterNotifier.value;
    
    switch (currentFilter) {
      case "Completed":
        await _cubit.getComplateOrder();
        break;
      case "Canceled":
        await _cubit.getAllOrdersCancal();
        break;
      case "InProgress":
        await _cubit.getOrderInProgress();
        break;
      case "Pending":
        await _cubit.getAllrequestPinding();
        break;
      case "All":
      default:
        await _cubit.loadOrders();
    }
  }

  Future<void> _handleRefresh() async {
    await _loadOrdersBasedOnFilter();
  }

  @override
  void dispose() {
    _filterDebounce?.cancel();
    _filterNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              height: 70,
              child: _filterCard,
            ),
          ),
          Expanded(
            child: _refreshIndicator,
          ),
        ],
      ),
    );
  }
}