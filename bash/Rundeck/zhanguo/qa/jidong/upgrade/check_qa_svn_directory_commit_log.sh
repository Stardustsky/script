#!/bin/bash
platform=apple
version=2.1.0
qa_svn_dir=/data/svn/$platform/$version

#chekc qa_svn_dir svn status
svn up $qa_svn_dir
svn log $qa_svn_dir
