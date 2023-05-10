import 'package:pleez/models/user_details_model.dart';
import 'package:pleez/resources/cloudfirestore_method.dart';
import 'package:pleez/screen/account_screen.dart';
import 'package:pleez/screen/search_screen.dart';
import 'package:pleez/utils/constant.dart';
import 'package:pleez/widget/account_scree_appbar.dart';
import 'package:pleez/widget/catageory_horizontal_list_view_bar.dart';
// import 'package:amazon_clone/widgets/simple_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_detail_provider.dart';
import '../widget/ad_banner_widget.dart';
import '../widget/loading_widget.dart';
import '../widget/product_show_case.dart';
import '../widget/search_bar_widget.dart';
import '../widget/user_detail_bar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offset = 0;
  List<Widget>? discount70;
  List<Widget>? discount60;
  List<Widget>? discount50;
  List<Widget>? discount0;

  @override
  void initState() {
    super.initState();
    getData();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }


  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }



  void getData() async {
    List<Widget> temp70 =
    await CloudFirestoreClass().getProductsFromDiscount(70);
    List<Widget> temp60 =
    await CloudFirestoreClass().getProductsFromDiscount(60);
    List<Widget> temp50 =
    await CloudFirestoreClass().getProductsFromDiscount(50);
    List<Widget> temp0 = await CloudFirestoreClass().getProductsFromDiscount(0);
    print("everything is done");
    setState(() {
      discount70 = temp70;
      discount60 = temp60;
      discount50 = temp50;
      discount0 = temp0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AccountScreenAppBar(),
      body: discount70 != null &&
          discount60 != null &&
          discount50 != null &&
          discount0 != null
          ? Stack(
        children: [
          SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                SizedBox(
                  height: kAppBarHeight / 2,
                ),

                CategoriesHorizontalListViewBar(),
                // GestureDetector(
                //     onTap: (){
                //       Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) => const SearchScreen())
                //             );
                //     },
                //     child: AdBannerWidget()),
                ProductsShowcaseListView(
                    title: "Upto 90% Off", children: discount70!),
                ProductsShowcaseListView(
                    title: "Upto 12% Off", children: discount60!),
                ProductsShowcaseListView(
                    title: "Upto 8% Off", children: discount50!),

              ],
            ),
          ),
          UserDetailsBar(
            offset: offset,
          ),
        ],
      )
          : const LoadingWidget(),
    );
  }
}