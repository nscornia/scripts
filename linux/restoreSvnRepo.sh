#! /bin/bash

shopt -s expand_aliases
source $HOME/.bash_aliases



curr_dir=$(pwd)
svn_all_cmd="svnsparse * && svnsparse */branches && svnsparse */tags && svnfull */trunk"

svn_dir=$1
repo_url=$2

cd $svn_dir && cd ..

svn_dir=$(pwd)

#
# Find all the compile and build directories and delete them
#
echo
echo "***** Deleting Compile Direcories *****"
find $svn_dir -type d \( -name 'target' -or -name 'node_modules' -or -name 'build' -or -name 'dist' -or -name 'bower_components' \) | xargs rm -rf > /dev/null
rm -rf $svn_dir/.svn/ > /dev/null
echo "----- Finished Deleting Compile Directories -----"

echo
echo "***** Copying svn repo to tmp *****"
cp -r $svn_dir/ $TMP/svn-repo.bak > /dev/null
echo "----- Finished Copying svn repo to tmp -----"

echo
echo "***** Deleting svn repo *****"
rm -rf $svn_dir/ > /dev/null
rm -rf $svn_dir/ > /dev/null
echo "----- Finished Deleting svn repo -----"

echo
echo "***** SVN Initial Repo Checking Out *****"
svn co --depth empty $repo_url > /dev/null
echo "----- Finished Initial Check Out -----"

echo
echo "***** Checking Out Root Directories *****"

eval $svn_all_cmd > /dev/null
echo "----- Finished Root Directories -----"

#
# Copy locally modified files back over top of the fresh checkout
#
echo
echo "***** Syncing old svn repo files back *****"
rsync -am --stats $TMP/svn-repo.bak $svn_dir/..
echo "----- Finished Syncing -----"

#
# Remove the old copy of svn repo
#
echo
echo "***** Deleting temporary copy of svn repo *****"
mv $TMP/svn-repo.delete
echo "----- Finished Deleting -----"

cd $curr_dir
