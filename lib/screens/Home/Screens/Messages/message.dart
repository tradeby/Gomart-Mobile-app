import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import '../../../../styles/styles.dart';
import '../../../Empty-state/empty_state_screen.dart';

/*class MessageFragment extends StatelessWidget {
  const MessageFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackground,
      appBar: AppBar(
        backgroundColor: Styles.colorWhite,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Messages',
          style: TextStyle(color: Styles.colorBlack, fontSize: 16),
        ),
      ),
      body: Column(
        children: const [
          Padding(padding: EdgeInsets.all(18)),
          SingleChildScrollView(
            child: EmptyStateScreen(
              assetImageUrl: 'assets/images/empty_state_no_messages.png',
              title: 'No Messages',
              subTitle:
                  'You\'ll see messages between you and sellers here. There isn\'t any message at the moment',
            ),
          ),
        ],
      ),
    );
  }
}*/
class MessageFragment extends StatefulWidget {
  const MessageFragment({
    Key? key,
  }) : super(key: key);

  @override
  State<MessageFragment> createState() => _MessageFragmentState();
}

class _MessageFragmentState extends State<MessageFragment> {
  late final _listController = StreamChannelListController(
    client: StreamChat.of(context).client,
    filter: Filter.in_(
      'members',
      [StreamChat.of(context).currentUser!.id],
    ),
    sort: const [SortOption('last_message_at')],
    limit: 20,
  );

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Styles.colorWhite, // navigation bar color
        statusBarColor:Styles.colorWhite, // status bar color
        statusBarIconBrightness:Brightness.dark,// status bar icons' color
        systemNavigationBarIconBrightness:Brightness.dark, //navigation bar icons' color
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.colorWhite,
          elevation: 0.2,
          centerTitle: true,
          title: const Text(
            'Messages',
            style: TextStyle(color: Styles.colorBlack, fontSize: 16),
          ),
        ),
        body: StreamChannelListView(
          controller: _listController,
          onChannelTap: (channel) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return StreamChannel(
                    channel: channel,
                    child: const ChannelPage(),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StreamChannelHeader(),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: StreamMessageListView(),
          ),
          StreamMessageInput(),
        ],
      ),
    );
  }
}
