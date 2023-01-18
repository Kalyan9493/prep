package com.prep.base.repository;

import com.prep.base.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends JpaRepository<Role, Integer> {

    @Query("select r from Role r where r.role=:role")
    public Role getRoleByRoleName(@Param("role") String role);
}
