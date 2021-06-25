import 'package:aula_textfield2/src/shared/widgets/shared_widgets.dart';
import 'package:aula_textfield2/src/shared/widgets/visible_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _nameController = TextEditingController();
  MaskedTextController _phoneController =
      MaskedTextController(mask: "(00)00000-0000");
  MaskedTextController _bornDateController =
      MaskedTextController(mask: "00/00/0000");
  TextEditingController _emailController = TextEditingController();
  MaskedTextController _cpfController =
      MaskedTextController(mask: "000.000.000-00");
  TextEditingController _passwordController = TextEditingController();
  FocusNode _passwordFocusNode = FocusNode();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _bornDateController.dispose();
    _emailController.dispose();
    _cpfController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CustomTextField(
                textInputAction: TextInputAction.next,
                labelText: "Nome",
                controller: _nameController,
              ),
              SizedBox(height: 8.0),
              CustomTextField(
                textInputAction: TextInputAction.next,
                labelText: "Telefone",
                controller: _phoneController,
                onEditingComplete: () {
                  FocusScope.of(context).nextFocus();
                },
                inputFormatters: [LengthLimitingTextInputFormatter(14)],
              ),
              SizedBox(height: 8.0),
              CustomTextField(
                textInputAction: TextInputAction.next,
                labelText: "Data de Nascimento",
                controller: _bornDateController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8.0),
              CustomTextField(
                textInputAction: TextInputAction.next,
                labelText: "E-mail",
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 8.0),
              CustomTextField(
                textInputAction: TextInputAction.next,
                labelText: "CPF",
                controller: _cpfController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8.0),
              CustomTextField(
                textInputAction: TextInputAction.next,
                labelText: "Senha",
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                obscureText: passwordVisible,
                suffixIcon: VisibleWidget(
                  visible: passwordVisible,
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),
              ),
              SizedBox(height: 8.0),
              CustomTextField(
                labelText: "Confirmar Senha",
                controller: _confirmPasswordController,
                suffixIcon: VisibleWidget(
                  visible: confirmPasswordVisible,
                  onPressed: () {
                    setState(() {
                      confirmPasswordVisible = !confirmPasswordVisible;
                    });
                  },
                ),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                },
                child: Text("Unfocuss"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
