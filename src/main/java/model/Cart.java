package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	List<Product> items;

	public Cart() {
		items = new ArrayList<>();
	}

	public void add(Product ci) {
		for (Product x : items) {
			if (ci.getId() == x.getId()) {
				x.setNumber(x.getNumber() + 1);
				return;
			}

		}
		items.add(ci);
	}

	public void decrease(Product ci) {
		for (Product x : items) {
			if (ci.getId() == x.getId()) {
				if (x.getNumber() == 1) {
					remove(ci.getId());
					return;
				}else {
					x.setNumber(x.getNumber() - 1);	
				}
				return;
			}
		}
	}
	

	public void remove(int id) {
		for (Product x : items) {
			if (x.getId() == id) {
				items.remove(x);
				return;
			}
		}
	}
	
	public void removeAll() {
		items.clear();
	}

	public double getAmount() {
		double s = 0;
		for (Product x : items) {
			s += x.getPrice() * x.getNumber();
		}

		return Math.round(s * 100.0) / 100.0;

	}


	public List<Product> getItems() {
		return items;
	}

}
