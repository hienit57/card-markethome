### Intl generator setup

* **Step 1:** add new string to [intl_en.arb](intl_en.arb) and [intl_vi.arb](intl_vi.arb) and another language (if have):
```dart
///'welcome': 'Welcome!'
```

* **Step 2:** active intl_utils global:
```bash
flutter pub global activate intl_utils
```

* **Step 3:** run following command:

Android Studio:
```bash
cd .. && cd .. && flutter pub global run intl_utils:generate
```

or (VS Code):

```bash
flutter pub global run intl_utils:generate
```

* **Step 4:** how to use? :

```
Text(S.of(context).welcome);
```

* **More Information:** 
* [Flutter Internationalization](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization)