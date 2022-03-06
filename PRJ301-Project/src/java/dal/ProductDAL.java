/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
}
