from setuptools import setup

from pip.req import parse_requirements


def get_requirements(filename):
    try:
        from pip.download import PipSession
        session = PipSession()
    except ImportError:
        session = None

    reqs = parse_requirements(filename, session=session)

    return [str(r.req) for r in reqs]


def get_install_requires():
    return get_requirements('requirements.txt')

setup_args = dict(
    name='foo-bar',
    version='0.0.1',
    packages=['foo', 'foo.plugins'],
)


if __name__ == '__main__':
    setup(**setup_args)
#wtf
