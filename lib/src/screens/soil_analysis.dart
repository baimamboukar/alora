import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:grnagain/src/extensions/contextx.dart';
import 'package:grnagain/src/extensions/extensions.dart';
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
                  MarkdownBody(
                    selectable: true,
                    data: _prediction,
                  ),
                ],
              ),
            24.vGap,
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
          "I am a farmer from Cameroon. I want you to help me make better decisions for my farms. Your task is to help me analyze the soil quality of my farm. Your response should be detailed and clear. You should highlight titles, indicators, causes, and recommendations. Please provide a detailed response by mentioning Cameroon and West Cameroon, organized in sections, each titled and subtitled. If the soil is healthy, mention it accordingly and give tips based on the soil's current condition.");
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
