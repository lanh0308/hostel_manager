/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dl;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BedCategory;
import model.Customer;
import model.Room;
import model.RoomCategory;
import model.RoomRental;
import model.Service;
import model.ServiceCategory;

/**
 *
 * @author lanh0
 */
public class RoomRentalDBContext extends DBContext {

    public ArrayList<RoomRental> getRoomRentals() {
        ArrayList<RoomRental> roomRentals = new ArrayList<>();
        ServiceDBContext serviceDBContext = new ServiceDBContext();
        try {
            String sql = "SELECT [room_rental].[id]\n"
                    + "		,[room_rental].[customer_id]\n"
                    + "		,[room_rental].[room_id]\n"
                    + "		,[room_rental].[deposit_money]\n"
                    + "		,[room_rental].[start_date]\n"
                    + "		,[room_rental].[end_date]\n"
                    + "		,[room_rental].[state]\n"
                    + "		,[customer].[name]\n"
                    + "		,[customer].[email]\n"
                    + "		,[customer].[phone_number]\n"
                    + "		,[customer].[cmnd]\n"
                    + "		,[customer].[address]\n"
                    + "		,[room].[name] as 'roomName'\n"
                    + "		,[room].[categoryId]\n"
                    + "		,[room_category].[name] as 'roomCategoryName'\n"
                    + "		,[room_category].[unit_price]\n"
                    + "		,[room_category].[areage]\n"
                    + "		,[room_category].[floor_number]\n"
                    + "		,[room_category].[is_window]\n"
                    + "		,[room_category].[is_balcony]\n"
                    + "		,[room_category].[is_kitchen]\n"
                    + "		,[room_category].[desk_number]\n"
                    + "		,[room_category].[id_bed_category]\n"
                    + "		,[bed_category].[name] as 'bedCategoryName' \n"
                    + " FROM [room_rental]\n"
                    + " INNER JOIN [customer] on [room_rental].[customer_id] = [customer].[id]\n"
                    + " INNER JOIN [room] on [room_rental].[room_id] = [room].[id]\n"
                    + " INNER JOIN [room_category] on [room].[categoryId] = [room_category].[id]\n"
                    + " INNER JOIN [bed_category] on [room_category].[id_bed_category] = [bed_category].[id]";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                RoomRental roomRental = new RoomRental();
                roomRental.setId(rs.getInt("id"));
                roomRental.setDeposit_money(rs.getInt("deposit_money"));
                roomRental.setStart_date(rs.getDate("start_date"));
                roomRental.setEnd_date(rs.getDate("end_date"));
                roomRental.setState(rs.getBoolean("state"));
                Customer customer = new Customer();
                customer.setId(rs.getInt("customer_id"));
                customer.setName(rs.getString("name"));
                customer.setPhone_number(rs.getString("phone_number"));
                customer.setAddress(rs.getString("address"));
                customer.setEmail(rs.getString("email"));
                customer.setCmnd(rs.getString("cmnd"));
                roomRental.setCustomer(customer);
                TreeMap<Date, ArrayList<Service>> services = serviceDBContext.findByRoomRental(roomRental.getId());
                roomRental.setServices(services);

                Room room = new Room();
                room.setId(rs.getInt("room_id"));
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
                roomRental.setRoom(room);
                roomRentals.add(roomRental);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomRentalDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return roomRentals;
    }
    
    public RoomRental getRoomRental(int id) {
        ArrayList<RoomRental> roomRentals = new ArrayList<>();
        ServiceDBContext serviceDBContext = new ServiceDBContext();
        try {
            String sql = "SELECT [room_rental].[id]\n"
                    + "		,[room_rental].[customer_id]\n"
                    + "		,[room_rental].[room_id]\n"
                    + "		,[room_rental].[deposit_money]\n"
                    + "		,[room_rental].[start_date]\n"
                    + "		,[room_rental].[end_date]\n"
                    + "		,[room_rental].[state]\n"
                    + "		,[customer].[name]\n"
                    + "		,[customer].[email]\n"
                    + "		,[customer].[phone_number]\n"
                    + "		,[customer].[cmnd]\n"
                    + "		,[customer].[address]\n"
                    + "		,[room].[name] as 'roomName'\n"
                    + "		,[room].[categoryId]\n"
                    + "		,[room_category].[name] as 'roomCategoryName'\n"
                    + "		,[room_category].[unit_price]\n"
                    + "		,[room_category].[areage]\n"
                    + "		,[room_category].[floor_number]\n"
                    + "		,[room_category].[is_window]\n"
                    + "		,[room_category].[is_balcony]\n"
                    + "		,[room_category].[is_kitchen]\n"
                    + "		,[room_category].[desk_number]\n"
                    + "		,[room_category].[id_bed_category]\n"
                    + "		,[bed_category].[name] as 'bedCategoryName' \n"
                    + " FROM [room_rental]\n"
                    + " INNER JOIN [customer] on [room_rental].[customer_id] = [customer].[id]\n"
                    + " INNER JOIN [room] on [room_rental].[room_id] = [room].[id]\n"
                    + " INNER JOIN [room_category] on [room].[categoryId] = [room_category].[id]\n"
                    + " INNER JOIN [bed_category] on [room_category].[id_bed_category] = [bed_category].[id]\n"
                    + " WHERE [room_rental].[id] = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                RoomRental roomRental = new RoomRental();
                roomRental.setId(rs.getInt("id"));
                roomRental.setDeposit_money(rs.getInt("deposit_money"));
                roomRental.setStart_date(rs.getDate("start_date"));
                roomRental.setEnd_date(rs.getDate("end_date"));
                roomRental.setState(rs.getBoolean("state"));
                Customer customer = new Customer();
                customer.setId(rs.getInt("customer_id"));
                customer.setName(rs.getString("name"));
                customer.setPhone_number(rs.getString("phone_number"));
                customer.setAddress(rs.getString("address"));
                customer.setEmail(rs.getString("email"));
                customer.setCmnd(rs.getString("cmnd"));
                roomRental.setCustomer(customer);
                TreeMap<Date, ArrayList<Service>> services = serviceDBContext.findByRoomRental(roomRental.getId());
                roomRental.setServices(services);

                Room room = new Room();
                room.setId(rs.getInt("room_id"));
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

                roomRental.setRoom(room);
                return roomRental;
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomRentalDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public RoomRental getRoomRentalBySearch(int id, String start_date,String end_date ,int pageIndex, int pageSize) {
        ArrayList<RoomRental> roomRentals = new ArrayList<>();
        ServiceDBContext serviceDBContext = new ServiceDBContext();
        try {
            String sql = "SELECT [room_rental].[id]\n"
                    + "		,[room_rental].[customer_id]\n"
                    + "		,[room_rental].[room_id]\n"
                    + "		,[room_rental].[deposit_money]\n"
                    + "		,[room_rental].[start_date]\n"
                    + "		,[room_rental].[end_date]\n"
                    + "		,[room_rental].[state]\n"
                    + "		,[customer].[name]\n"
                    + "		,[customer].[email]\n"
                    + "		,[customer].[phone_number]\n"
                    + "		,[customer].[cmnd]\n"
                    + "		,[customer].[address]\n"
                    + "		,[room].[name] as 'roomName'\n"
                    + "		,[room].[categoryId]\n"
                    + "		,[room_category].[name] as 'roomCategoryName'\n"
                    + "		,[room_category].[unit_price]\n"
                    + "		,[room_category].[areage]\n"
                    + "		,[room_category].[floor_number]\n"
                    + "		,[room_category].[is_window]\n"
                    + "		,[room_category].[is_balcony]\n"
                    + "		,[room_category].[is_kitchen]\n"
                    + "		,[room_category].[desk_number]\n"
                    + "		,[room_category].[id_bed_category]\n"
                    + "		,[bed_category].[name] as 'bedCategoryName' \n"
                    + " FROM [room_rental]\n"
                    + " INNER JOIN [customer] on [room_rental].[customer_id] = [customer].[id]\n"
                    + " INNER JOIN [room] on [room_rental].[room_id] = [room].[id]\n"
                    + " INNER JOIN [room_category] on [room].[categoryId] = [room_category].[id]\n"
                    + " INNER JOIN [bed_category] on [room_category].[id_bed_category] = [bed_category].[id]\n"
                    + " WHERE [room_rental].[id] = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                RoomRental roomRental = new RoomRental();
                roomRental.setId(rs.getInt("id"));
                roomRental.setDeposit_money(rs.getInt("deposit_money"));
                roomRental.setStart_date(rs.getDate("start_date"));
                roomRental.setEnd_date(rs.getDate("end_date"));
                roomRental.setState(rs.getBoolean("state"));
                Customer customer = new Customer();
                customer.setId(rs.getInt("customer_id"));
                customer.setName(rs.getString("name"));
                customer.setPhone_number(rs.getString("phone_number"));
                customer.setAddress(rs.getString("address"));
                customer.setEmail(rs.getString("email"));
                customer.setCmnd(rs.getString("cmnd"));
                roomRental.setCustomer(customer);
                TreeMap<Date, ArrayList<Service>> services = serviceDBContext.findByRoomRentalAndSerach(roomRental.getId(), start_date, end_date,pageIndex, pageSize);
                roomRental.setServices(services);

                Room room = new Room();
                room.setId(rs.getInt("room_id"));
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

                roomRental.setRoom(room);
                return roomRental;
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomRentalDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertRoomRental(RoomRental rr) {
        String sql = "INSERT INTO [room_rental]\n"
                + "           ([customer_id]\n"
                + "           ,[room_id]\n"
                + "           ,[deposit_money]\n"
                + "           ,[start_date]\n"
                + "           ,[end_date]\n"
                + "           ,[state])\n"
                + "     VALUES(?,?,?,?,?,?)";
        PreparedStatement stm = null;
        try {
            stm.setInt(1, rr.getCustomer().getId());
            stm.setInt(2, rr.getRoom().getId());
            stm.setInt(3, rr.getDeposit_money());
            stm.setDate(4, rr.getStart_date());
            stm.setDate(4, rr.getEnd_date());
            stm.setBoolean(6, rr.isState());
            ResultSet rs = stm.executeQuery();
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomRentalDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RoomRentalDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RoomRentalDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void updateRoomRental(RoomRental rr) {

        String sql = "UPDATE [room_rental]\n"
                + "      SET([customer_id]\n"
                + "         ,[room_id]\n"
                + "         ,[deposit_money]\n"
                + "         ,[start_date]\n"
                + "         ,[end_date]\n"
                + "         ,[state])\n"
                + "     VALUES(?,?,?,?,?,?)\n"
                + "where id = ?";
        PreparedStatement stm = null;
        try {
            stm.setInt(7, rr.getId());
            stm.setInt(1, rr.getCustomer().getId());
            stm.setInt(2, rr.getRoom().getId());
            stm.setInt(3, rr.getDeposit_money());
            stm.setDate(4, rr.getStart_date());
            stm.setDate(4, rr.getEnd_date());
            stm.setBoolean(6, rr.isState());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomRentalDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RoomRentalDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RoomRentalDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void deleteService(int id) {
        String sql = "DELETE FROM [room_rental]\n"
                + " WHERE id = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomRentalDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RoomRentalDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RoomRentalDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
}
