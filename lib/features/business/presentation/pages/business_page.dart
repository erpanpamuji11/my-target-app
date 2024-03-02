
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_terget_app/core/style/style_color.dart';
import 'package:my_terget_app/core/style/style_text.dart';
import 'package:my_terget_app/features/business/presentation/blocs/business/business_bloc.dart';
import 'package:my_terget_app/features/business/presentation/pages/components/business_item.dart';
import 'package:my_terget_app/features/product/presentation/blocs/product/product_bloc.dart';

class BusinessPage extends StatelessWidget {
  const BusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BusinessBloc>(context).add(OnGetBusiness());
    return BlocBuilder<BusinessBloc, BusinessState>(
          builder: (context, state) {
            if (state is BusinessLoading) {
              return const Center(
                child: SpinKitThreeBounce(
                  size: 20,
                  color: Colors.blue,
                ),
              );
            }
            if (state is BusinessFailed) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.message),
                    TextButton(
                        onPressed: () {
                          BlocProvider.of<ProductBloc>(context)
                              .add(OnGetProduct());
                        },
                        child: Text(
                          "try again",
                          style: b2Medium(colorText: CustomColor.primary800),
                        ))
                  ],
                ),
              );
            }
            if (state is BusinessLoaded) {
              if (state.business.isEmpty) {
                return Center(
                    child: Text(
                  "Data Kosong",
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
                            text: "Remaining Business Target ",
                            style: b1Medium(),
                            children: [
                              TextSpan(
                                text: '(${state.business.length})',
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
                      itemCount: state.business.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 12,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            context.push('/edit_business/$index',
                                extra: state.business[index]);
                          },
                          child: BusinessItem(business: state.business[index]),
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