library features.auth.providers.auth_firebase;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:outmap/features/auth/infraestructure/repositories/auth_firebase_repository_impl.dart';

import '../../../domain/repositories/auth_firebase_repository.dart';
import '../../../infraestructure/errors/auth_errors.dart';

part 'auth_firebase_notifier.dart';
part 'auth_firebase_provider.dart';
part 'auth_firebase_state.dart';
