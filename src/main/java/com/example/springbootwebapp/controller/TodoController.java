package com.example.springbootwebapp.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.springbootwebapp.entity.Todo;
import com.example.springbootwebapp.service.TodoService;

@Controller
@SessionAttributes("name")
public class TodoController {
	@Autowired
	private TodoService todoService;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

	@RequestMapping(value = "/todo-list", method = RequestMethod.GET)
	public String todoList(ModelMap map) {
		map.put("todos", todoService.retrieveTodos("Dhinesh"));
		return "todo-list";
	}

	@RequestMapping(value = "/add-todo", method = RequestMethod.GET)
	public String todo(ModelMap map) {
		map.addAttribute("todo", new Todo(0, (String) map.get("name"), "", new Date(), false));
		return "todo";
	}

	@RequestMapping(value = "/add-todo", method = RequestMethod.POST)
	public String addTodo(ModelMap map, @Valid @ModelAttribute("todo") Todo todo, BindingResult result) {
		if (result.hasErrors()) {
			return "todo";
		}
		todoService.addTodo("Dhinesh", todo.getDesc(), new Date(), false);
		return "redirect:/todo-list";
	}

	@RequestMapping(value = "/delete-todo", method = RequestMethod.GET)
	public String deleteTodo(@RequestParam int id) {
		todoService.deleteTodo(id);
		return "redirect:/todo-list";
	}

	@RequestMapping(value = "/update-todo", method = RequestMethod.GET)
	public String showUpdateTodo(@RequestParam int id, ModelMap map) {
		Todo todo1 = todoService.retrieveTodo(id);
		map.put("todo", todo1);
		return "updatetodo";
	}

	@RequestMapping(value = "/update-todo", method = RequestMethod.POST)
	public String updateTodo( @ModelAttribute("todo") Todo todo, BindingResult result, ModelMap map) {
		if (result.hasErrors()) {
			return "updatetodo";
		}
		todo.setUser((String) map.get("name"));
		todoService.update(todo);
		return "redirect:/todo-list";
	}
}
