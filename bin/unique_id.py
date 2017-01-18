#!/usr/bin/env python

from datetime import datetime as d
import hashlib

t = str(d.now())
print hashlib.sha1(t).hexdigest()[:5]
