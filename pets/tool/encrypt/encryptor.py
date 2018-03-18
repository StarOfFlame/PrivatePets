#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import sys
import md5

PATH_ROUTER = os.path
CURRENT_PATH = os.getcwd()
RELATIVE_PATH = '../../src/'
SOURCE_PATH = PATH_ROUTER.abspath(PATH_ROUTER.join(CURRENT_PATH, RELATIVE_PATH))

IGNORE_DIR = [
    'cocos',
    'cocos/3d',
    'cocos/cocos2d',
    'cocos/cocosbuilder',
    'cocos/cocosdenshion',
    'cocos/cocostudio',
    'cocos/controller',
    'cocos/extension',
    'cocos/framework',
    'cocos/framework/components',
    'cocos/network',
    'cocos/physics3d',
    'cocos/spine',
    'cocos/ui',
]

IGNORE_FILE = [
    'main'
]

class encryptor():
    def __init__(self):
        self.md5files_ = []

    def getMd5(self, path):
        with open(path, 'r') as f:
            return md5.new(f.read()).hexdigest()

    def encrypt(self):
        content = []
        content.append('{\n')
        length = len(self.md5files_)
        for idx, md5file in enumerate(self.md5files_):
            fd = '\t"%s" : {\n\t\t"md5" : "%s",\n\t\t"size" : %s\n\t},\n' % (
                md5file[0], md5file[1], md5file[2])
            if idx == length-1:
                fd = fd[:-2] + '\n'
            content.append(fd)
        content.append('}\n')
        with open('./md5.json', 'w') as f:
            f.writelines(content)

    def getMd5Files(self):
        for root, _, files in os.walk(SOURCE_PATH):
            for file in files:
                dir = PATH_ROUTER.relpath(root, SOURCE_PATH)
                if dir in IGNORE_DIR:
                    continue
                name, ext = PATH_ROUTER.splitext(file)
                if ext != '.lua' or name in IGNORE_FILE:
                    continue
                path = PATH_ROUTER.relpath(PATH_ROUTER.join(root, file), SOURCE_PATH)
                real = PATH_ROUTER.join(root, file)
                self.md5files_.append([path, self.getMd5(
                    real), PATH_ROUTER.getsize(real)])
    
    def start(self):
        self.getMd5Files()
        self.encrypt()

if __name__ == '__main__':
    encryptor().start()
