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
import model.RoomCategory;

/**
 *
 * @author lanh0
 */
public class RoomCategoryDBContext extends DBContext {

    public ArrayList<RoomCategory> getRoomCategorys() {
        ArrayList<RoomCategory> roomCategorys = new ArrayList<>();
        
        try {
            String sql = "select id, name, areage, floor_number, is_window, is_balcony, is_kitchen, desk_number, bed_category\n"
                    + "from room_category";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                RoomCategory rc = new RoomCategory();
                rc.setID(rs.getInt("id"));
                rc.setName(rs.getString("name"));
                rc.setAreage(rs.getInt("areage"));
                rc.setFloor_number(rs.getInt("floor_number"));
                rc.setIs_window(rs.getBoolean("is_window"));
                rc.setIs_balcony(rs.getBoolean("is_balcony"));
                rc.setIs_kitchen(rs.getBoolean("is_kitchen"));
                rc.setDesk_number(rs.getInt("desk_number"));
               // rc.setBed_category(rs.getString("bed_category"));
                roomCategorys.add(rc);

            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return roomCategorys;
    }
}
