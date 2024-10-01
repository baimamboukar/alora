import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:grnagain/src/extensions/contextx.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:grnagain/src/extensions/stringx.dart';
import 'package:grnagain/src/widgets/text_to_speech.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class SoilAnalysisPage extends StatefulWidget {
  final XFile image;
  const SoilAnalysisPage({super.key, required this.image});

  @override
  State<SoilAnalysisPage> createState() => _SoilAnalysisPageState();
}

class _SoilAnalysisPageState extends State<SoilAnalysisPage> {
  late final GenerativeModel _model;
  bool _loading = false;
  final gemeni_key = "AIzaSyDncmws8YAjCvUDZfIPKcQVYXOC2j8J7kw";
  String _prediction = '';
  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: gemeni_key,
      // generationConfig: GenerationConfig(
      //   maxOutputTokens: 250,
      // ),
    );
    getPrediction(File(widget.image.path), _model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GreenAgain Soil Analysis"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_loading)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (_prediction.isNotEmpty)
              Column(
                children: [
                  18.vGap,
                  Container(
                    height: 220,
                    width: context.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: MemoryImage(
                          File(widget.image.path).readAsBytesSync(),
                        ),
                      ),
                    ),
                  ),
                  10.vGap,
                  TextToSpeech(
                    label: "Read content",
                    text: _prediction.clean,
                    lang: "en-US",
                  ),
                  MarkdownBody(
                    selectable: true,
                    data: _prediction,
                  ),
                ],
              ),
            24.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final image = await ImagePicker().pickImage(
                      source: ImageSource.camera,
                      imageQuality: 50,
                    );
                    if (image != null) {
                      await getPrediction(File(image.path), _model);
                    }
                  },
                  child: const Text('Take a picture'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final image = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                      imageQuality: 50,
                    );
                    if (image != null) {
                      await getPrediction(File(image.path), _model);
                    }
                  },
                  child: const Text('Pick From Gallery'),
                ),
              ],
            ),
          ],
        ).hPadding.vPadding,
      ),
    );
  }

  Future<String?> getPrediction(File image, GenerativeModel model) async {
    setState(() {
      _loading = true;
      _prediction = '';
    });

    try {
      final prompt = TextPart(
          "Your name is GreenAgain AI, you are responsible for assisting farmers access their soil quality and provide them with a complete analysis and insights. Your response should be clear, but not loo long. You should highlight titles, soil characteristics and cause and recommendations (where applicable). Please provide a detailed response organized in sections. If the soil is healthy, mention it accordingly and give tips based on the soil's current condition. If the provided image is not a soil image, mention you can't analyze the soil or the image provided is invalid (in a cool funny way) and tell the user a fun fact about soil and agriculture in Cameroon, then ask him to provide a soil image.");
      final imageParts = [
        DataPart('image/jpeg', image.readAsBytesSync()),
      ];

      final response = await model.generateContent(
        [
          Content.multi([prompt, ...imageParts])
        ],
      );
      debugPrint(response.toString());
      final text = response.text;

      if (text == null) {
        _showError('Something went wrong..!');
        return null;
      } else {
        setState(() {
          _loading = false;
          _prediction = text;
        });
      }
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    }
    return null;
  }

  void _showError(String message) {
    setState(() {
      _loading = false;
    });
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
