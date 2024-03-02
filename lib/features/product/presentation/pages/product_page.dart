import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_terget_app/core/constants/constant_text.dart';
import 'package:my_terget_app/core/style/style_color.dart';
import 'package:my_terget_app/core/style/style_text.dart';
import 'package:my_terget_app/features/product/presentation/blocs/product/product_bloc.dart';
import 'package:my_terget_app/features/product/presentation/pages/components/target_item.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: SpinKitThreeBounce(
              size: 20,
              color: Colors.blue,
            ),
          );
        }
        if (state is ProductFailed) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(state.message),
                TextButton(
                    onPressed: () {
                      BlocProvider.of<ProductBloc>(context).add(OnGetProduct());
                    },
                    child: Text(
                      "try again",
                      style: b2Medium(colorText: CustomColor.primary800),
                    ))
              ],
            ),
          );
        }
        if (state is ProductLoaded) {
          if (state.products.isEmpty) {
            return Center(
                child: Text(
              ConstantText.dataEmpty,
              style: b1Bold(),
            ));
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: RichText(
                    text: TextSpan(
                        text: "Remaining Product Target ",
                        style: b1Medium(),
                        children: [
                          TextSpan(
                            text: '(${state.products.length})',
                            style: b1Bold(),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.products.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 12,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        context.push('/edit_product/$index',
                            extra: state.products[index]);
                      },
                      child: TargetItem(products: state.products[index]),
                    );
                  },
                )
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
