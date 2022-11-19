package com.prep.base.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prep.base.entity.QuestionType;

@Repository
public interface QuestionTypeRepository extends JpaRepository<QuestionType, Long>{

}
