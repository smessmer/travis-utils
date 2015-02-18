#!/usr/bin/env python

import re, os, shutil, sys, subprocess

SCRIPTDIR = os.path.dirname(os.path.realpath(__file__))

def bii_user_project():
  biiconfig = open(os.path.join(SCRIPTDIR, 'biicode.conf'), 'r').read()
  username = re.search('\[parent\]\n\s+([^/]+)/', biiconfig).group(1)
  projectname = re.search('\[parent\]\n\s+[^/]+/([^:]+)', biiconfig).group(1)
  return (username, projectname)

BUILDFOLDER = sys.argv[1]

(bii_username, bii_projectname) =  bii_user_project()
subprocess.check_call(['bii', 'init', BUILDFOLDER])
os.mkdir(os.path.join(BUILDFOLDER, 'blocks', bii_username))
shutil.move(bii_projectname, os.path.join(BUILDFOLDER, 'blocks', bii_username))
