# vim:fileencoding=utf-8:noet
from __future__ import (unicode_literals, division, absolute_import, print_function)

from collections import namedtuple

from powerline.lib.threaded import KwThreadedSegment
from powerline.segments import with_docstring

LOGO: str = "\uf6ed "

import os

_MaildirKey = namedtuple('Key', 'inbox')

class MailDirSegment(KwThreadedSegment):
	interval = 10

	@staticmethod
	def key(inbox, **kwargs):
		return _MaildirKey(inbox)

	def count_mail(self, inbox, folder):
		return sum(len(files) for _, _, files in os.walk(f"{inbox}/{folder}"))
		#return len([name for name in os.listdir(f"{inbox}/{folder}") if os.path.isfile(name)])

	def compute_state(self, key):
		if os.path.isdir(key.inbox):
			unread_count = self.count_mail(key.inbox, 'new')
			mail_count = self.count_mail(key.inbox, 'cur') + unread_count
			return f"{unread_count}/{mail_count}"
		else:
			return None

	@staticmethod
	def render_one(count, **kwargs):
		if count == None:
			return []
		else:
			return [{
		 		'contents': f"{LOGO} {count}",
				'highlight_groups': ['email_alert'],
			}]


maildir = with_docstring(MailDirSegment(),
('''Return unread e-mail count for Maildir INBOX.

:param str inbox:
	inbox

Highlight groups used: ``email_alert_gradient`` (gradient), ``email_alert``.
'''))
