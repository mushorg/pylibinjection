from distutils.core import setup
from distutils.extension import Extension

try:
    from Cython.Distutils import build_ext
    has_cython = True
except ImportError:
    has_cython = False


if has_cython:
    sourcefiles = [
        'src/pylibinjection.pyx',
        'submodules/libinjection/c/libinjection_sqli.c'
    ]
    cmdclass = {'build_ext': build_ext}
else:
    sourcefiles = [
        'src/pylibinjection.c',
        'submodules/libinjection/c/libinjection_sqli.c']
    cmdclass = {}

setup(
    name="pylibinjection",
    packages=[],
    version="0.2.4",
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
    cmdclass=cmdclass,
    ext_modules=[Extension(
        "pylibinjection",
        sources=sourcefiles,
        include_dirs=["submodules/libinjection/c"],
        library_dirs=["submodules/libinjection/c"])
    ],
    install_requires=open('requirements.txt').read().splitlines(),
)
