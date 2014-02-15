Pylibinjection
==============

Pylibinjection is a wrapper for the Libinjection library (https://github.com/client9/libinjection).


Requirements
------------

* Python 2.5 or later
* cython


Installation
------------

::

    $ pip install pylibinjection

Usage
-----

::

    $ python
    >>> import pylibinjection
    >>> pylibinjection.detect_sqli("anything' OR 'x'='x';")


Developers
-----------

Pylinjection embeds libinjection as a submodule, which means that you must clone the repo with the `--recursive` option::

    $ git clone --recursive https://github.com/glastopf/pylibinjection.git


License information
-------------------

Copyright (C) 2013 Angelo Dell'Aera <buffer@antifork.org>

License: GNU General Public License, version 2 or later; see COPYING.txt included in this archive for details.
