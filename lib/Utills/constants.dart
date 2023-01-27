import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:form_field_validator/form_field_validator.dart';



FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
FirebaseAuth firebaseAuth=FirebaseAuth.instance;

FirebaseDatabase database = FirebaseDatabase.instance;


final requiredValidator = RequiredValidator(errorText: 'required');
final emailValidator=EmailValidator(errorText: 'enter a valid email');