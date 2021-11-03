from setuptools import setup
from setuptools import find_packages

import sdl2promela

setup(
    name="sdl2promela",
    description="SDL 2 Promela translator, created within the scope of TASTE Model Checker Project financed by the European Space Agency",
    version=sdl2promela.__version__,
    packages=find_packages(),
    author="Michał Kurowski",
    author_email="mkurowski@n7space.com",
    url="https://github.com/n7space/sdl2promela",
    install_requires=["opengeode>=3.7.14"],
    python_requires=">=3.7",
    classifiers=[
        "Programming Language :: Python",
        "License :: OSI Approved :: GNU General Public License v3 (GPLv3)",
        "Operating System :: Linux"
    ],
    entry_points={
        'console_scripts': [
            'sdl2promela = sdl2promela.sdl2promela:main'
        ]
    }
)
