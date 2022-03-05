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
import model.BedCategory;

/**
 *
 * @author lanh0
 */
public class BedCategoryDBContext extends DBContext {

    

    public ArrayList<BedCategory> getBedCategorys() {
        ArrayList<BedCategory> bedCategorys = new ArrayList<>();

        try {
            String sql = "select id, name\n"
                    + "from [bed_category]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                BedCategory bc = new BedCategory();
                bc.setId(rs.getInt("id"));
                bc.setName(rs.getString("name"));
                bedCategorys.add(bc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BedCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bedCategorys;
    }

    public void addBedCategory(String name) {
        String sql = "INSERT INTO [bed_category]([name])\n"
                + "     VALUES(?)";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BedCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(BedCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(BedCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public BedCategory getBedCategory(int id) {
        try {
            String sql = "select id, name\n"
                    + "from bed_category\n"
                    + "where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                BedCategory bc = new BedCategory();
                bc.setId(rs.getInt("id"));
                bc.setName(rs.getString("name"));
                return bc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BedCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void editBedCategory(BedCategory bedCategory) {
        String sql = " UPDATE [bed_category]\n"
                + "   SET [name] = ? "
                + "WHERE [id] = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);

            stm.setInt(2, bedCategory.getId());
            stm.setString(1, bedCategory.getName());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BedCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(BedCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(BedCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
    public void deleteBedCategory(int id) {
        String sql = " DELETE FROM [bed_category] \n"
                + " WHERE [id] = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BedCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(BedCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(BedCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
}
