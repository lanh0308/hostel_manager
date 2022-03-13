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
import model.Room;
import model.RoomCategory;
import model.ServiceCategory;

/**
 *
 * @author lanh0
 */
public class RoomDBContext extends DBContext {

    public ArrayList<Room> getRoomsEmpty() {
        ArrayList<Room> rooms = new ArrayList<>();
        RoomCategoryDBContext roomCategoryDB = new RoomCategoryDBContext();
        try {
            String sql = "SELECT [room].[id] as 'roomId'\n"
                    + "    ,[room].[name] as 'roomName'\n"
                    + "    ,[room].[categoryId]\n"
                    + "    ,[room_category].[name] as 'roomCategoryName'\n"
                    + "    ,[room_category].[unit_price]\n"
                    + "    ,[room_category].[areage]\n"
                    + "    ,[room_category].[floor_number]\n"
                    + "    ,[room_category].[is_window]\n"
                    + "    ,[room_category].[is_balcony]\n"
                    + "    ,[room_category].[is_kitchen]\n"
                    + "    ,[room_category].[desk_number]\n"
                    + "    ,[room_category].[id_bed_category]\n"
                    + "    ,[bed_category].[name] as 'bedCategoryName' \n"
                    + "    FROM [room_rental]\n"
                    + "    INNER JOIN [customer] on [room_rental].[customer_id] = [customer].[id]\n"
                    + "    RIGHT JOIN [room] on [room_rental].[room_id] = [room].[id]\n"
                    + "    INNER JOIN [room_category] on [room].[categoryId] = [room_category].[id]\n"
                    + "    INNER JOIN [bed_category] on [room_category].[id_bed_category] = [bed_category].[id]\n"
                    + "	WHERE [room_rental].[id] is null";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setId(rs.getInt("roomId"));
                room.setName(rs.getString("roomName"));
                RoomCategory rc = new RoomCategory();
                rc.setID(rs.getInt("categoryId"));
                rc.setName(rs.getString("roomCategoryName"));
                rc.setUnit_price(rs.getInt("unit_price"));
                rc.setAreage(rs.getInt("areage"));
                rc.setFloor_number(rs.getInt("floor_number"));
                rc.setIs_window(rs.getBoolean("is_window"));
                rc.setIs_balcony(rs.getBoolean("is_balcony"));
                rc.setIs_kitchen(rs.getBoolean("is_kitchen"));
                rc.setDesk_number(rs.getInt("desk_number"));
                BedCategory bc = new BedCategory();
                bc.setId(rs.getInt("id_bed_category"));
                bc.setName(rs.getString("bedCategoryName"));
                rc.setBed_category(bc);
                room.setRoomCategory(rc);
                rooms.add(room);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rooms;
    }

    public ArrayList<Room> getAllRooms() {
        ArrayList<Room> rooms = new ArrayList<>();
        RoomCategoryDBContext roomCategoryDB = new RoomCategoryDBContext();
        try {
            String sql = "SELECT [room_rental].[id] as 'room_rental_id'\n"
                    + "	,[room].[id] as 'roomId'\n"
                    + "    ,[room].[name] as 'roomName'\n"
                    + "    ,[room].[categoryId]\n"
                    + "    ,[room_category].[name] as 'roomCategoryName'\n"
                    + "    ,[room_category].[unit_price]\n"
                    + "    ,[room_category].[areage]\n"
                    + "    ,[room_category].[floor_number]\n"
                    + "    ,[room_category].[is_window]\n"
                    + "    ,[room_category].[is_balcony]\n"
                    + "    ,[room_category].[is_kitchen]\n"
                    + "    ,[room_category].[desk_number]\n"
                    + "    ,[room_category].[id_bed_category]\n"
                    + "    ,[bed_category].[name] as 'bedCategoryName' \n"
                    + "    FROM [room_rental]\n"
                    + "    INNER JOIN [customer] on [room_rental].[customer_id] = [customer].[id]\n"
                    + "    RIGHT JOIN [room] on [room_rental].[room_id] = [room].[id]\n"
                    + "    INNER JOIN [room_category] on [room].[categoryId] = [room_category].[id]\n"
                    + "    INNER JOIN [bed_category] on [room_category].[id_bed_category] = [bed_category].[id]";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setIsEmpty(rs.getInt("room_rental_id")==0);
                room.setId(rs.getInt("roomId"));
                room.setName(rs.getString("roomName"));
                RoomCategory rc = new RoomCategory();
                rc.setID(rs.getInt("categoryId"));
                rc.setName(rs.getString("roomCategoryName"));
                rc.setUnit_price(rs.getInt("unit_price"));
                rc.setAreage(rs.getInt("areage"));
                rc.setFloor_number(rs.getInt("floor_number"));
                rc.setIs_window(rs.getBoolean("is_window"));
                rc.setIs_balcony(rs.getBoolean("is_balcony"));
                rc.setIs_kitchen(rs.getBoolean("is_kitchen"));
                rc.setDesk_number(rs.getInt("desk_number"));
                BedCategory bc = new BedCategory();
                bc.setId(rs.getInt("id_bed_category"));
                bc.setName(rs.getString("bedCategoryName"));
                rc.setBed_category(bc);
                room.setRoomCategory(rc);
                rooms.add(room);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rooms;
    }

    public ArrayList<Room> getRooms() {
        ArrayList<Room> rooms = new ArrayList<>();
        RoomCategoryDBContext roomCategoryDB = new RoomCategoryDBContext();
        try {
            String sql = "SELECT r.id as rid, r.name as rname, "
                    + "rc.id as rcid, rc.name as rcname,rc.unit_price, rc.areage, rc.floor_number, rc.is_window, rc.is_balcony, rc.is_kitchen, rc.desk_number, "
                    + "bc.id as bcid, bc.name as bcname \n"
                    + "FROM [room] AS r INNER JOIN [room_category] AS rc ON r.categoryId = rc.id\n"
                    + "INNER JOIN [bed_category] AS bc ON rc.id_bed_category = bc.id \n";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setId(rs.getInt("rid"));
                room.setName(rs.getString("rname"));
                RoomCategory rc = new RoomCategory();
                rc.setID(rs.getInt("rcid"));
                rc.setName(rs.getString("rcname"));
                rc.setUnit_price(rs.getInt("unit_price"));
                rc.setAreage(rs.getInt("areage"));
                rc.setFloor_number(rs.getInt("floor_number"));
                rc.setIs_window(rs.getBoolean("is_window"));
                rc.setIs_balcony(rs.getBoolean("is_balcony"));
                rc.setIs_kitchen(rs.getBoolean("is_kitchen"));
                rc.setDesk_number(rs.getInt("desk_number"));
                BedCategory bc = new BedCategory();
                bc.setId(rs.getInt("bcid"));
                bc.setName(rs.getString("bcname"));
                rc.setBed_category(bc);
                room.setRoomCategory(rc);
                rooms.add(room);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rooms;
    }

    public Room getRoom(int id) {
        RoomCategoryDBContext roomCategoryDB = new RoomCategoryDBContext();
        try {
            String sql = "SELECT r.id as rid, r.name as rname, "
                    + "rc.id as rcid, rc.name as rcname,rc.unit_price, rc.areage, rc.floor_number, rc.is_window, rc.is_balcony, rc.is_kitchen, rc.desk_number, "
                    + "bc.id as bcid, bc.name as bcname \n"
                    + "FROM [room] AS r INNER JOIN [room_category] AS rc ON r.categoryId = rc.id\n"
                    + "INNER JOIN [bed_category] AS bc ON rc.id_bed_category = bc.id \n"
                    + "where r.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setId(rs.getInt("rid"));
                room.setName(rs.getString("rname"));
                RoomCategory rc = new RoomCategory();
                rc.setID(rs.getInt("rcid"));
                rc.setName(rs.getString("rcname"));
                rc.setUnit_price(rs.getInt("unit_price"));
                rc.setAreage(rs.getInt("areage"));
                rc.setFloor_number(rs.getInt("floor_number"));
                rc.setIs_window(rs.getBoolean("is_window"));
                rc.setIs_balcony(rs.getBoolean("is_balcony"));
                rc.setIs_kitchen(rs.getBoolean("is_kitchen"));
                rc.setDesk_number(rs.getInt("desk_number"));
                BedCategory bc = new BedCategory();
                bc.setId(rs.getInt("bcid"));
                bc.setName(rs.getString("bcname"));
                rc.setBed_category(bc);
                room.setRoomCategory(rc);
                return room;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
    public Room getRoomByName(String name) {
        RoomCategoryDBContext roomCategoryDB = new RoomCategoryDBContext();
        try {
            String sql = "SELECT r.id as rid, r.name as rname, "
                    + "rc.id as rcid, rc.name as rcname,rc.unit_price, rc.areage, rc.floor_number, rc.is_window, rc.is_balcony, rc.is_kitchen, rc.desk_number, "
                    + "bc.id as bcid, bc.name as bcname \n"
                    + "FROM [room] AS r INNER JOIN [room_category] AS rc ON r.categoryId = rc.id\n"
                    + "INNER JOIN [bed_category] AS bc ON rc.id_bed_category = bc.id \n"
                    + "where r.name = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setId(rs.getInt("rid"));
                room.setName(rs.getString("rname"));
                RoomCategory rc = new RoomCategory();
                rc.setID(rs.getInt("rcid"));
                rc.setName(rs.getString("rcname"));
                rc.setUnit_price(rs.getInt("unit_price"));
                rc.setAreage(rs.getInt("areage"));
                rc.setFloor_number(rs.getInt("floor_number"));
                rc.setIs_window(rs.getBoolean("is_window"));
                rc.setIs_balcony(rs.getBoolean("is_balcony"));
                rc.setIs_kitchen(rs.getBoolean("is_kitchen"));
                rc.setDesk_number(rs.getInt("desk_number"));
                BedCategory bc = new BedCategory();
                bc.setId(rs.getInt("bcid"));
                bc.setName(rs.getString("bcname"));
                rc.setBed_category(bc);
                room.setRoomCategory(rc);
                return room;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertRoom(Room room) {
        String sql = "INSERT INTO [room]([name],[categoryId])\n"
                + "     VALUES(?,?)";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, room.getName());
            stm.setInt(2, room.getRoomCategory().getID());
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

    public void updateRoom(Room room) {
        String sql = "UPDATE [room] SET [name] = ?,[categoryId] = ? \n"
                + " WHERE id = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, room.getName());
            stm.setInt(2, room.getRoomCategory().getID());
            stm.setInt(3, room.getId());

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

    public void deleteRoom(int id) {
        String sql = "DELETE FROM [room]\n"
                + " WHERE id = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BedCategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
