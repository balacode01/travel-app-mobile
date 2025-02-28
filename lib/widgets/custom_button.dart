import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final bool isLoading;

  const CustomAnimatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.black,
    this.textColor = Colors.white,
    this.isLoading = false,
  }) : super(key: key);

  @override
  _CustomAnimatedButtonState createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    if (!widget.isLoading) {
      setState(() {
        _scale = 0.95; // Slightly reduce the size when pressed
      });
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (!widget.isLoading) {
      setState(() {
        _scale = 1.0; // Return to normal size
      });
      widget.onPressed(); // Execute the button action
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel:
          () => setState(() => _scale = 1.0), // Reset if tap is canceled
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Matrix4.identity()..scale(_scale),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: widget.isLoading ? Colors.grey[400] : widget.color,
          borderRadius: BorderRadius.circular(15), // Oval shape
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        alignment: Alignment.center,
        child:
            widget.isLoading
                ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 2,
                  ),
                )
                : Text(
                  widget.text,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
      ),
    );
  }
}
