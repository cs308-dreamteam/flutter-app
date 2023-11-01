import 'package:bragi/common/widgets/simple_title.dart';
import 'package:bragi/song_upload/manual_entry/widgets/additional_information_fields.dart';
import 'package:bragi/song_upload/manual_entry/widgets/additive_text_field.dart';
import 'package:bragi/song_upload/manual_entry/widgets/star_rating.dart';
import 'package:flutter/material.dart';

class ManualEntryScreen extends StatelessWidget {
  const ManualEntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SimpleTitle(
                    firstPart: "Enter",
                    secondPart: "Song",
                  ),
                  SizedBox(height: 32),
                  ManualEntryForm(),
                  ElevatedButton(
                    // TODO: Adding song to database
                    onPressed: () => {},
                    child: Text("Submit"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ManualEntryForm
class ManualEntryForm extends StatefulWidget {
  const ManualEntryForm({super.key});

  @override
  State<ManualEntryForm> createState() => _ManualEntryFormState();
}

class _ManualEntryFormState extends State<ManualEntryForm> {
  TextEditingController titleController = TextEditingController();
  TextEditingController artistController = TextEditingController();
  TextEditingController albumController = TextEditingController();
  TextEditingController genreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        direction: Axis.vertical,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        children: [
          AdditiveTextField(
            label: "Title",
            controller: titleController,
          ),
          AdditiveTextField(
            label: "Artist(s)",
            controller: artistController,
          ),
          AdditiveTextField(
            label: "Album(s)",
            controller: albumController,
          ),
          AdditiveTextField(
            label: "Genre(s)",
            controller: genreController,
          ),
          const StarRating(),
          AdditionalInformationFields(),
        ],
      ),
    );
  }
}
