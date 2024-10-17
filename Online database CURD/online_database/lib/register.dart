import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_database/loginscreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? _selectedGender;
  String? _selectedCity;
  late String firstName, lastName, email, password, gender, city;

  final List<String> _genders = ['Male', 'Female', 'Other'];
  final List<String> _cities = [
    'Rajkot',
    'Jamnagar',
    'Ahmedabad',
    'Gandhinagar',
    'Baroda'
  ];

  Future<void> _register() async {
    print("1");
    var url = Uri.parse("https://prakrutitech.buzz/Dhaval/signup.php");
    await http.post(url, body: {
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'password': password,
      'gender': gender,
      'city': city
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Register success")));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple, Colors.blue],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.0),
                  _buildTextFormField('First Name', _firstNameController),
                  SizedBox(height: 20.0),
                  _buildTextFormField('Last Name', _lastNameController),
                  SizedBox(height: 20.0),
                  _buildTextFormField('Email', _emailController, isEmail: true),
                  SizedBox(height: 20.0),
                  _buildTextFormField('Password', _passwordController,
                      isPassword: true),
                  SizedBox(height: 20.0),
                  _buildTextFormField2(
                      'Confirm Password', _confirmPasswordController,
                      isPassword: true),
                  SizedBox(height: 20.0),
                  _buildDropdown('Gender', _genders, _selectedGender,
                      (String? value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  }),
                  SizedBox(height: 20.0),
                  _buildDropdown('City', _cities, _selectedCity,
                      (String? value) {
                    setState(() {
                      _selectedCity = value;
                    });
                  }),
                  SizedBox(height: 40.0),
                  ElevatedButton(
                    onPressed: () {
                      firstName = _firstNameController.text;
                      lastName = _lastNameController.text;
                      email = _emailController.text;
                      password = _confirmPasswordController.text;
                      gender = _selectedGender!;
                      city = _selectedCity!;
                      _register();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.purple,
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label, TextEditingController controller,
      {bool isEmail = false, bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      style: TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _buildTextFormField2(String label, TextEditingController controller,
      {bool isEmail = false, bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      style: TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        }
        if (value != _passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? selectedItem,
      ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      value: selectedItem,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      dropdownColor: Colors.purple,
      style: TextStyle(color: Colors.white),
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a $label';
        }
        return null;
      },
    );
  }
}
