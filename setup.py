from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext


sourcefiles = ['src/pylibinjection.pyx', "/opt/libinjection/c/sqlparse.c"]


setup(
    name="pylibinjection",
    packages=[],
    version="0.1",
    description="Libinjection Python wrapper",
    url="",
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
    cmdclass={'build_ext': build_ext},
    ext_modules=[Extension("pylibinjection",
                           sourcefiles,
                           include_dirs=["/opt/libinjection/c"],
                           library_dirs=["/opt/libinjection/c"],
                           #libraries=["is_sqli"]
                           )
    ],
)
