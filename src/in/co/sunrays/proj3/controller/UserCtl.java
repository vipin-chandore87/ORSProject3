package in.co.sunrays.proj3.controller;

import in.co.sunrays.proj3.dto.BaseDTO;
import in.co.sunrays.proj3.dto.UserDTO;
import in.co.sunrays.proj3.exception.ApplicationException;
import in.co.sunrays.proj3.exception.DuplicateRecordException;
import in.co.sunrays.proj3.model.ModelFactory;
import in.co.sunrays.proj3.model.RoleModelInt;
import in.co.sunrays.proj3.model.UserModelInt;
import in.co.sunrays.proj3.util.DataUtility;
import in.co.sunrays.proj3.util.DataValidator;
import in.co.sunrays.proj3.util.PropertyReader;
import in.co.sunrays.proj3.util.ServletUtility;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * User functionality Controller. Performs operation for add, update and get
 * User
 * 
 * @author SUNRAYS Technologies
 * @version 1.0
 * @Copyright (c) SUNRAYS Technologies
 */

public class UserCtl extends BaseCtl {

	private static final long serialVersionUID = 1L;

	private static Logger log = Logger.getLogger(UserCtl.class);

	@Override
	protected void preload(HttpServletRequest request) {
		RoleModelInt model = ModelFactory.getInstance().getRoleModel();
		try {
			List l = model.list();
			request.setAttribute("roleList", l);
		} catch (ApplicationException e) {
			log.error(e);
		}

	}

	@Override
	protected boolean validate(HttpServletRequest request) {

		log.debug("UserCtl Method validate Started");

		boolean pass = true;

		String login = request.getParameter("login");
		String dob = request.getParameter("dob");

		if (DataValidator.isNull(request.getParameter("firstName"))) {
			request.setAttribute("firstName",
					PropertyReader.getValue("error.require", "First Name"));
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("lastName"))) {
			request.setAttribute("lastName",
					PropertyReader.getValue("error.require", "Last Name"));
			pass = false;
		}

		if (DataValidator.isNull(login)) {
			request.setAttribute("login",
					PropertyReader.getValue("error.require", "Login Id"));
			pass = false;
		} else if (!DataValidator.isEmail(login)) {
			request.setAttribute("login",
					PropertyReader.getValue("error.email", "Login "));
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("password"))) {
			request.setAttribute("password",
					PropertyReader.getValue("error.require", "Password"));
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("confirmPassword"))) {
			request.setAttribute("confirmPassword", PropertyReader.getValue(
					"error.require", "Confirm Password"));
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("gender"))) {
			request.setAttribute("gender",
					PropertyReader.getValue("error.require", "Gender"));
			pass = false;
		}
		
		if (DataValidator.isNull(dob)) {
			request.setAttribute("dob",
					PropertyReader.getValue("error.require", "Date Of Birth"));
			pass = false;
		} else if (!DataValidator.isDate(dob)) {
			request.setAttribute("dob",
					PropertyReader.getValue("error.date", "Date Of Birth"));
			pass = false;
		}
		
		if (!request.getParameter("password").equals(
				request.getParameter("confirmPassword"))
				&& !"".equals(request.getParameter("confirmPassword"))) {
			ServletUtility.setErrorMessage(
					"Confirm  Password  should not be matched.", request);
			pass = false;
		}

		log.debug("UserCtl Method validate Ended");

		return pass;
	}

	@Override
	protected BaseDTO populateDTO(HttpServletRequest request) {

		log.debug("UserCtl Method populateDTO Started");

		UserDTO dto = new UserDTO();

		dto.setId(DataUtility.getLong(request.getParameter("id")));

		dto.setRoleId(DataUtility.getLong(request.getParameter("roleId")));

		dto.setFirstName(DataUtility.getString(request
				.getParameter("firstName")));

		dto.setLastName(DataUtility.getString(request.getParameter("lastName")));

		dto.setLogin(DataUtility.getString(request.getParameter("login")));

		dto.setPassword(DataUtility.getString(request.getParameter("password")));

		dto.setConfirmPassword(DataUtility.getString(request
				.getParameter("confirmPassword")));

		dto.setGender(DataUtility.getString(request.getParameter("gender")));

		dto.setDob(DataUtility.getDate(request.getParameter("dob")));
		
		populateDTO(dto, request);

		log.debug("UserCtl Method populateDTO Ended");

		return dto;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		log.debug("UserCtl Method doGet Started");
		String op = DataUtility.getString(request.getParameter("operation"));

		// get model
		UserModelInt model = ModelFactory.getInstance().getUserModel();

		long id = DataUtility.getLong(request.getParameter("id"));

		if (OP_SAVE.equalsIgnoreCase(op)) {
			UserDTO dto = (UserDTO) populateDTO(request);

			try {
				if (id > 0) {
					model.update(dto);
				} else {
					long pk = model.add(dto);
					dto.setId(pk);
				}
				ServletUtility.setDto(dto, request);
				ServletUtility.setSuccessMessage("Data is successfully saved",
						request);

			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			} catch (DuplicateRecordException e) {
				ServletUtility.setDto(dto, request);
				ServletUtility.setErrorMessage("Login id already exists",
						request);
			}

		} else if (OP_DELETE.equalsIgnoreCase(op)) {

			UserDTO dto = (UserDTO) populateDTO(request);
			try {
				model.delete(dto);
				ServletUtility.redirect(ORSView.USER_LIST_CTL, request,
						response);
				return;
			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			}

		} else if (OP_CANCEL.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.USER_LIST_CTL, request, response);
			return;

		} else { // View page

			if (id > 0 || op != null) {
				System.out.println("in id > 0  condition");
				UserDTO dto;
				try {
					dto = model.findByPK(id);
					ServletUtility.setDto(dto, request);
				} catch (ApplicationException e) {
					log.error(e);
					ServletUtility.handleException(e, request, response);
					return;
				}
			}
		}

		ServletUtility.forward(ORSView.USER_VIEW, request, response);

		log.debug("UserCtl Method doGet Ended");
	}

	@Override
	protected String getView() {
		return ORSView.USER_VIEW;
	}

}
