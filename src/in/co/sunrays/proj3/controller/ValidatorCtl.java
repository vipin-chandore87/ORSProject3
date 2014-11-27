package in.co.sunrays.proj3.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Validator functionality Controller. Performs operation for Filter Method
 * 
 * @author SUNRAYS Technologies
 * @version 1.0
 * @Copyright (c) SUNRAYS Technologies
 */

public class ValidatorCtl implements Filter {

	private FilterConfig config = null;

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse rresponse,
			FilterChain chain) throws IOException, ServletException {

	}

	@Override
	public void init(FilterConfig fc) throws ServletException {
		config = fc;

	}

}
