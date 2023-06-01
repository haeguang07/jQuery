package com.yedam;

import java.util.List;

public class ToDoServiceImpl implements ToDoService {
	TodoMapper mapper = DataSource.getInstance().openSession(true).getMapper(TodoMapper.class);

	@Override
	public List<ToDoVO> todoList() {
		return mapper.selectToDo();
	}

	@Override
	public boolean addTodo(String todoTitle) {
		return mapper.insertTodo(todoTitle)==1;
	}

	@Override
	public boolean removeTodo(int todoNO) {
		return mapper.deleteTodo(todoNO)==1;
	}

	@Override
	public boolean modifyTodo(String status,int todoNO) {
		return mapper.updateTodo(status,todoNO)==1;
	}

	@Override
	public int newNo() {
		// TODO Auto-generated method stub
		return mapper.selectMaxNo();
	}



}
