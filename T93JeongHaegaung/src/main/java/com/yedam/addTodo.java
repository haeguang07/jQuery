package com.yedam;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


@WebServlet("/addTodo.json")
public class addTodo extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public addTodo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title=request.getParameter("title");
		
		ToDoService service = new ToDoServiceImpl();
		Map<String, Object> map = new HashMap<>();
		if(service.addTodo(title)) {
			int no = service.newNo();
			map.put("retCode", "Success");	
			map.put("no", no);
		}else {
			map.put("retCode", "Fail");						
		}
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		response.getWriter().print(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
