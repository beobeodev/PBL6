import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/home/widgets/home/home_app_bar.widget.dart';
import 'package:mobile/modules/home/widgets/home/home_search_box.widget.dart';
import 'package:mobile/modules/home/widgets/home/top_destinations/list_top_destinations.widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: HomeAppBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HomeSearchBox(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    UIConfigs.horizontalPadding,
                    UIConfigs.horizontalPadding,
                    0,
                    UIConfigs.horizontalPadding,
                  ),
                  child: Text(
                    'Khám phá thêm',
                    style: TextStyles.s17BoldText,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 15),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 15);
                  },
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://gonatour.vn/vnt_upload/news/04_2020/du_lich_ha_noi.jpg',
                        height: 200,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              const ListTopDestinations()
            ],
          ),
        ),
        backgroundColor: Palette.background,
      ),
    );
  }
}
