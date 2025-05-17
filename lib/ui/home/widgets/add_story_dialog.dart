import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class AddStoryDialog extends StatefulWidget {
  const AddStoryDialog({super.key});

  @override
  State<AddStoryDialog> createState() => _AddStoryDialogState();
}

class _AddStoryDialogState extends State<AddStoryDialog> {
  final _titleKey = TextFieldKey('title');
  final _storyKey = TextFieldKey('story');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add a story'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Add a story to preserve it for posterity!'),
          const Gap(16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Form(
              onSubmit: (context, values) {
                context.pop(values);
              },
              child: Column(
                spacing: 12,
                children: [
                  FormTableLayout(
                    rows: [
                      FormField<String>(
                        key: _titleKey,
                        label: Text('Story title'),
                        child: TextField(placeholder: Text('That time I buyed a flaska')),
                      ),
                      FormField<String>(
                        key: _storyKey,
                        label: Text('Story'),
                        child: TextArea(
                          expandableWidth: true,
                          initialWidth: 400,
                          initialHeight: 200,
                          placeholder: Text('Once upon a time...'),
                        ),
                      ),
                    ],
                  ),
                  SubmitButton(child: const Text('Add')),
                ],
              ),
            ).withPadding(vertical: 16),
          ),
        ],
      ),
    );
  }
}
