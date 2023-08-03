import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsAccountScreen extends StatelessWidget {
  const SettingsAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AccountSection(),
              const DarkThemeSection(),
              SectionTitle('Permission'),
              ListTile(
                title: Text('Microphone access'),
                trailing: Checkbox(onChanged: (val){}, value: false),
              ),
              ListTile(
                title: Text('Location access'),
                trailing: Checkbox(onChanged: (val){}, value: false),
              ),
              ListTile(
                title: Text('Haptics'),
                trailing: Checkbox(onChanged: null, value: true),
              ),
              Divider(),
              SectionTitle('Notification'),
              ListTile(
                title: Text('Allow notifications'),
                trailing: Radio(groupValue: 'notifications', onChanged: (val){}, value: false),
              ),
              ListTile(
                title: Text('Turn off notifications'),
                trailing: Radio(groupValue: 'notifications', onChanged: (val){}, value: true),
              ),
            ],
          ),
        ));
  }
}

class DarkThemeSection extends StatelessWidget {
  const DarkThemeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Settings'),
        ListTile(
          leading: Icon(Icons.dark_mode,
            color: Theme.of(context).primaryColor,),
          title: Text('Dark Theme'),
          trailing: Switch(onChanged: (val){}, value: false),
        ),
        Divider(),
      ],
    );
  }
}

class AccountSection extends StatelessWidget {
  const AccountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Account'),
        ListTile(
          leading: CircleAvatar(child: Text('N')),
          title: Text('Naseer Aliyu'),
          subtitle: Text('+2348093446914'),
          trailing: FilledButton.tonal(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Sign out'),
                Icon(Icons.exit_to_app_sharp)
              ],
            ),
            onPressed: (){},
          ),
        ),
        Divider(),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title,{
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Text(title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary
          )),
    );
  }
}
