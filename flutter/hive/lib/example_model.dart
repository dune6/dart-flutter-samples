import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'example_model.g.dart';

class ExampleWidgetModel {
  void doSomeSecure() async {
    const secureStorage = FlutterSecureStorage();
    // if key not exists return null
    final encryprionKey = await secureStorage.read(key: 'key');
    if (encryprionKey == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: 'key',
        value: base64UrlEncode(key),
      );
    }
    final key = await secureStorage.read(key: 'key');
    final encryptionKey = base64Url.decode(key!);
    print('Encryption key: $encryptionKey');
    final encryptedBox = await Hive.openBox('vaultBox',
        encryptionCipher: HiveAesCipher(encryptionKey));
    await encryptedBox.put('secret', 'Hive is cool');
    print(encryptedBox.get('secret'));
  }

  void doSome() async {
    // // box - коллекция
    // var box = await Hive.openBox('testBox');
    // await box.put('name', 'John');
    // final name = box.get('name')  ?? 'null';
    // print(name);
    // await box.delete('name');
    // print(box.get('name')  ?? 'null');
    // box.close();
    //
    // // other methods...

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(PetAdapter());
    }
    // Hive.deleteBoxFromDisk('testBox');
    final box = await Hive.openBox<User>('testBox');
    final petBox = await Hive.openBox<Pet>('petBox');
    final pet1 = Pet('Mira');
    final pet2 = Pet('Melissa');

    petBox.addAll([pet1, pet2]);
    final pets = HiveList(petBox, objects: [pet1, pet2]);
    final user = User('Sam3', 53, pets);
    await box.put('user', user);
    print(box.values);
    print(box.get('user')?.pets);
    await box.compact();
    await petBox.compact();
    box.close();
    petBox.close();
  }
}

@HiveType(typeId: 0)
// extend HiveObject для
class User extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  HiveList<Pet> pets;

  User(this.name, this.age, this.pets);

  @override
  String toString() {
    return '$name age: $age';
  }
}

@HiveType(typeId: 1)
// extend HiveObject для save/delete
class Pet extends HiveObject {
  @HiveField(0)
  String name;

  Pet(this.name);

  @override
  String toString() {
    return '$name';
  }
}
