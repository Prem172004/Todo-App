package com.java.todoapp.dao;

import java.sql.SQLException;
import java.util.List;

import com.java.todoapp.model.Todo;


public interface TodoDao {
	
	void insertTodo(Todo todo) throws SQLException;
	
	Todo selectTodo(long todoId);
	
	List<Todo> selectAllTodos();
	
	boolean deleteTodo(long id) throws SQLException;
	boolean updateTodo(Todo todo) throws SQLException;
}
