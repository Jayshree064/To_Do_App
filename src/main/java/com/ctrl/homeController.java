package com.ctrl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Dao.todoDao;
import com.entities.Todo;

@Controller
public class homeController {
	
	@Autowired
	todoDao TodoDao;
	
	@RequestMapping("/home")
	public String home(Model model) {
		
		String str="home";
		model.addAttribute("name",str);
		List<Todo> todo = this.TodoDao.getAll();
		model.addAttribute("todos",todo);
		System.out.print(todo);
		return "home";
	}
	
	@RequestMapping("/add")
	public String addTodo(Model m) {
		
		Todo t = new Todo();
		m.addAttribute("name","add");
		m.addAttribute("todo", t);
		return "home";
	}
	
	@RequestMapping(path="/saveTodo",method=RequestMethod.POST)
	public String saveTodo(@ModelAttribute("todo")Todo t, Model m) {
		System.out.print(t);
		t.setEntryDate(new Date());
		this.TodoDao.save(t);
		m.addAttribute("msg","Successfully added..");
		return "home";
	}
}
