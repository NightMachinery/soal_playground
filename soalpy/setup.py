# -*- coding: utf-8 -*-
from setuptools import setup

packages = \
['soalpy']

package_data = \
{'': ['*']}

install_requires = \
['icecream>=2.1.0,<3.0.0', 'scikit-learn>=1.0.2,<2.0.0']

setup_kwargs = {
    'name': 'soalpy',
    'version': '0.1.0',
    'description': '',
    'long_description': None,
    'author': 'NightMachinary',
    'author_email': 'rudiwillalwaysloveyou@gmail.com',
    'maintainer': None,
    'maintainer_email': None,
    'url': None,
    'packages': packages,
    'package_data': package_data,
    'install_requires': install_requires,
    'python_requires': '>=3.7,<4.0',
}


setup(**setup_kwargs)
