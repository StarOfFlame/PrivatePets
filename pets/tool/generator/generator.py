#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import sys

PATH_ROUTER   = os.path
CURRENT_PATH  = os.getcwd()
RELATIVE_PATH = '../../src/'
SOURCE_PATH   = PATH_ROUTER.abspath(PATH_ROUTER.join(CURRENT_PATH, RELATIVE_PATH))
SOURCE_LUA    = PATH_ROUTER.abspath(PATH_ROUTER.join(SOURCE_PATH, 'sources.lua'))
LUA_HEADER    = 'local sources = {\n'
LUA_LINE_PRE  = '\t'
LUA_LINE_SUB  = ',\n'
LUA_TAILER    = '}\n\n cc.exports.include = function(name)\n\treturn require(sources[name])\nend\n'
IGNORE_DIRS   = ['cocos']

class generator():
    def __init__(self):
        self.luafiles_ = []

    def append_lua_item(self, path):
        self.luafiles_.append(path)

    def write_lua_source(self):
        with open(SOURCE_LUA, 'w') as luafile:
            content = []
            content.append(LUA_HEADER)
            for path in self.luafiles_:
                name = path.split('.')[-1]
                line = "\t['%s'] = '%s',\n" % (name, path)
                content.append(line)
            content.append(LUA_TAILER)
            luafile.writelines(content)
    
    def generate_lua_source(self):
        for root, _, files in os.walk(SOURCE_PATH):
            for file in files:
                ignore = False
                for dirname in IGNORE_DIRS:
                    absfile = PATH_ROUTER.abspath(PATH_ROUTER.join(root, file))
                    absdir  = PATH_ROUTER.abspath(PATH_ROUTER.join(SOURCE_PATH, dirname))
                    if absdir in absfile:
                        ignore = True
                if ignore:
                    continue

                name, ext = PATH_ROUTER.splitext(file)
                if ext == '.lua' and name != 'sources':
                    path = PATH_ROUTER.relpath(PATH_ROUTER.join(root, name), SOURCE_PATH)
                    path = path.replace('/', '.')
                    self.append_lua_item(path)
        self.write_lua_source()

    def start(self):
        self.generate_lua_source()

if __name__ == '__main__':
    generator().start()
