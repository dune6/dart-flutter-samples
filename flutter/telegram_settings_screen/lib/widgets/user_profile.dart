import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  UserProfile();

  final List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.favorite, 'Избранное'),
    MenuRowData(Icons.phone, 'Недавние звонки'),
    MenuRowData(Icons.computer, 'Устройства'),
    MenuRowData(Icons.folder, 'Папка с чатами'),
  ];

  final List<MenuRowData> secondMenuRow = [
    MenuRowData(Icons.notifications, 'Уведомления'),
    MenuRowData(Icons.security, 'Конфиденциальность'),
    MenuRowData(Icons.storage, 'Данные и память'),
    MenuRowData(Icons.format_paint, 'Оформление'),
    MenuRowData(Icons.language, 'Язык'),
  ];

  final List<MenuRowData> thirdMenuRow = [
    MenuRowData(Icons.watch, 'Android Watch'),
  ];

  final List<MenuRowData> fourthMenuRow = [
    MenuRowData(Icons.help, 'Помощь'),
    MenuRowData(Icons.question_answer_rounded, 'Вопросы о Application'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 236, 243),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Настройки'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          children: [
            const _UserInfo(),
            const SizedBox(
              height: 20,
            ),
            _MenuWidget(
              menuRow: firstMenuRow,
            ),
            const SizedBox(
              height: 20,
            ),
            _MenuWidget(menuRow: secondMenuRow),
            const SizedBox(
              height: 20,
            ),
            _MenuWidget(menuRow: thirdMenuRow),
            const SizedBox(
              height: 20,
            ),
            _MenuWidget(menuRow: fourthMenuRow)
          ],
        ),
      ),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;

  MenuRowData(this.icon, this.text);
}

class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;

  const _MenuWidget({Key? key, required this.menuRow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: menuRow.map((data) => _MenuWidgetRow(data: data)).toList(),
      ),
    );
  }
}

class _MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;

  const _MenuWidgetRow({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(data.icon),
          const SizedBox(
            width: 10,
          ),
          Expanded(child: Text(data.text)),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Column(
            children: const [
              SizedBox(
                height: 20,
              ),
              _AvatarWidget(),
              SizedBox(
                height: 20,
              ),
              _UserNameWidget(),
              SizedBox(
                height: 10,
              ),
              _UserPhoneWidget(),
              SizedBox(
                height: 10,
              ),
              _UserNicknameWidget(),
            ],
          ),
        ),
      ),
      const Positioned(
          top: 20,
          right: 20,
          child: Text(
            'Изм.',
            style: TextStyle(color: Colors.blue, fontSize: 17),
          ))
    ]);
  }
}

class _UserNicknameWidget extends StatelessWidget {
  const _UserNicknameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('@dune6');
  }
}

class _UserPhoneWidget extends StatelessWidget {
  const _UserPhoneWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '+7(123)456-78-90',
      style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Ilya Voznesensky',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 100,
      height: 100,
      child: Placeholder(),
    );
  }
}
