package com.product.operation;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.executor.QueryExecutor;
import com.jdbc.model.Product;
import com.model.product.Category;
import com.user.User;

public class ProductOperation {
	public static boolean addProduct(Product product) {
		
		String query = "Insert into product(ProductName,ProductDescription,ProductCategoriesId,ProductPrice,"
				+ "ProductImage1,ProductImage2,ProductImage3,ProductImage4,ProductType,Email,phone,Duration)"
				+ " values (?,?,?,?,?,?,?,?,?,?,?,?)";
		QueryExecutor.prepareStatement(query);
		if (QueryExecutor.getPreparedStatement() != null) {
			try {
				QueryExecutor.getPreparedStatement().setString(1, product.getName());
				QueryExecutor.getPreparedStatement().setString(2, product.getDescription());
				QueryExecutor.getPreparedStatement().setInt(3, product.getCid());
				QueryExecutor.getPreparedStatement().setInt(4, product.getPrice());
				QueryExecutor.getPreparedStatement().setString(5, product.getImage1());
				QueryExecutor.getPreparedStatement().setString(6, product.getImage2());
				QueryExecutor.getPreparedStatement().setString(7, product.getImage3());
				QueryExecutor.getPreparedStatement().setString(8, product.getImage4());
				QueryExecutor.getPreparedStatement().setInt(9, product.getPtype());
				QueryExecutor.getPreparedStatement().setString(10, product.getEmail());
				QueryExecutor.getPreparedStatement().setString(11, product.getPhone());
				QueryExecutor.getPreparedStatement().setInt(12, product.getDuration());
				int i = QueryExecutor.executeStatement();
				if(i>0) {
					System.out.println("Addedd Successfully....");
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			return false;
	}
public static boolean updateProduct(Product product) {
		
		String query = "Update product set ProductName=?,ProductDescription=?,ProductCategoriesId=?,ProductPrice=?,"
				+ "ProductImage1=?,ProductImage2=?,ProductImage3=?,ProductImage4=?,IsActive=?,ProductType=?,Email=?,phone=? where ProductId=? ";
		QueryExecutor.prepareStatement(query);
		if (QueryExecutor.getPreparedStatement() != null) {
			try {
				QueryExecutor.getPreparedStatement().setString(1, product.getName());
				QueryExecutor.getPreparedStatement().setString(2, product.getDescription());
				QueryExecutor.getPreparedStatement().setInt(3, product.getCid());
				QueryExecutor.getPreparedStatement().setInt(4, product.getPrice());
				QueryExecutor.getPreparedStatement().setString(5, product.getImage1());
				QueryExecutor.getPreparedStatement().setString(6, product.getImage2());
				QueryExecutor.getPreparedStatement().setString(7, product.getImage3());
				QueryExecutor.getPreparedStatement().setString(8, product.getImage4());
				QueryExecutor.getPreparedStatement().setInt(9, product.getIsactive());
				QueryExecutor.getPreparedStatement().setInt(10, product.getPtype());
				QueryExecutor.getPreparedStatement().setString(11, product.getEmail());
				QueryExecutor.getPreparedStatement().setString(12, product.getPhone());
				QueryExecutor.getPreparedStatement().setInt(13, product.getId());
				int i = QueryExecutor.executeStatement();
				if(i>0) {
					System.out.println("Addedd Successfully....");
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace() ;
			}
		}
		return false;
	}
public static List<Product> getAll() {
	String query = "Select * from product;";
	return getProductListByQuery(query);
}

public static List<Product> getBySearchInput(String s) {
	String query = "Select * from product where ProductName LIKE '%"+s+"%' AND IsActive="+1+";";
	return getProductListByQuery(query);
}

public static List<Product> getAllByCategory(int i) {
	String query = "Select * from product where ProductCategoriesId="+i+" AND IsActive="+1+" AND ProductType="+1+";";
	return getProductListByQuery(query);
}

public static List<Product> getAllBuyByCategory(int i) {
	String query = "Select * from product where ProductCategoriesId="+i+" AND IsActive="+1+" AND ProductType="+1+";";
	return getProductListByQuery(query);
}
public static List<Product> getByCategoryAndType(int cid,int type) {
	String query = "Select * from product where ProductCategoriesId="+cid+" AND ProductType="+type+" AND IsActive="+1+";";
	return getProductListByQuery(query);
}


public static List<Product> getNewType(int min,int max,int cid,int type) {
	String query = "Select * from product where ProductCategoriesId="+cid+" AND ProductType="+type+" AND IsActive="+1+" AND ProductPrice > "+min+" AND ProductPrice < "+max+";";
	return getProductListByQuery(query);
}




public static List<Product> getByProductAndType(int cid,int type) {
	String query = "Select * from product where ProductCategoriesId="+cid+" AND ProductType="+type+" AND IsActive="+1+";";
	return getProductListByQuery(query);
}

public static List<Product> getAllActive() {
	String query = "Select * from product where IsActive="+1+";";
	return getProductListByQuery(query);
}

public static List<Product> getAllByEmail(String email) {
	String query = "Select * from product where Email='"+email+"'  AND IsActive="+1+";";
	return getProductListByQuery(query);
}
public static  List<Product> getAllByType() {
	String query = "Select * from product where ProductType="+1+";";
	return getProductListByQuery(query);
}
public static  Product getAllByID(int pid) {
	String query = "Select * from product where ProductId="+pid+";";
	List<Product> l=  getProductListByQuery(query);
	return l.get(0);
}

public static  List<Product>  getListByID(int pid) {
	String query = "Select * from product where ProductId="+pid+";";
	return getProductListByQuery(query);
	
}

private static List<Product> getProductListByQuery(String query) {
	List<Product> l = new ArrayList<>();
	ResultSet rs = QueryExecutor.executeStatementQuery(query);
if(rs!=null) {
	try {
		while (rs.next()) {
			Product p = getProductData(rs);
			l.add(p);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		// close connection
		QueryExecutor.close();
	}
}
	return l;
}
public List<Product> getAllByName(String name) {
	String query = "Select * from product where ProductName = '"+name+"'";
	return getProductListByQuery(query);
}
public static List<Product> getRange(int from,int to) { 
	String query = "Select * from product where ProductPrice > "+from+" AND ProductPrice < "+to+"  AND ProductType="+1+"  AND IsActive="+1+" ";
	return getProductListByQuery(query);
}
/*public List<Product> getMaxDiscount() { 
	String query = "Select * from product where disc = (Select MAX(disc) from product )";
	return getProductListByQuery(query);
}*/
public List<Product> getMinQty() { 
	String query = "Select * from productDB where qty = (Select MIN(qty) from productDB )";
	return getProductListByQuery(query);
}

public List<Product> getRangeQty(int from,int to) { 
	String query = "Select * from product where qty > "+from+" AND qty < "+to+" ";
	return getProductListByQuery(query);
}
private static Product getProductData(ResultSet rs) throws SQLException {
	Product p = new Product();
	p.setId(rs.getInt(1));
	p.setName(rs.getString(2));
	p.setDescription(rs.getString(3));
	p.setCid(rs.getInt(4));
	p.setPrice(rs.getInt(5));
	p.setImage1(rs.getString(6));
	p.setImage2(rs.getString(7));
	p.setImage3(rs.getString(8));
	p.setImage4(rs.getString(9));
	//p.setDoi(rs.getString(11));
	p.setIsactive(rs.getInt(10));
	p.setPtype(rs.getInt(13));
	p.setEmail(rs.getString(14));
	p.setPhone(rs.getString(15));
	p.setDuration(rs.getInt(16));
	
	return p;
}

}
