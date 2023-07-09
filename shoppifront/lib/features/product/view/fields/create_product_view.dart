import 'package:flutter/material.dart';
import 'package:shoppifront/core/view/widget/picker/number_picker.dart';
import 'package:shoppifront/core/view/widget/textfield/outline_text_field.dart';
import 'package:shoppifront/features/product/model/product.dart';

class CreateProductView extends StatefulWidget {
  final void Function(Product model) onComplete;

  const CreateProductView({super.key, required this.onComplete});
  @override
  _CreateProductViewState createState() => _CreateProductViewState();
}

class _CreateProductViewState extends State<CreateProductView> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final TextEditingController priceController;
  late final TextEditingController imageController;
  late final TextEditingController weightController;
  late final Product model;
  late final GlobalKey<FormState> formKey;
  bool _autoValidate = false;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: "Vb123123");
    descriptionController = TextEditingController(text: "sample");
    priceController = TextEditingController(text: "100");
    imageController = TextEditingController(
        text: "https://source.unsplash.com/1600x900/?pasta");
    weightController = TextEditingController(text: "100");
    model = Product();
    formKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode:
          _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      child: ListView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
        children: <Widget>[
          titleTF(),
          emptyHeight,
          descTF(),
          emptyHeight,
          priceTF(),
          emptyHeight,
          imageTF(),
          emptyHeight,
          weightTF(),
          emptyHeight,
          buildListTileTotal(),
          buttonsRow()
        ],
      ),
    );
  }

  ListTile buildListTileTotal() {
    return ListTile(
      title: Text("Total"),
      subtitle: SizedBox(
          child: NumberPicker(
        number: 0,
        minValue: 10,
        onChanged: (value) {
          // TODO: aaa
          // model.total = value.toDouble();
        },
      )),
    );
  }

  Row buttonsRow() {
    return Row(
      children: <Widget>[
        Spacer(),
        Expanded(
          child: Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.end,
            alignment: WrapAlignment.end,
            children: <Widget>[showImageButton, saveButton],
          ),
        )
      ],
    );
  }

  OutlineTextField imageTF() {
    return OutlineTextField(
        onValidator: urlValidator,
        controller: imageController,
        icons: Icons.image,
        validate: this._autoValidate,
        labelText: "Product Image");
  }

  OutlineTextField priceTF() {
    return OutlineTextField(
        controller: priceController,
        icons: Icons.attach_money,
        validate: this._autoValidate,
        onValidator: minimumValueValidator,
        // inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        labelText: "Product Price");
  }

  OutlineTextField descTF() {
    return OutlineTextField(
        controller: descriptionController,
        icons: Icons.description,
        validate: this._autoValidate,
        onValidator: emptyValueValidator,
        labelText: "Product Description");
  }

  OutlineTextField titleTF() {
    return OutlineTextField(
        controller: titleController,
        icons: Icons.title,
        validate: this._autoValidate,
        onValidator: (data) => emptyValueValidator(data),
        labelText: "Product Title");
  }

  OutlineTextField weightTF() {
    return OutlineTextField(
        controller: weightController,
        icons: Icons.title,
        validate: this._autoValidate,
        // inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        onValidator: minimumValueValidator,
        labelText: "Product Weight");
  }

  String? urlValidator(String? data) =>
      data == null || data.isNotEmpty && Uri.parse(data).isAbsolute
          ? null
          : "This field required or url is not validate.";

  String? emptyValueValidator(String? data) =>
      data == null || data.isEmpty ? "This field is required." : null;

  String? minimumValueValidator(String? data) =>
      data == null || data.isEmpty || double.tryParse(data) == 0
          ? "This field is required also minumum value 1 or higher"
          : null;

  void showImage() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Image.network(
          imageController.text,
          loadingBuilder: (context, child, loadingProgress) =>
              loadingProgress == null
                  ? child
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: Center(child: CircularProgressIndicator())),
          errorBuilder: (context, error, stackTrace) => Text("Not Found"),
        ),
      ),
    );
  }

  Widget get saveButton => FloatingActionButton.extended(
      onPressed: () {
        onConfirmModel();
      },
      label: Text("Save"));

  Widget get showImageButton => FloatingActionButton.extended(
      onPressed: () => showImage(), label: Text("Show Image"));

  void onConfirmModel() {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();

      widget.onComplete(model.copyWith(
          price: double.parse(priceController.text),
          title: titleController.text,
          image: imageController.text,
          weight: int.tryParse(weightController.text) ?? 500));
      Navigator.of(context).pop();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  Widget get emptyHeight =>
      SizedBox(height: MediaQuery.of(context).size.height * 0.05);

  @override
  void dispose() {
    super.dispose();
  }
}
