package com.java.todoapp.web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import com.java.todoapp.dao.TodoDao;
import com.java.todoapp.dao.TodoDaoImpl;
import com.java.todoapp.model.Todo;

@WebServlet("/")
public class TodoController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private TodoDao todoDAO;

    public TodoController() {
        super();
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        todoDAO = new TodoDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();

        try {

            switch (action) {

            case "/new":
                showNewForm(request, response);
                break;

            case "/insert":
                insertTodo(request, response);
                break;

            case "/delete":
                deleteTodo(request, response);
                break;

            case "/edit":
                showEditForm(request, response);
                break;

            case "/update":
                updateTodo(request, response);
                break;

            case "/list":
                listTodo(request, response);
                break;

            default:
                RequestDispatcher dispatcher =
                        request.getRequestDispatcher("login/login.jsp");
                dispatcher.forward(request, response);
                break;
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }

    private void listTodo(HttpServletRequest request,
                          HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        List<Todo> listTodo = todoDAO.selectAllTodos();

        request.setAttribute("listTodo", listTodo);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("todo/todo-list.jsp");

        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request,
                             HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("todo/todo-form.jsp");

        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request,
                              HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        Long id = Long.parseLong(request.getParameter("id"));

        Todo existingTodo = todoDAO.selectTodo(id);

        request.setAttribute("todo", existingTodo);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("todo/todo-form.jsp");

        dispatcher.forward(request, response);
    }

    private void insertTodo(HttpServletRequest request,
                            HttpServletResponse response)
            throws SQLException, IOException {

        String title = request.getParameter("title");
        String username = request.getParameter("username");
        String description = request.getParameter("description");

        boolean status =
                Boolean.parseBoolean(request.getParameter("status"));

        Todo newTodo = new Todo(
                title,
                username,
                description,
                LocalDate.now(),
                status
        );

        todoDAO.insertTodo(newTodo);

        response.sendRedirect("list");
    }

    private void updateTodo(HttpServletRequest request,
                            HttpServletResponse response)
            throws SQLException, IOException {

        Long id = Long.parseLong(request.getParameter("id"));

        String title = request.getParameter("title");
        String username = request.getParameter("username");
        String description = request.getParameter("description");

        LocalDate targetDate =
                LocalDate.parse(request.getParameter("targetDate"));

        boolean status =
                Boolean.parseBoolean(request.getParameter("status"));

        Todo todo = new Todo(
                id,
                title,
                username,
                description,
                targetDate,
                status
        );

        todoDAO.updateTodo(todo);

        response.sendRedirect("list");
    }

    private void deleteTodo(HttpServletRequest request,
                            HttpServletResponse response)
            throws SQLException, IOException {

        Long id = Long.parseLong(request.getParameter("id"));

        todoDAO.deleteTodo(id);

        response.sendRedirect("list");
    }
}