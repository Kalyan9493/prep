package com.prep.base.dto;

import lombok.Data;

@Data
public class LoginDto {

    private String emailIdOrMobileNumber;
    private String password;
}
