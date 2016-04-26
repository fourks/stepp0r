---
layout: page_raw
title: Documentation
permalink: /documentation/
---

<div class="content" markdown='1'>

## Introduction

*Stepp0r* can be used as an easy to use interface for the tracking interface of 
[**Renoise**](http://www.renoise.com/).
It gives you basic usage to 
[**Renoise**](http://www.renoise.com/)
which already exists. 

> There is only one restriction : 
> InstrumentX will always be on TrackX

</div>


<div class="foo pure-g">
<div class="pure-u-1 pure-u-lg-1-2"><div class="foo-img"> 
<img class="pure-img" src="{{ site.baseurl }}/assets/Launchpad-PatternEditorMode.svg" alt="Launchpad Parts" /> 
</div> </div>

<div class="pure-u-1 pure-u-lg-1-2">
<div class="foo-header" markdown='1'>

## Pattern Edit mode

The first mode you see, to *edit* the **Pattern** selected in **Renoise**.

<div class="foo-toc" markdown='1'>
* [Keyboard](#keyboard)
* [Instruments / Tracks](#instruments--tracks)
* [Pattern Area](#pattern-edit-area)
* [Effects](#pattern-effects)
    * [Delay](#delay)
    * [Volume](#volume)
    * [Panning](#panning)
* [Play/Recored/Stop](#playrecordstop)
</div>

</div>

</div>
<img class="foo-img-alt pure-img" src="{{ site.baseurl }}/assets/Launchpad-PatternEditorMode.svg" alt="Launchpad Parts" /> 
</div>


<div class="content" markdown='1'>

### Keyboard

For Playing Tones.

> You have to start an OSC Server on the port you configured to hear the tones.

The last key you've pressed is blinking and will be used to edit the **Pattern Edit Area**.

On the top left and right you can change the octave, which is displayed as an yellow button in the 
second row.

### Instruments / Tracks

You can choose the different Instruments here. 
Choosing a new Instrument will update the **Pattern Edit Area**.

The **Instrument-Row** is paged. 

On the right you can toggle between **choose** and **mute**.

> Changing an instrument/track will also change the focus in on the **Pattern Editor**.

> Changing the track in **Renoise** will also change the selection in **Stepp0r**.

### Pattern Edit Area

When you hit play and you select the actual pattern in the **Pattern Matrix**, you will see a green light running 
from left to right, which represents the current play position.

You have **Pagination** and **Zooming** for this Area.

Pressing keys will place or remove a note (using the **Keyboard** and **Effects**) at this specific place.

You can choose use up to 4 different **Note Columns** per track.

### Pattern Effects 

To change the **Delay/Volume/Panning**.
You can toggle through the different Effect on the right side.

#### Delay 

* On the first key you will put in the full step.
* On the 5th key in the row, you will delay the tone by half the time of the step.
* On the 7th key in the row, you will delay the tone by 3/4 the time of the step.
etc.

#### Panning

Is centered in the middle.
If you want to center the panning again, just press the panning again.

#### Volume

very obvious.


### Play/Record/Stop

There is one button for all three commands.
Press the button once starts playing.
Pressing the button again and again will toggle between play and record.
If you want to stop to play, you have to hold the button for a while.





</div>


<div class="foo pure-g">
<div class="pure-u-1 pure-u-lg-1-2"><div class="foo-img"> 
<img class="pure-img" src="{{ site.baseurl }}/assets/Launchpad-CopyPasteMode.svg" alt="Launchpad Copy/Paste Mode Parts" />
</div> </div>

<div class="pure-u-1 pure-u-lg-1-2">
<div class="foo-header" markdown='1'>

## Copy/Paste Mode 

This mode lets you copy paste sections of you Pattern. 

<div class="foo-toc" markdown='1'>
* [Bank](#bank)
    * [Copy Paste Types](#copy-paste-types)
* [Copy Selection Area](#copy-selection-area)
* [Copy/Paste Effects](#copypaste-effects)
* [Play/Recored/Stop](#playrecordstop)
</div>

</div>

</div>
<img class="foo-img-alt pure-img" src="{{ site.baseurl }}/assets/Launchpad-CopyPasteMode.svg" alt="Launchpad Copy/Paste Mode Parts" />
</div>

<div class="content" markdown='1'>





### Bank

You have 8 Banks, where you can store selections.
You can clear every Bank by using the first 4 red button and following 4 green buttons, 
below the selected bank.
By pressing the flashing button in the bank (your selected bank) 
you can switch between copy and paste mode.
The pattern you copy can be used across all other instruments.

#### Copy Paste Types

You have 4 types of copy paste selection to copy all notes in a line 
(the ones with the green clear buttons)
and 4 types to copy only one note per line 
(the ones with the red clear buttons).

### Copy Selection Area

Here you can insert and select your patterns, according to the mode you've selected.

### Copy/Paste Effects

Don't do anything right now.




</div>


<div class="foo pure-g">
<div class="pure-u-1 pure-u-lg-1-2"><div class="foo-img"> 
<img class="pure-img" src="{{ site.baseurl }}/assets/Launchpad-PatternMatrix.svg" alt="Launchpad Pattern Matrix Parts" />
</div> </div>

<div class="pure-u-1 pure-u-lg-1-2">
<div class="foo-header" markdown='1'>

## Pattern Matrix Mode

This mode is for arranging patterns. 
It is influenced by [Ableton Live](https://www.ableton.com/),
[Live Dive](http://www.renoise.com/tools/live-dive) and the 
[Grid Pie](http://www.renoise.com/tools/grid-pie) plugin, but optimized for producing. 
To use this mode you have to set the **Pattern Mix** parameter to 2 or 1. 

<div class="foo-toc" markdown='1'>
* [Play/Recored/Stop](#playrecordstop)
* [Copy and Delete](#copy-and-delete)
* [Scene buttons](#scene-buttons)
    * [Scene Meta commands](#scene-meta-commands)
</div>

</div>

</div>
<img class="foo-img-alt pure-img" src="{{ site.baseurl }}/assets/Launchpad-PatternMatrix.svg" alt="Launchpad Pattern Matrix Parts" />
</div>

<div class="content" markdown='1'>

### Copy and Delete

You have a copy and a delete button.
Holding the button will change the color of the scene buttons. 

Holding the copy button will copy the actual played pattern to the new selected one.
The delete button will delete the new selected pattern.

The Scene buttons will also take the copy and delete buttons into account.

### Scene buttons

The scene buttons will select the complete row.

#### Scene Meta commands

Meta commands only work in combination with the scene buttons.

##### Insert new row

* press the Copy Button
* press the Delete Button
* press the scene Button where you want to enter the row

##### remove new row

* press the Delete Button
* press the Copy Button
* press the scene Button you want to be removed

</div>