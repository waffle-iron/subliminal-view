#!/usr/bin/env python
#   This file is part of Subliminal View
#   Copyright (c) 2016, Subliminal View Developers
#
#   Please refer to CONTRIBUTORS.md for a complete list of Copyright
#   holders.
#
#   Subliminal View is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   Subliminal View is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program. If not, see <http://www.gnu.org/licenses/>.


import sys
from subprocess import Popen, PIPE

from kivy.app import App
from kivy.config import Config
from kivy.graphics import Color, Rectangle
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.floatlayout import FloatLayout
from kivy.uix.gridlayout import GridLayout
from kivy.uix.textinput import TextInput as BaseTextInput
from kivy.uix.button import Button


p = Popen(['wmctrl', '-d', '-G'], stdout=PIPE, stderr=PIPE)
stdout, stderr = p.communicate()
geometry = stdout.split()[3]
screenwidth = int(geometry.split('x')[0])
screenheight = int(geometry.split('x')[1])
windowwidth = int(screenwidth*0.8)
windowheight = 35
windowtop = screenheight-(windowheight+40)
windowleft = screenwidth-(windowwidth+15)
textinputwidth = windowwidth*0.7
buttonwidth = windowwidth*0.074
widgetspacing = windowwidth*0.003

Config.set('graphics', 'width', windowwidth)
Config.set('graphics', 'height', windowheight)
Config.set('graphics', 'resizable', 0)
Config.set('graphics', 'borderless', 1)
Config.set('graphics', 'position', 'custom')
Config.set('graphics', 'top', windowtop)
Config.set('graphics', 'left', windowleft)

dejavu = 'DejaVuSans'


class TextInput(BaseTextInput):
    def __init__(self, *args, **kwargs):
        super(TextInput, self).__init__(*args, **kwargs)

    def on_validate(self):
        self.focus = True

    def on_parent(self, widget, parent):
        self.focus = True


class SearchApp(App):

    def on_start(self):
        p = Popen(['wmctrl', '-r', ':ACTIVE:', '-b', 'add,above'],
                  stdout=PIPE, stderr=PIPE)

    def on_stop(self):
        p = Popen(['vim', '--servername', 'subliminal-view',
                   '--remote-send', '<Esc>:noh<CR>i'],
                  stdout=PIPE, stderr=PIPE)

    def callback(self, instance):
        for widget in self.root.walk():
            if widget.id == 'textinput':
                p = Popen(['vim', '--servername', 'subliminal-view',
                           '--remote-send', '<Esc>/%s<CR>' % widget.text],
                          stdout=PIPE, stderr=PIPE)
                widget.focus = True

    def _update_rect(self, instance, value):
        self.rect.pos = instance.pos
        self.rect.size = instance.size

    def build(self):
        self.root = GridLayout(cols=5, padding=(widgetspacing, 5),
                               spacing=(widgetspacing, 0))
        self.root.bind(size=self._update_rect, pos=self._update_rect)

        with self.root.canvas.before:
            Color(0.227, 0.227, 0.227, 1)
            self.rect = Rectangle(size=self.root.size, pos=self.root.pos)

        textinput = TextInput(id='textinput', size_hint_x=None,
                              width=textinputwidth, font_size=11,
                              font_name=dejavu, multiline=False)
        # textinput.focus = True
        textinput.bind(on_text_validate=self.callback)

        button_find = Button(text='Find', font_size=11, font_name=dejavu,
                             width=buttonwidth,
                             background_color=(0.55, 0.55, 0.55, 1))
        button_find.bind(on_press=self.callback)

        button_find_previous = Button(text='Find Prev', font_size=11,
                                      width=buttonwidth,
                                      background_color=(0.55, 0.55, 0.55, 1),
                                      font_name=dejavu)
        button_find_previous.bind(on_press=self.callback)

        button_find_all = Button(text='Find All', font_size=11,
                                 width=buttonwidth,
                                 background_color=(0.55, 0.55, 0.55, 1),
                                 font_name=dejavu)
        button_find_all.bind(on_press=self.callback)

        button_close = Button(text='x', font_size=11,
                              width=buttonwidth,
                              background_color=(0.55, 0.55, 0.55, 1),
                              font_name=dejavu)
        button_close.bind(on_press=self.stop)

        self.root.add_widget(textinput)
        self.root.add_widget(button_find)
        self.root.add_widget(button_find_previous)
        self.root.add_widget(button_find_all)
        self.root.add_widget(button_close)

        return self.root


if __name__ == '__main__':
    app = SearchApp()
    app.run()
