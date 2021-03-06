# Tip-Calculator
Tip calculator for Codepath University

# Pre-work - Tips

Tips is a tip calculator application for iOS.

Submitted by: Christopher Hayduk

Time spent: 15 hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

* [X] Allow user to enter number of people splitting the bill

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

UPDATED:

<img src='http://imgur.com/C0Q8ppu.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Creating the app went fairly smoothly, but I initially had issues with updating the NSUserDefaults. It took me some time to figure out how to get it to save the selected segment across both screens, but I was eventually able to see that I needed to setDouble() method on defaults in order set the tip percentage.

I later went back and added the optional features of having the keyboard appear automatically and saving the bill amount across restarts for 10 minutes. Both of these features were fairly easy to implement after having gone through the main parts of the apps.

## License

    Copyright [2015] [Christopher Hayduk]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
