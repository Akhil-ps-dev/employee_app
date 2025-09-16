import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/get_providers.dart';

class CreateUserPage extends ConsumerStatefulWidget {
  const CreateUserPage({super.key});

  @override
  ConsumerState<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends ConsumerState<CreateUserPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _avatarController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _avatarController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _avatarController.text.isNotEmpty) {
      ref
          .read(addUserProvider.notifier)
          .createUser(
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            email: _emailController.text,
            avatar: _avatarController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(addUserProvider, (_, state) {
      if (state is AsyncError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${state.error}')));
        debugPrint('Add user failed: ${state.error}');
      }
      if (state is AsyncData && state.value != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User created successfully!')),
        );
        debugPrint('Add user operation completed successfully.');
        Navigator.of(context).pop();
      }
    });

    final addUserState = ref.watch(addUserProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Create New User')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _avatarController,
                decoration: const InputDecoration(labelText: 'Avatar URL'),
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: addUserState.isLoading ? null : _submit,
                child: addUserState.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Create User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
