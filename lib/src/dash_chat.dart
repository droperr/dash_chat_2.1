part of dash_chat_2;

/// {@category Entry point}
class DashChat extends StatelessWidget {
  const DashChat({
    required this.currentUser,
    required this.onSend,
    required this.messages,
    this.toolbarBuilder,
    this.emptyMessageBuilder = const Center(),
    this.inputOptions = const InputOptions(),
    this.messageOptions = const MessageOptions(),
    this.messageListOptions = const MessageListOptions(),
    this.quickReplyOptions = const QuickReplyOptions(),
    this.scrollToBottomOptions = const ScrollToBottomOptions(),
    this.readOnly = false,
    this.typingUsers,
    Key? key,
  }) : super(key: key);

  /// The current user of the chat
  final ChatUser currentUser;

  /// Function to call when the user sends a message
  final void Function(ChatMessage message) onSend;

  /// List of messages visible in the chat
  final List<ChatMessage> messages;

  /// Options to customize the behaviour and design of the chat input
  final InputOptions inputOptions;

  /// Options to customize the behaviour and design of the messages
  final MessageOptions messageOptions;

  /// Options to customize the behaviour and design of the overall list of message
  final MessageListOptions messageListOptions;

  /// Options to customize the behaviour and design of the quick replies
  final QuickReplyOptions quickReplyOptions;

  /// Options to customize the behaviour and design of the scroll-to-bottom button
  final ScrollToBottomOptions scrollToBottomOptions;

  /// Option to make the chat read only, it will hide the input field
  final bool readOnly;

  /// List of users currently typing in the chat
  final List<ChatUser>? typingUsers;

  /// Builder to create an empty chat display
  final Widget emptyMessageBuilder;

  /// Builder to create your own custom toolbar
  final Widget? toolbarBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: messages.isEmpty
              ? emptyMessageBuilder
              : MessageList(
                  currentUser: currentUser,
                  messages: messages,
                  messageOptions: messageOptions,
                  messageListOptions: messageListOptions,
                  quickReplyOptions: quickReplyOptions,
                  scrollToBottomOptions: scrollToBottomOptions,
                  typingUsers: typingUsers,
                ),
        ),
        if (!readOnly)
          // ignore: always_specify_types
          {
            if (toolbarBuilder != null)
              // ignore: always_specify_types
              {toolbarBuilder}
            else
              InputToolbar(
                inputOptions: inputOptions,
                currentUser: currentUser,
                onSend: onSend,
              ),
          }
      ],
    );
  }
}
