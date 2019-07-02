# ContextMenuExample
At WWDC 2019 [What's New in iOS Design](https://developer.apple.com/videos/play/wwdc2019/808/), Apple introduced ContextMenu. This is a demo app of ContextMenu. Long press on the image and you'll see the options.

During the Beta release, it seems like only works on simulatotrs. You'll get unsolved `Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '+[UIMenu menuWithTitle:image:identifier:options:children:]: unrecognized selector sent to class 0x1f1002cd0'` in virtual device.