from distutils.core import setup, Extension

module1 = Extension('uniplug',
                    sources = ['Main.cpp'],
                    libraries=["../bin/ManagedBridge"],
					extra_compile_args=['/Zi'],
                    extra_link_args=['/DEBUG'])

setup (name = 'UniplugPackage',
       version = '1.0',
       description = 'This is a demo package',
	   author = 'FUSEEProjectTeam',
	   url = 'https://fusee3d.org',
       ext_modules = [module1])