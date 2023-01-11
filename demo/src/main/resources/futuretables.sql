-- Question answer related tables

CREATE TABLE `question_type` (
  `question_type_id` int NOT NULL AUTO_INCREMENT,
  `question_type` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `created_date` bigint DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  `updated_date` bigint DEFAULT NULL,
  PRIMARY KEY (`question_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `questions` (
  `question_id` bigint NOT NULL AUTO_INCREMENT,
  `question_type_id` int DEFAULT NULL,
  `description` longtext,
  `created_by` varchar(45) DEFAULT NULL,
  `created_date` bigint DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  `updated_date` bigint DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `fk_questions_1_idx` (`question_type_id`),
  CONSTRAINT `fk_questions_1` FOREIGN KEY (`question_type_id`) REFERENCES `question_type` (`question_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `images` (
  `image_id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(45) DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `created_date` bigint DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  `updated_date` bigint DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;












CREATE TABLE `answer_images` (
  `answer_image_id` int NOT NULL AUTO_INCREMENT,
  `answer_id` bigint DEFAULT NULL,
  `image_id` bigint DEFAULT NULL,
  PRIMARY KEY (`answer_image_id`),
  KEY `fk_answer_images_1_idx` (`answer_id`),
  KEY `fk_answer_images_2_idx` (`image_id`),
  CONSTRAINT `fk_answer_images_1` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`),
  CONSTRAINT `fk_answer_images_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `answers` (
  `answer_id` bigint NOT NULL AUTO_INCREMENT,
  `answer` varchar(100) DEFAULT NULL,
  `explanation` longtext,
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `option_images` (
  `option_image_id` bigint NOT NULL AUTO_INCREMENT,
  `option_id` int DEFAULT NULL,
  `image_id` bigint DEFAULT NULL,
  PRIMARY KEY (`option_image_id`),
  KEY `fk_option_images_1_idx` (`option_id`),
  KEY `fk_option_images_2_idx` (`image_id`),
  CONSTRAINT `fk_option_images_1` FOREIGN KEY (`option_id`) REFERENCES `options` (`option_id`),
  CONSTRAINT `fk_option_images_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `options` (
  `option_id` int NOT NULL AUTO_INCREMENT,
  `option` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `question_answers` (
  `question_answer_id` bigint NOT NULL AUTO_INCREMENT,
  `question_id` bigint DEFAULT NULL,
  `answer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`question_answer_id`),
  KEY `fk_question_answers_1_idx` (`answer_id`),
  KEY `fk_question_answers_2_idx` (`question_id`),
  CONSTRAINT `fk_question_answers_1` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`),
  CONSTRAINT `fk_question_answers_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `question_images` (
  `question_image_id` int NOT NULL AUTO_INCREMENT,
  `question_id` bigint DEFAULT NULL,
  `image_id` bigint DEFAULT NULL,
  `order` int DEFAULT NULL,
  PRIMARY KEY (`question_image_id`),
  KEY `fk_question_images_1_idx` (`image_id`),
  KEY `fk_question_images_2_idx` (`question_id`),
  CONSTRAINT `fk_question_images_1` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`),
  CONSTRAINT `fk_question_images_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `question_options` (
  `question_option_id` bigint NOT NULL AUTO_INCREMENT,
  `question_id` bigint DEFAULT NULL,
  `option_id` int DEFAULT NULL,
  PRIMARY KEY (`question_option_id`),
  KEY `fk_question_options_1_idx` (`option_id`),
  KEY `fk_question_options_2_idx` (`question_id`),
  CONSTRAINT `fk_question_options_1` FOREIGN KEY (`option_id`) REFERENCES `options` (`option_id`),
  CONSTRAINT `fk_question_options_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;






CREATE TABLE `test` (
  `test_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `instructions` longtext,
  `created_date` bigint DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  `updated_date` bigint DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `test_topics_questions` (
  `test_topics_questions_id` int NOT NULL AUTO_INCREMENT,
  `test_id` int DEFAULT NULL,
  `topic_id` int DEFAULT NULL,
  `question_id` bigint DEFAULT NULL,
  PRIMARY KEY (`test_topics_questions_id`),
  KEY `fk_test_topics_questions_1_idx` (`test_id`),
  KEY `fk_test_topics_questions_2_idx` (`topic_id`),
  KEY `fk_test_topics_questions_3_idx` (`question_id`),
  CONSTRAINT `fk_test_topics_questions_1` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`),
  CONSTRAINT `fk_test_topics_questions_2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`),
  CONSTRAINT `fk_test_topics_questions_3` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `topic_questions` (
  `topic_question_id` int NOT NULL AUTO_INCREMENT,
  `topic_id` int DEFAULT NULL,
  `question_id` bigint DEFAULT NULL,
  PRIMARY KEY (`topic_question_id`),
  KEY `fk_topic_questions_1_idx` (`topic_id`),
  KEY `fk_topic_questions_2_idx` (`question_id`),
  CONSTRAINT `fk_topic_questions_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`),
  CONSTRAINT `fk_topic_questions_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `topics` (
  `topic_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `user_assignment` (
  `user_assignment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `test_id` int DEFAULT NULL,
  `max_time` int DEFAULT NULL,
  `assigned_by` varchar(45) DEFAULT NULL,
  `assigned_date` bigint DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_assignment_id`),
  KEY `fk_user_assignment_1_idx` (`user_id`),
  KEY `fk_user_assignment_2_idx` (`test_id`),
  CONSTRAINT `fk_user_assignment_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_user_assignment_2` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;