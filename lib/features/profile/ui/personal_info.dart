import 'package:doc/core/di/dependency_injection.dart';
import 'package:doc/core/helpers/spacing.dart';
import 'package:doc/core/theming/colors.dart';
import 'package:doc/core/widgets/app_text_form_field.dart';
import 'package:doc/features/profile/data/model/profile_response_model/profile_data.dart';
import 'package:doc/features/profile/logic/profile_cubit.dart';
import 'package:doc/features/profile/logic/profile_state.dart';
import 'package:doc/features/profile/ui/widget/naming_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  bool _isEditing = false;
  late ProfileCubit _profileCubit;
  final formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _profileCubit = getit<ProfileCubit>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _profileCubit.getProfileData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _initializeControllers(ProfileData? profileData) {
    if (profileData != null) {
      _nameController.text = profileData.name ?? '';
      _emailController.text = profileData.email ?? '';
      _phoneController.text = profileData.phone ?? '';
    }
  }

  Widget _buildPasswordDisplay() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            children: [
              Text(
                '••••••••',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              Spacer(),
              Icon(Icons.edit, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }

  void _saveProfile(BuildContext context) {
    if (formKey.currentState!.validate()) {
      _profileCubit.updateProfile(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        password: _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _profileCubit,
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Profile updated successfully!'),
                backgroundColor: Colors.green,
              ),
            );
            setState(() {
              _isEditing = false;
            });
          } else if (state is UpdateProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.apiErrorModel.message ?? 'Update failed'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final profileResponse =
              ProfileCubit.get(context).profileResponseModel;
          final profileData = profileResponse?.data?.first;

          if (_nameController.text.isEmpty) {
            _initializeControllers(profileData);
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Personal Information'),
              centerTitle: true,
              elevation: 0,
              actions: [
                IconButton(
                  icon: Icon(_isEditing ? Icons.close : Icons.edit),
                  onPressed: () {
                    setState(() {
                      _isEditing = !_isEditing;
                      if (!_isEditing) {
                        _initializeControllers(profileData);
                        _passwordController.clear();
                      }
                    });
                  },
                ),
              ],
            ),
            body: Builder(
              builder: (context) {
                if (state is ProfileLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProfileError) {
                  return Center(
                    child: Text(
                        state.apiErrorModel.message ?? 'Error loading profile'),
                  );
                } else if (profileData == null) {
                  return const Center(child: Text('No data available'));
                }

                return Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const NamingTextField(
                                name: 'Name',
                              ),
                              verticalSpace(8),
                              _isEditing
                                  ? AppTextFormField(
                                      hintText: 'Enter your name',
                                      controller: _nameController,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Name is required';
                                        }
                                        return null;
                                      },
                                    )
                                  : Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 15),
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.grey[300]!),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              _nameController.text.isEmpty
                                                  ? 'No name'
                                                  : _nameController.text,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                          verticalSpace(20),
                      
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               const NamingTextField(name: 'Email',),
                              const SizedBox(height: 8),
                              _isEditing
                                  ? AppTextFormField(
                                      hintText: 'Enter your email',
                                      controller: _emailController,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Email is required';
                                        }
                                        if (!RegExp(
                                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                            .hasMatch(value)) {
                                          return 'Enter a valid email';
                                        }
                                        return null;
                                      },
                                    )
                                  : Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 15),
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.grey[300]!),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              _emailController.text.isEmpty
                                                  ? 'No email'
                                                  : _emailController.text,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                          verticalSpace(20) ,
                      
                          if (_isEditing) ...[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 const NamingTextField(name: 'New Password',),
                                const SizedBox(height: 8),
                                AppTextFormField(
                                  hintText: 'Enter new password',
                                  controller: _passwordController,
                                  isObscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password is required';
                                    }
                                    if (value.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            verticalSpace(20),
                          ] else ...[
                            _buildPasswordDisplay(),
                            verticalSpace(20),
                          ],
                      
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               const NamingTextField(name: 'Phone',),
                              verticalSpace(8),
                              _isEditing
                                  ? AppTextFormField(
                                      hintText: 'Enter your phone',
                                      controller: _phoneController,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Phone is required';
                                        }
                                        return null;
                                      },
                                    )
                                  : Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 15),
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.grey[300]!),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              _phoneController.text.isEmpty
                                                  ? 'No phone'
                                                  : _phoneController.text,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                          verticalSpace(30),
                      
                          Text(
                            'When you set up your personal information settings, you should use one to provide accurate information.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          verticalSpace(30),
                      
                          // Save Button (only show when editing)
                          if (_isEditing)
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: state is UpdateProfileLoading
                                    ? null
                                    : () => _saveProfile(context),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: ColorsManager.mainBlue,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: state is UpdateProfileLoading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white)
                                      : const Text(
                                          'Save Changes',
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.white),
                                        ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

