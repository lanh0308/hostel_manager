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
import model.RoomCategory;

/**
 *
 * @author lanh0
 */
public class RoomCategoryDBContext extends DBContext {

    public ArrayList<RoomCategory> getRoomCategorys() {
        ArrayList<RoomCategory> roomCategorys = new ArrayList<>();

        try {
            String sql = "select r.id as 'rid', r.name as 'rName', \n"
                    + " r.unit_price, r.areage, r.floor_number, r.is_window, \n"
                    + " r.is_balcony, r.is_kitchen, r.desk_number, b.id as 'bid', b.name as 'bName'\n"
                    + "from room_category r inner join bed_category b on r.id_bed_category = b.id"
                    + " order by r.floor_number asc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                RoomCategory rc = new RoomCategory();
                rc.setID(rs.getInt("rid"));
                rc.setName(rs.getString("rName"));
                rc.setUnit_price(rs.getInt("unit_price"));
                rc.setAreage(rs.getInt("areage"));
                rc.setFloor_number(rs.getInt("floor_number"));
                rc.setIs_window(rs.getBoolean("is_window"));
                rc.setIs_balcony(rs.getBoolean("is_balcony"));
                rc.setIs_kitchen(rs.getBoolean("is_kitchen"));
                rc.setDesk_number(rs.getInt("desk_number"));
                BedCategory bc = new BedCategory();
                bc.setId(rs.getInt("bid"));
                bc.setName(rs.getString("bName"));
                rc.setBed_category(bc);
                roomCategorys.add(rc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return roomCategorys;
    }

    public ArrayList<RoomCategory> getRoomCategorys(int floor) {
        ArrayList<RoomCategory> roomCategorys = new ArrayList<>();

        try {
            String sql = "select r.id as 'rid', r.name as 'rName', \n"
                    + " r.unit_price, r.areage, r.floor_number, r.is_window, \n"
                    + " r.is_balcony, r.is_kitchen, r.desk_number, b.id as 'bid', b.name as 'bName'\n"
                    + "from room_category r inner join bed_category b on r.id_bed_category = b.id"
                    + " where r.floor_number = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, floor);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                RoomCategory rc = new RoomCategory();
                rc.setID(rs.getInt("rid"));
                rc.setName(rs.getString("rName"));
                rc.setUnit_price(rs.getInt("unit_price"));
                rc.setAreage(rs.getInt("areage"));
                rc.setFloor_number(rs.getInt("floor_number"));
                rc.setIs_window(rs.getBoolean("is_window"));
                rc.setIs_balcony(rs.getBoolean("is_balcony"));
                rc.setIs_kitchen(rs.getBoolean("is_kitchen"));
                rc.setDesk_number(rs.getInt("desk_number"));
                BedCategory bc = new BedCategory();
                bc.setId(rs.getInt("bid"));
                bc.setName(rs.getString("bName"));
                rc.setBed_category(bc);
                roomCategorys.add(rc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return roomCategorys;
    }

    public void addRoomCategory(RoomCategory roomCategory) {
        String sql = "INSERT INTO [room_category]\n"
                + "           ([name]\n"
                + "           ,[unit_price]\n"
                + "           ,[areage]\n"
                + "           ,[floor_number]\n"
                + "           ,[is_window]\n"
                + "           ,[is_balcony]\n"
                + "           ,[is_kitchen]\n"
                + "           ,[desk_number]\n"
                + "           ,[id_bed_category])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, roomCategory.getName());
            stm.setInt(2, roomCategory.getUnit_price());
            stm.setInt(3, roomCategory.getAreage());
            stm.setInt(4, roomCategory.getFloor_number());
            stm.setBoolean(5, roomCategory.isIs_window());
            stm.setBoolean(6, roomCategory.isIs_balcony());
            stm.setBoolean(7, roomCategory.isIs_kitchen());
            stm.setInt(8, roomCategory.getDesk_number());
            stm.setInt(9, roomCategory.getBed_category().getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RoomCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RoomCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public RoomCategory getRoomCategory(int id) {
        try {
            String sql = "select r.id as 'rid', r.name as 'rName', r.unit_price, r.areage, r.floor_number, r.is_window,r.is_balcony, r.is_kitchen, r.desk_number, b.id as 'bid',\n"
                    + "b.name as 'bName'\n"
                    + "from room_category r inner join bed_category b on r.id_bed_category = b.id\n"
                    + " where r.id = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                RoomCategory rc = new RoomCategory();
                rc.setID(rs.getInt("rid"));
                rc.setName(rs.getString("rName"));
                rc.setUnit_price(rs.getInt("unit_price"));
                rc.setAreage(rs.getInt("areage"));
                rc.setFloor_number(rs.getInt("floor_number"));
                rc.setIs_window(rs.getBoolean("is_window"));
                rc.setIs_balcony(rs.getBoolean("is_balcony"));
                rc.setIs_kitchen(rs.getBoolean("is_kitchen"));
                rc.setDesk_number(rs.getInt("desk_number"));
                BedCategory bc = new BedCategory();
                bc.setId(rs.getInt("bid"));
                bc.setName(rs.getString("bName"));
                rc.setBed_category(bc);
                return rc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void editRoomCategory(RoomCategory roomCategory) {
        String sql = "UPDATE [room_category]\n"
                + "   SET [name] = ?\n"
                + "      ,[unit_price] = ?\n"
                + "      ,[areage] = ?\n"
                + "      ,[floor_number] = ?\n"
                + "      ,[is_window] = ?\n"
                + "      ,[is_balcony] = ?\n"
                + "      ,[is_kitchen] = ?\n"
                + "      ,[desk_number] = ?\n"
                + "      ,[id_bed_category] = ?\n"
                + " WHERE [id] = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, roomCategory.getName());
            stm.setInt(2, roomCategory.getUnit_price());
            stm.setInt(3, roomCategory.getAreage());
            stm.setInt(4, roomCategory.getFloor_number());
            stm.setBoolean(5, roomCategory.isIs_window());
            stm.setBoolean(6, roomCategory.isIs_balcony());
            stm.setBoolean(7, roomCategory.isIs_kitchen());
            stm.setInt(8, roomCategory.getDesk_number());
            stm.setInt(9, roomCategory.getBed_category().getId());
            stm.setInt(10, roomCategory.getID());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RoomCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RoomCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void deleteRoomCategory(int id) {
        String sql = " DELETE [room_category] \n"
                + "WHERE [id] = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);

            stm.setInt(1, id);

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RoomCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RoomCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
}
