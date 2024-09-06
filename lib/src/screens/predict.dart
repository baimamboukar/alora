// import 'dart:io';

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:grnagain/i18n/strings.g.dart';
// import 'package:grnagain/src/configs/index.dart';
// import 'package:grnagain/src/extensions/contextx.dart';
// import 'package:grnagain/src/extensions/num.dart';
// import 'package:grnagain/src/riverpods/prediction_services_riverpod.dart';
// import 'package:grnagain/src/widgets/error.dart';
// import 'package:grnagain/src/widgets/text_to_speech.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:lottie/lottie.dart';

// @RoutePage()
// class PredictPage extends ConsumerWidget {
//   final XFile image;
//   const PredictPage({super.key, required this.image});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final predicter = ref.watch(predicterRiverpod(image));
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         title: Text(
//           t.prediction,
//           style: Styles.designText(
//             bold: false,
//             size: 14,
//             color: context.colorScheme.primary,
//           ),
//         ),
//       ),
//       body: predicter.when(
//         data: (data) {
//           return SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 200,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Image.file(
//                     File(image.path),
//                     fit: BoxFit.fitWidth,
//                   ),
//                 ),
//                 10.vGap,
//                 TextToSpeech(
//                   text: data.description,
//                   lang: "en-AU",
//                 ),
//                 10.vGap,
//                 Padding(
//                   padding: const EdgeInsets.only(left: 18.0),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             t.disease,
//                             style: Styles.designText(
//                                 bold: true,
//                                 size: 16,
//                                 color: context.colorScheme.primary),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 18.0),
//                   child: Row(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                             color: context.colorScheme.primary,
//                             borderRadius: BorderRadius.circular(20)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: Text(data.prediction,
//                               style: Styles.designText(
//                                   bold: true, size: 14, color: Palette.light)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 18.0, top: 14),
//                   child: Row(
//                     children: [
//                       Text(
//                         t.description,
//                         style: Styles.designText(
//                             bold: true,
//                             size: 16,
//                             color: context.colorScheme.primary),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: context.colorScheme.primary,
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             data.description,
//                             style: Styles.designText(
//                                 bold: false, size: 14, color: Palette.light),
//                           ),
//                           const SizedBox(
//                             height: 14,
//                           ),
//                           Text(
//                             t.symptoms,
//                             style: Styles.designText(
//                                 bold: true, size: 16, color: Palette.light),
//                           ),
//                           Text(data.symptoms,
//                               style: Styles.designText(
//                                   bold: true, size: 16, color: Palette.light)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: 14,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             t.getToSource,
//                             style: Styles.designText(
//                                 bold: true,
//                                 size: 16,
//                                 color: context.colorScheme.primary),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       GestureDetector(
//                         onTap: () {
//                           //copy data.source to clipboad
//                           Clipboard.setData(ClipboardData(text: data.source));
//                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                             content: Text(data.source),
//                           ));
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: context.colorScheme.primary,
//                               borderRadius: BorderRadius.circular(20)),
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Text(data.source,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: Styles.designText(
//                                     bold: true,
//                                     size: 14,
//                                     color: Palette.light)),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//               ],
//             ),
//           );
//         },
//         loading: () => Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 t.processingIMage,
//                 style: Styles.designText(
//                     color: context.colorScheme.primary, size: 20, bold: true),
//               ),
//               Stack(
//                 children: [
//                   Lottie.asset('assets/images/leaves.json'),
//                   Lottie.asset('assets/images/leaf.json',
//                       width: 300, height: 300),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         error: (err, trace) => ErrorView(
//           desc: t.desc,
//           error: t.error,
//         ),
//       ),
//     );
//   }
// }

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:grnagain/src/app/assets.dart';
import 'package:grnagain/src/extensions/contextx.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:line_icons/line_icons.dart';

const gemeni_key = 'AIzaSyDncmws8YAjCvUDZfIPKcQVYXOC2j8J7kw';

//TODO: #38 Implement Records feature
@RoutePage()
class PredictPage extends StatefulWidget {
  const PredictPage({super.key});

  @override
  State<PredictPage> createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      appBar: AppBar(
        title: const Text("GreenAgain AI"),
      ),
      body: const ChatWidget(),
    );
  }
}

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode();
  bool _loading = false;
  static const _apiKey = "AIzaSyDncmws8YAjCvUDZfIPKcQVYXOC2j8J7kw";
  //String.fromEnvironment('API_KEY');
  final prompt =
      "Your name is GreenAgain AI and your work is to assist Cameroonian farmers seeking AI assistance to improve their farm using climate-smart techniques and data-driven decisions. Please help them by acknowledging their goals, offering insights into agricultural challenges and opportunities, discussing climate-smart practices, and emphasizing data-driven approaches for yield, sustainability, and climate adaptation. They are especially interested in your expertise in soil, crop selection, water management, pest control, and market access. Feel free to ask clarifying questions, and I look forward to tailored responses that consider my specific context. Let's work together for a flourishing farm!";
  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: gemeni_key,
      generationConfig: GenerationConfig(
        maxOutputTokens: 250,
      ),
    );
    _chat = _model.startChat();
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textFieldDecoration = InputDecoration(
      suffixIcon: IconButton(
        onPressed: () async {
          _sendChatMessage(_textController.text);
        },
        icon: Icon(
          Icons.image_outlined,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      prefixIcon: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.primaryContainer),
        child: const Icon(
          LineIcons.microphone,
        ),
      ).hPaddingx(4),
      contentPadding: const EdgeInsets.all(15),
      hintText: 'Ask something...?',
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _apiKey.isNotEmpty
                ? ListView.builder(
                    controller: _scrollController,
                    itemBuilder: (context, idx) {
                      var content = _chat.history.toList()[idx];
                      var text = content.parts
                          .whereType<TextPart>()
                          .map<String>((e) => e.text)
                          .join('');
                      return MessageWidget(
                        text: text,
                        isFromUser: content.role == 'user',
                      );
                    },
                    itemCount: _chat.history.length,
                  )
                : ListView(
                    children: const [
                      Text('Something went wrong..!'),
                    ],
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 15,
            ),
            child: Column(
              children: [
                Visibility(
                  visible: false,
                  child: Image.asset(
                    Assets.assetsImagesPotato,
                    height: 100,
                  ).floatL,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        focusNode: _textFieldFocus,
                        decoration: textFieldDecoration,
                        controller: _textController,
                        onSubmitted: (String value) {
                          if (value.isNotEmpty && !_loading)
                            _sendChatMessage(value);
                        },
                      ),
                    ),
                    const SizedBox.square(
                      dimension: 10,
                    ),
                    if (!_loading)
                      IconButton(
                        onPressed: () async {
                          _sendChatMessage(_textController.text);
                        },
                        icon: Icon(
                          LineIcons.paperPlane,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )
                    else
                      const CircularProgressIndicator(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _sendChatMessage(String message) async {
    setState(() {
      _loading = true;
    });

    try {
      var response = await _chat.sendMessage(
        Content.text(message),
      );
      var text = response.text;

      if (text == null) {
        _showError('Something went wrong..!');
        return;
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

  void _showError(String message) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(
            child: SelectableText(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }
}

class MessageWidget extends StatelessWidget {
  final String text;
  final bool isFromUser;

  const MessageWidget({
    super.key,
    required this.text,
    required this.isFromUser,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            decoration: BoxDecoration(
              color: isFromUser
                  ? context.colorScheme.primaryContainer
                  : context.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: MarkdownBody(
              selectable: true,
              data: text,
            ),
          ),
        ),
      ],
    );
  }
}
