#       _      _     _                          _       _
#  __ _| | ___(_)___| |_ ___ _ __    __ _ _   _| |_ ___| |__  _ __ _____      _____  ___ _ __
# / _` | |/ _ \ / __| __/ _ \ '__|  / _` | | | | __/ _ \ '_ \| '__/ _ \ \ /\ / / __|/ _ \ '__|
#| (_| | |  __/ \__ \ ||  __/ |    | (_| | |_| | ||  __/ |_) | | | (_) \ V  V /\__ \  __/ |
# \__,_|_|\___|_|___/\__\___|_|     \__, |\__,_|\__\___|_.__/|_|  \___/ \_/\_/ |___/\___|_|
#                                      |_|

import subprocess
import os
from qutebrowser.api import interceptor

# Youtube adblocking
def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (
        url.host() == "www.youtube.com"
        and url.path() == "/get_video_info"
        and "&adformat=" in url.query()
    ):
        info.block()

interceptor.register(filter_yt)

# Adblocker
config.load_autoconfig(True)
c.content.blocking.adblock.lists = [
        "https://easylist.to/easylist/easylist.txt",
        "https://easylist.to/easylist/easyprivacy.txt",
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt",
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2020.txt",
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/legacy.txt",
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt",
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt",
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt",
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/unbreak.txt",
        "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext&_=223428",
        "https://raw.githubusercontent.com/brave/adblock-lists/master/brave-lists/brave-social.txt",
        "https://raw.githubusercontent.com/brave/adblock-lists/master/brave-unbreak.txt"]

# Activate pdf reader
c.content.pdfjs = True

# Search engines
c.url.searchengines = { 'yan':          'https://yandex.com/?q={}',
                        'aw':           'https://wiki.archlinux.org/?search={}',
                        'goog':         'https://www.google.com/search?q={}',
                        're':           'https://www.reddit.com/r/{}',
                        'ub':           'https://www.urbandictionary.com/define.php?term={}',
                        'wiki':         'https://en.wikipedia.org/wiki/{}',
                        'yt':           'https://www.youtube.com/results?search_query={}',
                        'duck':         'https://duckduckgo.com/?q={}',
                        'tor':          'https://gw1.torlook.info/{}',
                        'nyaa':         'https://nyaa.si/?f=0&c=0_0&q={}',
                        'tseeker':      'https://torrentseeker.com/search.php?q={}',
                        'odysee':       'https://odysee.com/$/search?q={}',
                        'searchx':      'https://search.ononoki.org/search?q={}',
                        'brave':        'https://search.brave.com/search?q={}',
                        'DEFAULT':      'https://search.brave.com/search?q={}',
}

c.url.start_pages = 'https://search.brave.com/'

# Various Settings
c.tabs.background = True
c.fonts.default_family = 'Ubuntu Mono'
c.content.javascript.can_access_clipboard = True

