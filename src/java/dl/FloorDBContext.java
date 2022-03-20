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
import model.Floor;

/**
 *
 * @author lanh0
 */
public class FloorDBContext extends DBContext {

    public ArrayList<Floor> floors() {
        ArrayList<Floor> floors = new ArrayList<>();
        try {
            String sql = "SELECT a.floor_number, a.notuse, b.isuse FROM(select a.floor_number, s.notuse from (select  room_category.floor_number,  count(room.id) as notuse\n"
                    + "from room_rental full outer join room on room_rental.room_id = room.id\n"
                    + "inner join room_category on room_category.id = room.categoryId\n"
                    + "where room_rental.room_id is null\n"
                    + "group by room_category.floor_number) as s\n"
                    + "full outer join (select room_category.floor_number\n"
                    + "from room_category\n"
                    + "group by room_category.floor_number) as a on s.floor_number = a.floor_number) a\n"
                    + "inner join (\n"
                    + "select a.floor_number, s.isuse from(\n"
                    + "select  room_category.floor_number,  count(room.id) as isuse\n"
                    + "from room_rental full outer join room on room_rental.room_id = room.id\n"
                    + "inner join room_category on room_category.id = room.categoryId\n"
                    + "where room_rental.room_id is not null\n"
                    + "group by room_category.floor_number) as s\n"
                    + "full outer join (select room_category.floor_number\n"
                    + "from room_category\n"
                    + "group by room_category.floor_number) as a on s.floor_number = a.floor_number) b\n"
                    + "on b.floor_number = a.floor_number\n"
                    + "group by  a.floor_number, a.notuse, b.isuse";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Floor floor = new Floor();
                floor.setNumber(rs.getInt("floor_number"));
                floor.setNotuse(rs.getInt("notuse"));
                floor.setUse(rs.getInt("isuse"));
                floors.add(floor);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return floors;
    }
}
