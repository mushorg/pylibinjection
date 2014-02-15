from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

sourcefiles = ['src/pylibinjection.pyx',
               'submodules/libinjection/c/libinjection_sqli.c']

setup(
    name="pylibinjection",
    packages=[],
    version="0.2.2",
    description="Libinjection Python wrapper",
    url="https://github.com/glastopf/pylibinjection/",
    author="Angelo Dell'Aera",
    author_email="angelo.dellaera@honeynet.org",
    classifiers=[
        "Programming Language :: Cython",
        "Development Status :: 3 - Alpha",
        "Environment :: Console",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: GNU Library or Lesser General Public License (LGPL)",
        "Operating System :: Unix",
        "Topic :: Software Development :: Libraries :: Python Modules",
        "Topic :: Security",
    ],
    cmdclass={'build_ext': build_ext },
    ext_modules=[Extension("pylibinjection",
                           sourcefiles,
                           include_dirs=["submodules/libinjection/c"],
                           library_dirs=["submodules/libinjection/c"]
    )
    ]
)
