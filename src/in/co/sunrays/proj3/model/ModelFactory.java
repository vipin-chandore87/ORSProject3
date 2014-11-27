package in.co.sunrays.proj3.model;

import java.util.HashMap;
import java.util.ResourceBundle;

/**
 * Factory of Service classes
 * 
 * @author SUNRAYS Technologies
 * @version 1.0
 * @Copyright (c) SUNRAYS Technologies
 * 
 */

/**
 * @author 123
 * 
 */
public class ModelFactory {

	private static ResourceBundle bundle = ResourceBundle
			.getBundle("in.co.sunrays.proj3.bundle.system");

	private static final String DATABASE = bundle.getString("DATABASE");
	private static ModelFactory serviceLocator = null;
	/**
	 * Cache of Service classes
	 */
	private static HashMap serviceCache = new HashMap();

	/**
	 * Constructor is private so no other class can create instance of Service
	 * Locator
	 */
	private ModelFactory() {

	}

	/**
	 * Get the instance of Service Locator
	 * 
	 * @return serviceLocator
	 */
	public static ModelFactory getInstance() {
		if (serviceLocator == null) {
			serviceLocator = new ModelFactory();
		}
		return serviceLocator;
	}

	/**
	 * Get instance of Marksheet Service
	 * 
	 * @return marksheetService
	 */
	public MarksheetModelInt getMarksheetModel() {
		MarksheetModelInt marksheetService = (MarksheetModelInt) serviceCache
				.get("marksheetService");
		if (marksheetService == null) {
			if ("Hibernate".equals(DATABASE)) {
				marksheetService = new MarksheetModelHibImpl();
			}
			if ("JDBC".equals(DATABASE)) {
				marksheetService = new MarksheetModelJDBCImpl();
			}
			serviceCache.put("marksheetService", marksheetService);
		}

		return marksheetService;
	}

	/**
	 * Get instance of User Service
	 * 
	 * @return userService
	 */
	public UserModelInt getUserModel() {
		UserModelInt userService = (UserModelInt) serviceCache
				.get("userService");
		if (userService == null) {
			if ("Hibernate".equals(DATABASE)) {
				userService = new UserModelHibImpl();
			}
			if ("JDBC".equals(DATABASE)) {
				userService = new UserModelJDBCImpl();
			}
			serviceCache.put("userService", userService);
		}

		return userService;
	}

	/**
	 * Get instance of Collage Service
	 * 
	 * @return collage
	 */
	public CollegeModelInt getCollegeModel() {
		CollegeModelInt collegeService = (CollegeModelInt) serviceCache
				.get("collegeService");
		if (collegeService == null) {
			if ("Hibernate".equals(DATABASE)) {
				collegeService = new CollegeModelHibImpl();
			}
			if ("JDBC".equals(DATABASE)) {
				collegeService = new CollegeModelJDBCImpl();
			}
			serviceCache.put("collegeService", collegeService);
		}

		return collegeService;
	}

	/**
	 * Get instance of Student Service
	 * 
	 * @return Student
	 */
	public StudentModelInt getStudentModel() {
		StudentModelInt studentService = (StudentModelInt) serviceCache
				.get("StudentService");
		if (studentService == null) {
			if ("Hibernate".equals(DATABASE)) {
				studentService = new StudentModelHibImpl();
			}
			if ("JDBC".equals(DATABASE)) {
				studentService = new StudentModelJDBCImpl();
			}
			serviceCache.put("studentService", studentService);
		}

		return studentService;
	}

	/**
	 * Get instance of Role Service
	 * 
	 * @return Student
	 */
	public RoleModelInt getRoleModel() {
		RoleModelInt roleService = (RoleModelInt) serviceCache
				.get("roleService");
		if (roleService == null) {
			if ("Hibernate".equals(DATABASE)) {
				roleService = new RoleModelHibImpl();
			}
			if ("JDBC".equals(DATABASE)) {
				roleService = new RoleModelJDBCImpl();
			}
			serviceCache.put("roleService", roleService);
		}

		return roleService;

	}

}
