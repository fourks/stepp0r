# Launchpad Step Sequencer

This will be a step sequencer for Renoise using the Launchpad.

## Structure

### Module

A module is something that is used by other Modules. 
Moste of the time that is something that writes something to the Launchpad.

#### Module fields

`self.is_active` and `self.is_not_active` will give you information if this module is activated or not.
Use them in your notifies and callbacks!

`self.is_first_run` and `self.first_run` will always be true till the first time `self._activate()` is called.
After `self._activate()` has finished, those values will be false.
While the first time `self._activate()` is called those values will be true.
Use them to control the wiring against notifies.

#### parts of a module

##### init

The init part is the part that holds the constructor and everything that should be used from outside.
Most of the time these are callbacks, setter (starte withe `wire` because it sound cooler) and 
un/register callback functions.

##### boot

The boot part is kinda fuzzy, in here are the `_activate` and `_deactivate` functions.
And most of the time all the functions that are called in those 2 functions.

##### lib / _functionality_

This part/s hold logic function that derive from the init and boot parts.

### Data

Modules have them too, and the convention is `<Modulename>Data`. 
It holds the Constant values for the modul or this artifact (Color or Note for example).
Its a dictionary (table).
For more complex objects it has a access key (containing the indecies to access parts of the complex object)

# Changelog

Version names by Estonian Marathon Champions

## 0.2 Rene Meimer

* cleaned up code
* add columns to chooser
* propper activate and deactivate behavior

## 0.1 Aare Kuum

* Basic usability works
    * Pattern Editor
    * Keyboard
    * Instrument chooser/muter
    * Pagination and Zooming works too
* You can use an osc server to hear the keyboard preview sounds
    