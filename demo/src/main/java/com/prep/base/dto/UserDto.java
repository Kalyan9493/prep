package com.prep.base.dto;

import com.prep.base.entity.Role;
import lombok.Data;

import java.util.List;

@Data
public class UserDto {

    private Long userId;
    private String firstName;
    private String lastName;
    private Long mobileNumber;
    private String emailId;
    private String password;
    private List<Role> roles;
}
