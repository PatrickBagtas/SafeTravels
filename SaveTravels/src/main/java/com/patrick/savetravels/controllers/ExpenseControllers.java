package com.patrick.savetravels.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.patrick.savetravels.models.Expense;
import com.patrick.savetravels.services.ExpenseService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/expense")
public class ExpenseControllers {
	@Autowired
	ExpenseService expenseService;
	
//====Show ALL===
	@GetMapping("")
	public String index(@ModelAttribute("expense")Expense expense,Model model) {
		List<Expense> expenses= expenseService.allExpense();
		model.addAttribute("expenses",expenses);
		return "dashboard.jsp";
	}

//	===Create===
	@PostMapping("/add")
	public String index(@Valid @ModelAttribute("expense")Expense expense, BindingResult result, Model model) {
		if(result.hasErrors()) {
			List<Expense> expenses = expenseService.allExpense();
			model.addAttribute("expenses", expenses);
			return "dashboard.jsp";
		}
		expenseService.addExpense(expense);
		return "redirect:/expense";
	}
//	====Edit Page===
	@GetMapping("/edit/{id}")
	public String editExpense(@PathVariable("id")Long id,Model model) {
		model.addAttribute("expense",expenseService.getOne(id));
		return "edit.jsp";
	}
	
	@PutMapping("/edited/{id}")
	public String editedExpense(@Valid @ModelAttribute("expense")Expense expense, BindingResult result,@PathVariable ("id")Long id) {
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		expenseService.update(expense);
		return "redirect:/expense";
	}
//	==Delete===
	@DeleteMapping("/delete/{id}")
	public String deleteExpense(@PathVariable("id")Long id) {
		expenseService.delete(id);
		return "redirect:/expense";
	}
//	===SHow One===
	@GetMapping("/{id}")
	public String showOne(Model model, @PathVariable("id")Long id) {
		Expense expense = expenseService.getOne(id);
		model.addAttribute("expense",expense);
		return "show.jsp";
	}
	
}
