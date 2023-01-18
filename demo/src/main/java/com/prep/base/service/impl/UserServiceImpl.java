package com.prep.base.service.impl;

import com.prep.base.dto.UserDto;
import com.prep.base.entity.Role;
import com.prep.base.entity.User;
import com.prep.base.entity.UserRole;
import com.prep.base.exception.ExceptionHandler;
import com.prep.base.repository.RoleRepository;
import com.prep.base.repository.UserRepository;
import com.prep.base.repository.UserRoleRepository;
import com.prep.base.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserRoleRepository userRoleRepository;
    @Autowired
    private RoleRepository roleRepository;

    @Override
    public UserDto save(UserDto userDto) {
        validate(userDto);
        User user = new User();
        userDto.setPassword(new BCryptPasswordEncoder().encode(userDto.getPassword()));
        BeanUtils.copyProperties(userDto, user);
        user = userRepository.save(user);
        if(userDto.getRoles() != null && userDto.getRoles().size() != 0) {
            for (Role role: userDto.getRoles()) {
                Optional<Role> roleOptional = roleRepository.findById(role.getRoleId());
                if(!roleOptional.isPresent()){
                   throw new ExceptionHandler(HttpStatus.NOT_FOUND, "Role not found");
                }
                UserRole userRole = new UserRole();
                userRole.setRole(roleOptional.get());
                userRole.setUser(user);
                userRoleRepository.save(userRole);
            }
        }
        if(user != null){
            BeanUtils.copyProperties(user, userDto, "roles", "password");
        }
        return userDto;
    }

    private void validate(UserDto userDto) {
        User existingUser = null;
        if(userDto.getEmailId() == null && userDto.getMobileNumber() == null) {
            throw new ExceptionHandler(HttpStatus.BAD_REQUEST, "EmailId or Mobile Number is required");
        }
        if(userDto.getEmailId() != null){
            existingUser = userRepository.findUserByEmailIdOrMobileNumber(userDto.getEmailId());
        }
        if(existingUser == null && userDto.getMobileNumber() != null){
            existingUser = userRepository.findUserByEmailIdOrMobileNumber(userDto.getMobileNumber().toString());
        }
        if(existingUser != null){
            throw new ExceptionHandler(HttpStatus.CONFLICT, "EmailId or Mobile Number already exists");
        }
        if(userDto.getRoles() == null){
            List<Role> defaultRolesList = new ArrayList<>();
            defaultRolesList.add(roleRepository.getRoleByRoleName("USER"));
            userDto.setRoles(defaultRolesList);
        }
    }

    @Override
    public UserDto findUserById(Integer userId) {
        return null;
    }

    @Override
    public List<UserDto> getAllUsers() {
        List<User> users = userRepository.findAll();
        List<UserDto> userDtos = new ArrayList<>();
        for (User user: users) {
            UserDto userDto = new UserDto();
            BeanUtils.copyProperties(user, userDto);
            userDtos.add(userDto);
        }
        return userDtos;
    }

    @Override
    public UserDto findUserByEmailIdOrMobileNumberAndPassword(String emailIdOrMobileNumber, String password) {

        User user = userRepository.findUserByEmailIdOrMobileNumber(emailIdOrMobileNumber);
        if(user == null) {
            throw new ExceptionHandler(HttpStatus.NOT_FOUND, "User not found");
        }
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        if (!encoder.matches(password, user.getPassword())){
            throw new ExceptionHandler(HttpStatus.UNAUTHORIZED, "Invalid credentials");
        }
        List<UserRole> userRoles = userRoleRepository.getUserRolesByUserId(user.getUserId());
        UserDto userDto = new UserDto();
        BeanUtils.copyProperties(user, userDto);
        List<Role> roles = new ArrayList<>();
        for (UserRole userRole: userRoles) {
            roles.add(userRole.getRole());
        }
        userDto.setRoles(roles);
        return userDto;
    }
}
