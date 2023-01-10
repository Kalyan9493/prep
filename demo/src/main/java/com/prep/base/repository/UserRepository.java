package com.prep.base.repository;

import com.prep.base.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    @Query("select u from User u where u.emailId=:emailIdOrMobileNumber or u.mobileNumber=:emailIdOrMobileNumber")
    User findUserByEmailIdOrMobileNumber(@Param("emailIdOrMobileNumber") String emailIdOrMobileNumber);
}
