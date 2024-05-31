package com.itwill.lab05.repository;

// Model. users 테이블.
public class User {
    private Integer id;
    private String userid;
    private String password;
    private String email;
    private Integer points;
    
    public User() {}

    public User(Integer id, String userid, String password, String email, Integer points) {
        this.id = id;
        this.userid = userid;
        this.password = password;
        this.email = email;
        this.points = points;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getPoints() {
        return points;
    }

    public void setPoints(Integer points) {
        this.points = points;
    }

    @Override
    public String toString() {
        return "User [id=" + id + ", userid=" + userid + ", password=" + password + ", email=" + email + ", points="
                + points + "]";
    }

    // builder 패턴(보일러플레이트)
    public static UserBuilder builder() { // static으로 만든 이유: user를 만들기 전에 메소드를 불러오기 위해서(객체를 만들기 위해서)
        return new UserBuilder();
    }
    
    public static class UserBuilder {
        private Integer id;
        private String userid;
        private String password;
        private String email;
        private Integer points;
        
        private UserBuilder() {}
        
        public UserBuilder id(Integer id) {
            this.id = id;
            return this; // 메소드를 연쇄적으로 호출하기 위해서 return을 사용 ex) user.builder().build();  user.builder().id().(builder 안에 있는 것 사용가능)
        }
        
        public UserBuilder userid(String userid) {
            this.userid = userid;
            return this;
        }
        
        public UserBuilder password(String password) {
            this.password = password;
            return this;
        }
        
        public UserBuilder email(String email) {
            this.email = email;
            return this;
        }
        
        public UserBuilder points(Integer points) {
            this.points = points;
            return this;
        }
        
        public User build() {
            return new User(id, userid, password, email, points);
        }
    }
    
}