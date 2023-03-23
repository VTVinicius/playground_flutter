import 'package:flutter/material.dart';

class FeaturesButton extends StatelessWidget {
  final String text;
  ImageProvider image = AssetImage("assets/img_features.png");
  final VoidCallback onPressed;
  Color buttonColor = Colors.green;
  Color textColor = Colors.black;

  FeaturesButton({
    super.key,
    required this.text,
    this.image = const AssetImage('assets/img_features.png'),
    required this.onPressed,
    this.buttonColor = Colors.green,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Para preencher toda a largura da tela
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: buttonColor,
          elevation: 10,

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  6) // Estilize o botão conforme necessário
              ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // Para alinhar texto e imagem
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                text,
                style: TextStyle(
                    color: textColor), // Estilize o texto conforme necessário
              ),
            ),
            Image(
              image: image,
              height: 50,
              width: 50, // Ajuste a altura da imagem conforme necessário
            ),
          ],
        ),
      ),
    );
  }
}
