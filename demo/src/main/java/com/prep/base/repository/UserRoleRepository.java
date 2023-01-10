package com.prep.base.repository;

import com.prep.base.entity.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRoleRepository extends JpaRepository<UserRole, Integer> {

    @Query("select ur from UserRole ur join fetch ur.user u join fetch ur.role r where u.userId= :userId")
    List<UserRole> getUserRolesByUserId(@Param("userId") Long userId);
}
