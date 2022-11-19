package com.prep.base.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prep.base.entity.QuestionType;
import com.prep.base.repository.QuestionTypeRepository;

@Service
public class QuestionTypeServiceImpl {
	
	@Autowired
	private QuestionTypeRepository questionTypeRepo;
	
	public QuestionType save(QuestionType questionType) {
		return questionTypeRepo.save(questionType);
	}
	
	public List<QuestionType> getAllQuestionTypes() {
		return questionTypeRepo.findAll();
	}
}
