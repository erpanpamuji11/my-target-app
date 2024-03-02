import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_terget_app/core/constants/constant_text.dart';
import 'package:my_terget_app/core/style/style_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_terget_app/features/business/presentation/pages/business_page.dart';
import 'package:my_terget_app/features/marketing/presentation/pages/marketing_page.dart';
import 'package:my_terget_app/features/product/presentation/blocs/product/product_bloc.dart';
import 'package:my_terget_app/features/product/presentation/pages/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    Future.microtask(() {
      BlocProvider.of<ProductBloc>(context).add(OnGetProduct());
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          ConstantText.myApp,
          style: h3Bold(),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.line_horizontal_3),
        ),
        actions: [
          IconButton(
            onPressed: () => context.push('/profile'),
            icon: const Icon(
              Icons.person_2_rounded,
            ),
          )
        ],
        bottom: TabBar(controller: _tabController, tabs: const [
          Tab(
            text: ConstantText.business,
          ),
          Tab(
            text: ConstantText.product,
          ),
          Tab(
            text: ConstantText.marketing,
          )
        ]),
      ),
      body: TabBarView(controller: _tabController, children: const [
        BusinessPage(),
        ProductPage(),
        MarketingPage(),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade600,
        onPressed: () {
          if (_tabController.index == 0){
            context.push("/add_business");
          } else if (_tabController.index == 1){
            context.push("/add_target");
          } else {
            context.push("/add_marketing");
          }
        },
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
