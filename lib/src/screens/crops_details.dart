import 'package:alora/src/configs/index.dart';
import 'package:alora/src/extensions/extensions.dart';
import 'package:alora/src/models/crop_model.dart';
import 'package:alora/src/widgets/index.dart';
import 'package:cinetpay/cinetpay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class CropsDetails extends ConsumerStatefulWidget {
  final Crop model;
  const CropsDetails({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CropsDetailsState();
}

class _CropsDetailsState extends ConsumerState<CropsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              filterQuality: FilterQuality.high,
              scale: .75,
              fit: BoxFit.cover,
              image: AssetImage(widget.model.imageURL.details),
            ),
          ),
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () => context.autorouter.pop(),
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFFEAEAEA),
                    child: Center(
                      child: Icon(
                        Icons.chevron_left,
                        size: 32,
                        color: Palette.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          right: 24,
                          top: -32,
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Palette.primary,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                widget.model.bookMarked
                                    ? LineIcons.heartAlt
                                    : LineIcons.heart,
                                color: Palette.light,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                30.0, 12.0, 0.0, 14.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.model.name,
                                    style: Styles.designText(
                                        bold: true,
                                        color: Palette.primary,
                                        size: 16)),
                                Text(widget.model.scienticName,
                                    style: Styles.designText(
                                        bold: false,
                                        color: Palette.primary,
                                        size: 12)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Text(widget.model.description,
                          style: Styles.designText(
                              bold: false, color: Palette.dark, size: 14)),
                    ),
                    const SizedBox(height: 28),
                    Button(
                      callback: () {
                        showDialog(
                            context: context,
                            builder: (context) => CinetPayCheckout(
                                  title: 'Alora Prenium',
                                  configData: const <String, dynamic>{
                                    'apikey':
                                        '182473934962dd5dfc165aa0.79719255',
                                    'site_id': 'alora',
                                    'notify_url':
                                        'https://baimamboukar.hashnode.com/',
                                    'mode': 'test',
                                  },
                                  paymentData: const <String, dynamic>{
                                    'transaction_id': '8111322',
                                    'amount': 200,
                                    'currency': 'XAF',
                                    'channels': 'CREDIT_CARD',
                                    'description': 'Alora payment test',
                                  },
                                  waitResponse: (data) {
                                    debugPrint(data.toString());
                                  },
                                  onError: (data) {
                                    debugPrint(data.toString());
                                  },
                                ));
                      },
                      isLoading: false,
                      label: "Solution",
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
