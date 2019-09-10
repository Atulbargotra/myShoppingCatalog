/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppingcatalog.dto;

/**
 *
 * @author atulb
 */
public class UserDTO {

    public UserDTO() {
    }
    private String username;
    private String password;
    private String userType;

    public UserDTO(String username, String password, String userType) {
        this.username = username;
        this.password = password;
        this.userType = userType;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "username=" + username + ", password=" + password + ", userType=" + userType + '}';
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }
    
}
