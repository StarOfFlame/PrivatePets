//
//  serialize.h
//  PetsPlan
//
//  Created by Reyn on 2018/3/24.
//

#ifndef serialize_h
#define serialize_h

#ifdef __cplusplus
extern "C" {
#endif
    
#include <lua.h>
#include <lauxlib.h>

#include <stdlib.h>
#include <stdint.h>
#include <assert.h>
#include <string.h>

#define TYPE_NIL 0
#define TYPE_BOOLEAN 1
// hibits 0 false 1 true

#define TYPE_NUMBER 2
// hibits 0 : 0 , 1: byte, 2:word, 4: dword, 6: qword, 8 : double
#define TYPE_NUMBER_ZERO 0
#define TYPE_NUMBER_BYTE 1
#define TYPE_NUMBER_WORD 2
#define TYPE_NUMBER_DWORD 4
#define TYPE_NUMBER_QWORD 6
#define TYPE_NUMBER_REAL 8

#define TYPE_USERDATA 3
#define TYPE_SHORT_STRING 4
// hibits 0~31 : len
#define TYPE_LONG_STRING 5
#define TYPE_TABLE 6

#define MAX_COOKIE 32
#define COMBINE_TYPE(t,v) ((t) | (v) << 3)

#define BLOCK_SIZE 128
#define MAX_DEPTH 32

struct block {
    struct block * next;
    char buffer[BLOCK_SIZE];
};

struct write_block {
    struct block * head;
    int len;
    struct block * current;
    int ptr;
};

struct read_block {
    char * buffer;
    struct block * current;
    int len;
    int ptr;
};


int luaopen_serialize(lua_State *L);

#ifdef __cplusplus
}
#endif
        
#endif /* serialize_h */
