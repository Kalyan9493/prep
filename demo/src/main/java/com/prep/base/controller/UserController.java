package com.prep.base.controller;

import com.prep.base.dto.LoginDto;
import com.prep.base.dto.UserDto;
import com.prep.base.exception.ExceptionHandler;
import com.prep.base.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/create")
    public ResponseEntity createUser(@RequestBody UserDto userDto) {
        try {
            UserDto user = userService.save(userDto);
            return new ResponseEntity(user,HttpStatus.OK);
        }catch (ExceptionHandler exceptionHandler){
            return new ResponseEntity(exceptionHandler.getMessage(), exceptionHandler.getStatus());
        }catch (Exception e) {
            return new ResponseEntity(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/login")
    public ResponseEntity login(@RequestBody LoginDto loginDto) {
        try {
            UserDto user = userService.findUserByEmailIdOrMobileNumberAndPassword(loginDto.getEmailIdOrMobileNumber(), loginDto.getPassword());
            return new ResponseEntity(user,HttpStatus.OK);
        } catch (ExceptionHandler e) {
            return new ResponseEntity(e.getMessage(), e.getStatus());
        } catch (Exception e) {
            return new ResponseEntity(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
