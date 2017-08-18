#!/bin/bash

#*
#* Does a sparse checkout for all branches and tags under path
#*

curr_dir=$(pwd)

start_dir=$1

cd $1

# This takes care of main projects
rm -rf */branches/*/*
svn update --set-depth immediates */branches/
rm -rf */tags/*/*
svn update --set-depth immediates */tags/

# This takes care of nested projects one deep
rm -rf */*/branches/*/*
svn update --set-depth immediates */*/branches/
rm -rf */*/tags/*/*
svn update --set-depth immediates */*/tags/

cd $curr_dir
