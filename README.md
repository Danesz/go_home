# go_home

Programmatically triggering a "go to Home screen" action on Android and iOS

## Getting Started

By calling `GoHome.sendAppToHome()` in your Flutter application this plugin sends the app to the background (while triggering the proper lifecycle events).

This can be useful during testing, but also if you app has background capabilities (like background audio playback, or Picture-in-Picture (PiP) mode) and you would like to trigger that background mode programmatically. 
However, be aware of the risks! (see below)

## Risks

### iOS
- Apple is [against](https://tableless.github.io/exemplos/pdf/guidelines-interface-mobiles/MobileHIG.pdf) quitting an application (however this plugin is not really doing that, just sending the app to the background)

```agsl
Don’t Quit Programmatically

Never quit an iOS application programmatically because 
people tend to interpret this as a crash. However, if 
external circumstances prevent your application from 
functioning as intended, you need to tell your users 
about the situation and explain what they can do about it.

Depending on how severe the application malfunction is, 
you have two choices...
```

- It wasn't confirmed yet, if Apple would be ok with this code in a production app
- However, there are already apps in the store that use similar logic in certain scenarios. (e.g. when a video moves into PiP mode the app moves to the background)

### Android
- if there is no default Home application selected on the device, it is possible that a "Home app selector" dialog will appear on the screen. (This is probably not the case for 99.9% percent of the users)