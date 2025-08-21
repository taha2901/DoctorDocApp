import 'package:doc/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:iconsax/iconsax.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class Message {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  Message({required this.text, required this.isUser, required this.timestamp});
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  late GenerativeModel _model;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Message> _messages = [];
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _initializeAIModel();

    // رسالة ترحيب عامة
    _addMessage(
      'مرحباً! أنا Medi Bot، مساعدك الطبي الذكي. اسألني عن الأعراض الشائعة، الأدوية وآثارها، الفحوصات، نمط الحياة، أو الإسعافات الأولية. '
      'مهم: لست بديلاً عن الطبيب، وفي الحالات الطارئة اتصل بالطوارئ فوراً.',
      false,
    );
  }

  // Future<void> _initializeAIModel() async {
  //   // ⚠️ أمان: وفّر المفتاح بمتغير بيئة أو عبر secret manager، ولا تضعه صريحًا في الكود.
  //   // شغّل التطبيق مع:
  //   // flutter run --dart-define=GEMINI_API_KEY=YOUR_KEY
  //   const apiKey = String.fromEnvironment('GEMINI_API_KEY', defaultValue: '');
  //   if (apiKey.isEmpty) {
  //     debugPrint('❗ GEMINI_API_KEY is empty. Provide it via --dart-define.');
  //   }

  //   _model = GenerativeModel(
  //     model: 'gemini-1.5-flash',
  //     apiKey: apiKey,
  //     generationConfig:  GenerationConfig(
  //       maxOutputTokens: 1000,
  //       temperature: 0.7,
  //       topP: 0.8,
  //       topK: 10,
  //     ),
  //   );
  // }

  Future<void> _initializeAIModel() async {
    const apiKey = 'AIzaSyBXAbOtFoxQ1yDfOuINGdG4uKh5EekrBJI';
    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
      generationConfig: GenerationConfig(
        maxOutputTokens: 1000,
        temperature: 0.7,
        topP: 0.8,
        topK: 10,
      ),
    );
  }


  void _addMessage(String text, bool isUser) {
    if (!mounted) return;
    setState(() {
      _messages.add(
        Message(text: text, isUser: isUser, timestamp: DateTime.now()),
      );
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    _controller.clear();
    _addMessage(text, true);

    setState(() {
      _isTyping = true;
    });

    try {
      final response = await _getBotResponse(text);
      if (!mounted) return;
      setState(() => _isTyping = false);
      _addMessage(response, false);
    } catch (e) {
      debugPrint('Error: $e');
      if (!mounted) return;
      setState(() => _isTyping = false);
      _addMessage('عذراً، حدث خطأ. يرجى المحاولة مرة أخرى.', false);
    }
  }

  Future<String> _getBotResponse(String userMessage) async {
    try {
      final prompt = """
أنت مساعد طبي ذكي اسمه "Medi Bot". تخاطب المستخدم بالعربية المبسّطة.
المهام:
1) شرح عام للأعراض الشائعة وأسبابها المحتملة (بدون تشخيص نهائي).
2) تقديم معلومات عن الفحوصات المناسبة (متى تُطلب وماذا تقيس).
3) توضيح استخدام الأدوية الشائعة وآثارها الجانبية والتحذيرات العامة وتداخلاتها الشائعة.
4) إرشادات نمط الحياة: تغذية، نوم، نشاط بدني، عادات صحية، والوقاية.
5) إسعافات أولية مبسطة للظروف الشائعة (نزيف بسيط، التواء، حمى، حروق خفيفة...).
6) التنبيه متى يجب مراجعة الطبيب أو الذهاب للطوارئ.
7) الدعم النفسي والطمأنة بلغة محترمة، وتشجيع المتابعة الطبية.

حدود الأمان:
- لا تقدم تشخيصاً نهائياً أو وصفات دوائية، ولا تطلب جرعات مخصّصة.
- لا تطلب إيقاف دواء أو تغييره؛ قل دائماً: "استشر طبيبك/صيدليك".
- في الأعراض الخطيرة (ألم صدر شديد، ضيق نفس، أعراض سكتة، نزيف لا يتوقف، فقدان وعي...) اطلب التوجّه للطوارئ فوراً أو الاتصال بخدمات الطوارئ.
- اطلب معلومات أساسية عند الحاجة (العمر، الجنس، أمراض مزمنة، أدوية حالية، حساسية أدوية، مدة الأعراض).

أسلوب الإجابة:
- قصير ومنظم بنقاط عند الحاجة.
- أعطِ بدائل عملية وآمنة في المنزل عندما يكون ذلك مناسباً.
- إذا كان سؤال المستخدم غير واضح، اذكر الافتراضات المعقولة في سطر قصير ثم قدّم نصيحة عامة آمنة.

سؤال المستخدم: $userMessage
""";

      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      return response.text ??
          'عذراً، لم أفهم سؤالك جيداً. هل يمكنك توضيحه أو ذكر العمر والحالة الصحية والأدوية الحالية إن وُجدت؟';
    } catch (e) {
      debugPrint('API Error: $e');
      throw Exception('خطأ في الاتصال مع الذكاء الاصطناعي');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Iconsax.arrow_left, color: Colors.white),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ColorsManager.mainBlue.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.medical_information,
                color: ColorsManager.mainBlue,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Medi Bot',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'مساعدك الطبي الذكي',
                  style: TextStyle(fontSize: 12, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: ColorsManager.mainBlue,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ColorsManager.mainBlue, ColorsManager.mainBlue],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length + (_isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _messages.length && _isTyping) {
                  return _buildTypingIndicator();
                }
                final message = _messages[index];
                return _buildMessageBubble(message);
              },
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment:
            message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!message.isUser) ...[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ColorsManager.mainBlue, ColorsManager.mainBlue],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ColorsManager.mainBlue.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(Icons.medical_information,
                  size: 20, color: Colors.white),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                gradient: message.isUser
                    ? LinearGradient(
                        colors: [
                          ColorsManager.mainBlue,
                          ColorsManager.mainBlue,
                        ],
                      )
                    : null,
                color: message.isUser ? null : Colors.white,
                borderRadius: BorderRadius.circular(20).copyWith(
                  bottomLeft: message.isUser
                      ? const Radius.circular(20)
                      : const Radius.circular(4),
                  bottomRight: message.isUser
                      ? const Radius.circular(4)
                      : const Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: message.isUser ? Colors.white : Colors.black87,
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
            ),
          ),
          if (message.isUser) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(Icons.person, size: 20, color: Colors.grey[600]),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [ColorsManager.mainBlue, ColorsManager.mainBlue],
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.medical_information,
                size: 20, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(20).copyWith(bottomLeft: const Radius.circular(4)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTypingDot(0),
                const SizedBox(width: 4),
                _buildTypingDot(1),
                const SizedBox(width: 4),
                _buildTypingDot(2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingDot(int index) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0.5, end: 1.0),
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: ColorsManager.mainBlue,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
      onEnd: () {
        if (mounted) setState(() {});
      },
    );
  }

  Widget _buildInputArea() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText:
                        'اسأل عن أعراض، أدوية، فحوصات، نمط حياة، أو إسعافات أولية...',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                  onSubmitted: (_) => _sendMessage(),
                  textInputAction: TextInputAction.send,
                  maxLines: null,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ColorsManager.mainBlue, ColorsManager.mainBlue],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ColorsManager.mainBlue.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: _isTyping ? null : _sendMessage,
                icon: Icon(
                  _isTyping ? Icons.hourglass_empty : Icons.send,
                  color: Colors.white,
                ),
                splashRadius: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
