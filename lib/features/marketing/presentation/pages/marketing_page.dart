
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_terget_app/core/constants/constant_text.dart';
import 'package:my_terget_app/core/style/style_color.dart';
import 'package:my_terget_app/core/style/style_text.dart';
import 'package:my_terget_app/features/marketing/presentation/blocs/marketing/marketing_bloc.dart';
import 'package:my_terget_app/features/marketing/presentation/pages/components/marketing_item.dart';
class MarketingPage extends StatelessWidget {
  const MarketingPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MarketingBloc>(context).add(OnGetMarketing());
    return BlocBuilder<MarketingBloc, MarketingState>(
          builder: (context, state) {
            if (state is MarketingLoading) {
              return const Center(
                child: SpinKitThreeBounce(
                  size: 20,
                  color: Colors.blue,
                ),
              );
            }
            if (state is MarketingFailed) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.message),
                    TextButton(
                        onPressed: () {
                          BlocProvider.of<MarketingBloc>(context)
                              .add(OnGetMarketing());
                        },
                        child: Text(
                          "try again",
                          style: b2Medium(colorText: CustomColor.primary800),
                        ))
                  ],
                ),
              );
            }
            if (state is MarketingLoaded) {
              if (state.marketings.isEmpty) {
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
                            text: "Remaining Marketing Target ",
                            style: b1Medium(),
                            children: [
                              TextSpan(
                                text: '(${state.marketings.length})',
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
                      itemCount: state.marketings.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 12,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            context.push('/edit_marketing/$index',
                                extra: state.marketings[index]);
                          },
                          child: MarketingItem(marketing: state.marketings[index]),
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