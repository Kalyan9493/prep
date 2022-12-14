package com.prep.base.exception;

import lombok.Data;
import org.springframework.http.HttpStatus;

import java.util.Date;

@Data
public class ExceptionHandler extends RuntimeException{

    private final HttpStatus status;
    private final String message;
    private final Date timestamp;

    public ExceptionHandler(HttpStatus status, String message) {
        this.status = status;
        this.message = message;
        this.timestamp = new Date();
    }
}
