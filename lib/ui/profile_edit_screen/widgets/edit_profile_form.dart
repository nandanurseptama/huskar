import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';

class EditProfileForm extends StatefulWidget {
  final BoxConstraints constraints;
  const EditProfileForm({super.key, required this.constraints});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.constraints.maxWidth,
      child: Form(
        child: Column(
          children: [
            getField(labelLeft: "Nama Depan", hint: "Masukkan nama depan anda"),
            getField(
                labelLeft: "Nama Belakang",
                hint: "Masukkan nama belakang anda"),
            getField(labelLeft: "Email", hint: "Masukkan email anda"),
            getField(labelLeft: "No Telpon", hint: "Masukkan no telpon anda"),
            getField(labelLeft: "No. KTP", hint: "Masukkan no KTP anda"),
            info(),
            const SizedBox(
              height: 34,
            ),
            buttonSave(),
          ],
        ),
      ),
    );
  }

  Widget buttonSave() {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(AppTheme.of(context).primaryColor),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide.none))),
            child: const Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text("Save"),
                      Positioned(
                        right: 12,
                        child: Icon(Icons.save),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget info() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          Icons.info,
          color: AppTheme.of(context).primaryColor,
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Text(
            "Pastikan profile anda terisi dengan benar, data pribadi anda terjamin keamanannya",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontFamily: AppTheme.proximaNovaFontFamily,
                color: const Color(0xff6a6a6a),
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

  Widget getField({
    required String labelLeft,
    String? labelRight,
    required String hint,
    TextEditingController? controller,
    FocusNode? focusNode,
    Widget? suffix,
    bool obSecure = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: labelRight != null ? 0 : 20, bottom: 16),
                  child: Text(
                    labelLeft,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.of(context).textPrimaryColor),
                  ),
                ),
              ),
              if (labelRight != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    labelRight,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.of(context).textSecondayColor),
                  ),
                ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  maxLines: 1,
                  obscureText: obSecure,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(left: 24, right: 24, top: 13),
                    hintText: hint,
                    suffixIcon: suffix,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
