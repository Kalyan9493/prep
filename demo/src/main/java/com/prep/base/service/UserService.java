package com.prep.base.service;

import com.prep.base.dto.UserDto;

import java.util.List;

public interface UserService {

    UserDto save(UserDto userDto);
    UserDto findUserById(Integer userId);
    List<UserDto> getAllUsers();
    UserDto findUserByEmailIdOrMobileNumberAndPassword(String emailIdOrMobileNumber, String password);
}
