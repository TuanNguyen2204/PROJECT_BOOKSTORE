/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Bill;
import model.Bill;

/**
 *
 * @author Tuan
 */
public class BillDAL extends DBContext {

    public List<Bill> getTop3BestSeller() {
        String xSql = "select top 3 pid,sum(b.amount) countAmount\n"
                + "from Bills b\n"
                + "group by pid\n"
                + "order by countAmount desc ";
        List<Bill> lsBill = new ArrayList<Bill>();
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setPid(rs.getString("pid"));
                bill.setAmount(rs.getInt("countAmount"));
                lsBill.add(bill);
            }
            return lsBill;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Bill> getTop5Username() {
        String xSql = "select top 5 username, sum(b.total) total\n"
                + "from Bills b \n"
                + "group by username\n"
                + "order by total desc";
        List<Bill> lsBill = new ArrayList<Bill>();
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setUsername(rs.getString("username"));
                bill.setTotal(rs.getFloat("total"));
                lsBill.add(bill);
            }
            return lsBill;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void deleteProductByPid(String pid) {
        String xSql = "DELETE Bills WHERE pid= ? ";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Bill> getAll() {
        List<Bill> list = new ArrayList<Bill>();
        String xSql = "select Bills.*, p.name, p.description, p.price, p.catid, p.image from Bills inner join Products p\n"
                + "on Bills.pid = p.pid";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Bill p = new Bill(rs.getString("bid"), rs.getString("username"), rs.getString("pid"), rs.getDate("date"), rs.getInt("amount"), rs.getFloat("total"), rs.getString("name"), rs.getString("description"), rs.getFloat("price"), rs.getString("catid"), rs.getString("image"));
                list.add(p);
            }

            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void deleteProductByBid(String bid) {
        String xSql = "DELETE Bills WHERE bid= ? ";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, bid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Bill getBillByBid(String bid) {
        String xSql = "select Bills.*, p.name, p.description, p.price, p.catid, p.image from Bills inner join Products p\n"
                + "on Bills.pid = p.pid where bid = ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, bid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Bill p = new Bill(rs.getString("bid"), rs.getString("username"), rs.getString("pid"), rs.getDate("date"), rs.getInt("amount"), rs.getFloat("total"), rs.getString("name"), rs.getString("description"), rs.getFloat("price"), rs.getString("catid"), rs.getString("image"));
                return p;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        BillDAL b = new BillDAL();
        System.out.println(b.getBillByBid("2c6fe9f4-678d-42d6-ab0e-bf9bf3c75e66"));
    }

    public void updateBillById(Bill b) {
        String xSql = "UPDATE Bills set username = ? ,"
                + "pid = ? , "
                + "date = ? ,"
                + "amount = ? , "
                + "total = ? "
                + "where bid = ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, b.getUsername());
            ps.setString(2, b.getPid());
            ps.setDate(3, (Date) b.getDate());
            ps.setInt(4, b.getAmount());
            ps.setFloat(5, b.getTotal());
            ps.setString(6, b.getBid());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
