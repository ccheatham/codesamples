package com.bgs.fc.ejb.webos;

import java.util.List;

public class WebosException extends RuntimeException {

	private static final long serialVersionUID = 8616639848186294403L;
	
	private List errors;
	private Object error;

	public WebosException(String msg, List errors) {
		super(msg);
		
		this.setErrors(errors);
	}
	
	public WebosException(String msg, Object error) {
		super(msg);
		
		this.setError(error);
	}

	public List getErrors() {
		return errors;
	}

	public void setErrors(List errors) {
		this.errors = errors;
	}
	
	public Object getError() {
		return error;
	}

	public void setError(Object error) {
		this.error = error;
	}

}
