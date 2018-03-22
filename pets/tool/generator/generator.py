#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import sys

PATH_ROUTER   = os.path
CURRENT_PATH  = os.getcwd()
RELATIVE_PATH = '../../src/core/'
SOURCE_PATH   = PATH_ROUTER.abspath(PATH_ROUTER.join(CURRENT_PATH, RELATIVE_PATH))
SOURCE_LUA    = PATH_ROUTER.abspath(PATH_ROUTER.join(SOURCE_PATH, '../sources.lua'))
LUA_HEADER    = 'local sources = {\n'
LUA_LINE_PRE  = '\t'
LUA_LINE_SUB  = ',\n'
LUA_TAILER    = '}\n\n cc.exports.include = function(name)\n\treturn require(sources[name])\nend\n'


class generator():
    def __init__(self):
        self.luafiles_ = []

    def appendLuaItem(self, path):
        self.luafiles_.append(path)

    def writeLuaSource(self):
        with open(SOURCE_LUA, 'w') as luafile:
            content = []
            content.append(LUA_HEADER)
            for path in self.luafiles_:
                name = path.split('.')[-1]
                line = "\t%s = '%s',\n" % (name, path)
                content.append(line)
            content.append(LUA_TAILER)
            luafile.writelines(content)
    
    def generateLuaSource(self):
        for root, _, files in os.walk(SOURCE_PATH):
            for file in files:
                name, ext = PATH_ROUTER.splitext(file)
                if ext == '.lua' and name != 'sources':
                    path = PATH_ROUTER.relpath(PATH_ROUTER.join(root, name), SOURCE_PATH)
                    path = 'core.' + path.replace('/', '.')
                    self.appendLuaItem(path)
        self.writeLuaSource()

    def start(self):
        self.generateLuaSource()

if __name__ == '__main__':
    generator().start()
