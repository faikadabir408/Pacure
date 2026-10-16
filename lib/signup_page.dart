import 'package:flutter/material.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final _businessName = TextEditingController();
  final _representative = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();
  final _city = TextEditingController();
  final _pan = TextEditingController();
  final _gstin = TextEditingController();
  final _password = TextEditingController();

  bool _obscurePassword = true;
  bool _identityVerified = false;
  bool _agreedToTerms = false;

  static const purple = Color(0xFF6C3CE9);
  static const backgroundPurple = Color(0xFF5120B8);

  @override
  void dispose() {
    _businessName.dispose();
    _representative.dispose();
    _email.dispose();
    _phone.dispose();
    _address.dispose();
    _city.dispose();
    _pan.dispose();
    _gstin.dispose();
    _password.dispose();
    super.dispose();
  }

  Widget sectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xFF211536),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget inputField({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    bool obscureText = false,
    Widget? suffixIcon,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF211536),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          obscureText: obscureText,
          maxLines: obscureText ? 1 : maxLines,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: purple),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: const Color(0xFFF8F6FC),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(
                color: Color(0xFFE5DDF2),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(
                color: Color(0xFFE5DDF2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(
                color: purple,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _submitRegistration() {
    if (!_formKey.currentState!.validate()) return;

    if (!_identityVerified) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please complete identity verification first.',
          ),
        ),
      );
      return;
    }

    if (!_agreedToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please accept the terms to continue.'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Form validated! Connect your registration backend next.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPurple,
      appBar: AppBar(
        backgroundColor: backgroundPurple,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Agency Registration'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.local_shipping_rounded,
                  size: 54,
                  color: Colors.white,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Register Your Agency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Join our delivery partner network',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFE3D6FF),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 25),

                // BUSINESS DETAILS
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      sectionTitle(
                        'Business Information',
                        'Tell us about your delivery agency.',
                      ),
                      const SizedBox(height: 22),

                      inputField(
                        label: 'Business / Agency Name',
                        hint: 'Enter registered business name',
                        icon: Icons.business_outlined,
                        controller: _businessName,
                        validator: (v) =>
                        v == null || v.trim().isEmpty
                            ? 'Business name is required'
                            : null,
                      ),
                      const SizedBox(height: 18),

                      inputField(
                        label: 'Authorized Representative',
                        hint: 'Full name',
                        icon: Icons.person_outline,
                        controller: _representative,
                        validator: (v) =>
                        v == null || v.trim().isEmpty
                            ? 'Representative name is required'
                            : null,
                      ),
                      const SizedBox(height: 18),

                      inputField(
                        label: 'Business Email',
                        hint: 'agency@example.com',
                        icon: Icons.email_outlined,
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (v) {
                          if (v == null ||
                              !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                                  .hasMatch(v.trim())) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),

                      inputField(
                        label: 'Mobile Number',
                        hint: 'Enter contact number',
                        icon: Icons.phone_outlined,
                        controller: _phone,
                        keyboardType: TextInputType.phone,
                        validator: (v) {
                          if (v == null ||
                              !RegExp(r'^[0-9]{10}$')
                                  .hasMatch(v.trim())) {
                            return 'Enter a 10-digit mobile number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),

                      inputField(
                        label: 'Business Address',
                        hint: 'Street, building, area',
                        icon: Icons.location_on_outlined,
                        controller: _address,
                        validator: (v) =>
                        v == null || v.trim().isEmpty
                            ? 'Address is required'
                            : null,
                      ),
                      const SizedBox(height: 18),

                      inputField(
                        label: 'City and PIN Code',
                        hint: 'e.g. Pune, 411001',
                        icon: Icons.location_city_outlined,
                        controller: _city,
                        validator: (v) =>
                        v == null || v.trim().isEmpty
                            ? 'City and PIN code are required'
                            : null,
                      ),
                      const SizedBox(height: 18),

                      inputField(
                        label: 'Create Password',
                        hint: 'At least 8 characters',
                        icon: Icons.lock_outline,
                        controller: _password,
                        obscureText: _obscurePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: purple,
                          ),
                        ),
                        validator: (v) =>
                        v == null || v.length < 8
                            ? 'Use at least 8 characters'
                            : null,
                      ),

                      const SizedBox(height: 28),

                      // DIGILOCKER SECTION
                      sectionTitle(
                        'Identity Verification',
                        'Verify the authorized representative.',
                      ),
                      const SizedBox(height: 14),

                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F0FF),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFFDCCBFF),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.stretch,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.verified_user_outlined,
                                  color: purple,
                                  size: 32,
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'DigiLocker Verification',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF211536),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Connect to an authorized DigiLocker '
                                  'verification flow to verify an eligible '
                                  'identity document with the user’s consent.',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 16),
                            OutlinedButton.icon(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'DigiLocker integration is not '
                                          'connected yet.',
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.open_in_new,
                              ),
                              label: const Text(
                                'Verify with DigiLocker',
                              ),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: purple,
                                side: const BorderSide(
                                  color: purple,
                                ),
                                padding:
                                const EdgeInsets.all(14),
                              ),
                            ),
                            const SizedBox(height: 8),
                            CheckboxListTile(
                              value: _identityVerified,
                              onChanged: (value) {
                                setState(() {
                                  _identityVerified = value ?? false;
                                });
                              },
                              contentPadding: EdgeInsets.zero,
                              controlAffinity:
                              ListTileControlAffinity.leading,
                              activeColor: purple,
                              title: const Text(
                                'Identity verification completed',
                                style: TextStyle(fontSize: 12),
                              ),
                              subtitle: const Text(
                                'Enable only after successful verification.',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 26),

                      // BUSINESS REGISTRATION DETAILS
                      sectionTitle(
                        'Business Documents',
                        'Additional details for agency review.',
                      ),
                      const SizedBox(height: 18),

                      inputField(
                        label: 'Business PAN (if applicable)',
                        hint: 'Enter business PAN',
                        icon: Icons.description_outlined,
                        controller: _pan,
                      ),
                      const SizedBox(height: 18),

                      inputField(
                        label: 'GSTIN (if applicable)',
                        hint: 'Enter GST identification number',
                        icon: Icons.receipt_long_outlined,
                        controller: _gstin,
                      ),

                      const SizedBox(height: 18),

                      CheckboxListTile(
                        value: _agreedToTerms,
                        onChanged: (value) {
                          setState(() {
                            _agreedToTerms = value ?? false;
                          });
                        },
                        activeColor: purple,
                        contentPadding: EdgeInsets.zero,
                        controlAffinity:
                        ListTileControlAffinity.leading,
                        title: const Text(
                          'I confirm that the information provided '
                              'is accurate and agree to the terms.',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),

                      const SizedBox(height: 14),

                      SizedBox(
                        height: 54,
                        child: ElevatedButton(
                          onPressed: _submitRegistration,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: purple,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            'Submit Registration',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  'Your agency will be activated after the required '
                      'verification and review.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFE3D6FF),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
