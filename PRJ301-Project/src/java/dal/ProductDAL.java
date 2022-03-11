/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import model.Product;

/**
 *
 * @author Tuan
 */
public class ProductDAL extends DBContext {

    public List<Product> getAllProduct() {

        List<Product> list = new ArrayList<Product>();
        String xSql = "select * from Products";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString("pid"), rs.getString("name"), rs.getString("description"), rs.getFloat("price"), rs.getInt("quantity"), rs.getString("catid"), rs.getString("image"));
                list.add(p);
            }

            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Product> getProductByCategory(String category) {

        List<Product> list = new ArrayList<Product>();
        String xSql = "select * from Products where catid = ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, category);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString("pid"), rs.getString("name"), rs.getString("description"), rs.getFloat("price"), rs.getInt("quantity"), rs.getString("catid"), rs.getString("image"));
                list.add(p);
            }
            ps.close();
            rs.close();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Product> getProductBySerch(String search) {
        List<Product> list = new ArrayList<Product>();
        String xSql = "select * from Products where name like ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString("pid"), rs.getString("name"), rs.getString("description"), rs.getFloat("price"), rs.getInt("quantity"), rs.getString("catid"), rs.getString("image"));
                list.add(p);
            }
            ps.close();
            rs.close();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Product getProductById(String pid) {
        String xSql = "select * from Products where pid = ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString("pid"), rs.getString("name"), rs.getString("description"), rs.getFloat("price"), rs.getInt("quantity"), rs.getString("catid"), rs.getString("image"));
                ps.close();
                rs.close();
                return p;
            }
            ps.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
     public List<Product> getListByPage(List<Product> list, int start,int end){
        ArrayList<Product> arr=new ArrayList<>();
        for(int i=start;i<end;i++){
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Product> getProductOrderByPrice(String search) {
        List<Product> list = new ArrayList<Product>();
        String xSql = "select * from Products\n"
                + "order by price asc";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString("pid"), rs.getString("name"), rs.getString("description"), rs.getFloat("price"), rs.getInt("quantity"), rs.getString("catid"), rs.getString("image"));
                list.add(p);
            }

            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Product> getProductOrderByBestSeller(String search) {
        List<Product> list = new ArrayList<Product>();
        String xSql = "select p.*, isnull(sum(b.amount),0)  countAmount\n"
                + "from Products p left join Bills b on p.pid = b.pid \n"
                + "group by p.pid, p.name, p.description, p.price, p.quantity, p.catid, p.image\n"
                + "order by countAmount desc";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString("pid"), rs.getString("name"), rs.getString("description"), rs.getFloat("price"), rs.getInt("quantity"), rs.getString("catid"), rs.getString("image"));
                int quant = rs.getInt("countAmount");
                list.add(p);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Product> getProductOrderByName(String search) {
        List<Product> list = new ArrayList<Product>();
        String xSql = "select * from Products\n"
                + "order by name asc";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString("pid"), rs.getString("name"), rs.getString("description"), rs.getFloat("price"), rs.getInt("quantity"), rs.getString("catid"), rs.getString("image"));
                list.add(p);
            }

            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public HashMap<String, Integer> getCart(String username) {
        HashMap<String, Integer> hashCart = new HashMap<>();
        String xSql = "select * from Carts where username = ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                hashCart.put(rs.getString("pid"), rs.getInt("amount"));
            }
            return hashCart;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hashCart;
    }

    public void addToCart(String username, String pid, int amount) {
        String xSql = "insert into Carts(username, pid, amount) values (?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, username);
            ps.setString(2, pid);
            ps.setInt(3, amount);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

     public void updateCart(String username, String pid, int amount){
        String xSql = "update Carts set amount=? where username=? and pid=?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setInt(1, amount);
            ps.setString(2, username);
            ps.setString(3, pid);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

      public void removeProductCart(String username, String pid){
        String xSql = "DELETE FROM Carts WHERE username=? and pid=?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, username);
            ps.setString(2, pid);
            ps.executeUpdate();
           
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
