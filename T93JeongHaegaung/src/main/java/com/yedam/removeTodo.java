package com.yedam;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


@WebServlet("/removeTodo.json")
public class removeTodo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public removeTodo() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ToDoService service = new ToDoServiceImpl();

		String noStr = request.getParameter("no");
		int no = Integer.parseInt(noStr);
		Map<String, Object> map = new HashMap<>();
		if (service.removeTodo(no)) {
			map.put("retCode", "Success");
		} else {
			map.put("retCode", "Fail");
		}
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		response.setContentType("text/json;charset=UTF-8");
		response.getWriter().print(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
