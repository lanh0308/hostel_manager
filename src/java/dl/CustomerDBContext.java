/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;

/**
 *
 * @author lanh0
 */
public class CustomerDBContext extends DBContext {

    public ArrayList<Customer> getCustomers() {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[phone_number]\n"
                    + "      ,[address]\n"
                    + "      ,[email]\n"
                    + "      ,[cmnd]\n"
                    + "  FROM [customer]";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setName(rs.getString("name"));
                customer.setPhone_number(rs.getString("phone_number"));
                customer.setAddress(rs.getString("address"));
                customer.setEmail(rs.getString("email"));
                customer.setCmnd(rs.getString("cmnd"));
                customers.add(customer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

    public Customer getCustomer(int id) {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[phone_number]\n"
                    + "      ,[address]\n"
                    + "      ,[email]\n"
                    + "      ,[cmnd]\n"
                    + "  FROM [customer]\n"
                    + " WHERE id = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setName(rs.getString("name"));
                customer.setPhone_number(rs.getString("phone_number"));
                customer.setAddress(rs.getString("address"));
                customer.setEmail(rs.getString("email"));
                customer.setCmnd(rs.getString("cmnd"));
                return customer;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Customer insertCustomer(Customer c) {
        int id = 1;
        String sql = "INSERT INTO [customer]\n"
                + "           ([name]\n"
                + "           ,[phone_number]\n"
                + "           ,[address]\n"
                + "           ,[email]\n"
                + "           ,[cmnd])\n"
                + "     VALUES(?,?,?,?,?);";

        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql, stm.RETURN_GENERATED_KEYS);
            stm.setString(1, c.getName());
            stm.setString(2, c.getPhone_number());
            stm.setString(3, c.getAddress());
            stm.setString(4, c.getEmail());
            stm.setString(5, c.getCmnd());
            stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            if (rs.next()) {
                id = rs.getInt(1);
                System.out.println(id);
                return getCustomer(id);
            } 
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    public void updateCustomer(Customer c) {
        String sql = "UPDATE [customer]\n"
                + "   SET ([name]\n"
                + "           ,[phone_number]\n"
                + "           ,[address]\n"
                + "           ,[email]\n"
                + "           ,[cmnd])\n"
                + "     VALUES(?,?,?,?,?)\n"
                + "where id = ?";

        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(6, c.getId());
            stm.setString(1, c.getName());
            stm.setString(2, c.getPhone_number());
            stm.setString(3, c.getAddress());
            stm.setString(4, c.getEmail());
            stm.setString(5, c.getCmnd());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void deleteCustomer(int id) {
        String sql = "DELETE FROM [customer]\n"
                + "where id = ?";

        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
}
