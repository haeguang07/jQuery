package com.yedam;

import java.util.List;

public interface ToDoService {
	public List<ToDoVO> todoList();
	public boolean addTodo(String todoTitle);
	public int newNo();
	public boolean removeTodo(int todoNO);
	public boolean modifyTodo(String status,int todoNO);
}
