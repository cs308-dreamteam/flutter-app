import 'package:bragi/common/widgets/simple_text_field.dart';
import 'package:bragi/models/artist.dart';
import 'package:flutter/material.dart';

import '../../../models/album.dart';
import '../../../models/song.dart';

class AdditionalInformationFields extends StatefulWidget {
  const AdditionalInformationFields({Key? key}) : super(key: key);

  @override
  State<AdditionalInformationFields> createState() =>
      _AdditionalInformationFieldsState();
}

class _AdditionalInformationFieldsState
    extends State<AdditionalInformationFields> {
  double height = 0;

  @override
  Widget build(BuildContext context) {
    Song tempSong = Song(
      name: "name",
      artists: List<Artist>.empty(),
      albums: List<Album>.empty(),
    );
    Map<String, TextEditingController> controllers =
        <String, TextEditingController>{};
    for (String field in tempSong.toJson().keys.skip(5)) {
      controllers[field] = TextEditingController();
    }
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => {
            setState(() {
              height =
                  height == 0 ? MediaQuery.of(context).size.height * 0.2 : 0;
            })
          },
          child: const Text("Additional Information"),
        ),
        AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
          ),
          padding: const EdgeInsets.all(8),
          width: 250,
          height: height,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            clipBehavior: Clip.antiAlias,
            itemCount: tempSong.toJson().keys.length - 5,
            itemBuilder: (BuildContext context, int index) {
              String field = tempSong.toJson().keys.skip(5).elementAt(index);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SimpleTextField(
                  fieldLabel: field.prettify(),
                  fieldHint: field.prettify(),
                  controller: controllers[field]!,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
  String prettify() => replaceAll("_", " ").toTitleCase();
}
