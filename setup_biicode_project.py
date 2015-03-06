#!/usr/bin/env python

import re, os, shutil, sys, subprocess

# TODO: This script can't work with biicode blocks that don't have a [parent] set in biicode.conf
# TODO: This script doesn't work when there are comments in the [parent] section of biicode.conf

BUILDFOLDER = "travisbuild"

def bii_user_project():
  biiconfig = open('biicode.conf', 'r').read()
  username = re.search('\[parent\]\n\s+([^/]+)/', biiconfig).group(1)
  projectname = re.search('\[parent\]\n\s+[^/]+/([^:]+)', biiconfig).group(1)
  return (username, projectname)

def setup_biicode():
  subprocess.check_call(['wget', 'http://apt.biicode.com/install.sh'])
  subprocess.check_call(['/bin/bash', './install.sh'])
  os.remove('install.sh') # cleanup downloaded bash script
  subprocess.check_call(['bii', 'setup:cpp'])
  print "Installed biicode version:"
  subprocess.check_call(['bii', '--version'])

def setup_dir_structure():
  (bii_username, bii_projectname) =  bii_user_project()
  print "Recognized biicode project %s/%s" % (bii_username, bii_projectname)
  git_projectname = os.path.basename(os.getcwd())
  os.chdir('..')
  subprocess.check_call(['bii', 'init', BUILDFOLDER])
  subprocess.check_call(['ls','-l'])
  subprocess.check_call(['pwd'])
  os.mkdir(os.path.join(BUILDFOLDER, 'blocks', bii_username))
  shutil.move(git_projectname, os.path.join(BUILDFOLDER, 'blocks', bii_username, bii_projectname))
  print "Finished setting up biicode project"

setup_biicode()
setup_dir_structure()
