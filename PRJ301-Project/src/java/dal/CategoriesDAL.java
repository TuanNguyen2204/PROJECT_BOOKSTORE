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
import model.Categories;

/**
 *
 * @author Tuan
 */
public class CategoriesDAL extends DBContext{
    public List<Categories> getAllCategories(){
        List<Categories> list = new ArrayList<Categories>();
        String xSql = "select * from Categories";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories p = new Categories(rs.getString("catid"), rs.getString("name"));
                list.add(p);
            }
            
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public void addNewCategory(Categories c){
        String xSql = "insert into Categories(catid, name) values (?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, c.getCatid());
            ps.setString(2, c.getName());
            ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
     public void deleteCategoriesByCatid(String catid) {
        String xSql = "DELETE FROM Categories WHERE catid= ? ";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, catid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
