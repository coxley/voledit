voledit
=======

Description
-----------

voledit.sh is a simple shell-script wrapper around amixer, xbacklight, and
volnoti (specifically hcchu_'s fork that adds arbritary icon support).

Thanks to volnoti, this displays an on-screen display (OSD) when increasing,
decreasing, or muting Master audio or backlight. Very similar to the Mac OS X
way.

.. _`hcchu`: https://github.com/hcchu/volnoti

Usage
-----

Just make executable, put in your ``PATH``, and use it like so::

    voledit.sh sound      (up|down|mute)
    voledit.sh brightness (up|down)

Ideally put binds in your .xbindkeysrc::

    "voledit.sh sound up"
            XF86AudioRaiseVolume
    "voledit.sh sound down"
            XF86AudioLowerVolume
    "voledit.sh sound mute"
            XF86AudioMute
    "voledit.sh brightness up"
            XF86MonBrightnessUp
    "voledit.sh brightness down"
            XF86MonBrightnessDown

License
-------

``DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE``
