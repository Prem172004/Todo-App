package com.java.todoapp.web;

import java.io.IOException;

import com.java.todoapp.dao.LoginDao;
import com.java.todoapp.model.LoginBean;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private LoginDao loginDao;

    public void init() {
        loginDao = new LoginDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	response.sendRedirect(request.getContextPath() + "/login/login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
			authenticate(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    private void authenticate(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException, ClassNotFoundException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        LoginBean loginBean = new LoginBean();
        loginBean.setUsername(username);
        loginBean.setPassword(password);

        if (loginDao.validate(loginBean)) {

		    HttpSession session = request.getSession();
		    session.setAttribute("username", username);

		    response.sendRedirect(request.getContextPath() + "/todo-list");

		} else {

		    request.setAttribute("errorMessage", "Invalid Username or Password");
		    RequestDispatcher dispatcher = request.getRequestDispatcher("login/login.jsp");
		    dispatcher.forward(request, response);

		}
    }
}