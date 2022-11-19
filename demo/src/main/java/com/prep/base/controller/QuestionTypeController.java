package com.prep.base.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.prep.base.entity.QuestionType;
import com.prep.base.service.impl.QuestionTypeServiceImpl;

@RestController
@RequestMapping("/questiontype")
public class QuestionTypeController {

	@Autowired
	private QuestionTypeServiceImpl questionTypeServiceImpl;
	
	@PostMapping
	public QuestionType saveQuestionType(@RequestBody QuestionType questionType) {
		return questionTypeServiceImpl.save(questionType);
	}
	
	@GetMapping("/all")
	public List<QuestionType> getAllQuestionTypes() {
		return questionTypeServiceImpl.getAllQuestionTypes();
	}
	
}
