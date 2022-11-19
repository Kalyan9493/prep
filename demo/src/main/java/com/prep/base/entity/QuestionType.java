package com.prep.base.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "question_types")
public class QuestionType {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "question_type_id")
	private Long questionTypeId;
	@Column(name = "question_type",nullable = false)
	private String questionType;
	@Column(name = "description")
	private String description;
	@Column(name = "created_by")
	private String createdBy;
	@Column(name = "created_date")
	private Long createdDate;
	@Column(name = "updated_by")
	private String updatedBy;
	@Column(name = "updated_date")
	private Long updatedDate;
}
