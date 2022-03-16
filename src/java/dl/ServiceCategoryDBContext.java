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
import model.ServiceCategory;

/**
 *
 * @author lanh0
 */
public class ServiceCategoryDBContext extends DBContext {

    public ArrayList<ServiceCategory> getServiceCategorys() {
        ArrayList<ServiceCategory> serviceCategorys = new ArrayList<>();

        try {
            String sql = "select id, name, unit_price\n"
                    + "from service_category";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ServiceCategory sc = new ServiceCategory();
                sc.setId(rs.getInt("id"));
                sc.setName(rs.getString("name"));
                sc.setUnit_price(rs.getInt("unit_price"));
                serviceCategorys.add(sc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return serviceCategorys;
    }

    public ServiceCategory getServiceCategory(int id) {
        try {
            String sql = "select id, name, unit_price\n"
                    + "from service_category\n"
                    + "where id = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ServiceCategory sc = new ServiceCategory();
                sc.setId(rs.getInt("id"));
                sc.setName(rs.getString("name"));
                sc.setUnit_price(rs.getInt("unit_price"));
                return sc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertServiceCategory(String name, int unit_price) {
        String sql = "INSERT INTO [service_category]([name],[unit_price])\n"
                + "     VALUES(?,?)";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setInt(2, unit_price);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServiceCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServiceCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void updateServiceCategory(ServiceCategory sc) {
        String sql = " UPDATE [service_category]\n"
                + "   SET [name] = ?, [unit_price] = ? "
                + "WHERE [id] = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);

            stm.setInt(3, sc.getId());
            stm.setString(1, sc.getName());
            stm.setInt(2, sc.getUnit_price());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServiceCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServiceCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void deleteServiceCategory(int id) {
        ServiceDBContext serviceDBContext = new ServiceDBContext();
        serviceDBContext.deleteByServiceCategory(id);
        String sql = "DELETE FROM [service_category]\n"
                + "      WHERE id = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    
    
}
