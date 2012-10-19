package com.tavant.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.tavant.domain.Transaction;
import com.tavant.domain.User;
import com.tavant.services.ContactService;
import com.tavant.services.TransactionService;

@Controller
public class TransactionController {
	private TransactionService transactionService;
	private ContactService contactService;

	@Autowired
	public void setTransactionService(TransactionService transactionService) {
		this.transactionService = transactionService;
	}

	@Autowired
	public void setContactService(ContactService contactService) {
		this.contactService = contactService;
	}

	@RequestMapping(value = "transactions-list")
	public ModelAndView showTransactions(HttpServletRequest request) {
		// if user session is empty, return to master page
		if (request.getSession().getAttribute("currentUser") == null) {
			return new ModelAndView("redirect:login.html");
		}

		User currentUser = (User) request.getSession().getAttribute(
				"currentUser");
		List<Transaction> transactionList = transactionService
				.selectAll(currentUser.getUserId());
		ModelMap model = new ModelMap(transactionList);
		
		// model.addAttribute(request.getParameter("owe"));
		int[] totalAmounts = transactionService.getTotalAmounts(currentUser.getUserId());
		model.addAttribute("totalAmounts",totalAmounts);
		return new ModelAndView("transactionsList", model);
	}

	@RequestMapping(value = "transaction-add", method = RequestMethod.GET)
	public ModelAndView addTransaction(HttpServletRequest request) {

		if (request.getSession().getAttribute("currentUser") == null) {
			return new ModelAndView("redirect:login.html");
		}

		ModelMap model = new ModelMap();
		
		Transaction transaction = new Transaction();
		model.addAttribute(transaction);

		String owes = request.getParameter("owes");
		model.addAttribute("owes", owes);
		
		return new ModelAndView("addTransaction", model);
	}

	@RequestMapping(value = "transaction-add", method = RequestMethod.POST)
	public ModelAndView onAddTransactionSubmit(
			@ModelAttribute("transaction") Transaction transaction,
			BindingResult result, SessionStatus status,
			HttpServletRequest request) {
		System.out.println(transaction);
		User user = (User) request.getSession().getAttribute("currentUser");
		transaction.setUserId(user.getUserId());
		
		transactionService.addTransaction(transaction);
		((HashMap<Integer, Transaction>)request.getSession().getAttribute("transHashMap")).put(transaction.getContactId(), transaction);
		
		return new ModelAndView("redirect:transactions-list.html");
	}
	
	@RequestMapping("delete-transaction")
	public ModelAndView deleteTransaction(HttpServletRequest request) {
		
		if (request.getSession().getAttribute("currentUser") == null) {
			return new ModelAndView("redirect:login.html");
		}
		
		
		int id = Integer.parseInt(request.getParameter("transId"));
		int contactId = Integer.parseInt(request.getParameter("contactId"));
		
		transactionService.deleteTransaction(id);
		((HashMap<Integer, Transaction>)request.getSession().getAttribute("transHashMap")).remove(contactId);

		
		return new ModelAndView("redirect:transactions-list.html");
		
	}
}