# Bindings
config.bind('M',  'yank;; spawn /home/aleister/.local/scripts/browser/qutebrowser-yt-mpv.sh')
config.bind('tt', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')

# credits to theova/base16-qutebrowser for the original template

# Colors

bg_default = "#0d0d0d"          # main shade darkest
bg_lighter = "#111111"
bg_selection = "#202020"
fg_disabled = "#9f9f9f"
fg_default = "#ffffff"
bg_lightest = "#ffffff"         # main shade lightest
fg_error = "#fa2573"            # red
bg_hint = "#dfd460"             # yellow
fg_matched_text = "#97e123"     # green
bg_passthrough_mode = "#0f7fcf" # teal
bg_insert_mode = "#42a7cf"      # blue
bg_warning = "#8700ff"          # purple

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = fg_default

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = bg_lighter

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = bg_default

# Foreground color of completion widget category headers.
c.colors.completion.category.fg = bg_hint

# Background color of the completion widget category headers.
c.colors.completion.category.bg = bg_default

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = bg_default

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = bg_default

# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = fg_default

# Background color of the selected completion item.
c.colors.completion.item.selected.bg = bg_selection

# Top border color of the selected completion item.
c.colors.completion.item.selected.border.top = bg_selection

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = bg_selection

# Foreground color of the matched text in the selected completion item.
c.colors.completion.item.selected.match.fg = fg_matched_text

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = fg_matched_text

# Color of the scrollbar handle in the completion view.
c.colors.completion.scrollbar.fg = fg_default

# Color of the scrollbar in the completion view.
c.colors.completion.scrollbar.bg = bg_default

# Background color of disabled items in the context menu.
c.colors.contextmenu.disabled.bg = bg_lighter

# Foreground color of disabled items in the context menu.
c.colors.contextmenu.disabled.fg = fg_disabled

# Background color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.bg = bg_default

# Foreground color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.fg =  fg_default

# Background color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.bg = bg_selection

#Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.fg = fg_default

# Background color for the download bar.
c.colors.downloads.bar.bg = bg_default

# Color gradient start for download text.
c.colors.downloads.start.fg = bg_default

# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = bg_insert_mode

# Color gradient end for download text.
c.colors.downloads.stop.fg = bg_default

# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = bg_passthrough_mode

# Foreground color for downloads with errors.
c.colors.downloads.error.fg = fg_error

# Font color for hints.
c.colors.hints.fg = bg_default

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
c.colors.hints.bg = bg_hint

# Font color for the matched part of hints.
c.colors.hints.match.fg = fg_default

# Text color for the keyhint widget.
c.colors.keyhint.fg = fg_default

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = fg_default

# Background color of the keyhint widget.
c.colors.keyhint.bg = bg_default

# Foreground color of an error message.
c.colors.messages.error.fg = bg_default

# Background color of an error message.
c.colors.messages.error.bg = fg_error

# Border color of an error message.
c.colors.messages.error.border = fg_error

# Foreground color of a warning message.
c.colors.messages.warning.fg = bg_default

# Background color of a warning message.
c.colors.messages.warning.bg = bg_warning

# Border color of a warning message.
c.colors.messages.warning.border = bg_warning

# Foreground color of an info message.
c.colors.messages.info.fg = fg_default

# Background color of an info message.
c.colors.messages.info.bg = bg_default

# Border color of an info message.
c.colors.messages.info.border = bg_default

# Foreground color for prompts.
c.colors.prompts.fg = fg_default

# Border used around UI elements in prompts.
c.colors.prompts.border = bg_default

# Background color for prompts.
c.colors.prompts.bg = bg_default

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = bg_selection

# Foreground color for the selected item in filename prompts.
c.colors.prompts.selected.fg = fg_default

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = fg_matched_text

# Background color of the statusbar.
c.colors.statusbar.normal.bg = bg_default

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = bg_default

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = bg_insert_mode

# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = bg_default

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = bg_passthrough_mode

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = bg_default

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = bg_lighter

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = fg_default

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = bg_default

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = fg_default

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = bg_default

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = bg_default

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = bg_warning

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = bg_default

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = bg_insert_mode

# Background color of the progress bar.
c.colors.statusbar.progress.bg = bg_insert_mode

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = fg_default

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = fg_error

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = fg_default

# Foreground color of the URL in the statusbar on successful load
# (http).
c.colors.statusbar.url.success.http.fg = bg_passthrough_mode

# Foreground color of the URL in the statusbar on successful load
# (https).
c.colors.statusbar.url.success.https.fg = fg_matched_text

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = bg_warning

# Background color of the tab bar.
c.colors.tabs.bar.bg = bg_default

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = bg_insert_mode

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = bg_passthrough_mode

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = fg_error

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = fg_default

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = bg_lighter

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = fg_default

# Background color of unselected even tabs.
c.colors.tabs.even.bg = bg_default

# Background color of pinned unselected even tabs.
c.colors.tabs.pinned.even.bg = bg_passthrough_mode

# Foreground color of pinned unselected even tabs.
c.colors.tabs.pinned.even.fg = bg_lightest

# Background color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.bg = fg_matched_text

# Foreground color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.fg = bg_lightest

# Background color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.bg = bg_selection

# Foreground color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.fg = fg_default

# Background color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.bg = bg_selection

# Foreground color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.fg = fg_default

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = fg_default

# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = bg_selection

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = fg_default

# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = bg_selection
