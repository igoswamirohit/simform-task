import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../utility/extensions.dart';
import '../../../core/app_controller.dart';
import '../../../data/models/user_response.dart';
import '../../../widgets/address_and_phone.dart';
import '../../../widgets/circular_image.dart';
import '../home.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final boxDecoration = BoxDecoration(
      border: Border.all(
        width: 2,
      ),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)));

  final _appController = Get.find<AppController>();
  final _homeController = Get.find<HomeController>();

  Widget _noDataAvailableWidget() {
    return Center(
      child: Text(
        'No Local Data Available! Please turn on the internet to fetch the data once.',
        style: 16.mediumStyle.copyWith(color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildNameAndEmail(RemoteUser? user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${user?.name?.title} ${user?.name?.first} ${user?.name?.last} (Age - ${user?.dob?.age})',
          style: 14.mediumStyle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: [
            const Icon(
              Icons.email,
              size: 14,
            ),
            2.sizedBoxWidth(),
            Text('${user?.email}'),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
          style: 17.mediumStyle.copyWith(
                color: Colors.black,
              ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _homeController.deleteLocalData(),
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.black,
            ),
            tooltip: 'Delete local data!',
          )
        ],
      ),
      body: Column(
        children: [
          Obx(() => Container(
                color: _appController.connectivity.value != null &&
                        (_appController.connectivity.value ==
                                ConnectivityResult.mobile ||
                            _appController.connectivity.value ==
                                ConnectivityResult.wifi)
                    ? Colors.green.shade800
                    : Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 4),
                margin: const EdgeInsets.only(bottom: 8),
                child: Center(
                  child: Text(
                    _appController.connectivity.value != null &&
                            (_appController.connectivity.value ==
                                    ConnectivityResult.mobile ||
                                _appController.connectivity.value ==
                                    ConnectivityResult.wifi)
                        ? 'Internet Available!'
                        : 'Internet Not Available!',
                    style: 12.mediumStyle.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Obx(() => _homeController.users.value != null
                  ? _homeController.users.value!.isEmpty
                      ? _noDataAvailableWidget()
                      : ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final user = _homeController.users.value?[index];
                            return Container(
                              decoration: boxDecoration,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomCircularImage(
                                          size: const Size(45, 45),
                                          url: user?.picture?.thumbnail ?? '',
                                        ),
                                        12.sizedBoxWidth(),
                                        Expanded(
                                          child: _buildNameAndEmail(user),
                                        )
                                      ],
                                    ),
                                  ),
                                  AddressAndPhone(
                                    item1: AddressAndPhoneItem(
                                        icon: Icons.location_on,
                                        label: user?.location?.country ?? ''),
                                    item2: AddressAndPhoneItem(
                                        icon: Icons.phone,
                                        label: user?.cell ?? ''),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              10.sizedBoxHeight(),
                          itemCount: _homeController.users.value?.length ?? 0,
                        )
                  : const SpinKitSquareCircle(
                      color: Colors.blue,
                    )),
            ),
          ),
        ],
      ),
    );
  }
}
