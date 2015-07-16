package com.dnt.service.transaction;

import com.dnt.model.Transaction;

public class WithdrawTransaction implements TransactionCommand {

	@Override
	public void execute(Transaction t) {
		t.getAccount().withdraw(t.getAmount());
	}

	@Override
	public void reverse(Transaction t) {
		t.getAccount().deposit(t.getAmount());	
	}

}
