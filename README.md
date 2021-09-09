# ![Logo](web/favicon.png) Guerrilla Mail Mobile - Your unofficial Guerrilla Mail client

![Gitlab pipeline status](https://img.shields.io/gitlab/pipeline/TheOneWithTheBraid/guerrilla_mail/main?style=for-the-badge) ![F-Droid](https://img.shields.io/f-droid/v/cf.theonewiththebraid.guerrilla_mail?style=for-the-badge)

Quickly receive anonymous and temporary mails using [Guerrilla Mail](https://guerrillamail.com/).

## Try it out

- Visit [the web version](https://theonewiththebraid.gitlab.io/guerrilla_mail/).
- [Get it on F-Droid](https://f-droid.org/packages/cf.theonewiththebraid.guerrilla_mail/)
- [Direct download APK](https://gitlab.com/TheOneWithTheBraid/guerrilla_mail/-/jobs/artifacts/main/browse?job=build%3Aapk)
- [Direct download Debian archive](https://gitlab.com/TheOneWithTheBraid/guerrilla_mail/-/jobs/artifacts/main/browse?job=build%3Adebian)
- [Direct download Linux binaries](https://gitlab.com/TheOneWithTheBraid/guerrilla_mail/-/jobs/artifacts/main/browse?job=build%3Alinux)

## Changelog

See [CHANGELOG.md](CHANGELOG.md).

## Build yourself

Currently, all officially supported Flutter platforms are compatible; this is

- Android
- iOS
- Linux
- macOS
- Windows
- web

For all these platforms, you can build it yourself.

To do so, install [Flutter](https://flutter.dev) and follow these steps:

```shell
# load required dependencies
flutter pub get

# see the device you want to use
flutter devices

# finally run the app
flutter run -d YOUR_DEVICE 
```

## License

This project is EUPL-1.2 licensed. For further information, consult [LICENSE](LICENSE).