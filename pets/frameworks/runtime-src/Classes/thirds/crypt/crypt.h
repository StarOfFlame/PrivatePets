//
//  crypt.hpp
//  PetsPlan
//
//  Created by Reyn on 2018/3/29.
//

#ifndef crypt_hpp
#define crypt_hpp

#include <iostream>

std::string encrypt(std::string source, std::string secret);
std::string decrypt(std::string source, std::string secret);

#endif /* crypt_hpp */
