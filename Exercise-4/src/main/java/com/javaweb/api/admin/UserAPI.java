package com.javaweb.api.admin;

import com.javaweb.exception.MyException;
import com.javaweb.model.dto.*;

import com.javaweb.model.response.ResponseDTO;

import com.javaweb.service.CustomerService;

import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;
@RestController(value = "userAPIOfAdmin")
@RequestMapping("/api/user")
public class UserAPI {
    @Autowired
    private UserService userService;
    @PutMapping("/{id}")
    public void createUser(@PathVariable Long id, @RequestBody UserDTO userDTO) {
        userService.update(id,userDTO);
    }
    @PostMapping
        public void addUser(@RequestBody UserDTO userDTO) {
        userService.insert(userDTO);
    }
    @DeleteMapping("/{ids}")
    public void deleteUser(@PathVariable Long[] ids) {
        userService.delete(ids);
    }
    @PutMapping("/change-password/{id}")
    public void changePassword(@PathVariable Long id, @RequestBody PasswordDTO passDTO) throws MyException {
        userService.updatePassword(id,passDTO);
    }
    @PutMapping("/password/{id}/reset")
    public void resetPassword(@PathVariable Long id) throws MyException {
        userService.resetPassword(id);
    }
    @PostMapping("/resign")
    public ResponseEntity<?> Resign(@RequestBody UserDTO userDTO) throws MyException {
        try {
            userService.resign(userDTO);
            return ResponseEntity.ok(Collections.singletonMap("message", "Hủy tài khoản thành công!"));
        } catch (MyException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Collections.singletonMap("error", e.getMessage()));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.singletonMap("error", "Lỗi hệ thống!"));
        }
    }
}
