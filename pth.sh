#!/bin/bash
echo -e 'Apply changes...'
git add -A

echo -e '\nChanges applid'
echo -e '\nCommit changes...'
git commit -m $1

echo -e '\nCommited'

echo -e '\nPushing to git master...'
git push -u origin master

echo -e '\nPushed'

echo  -e '\nPushing to heroku...'
git push heroku master

echo -e '\nCompleted :)'
