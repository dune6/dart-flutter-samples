import 'address.dart';
import 'human.dart';

final humans = [
  Human(name: 'Илья', surname: 'Фамилия', age: 20, addresses: [
    Address(city: 'Москва', street: 'Баумана', house: '12a', flat: 12),
    Address(city: 'Киев', street: 'Одесская', house: '1', flat: 3),
    Address(
        city: 'Токио', street: 'Токийских гулей', house: '1000-7', flat: 993),
  ]),
  Human(name: 'Даня', surname: 'Surname', age: 20, addresses: [
    Address(city: 'Москва', street: 'Люблино', house: 'Метро Люблино', flat: 2),
    Address(city: 'Харьков', street: 'Харьковская', house: '228', flat: 1337),
    Address(
        city: 'Верхний Волочёк',
        street: 'Преображенская',
        house: '1b',
        flat: -1),
  ]),
];

const jsonString = '''
[
  {
     "first_name": "Илья",
     "surname": "Фамилия",
     "age": 20,
     "addresses": [
       {
          "city": "Москва",
          "street": "Баумана",
          "house": "12a",
          "flat": 12
       },
       {
          "city": "Киев",
          "street": "Одесская",
          "house": "1",
          "flat": 3
       },
       {
          "city": "Киев",
          "street": "Одесская",
          "house": "1",
          "flat": 3
       }
     ]
  },
  {
     "name": "Даня",
     "surname": "Surname",
     "age": 20,
     "addresses": [
       {
          "city": "Москва",
          "street": "Люблино",
          "house": "Метро Люблино",
          "flat": 2
       },
       {
          "city": "Харьков",
          "street": "Харьковская",
          "house": "228",
          "flat": 1337
       },
       {
          "city": "Верхний Волочёк",
          "street": "Преображенская",
          "house": "1b",
          "flat": -1
       }
     ]
  }
]
''';
