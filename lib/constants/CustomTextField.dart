import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? imagePath; // For image path
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.imagePath,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44, // Set the height to 44
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 16, color: Color(0xFFC5C6C7)),
          suffixIcon: imagePath != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0), // Optional padding
                  child: Image.asset(
                    imagePath!,
                    height: 24,
                    width: 24,
                  ),
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10, // Adjust vertical padding
            horizontal: 12, // Adjust horizontal padding
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}

// phonenumber textfomfild

// import 'package:flutter/material.dart';

class PhoneWidget extends StatefulWidget {
  @override
  _PhoneWidgetState createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> {
  String _selectedCountryCode = '+91';
  final List<String> _countryCodes = ['+91', '+23', '+44', '+1'];

  void _selectCountryCode() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: _countryCodes.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_countryCodes[index]),
              onTap: () {
                setState(() {
                  _selectedCountryCode = _countryCodes[index];
                });
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 44,
      // margin: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 3.0),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a phone number';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                // contentPadding: const EdgeInsets.all(12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: 'Phone Number',
                hintStyle:
                    const TextStyle(fontSize: 16, color: Color(0xFFC5C6C7)),
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 0, minHeight: 0),
                prefixIcon: GestureDetector(
                  onTap: _selectCountryCode,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _selectedCountryCode,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                        const SizedBox(width: 5),
                        const Text('|',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
