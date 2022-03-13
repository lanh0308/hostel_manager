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
import model.Customer;
import model.Report;
import model.Room;
import model.RoomCategory;
import model.Service;

/**
 *
 * @author lanh0
 */
public class ReportDBContext extends DBContext {

    public ArrayList<Report> getReports() {
        ArrayList<Report> reports = new ArrayList<>();
        try {
            String sql = "SELECT [report].[id]\n"
                    + "      ,[report].[title]\n"
                    + "      ,[report].[content]\n"
                    + "      ,[report].[process_note]\n"
                    + "      ,[report].[status]\n"
                    + "      ,[report].[room_id]\n"
                    + "      ,[report].[customer_id]\n"
                    + "      ,[report].[created]\n"
                    + "      ,[report].[updated]\n"
                    + "      ,[customer].[name] as 'customer_name'\n"
                    + "      ,[phone_number]\n"
                    + "      ,[customer].[address]\n"
                    + "      ,[customer].[email]\n"
                    + "      ,[customer].[cmnd]\n"
                    + "      ,[room].[name] as 'room_name'\n"
                    + "      ,[room].[categoryId]\n"
                    + "	     ,[room_category].[name] as 'roomCategoryName'\n"
                    + "      ,[room_category].[unit_price]\n"
                    + "      ,[room_category].[areage]\n"
                    + "      ,[room_category].[floor_number]\n"
                    + "      ,[room_category].[is_window]\n"
                    + "      ,[room_category].[is_balcony]\n"
                    + "      ,[room_category].[is_kitchen]\n"
                    + "      ,[room_category].[desk_number]\n"
                    + "      ,[room_category].[id_bed_category]\n"
                    + "	  ,[bed_category].[name] as 'bedCategoryName'\n"
                    + "  FROM [report]\n"
                    + "  INNER JOIN [customer] ON [customer].[id] = [report].[customer_id]\n"
                    + "  INNER JOIN [room] ON [room].[id] = [report].[room_id]\n"
                    + "  INNER JOIN [room_category] on [room].[categoryId] = [room_category].[id]\n"
                    + "  INNER JOIN [bed_category] on [room_category].[id_bed_category] = [bed_category].[id]\n"
                    + " ORDER BY [report].[created] desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Report report = new Report();
                report.setId(rs.getInt("id"));
                report.setTitle(rs.getString("title"));
                report.setContent(rs.getString("content"));
                report.setCreated(rs.getTimestamp("created"));
                report.setUpdated(rs.getTimestamp("updated"));
                report.setStatus(rs.getString("status"));
                report.setProcess_note(rs.getString("process_note"));

                Customer customer = new Customer();
                customer.setId(rs.getInt("customer_id"));
                customer.setName(rs.getString("customer_name"));
                customer.setPhone_number(rs.getString("phone_number"));
                customer.setAddress(rs.getString("address"));
                customer.setEmail(rs.getString("email"));
                customer.setCmnd(rs.getString("cmnd"));
                report.setCustomer(customer);

                Room room = new Room();
                room.setId(rs.getInt("room_id"));
                room.setName(rs.getString("room_name"));
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
                report.setRoom(room);
                reports.add(report);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reports;
    }

    public ArrayList<Report> getReports(String value, String status, int pageIndex, int pageSize) {
        ArrayList<Report> reports = new ArrayList<>();
        try {
            String sql = "SELECT * FROM(SELECT [report].[id]\n"
                    + "      ,[report].[title]\n"
                    + "      ,[report].[content]\n"
                    + "      ,[report].[process_note]\n"
                    + "      ,[report].[status]\n"
                    + "      ,[report].[room_id]\n"
                    + "      ,[report].[customer_id]\n"
                    + "      ,[report].[created]\n"
                    + "      ,[report].[updated]\n"
                    + "      ,[customer].[name] as 'customer_name'\n"
                    + "      ,[phone_number]\n"
                    + "      ,[customer].[address]\n"
                    + "      ,[customer].[email]\n"
                    + "      ,[customer].[cmnd]\n"
                    + "      ,[room].[name] as 'room_name'\n"
                    + "      ,[room].[categoryId]\n"
                    + "	     ,[room_category].[name] as 'roomCategoryName'\n"
                    + "      ,[room_category].[unit_price]\n"
                    + "      ,[room_category].[areage]\n"
                    + "      ,[room_category].[floor_number]\n"
                    + "      ,[room_category].[is_window]\n"
                    + "      ,[room_category].[is_balcony]\n"
                    + "      ,[room_category].[is_kitchen]\n"
                    + "      ,[room_category].[desk_number]\n"
                    + "      ,[room_category].[id_bed_category]\n"
                    + "      ,ROW_NUMBER() OVER (ORDER BY [report].[created] DESC) as row_index\n"
                    + "	  ,[bed_category].[name] as 'bedCategoryName'\n"
                    + "  FROM [report]\n"
                    + "  INNER JOIN [customer] ON [customer].[id] = [report].[customer_id]\n"
                    + "  INNER JOIN [room] ON [room].[id] = [report].[room_id]\n"
                    + "  INNER JOIN [room_category] on [room].[categoryId] = [room_category].[id]\n"
                    + "  INNER JOIN [bed_category] on [room_category].[id_bed_category] = [bed_category].[id]\n"
                    + " WHERE (LOWER([room].[name]) LIKE LOWER(?) OR LOWER([customer].[name]) LIKE LOWER(?) OR\n"
                    + " LOWER([customer].[email]) LIKE LOWER(?) OR LOWER([customer].[phone_number]) LIKE LOWER(?))\n";
            if (status != null && !status.trim().isEmpty()) {
                sql += " AND LOWER([report].[status]) = LOWER(?)\n";
            }
            sql += " ) [report]\n"
                    + " WHERE row_index >= (? - 1) * ? + 1 AND row_index <= ? * ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + value + "%");
            stm.setString(2, "%" + value + "%");
            stm.setString(3, "%" + value + "%");
            stm.setString(4, "%" + value + "%");
            if (status != null && !status.trim().isEmpty()) {
                stm.setString(5, status);
                stm.setInt(6, pageIndex);
                stm.setInt(7, pageSize);
                stm.setInt(8, pageIndex);
                stm.setInt(9, pageSize);
            } else {
                stm.setInt(5, pageIndex);
                stm.setInt(6, pageSize);
                stm.setInt(7, pageIndex);
                stm.setInt(8, pageSize);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Report report = new Report();
                report.setId(rs.getInt("id"));
                report.setTitle(rs.getString("title"));
                report.setContent(rs.getString("content"));
                report.setCreated(rs.getTimestamp("created"));
                report.setUpdated(rs.getTimestamp("updated"));
                report.setStatus(rs.getString("status"));
                report.setProcess_note(rs.getString("process_note"));

                Customer customer = new Customer();
                customer.setId(rs.getInt("customer_id"));
                customer.setName(rs.getString("customer_name"));
                customer.setPhone_number(rs.getString("phone_number"));
                customer.setAddress(rs.getString("address"));
                customer.setEmail(rs.getString("email"));
                customer.setCmnd(rs.getString("cmnd"));
                report.setCustomer(customer);

                Room room = new Room();
                room.setId(rs.getInt("room_id"));
                room.setName(rs.getString("room_name"));
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
                report.setRoom(room);
                reports.add(report);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reports;
    }

    public ArrayList<Report> getReportsByRoom(int id) {
        ArrayList<Report> reports = new ArrayList<>();
        try {
            String sql = "SELECT [report].[id]\n"
                    + "      ,[report].[title]\n"
                    + "      ,[report].[content]\n"
                    + "      ,[report].[process_note]\n"
                    + "      ,[report].[status]\n"
                    + "      ,[report].[room_id]\n"
                    + "      ,[report].[customer_id]\n"
                    + "      ,[report].[created]\n"
                    + "      ,[report].[updated]\n"
                    + "      ,[customer].[name] as 'customer_name'\n"
                    + "      ,[phone_number]\n"
                    + "      ,[customer].[address]\n"
                    + "      ,[customer].[email]\n"
                    + "      ,[customer].[cmnd]\n"
                    + "      ,[room].[name] as 'room_name'\n"
                    + "      ,[room].[categoryId]\n"
                    + "	     ,[room_category].[name] as 'roomCategoryName'\n"
                    + "      ,[room_category].[unit_price]\n"
                    + "      ,[room_category].[areage]\n"
                    + "      ,[room_category].[floor_number]\n"
                    + "      ,[room_category].[is_window]\n"
                    + "      ,[room_category].[is_balcony]\n"
                    + "      ,[room_category].[is_kitchen]\n"
                    + "      ,[room_category].[desk_number]\n"
                    + "      ,[room_category].[id_bed_category]\n"
                    + "	  ,[bed_category].[name] as 'bedCategoryName'\n"
                    + "  FROM [report]\n"
                    + "  INNER JOIN [customer] ON [customer].[id] = [report].[customer_id]\n"
                    + "  INNER JOIN [room] ON [room].[id] = [report].[room_id]\n"
                    + "  INNER JOIN [room_category] on [room].[categoryId] = [room_category].[id]\n"
                    + "  INNER JOIN [bed_category] on [room_category].[id_bed_category] = [bed_category].[id]\n"
                    + " WHERE [report].[room_id]=?\n"
                    + " ORDER BY [report].[created] desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Report report = new Report();
                report.setId(rs.getInt("id"));
                report.setTitle(rs.getString("title"));
                report.setContent(rs.getString("content"));
                report.setCreated(rs.getTimestamp("created"));
                report.setUpdated(rs.getTimestamp("updated"));
                report.setStatus(rs.getString("status"));
                report.setProcess_note(rs.getString("process_note"));

                Customer customer = new Customer();
                customer.setId(rs.getInt("customer_id"));
                customer.setName(rs.getString("customer_name"));
                customer.setPhone_number(rs.getString("phone_number"));
                customer.setAddress(rs.getString("address"));
                customer.setEmail(rs.getString("email"));
                customer.setCmnd(rs.getString("cmnd"));
                report.setCustomer(customer);

                Room room = new Room();
                room.setId(rs.getInt("room_id"));
                room.setName(rs.getString("room_name"));
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
                report.setRoom(room);
                reports.add(report);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reports;
    }

    public Report getReport(int id) {
        ArrayList<Report> reports = new ArrayList<>();
        try {
            String sql = "SELECT [report].[id]\n"
                    + "      ,[report].[title]\n"
                    + "      ,[report].[content]\n"
                    + "      ,[report].[process_note]\n"
                    + "      ,[report].[status]\n"
                    + "      ,[report].[room_id]\n"
                    + "      ,[report].[customer_id]\n"
                    + "      ,[report].[created]\n"
                    + "      ,[report].[updated]\n"
                    + "      ,[customer].[name] as 'customer_name'\n"
                    + "      ,[phone_number]\n"
                    + "      ,[customer].[address]\n"
                    + "      ,[customer].[email]\n"
                    + "      ,[customer].[cmnd]\n"
                    + "      ,[room].[name] as 'room_name'\n"
                    + "      ,[room].[categoryId]\n"
                    + "	     ,[room_category].[name] as 'roomCategoryName'\n"
                    + "      ,[room_category].[unit_price]\n"
                    + "      ,[room_category].[areage]\n"
                    + "      ,[room_category].[floor_number]\n"
                    + "      ,[room_category].[is_window]\n"
                    + "      ,[room_category].[is_balcony]\n"
                    + "      ,[room_category].[is_kitchen]\n"
                    + "      ,[room_category].[desk_number]\n"
                    + "      ,[room_category].[id_bed_category]\n"
                    + "	  ,[bed_category].[name] as 'bedCategoryName'\n"
                    + "  FROM [report]\n"
                    + "  INNER JOIN [customer] ON [customer].[id] = [report].[customer_id]\n"
                    + "  INNER JOIN [room] ON [room].[id] = [report].[room_id]\n"
                    + "  INNER JOIN [room_category] on [room].[categoryId] = [room_category].[id]\n"
                    + "  INNER JOIN [bed_category] on [room_category].[id_bed_category] = [bed_category].[id]\n"
                    + " WHERE [report].[id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Report report = new Report();
                report.setId(rs.getInt("id"));
                report.setTitle(rs.getString("title"));
                report.setContent(rs.getString("content"));
                report.setCreated(rs.getTimestamp("created"));
                report.setUpdated(rs.getTimestamp("updated"));
                report.setStatus(rs.getString("status"));
                report.setProcess_note(rs.getString("process_note"));

                Customer customer = new Customer();
                customer.setId(rs.getInt("customer_id"));
                customer.setName(rs.getString("customer_name"));
                customer.setPhone_number(rs.getString("phone_number"));
                customer.setAddress(rs.getString("address"));
                customer.setEmail(rs.getString("email"));
                customer.setCmnd(rs.getString("cmnd"));
                report.setCustomer(customer);

                Room room = new Room();
                room.setId(rs.getInt("room_id"));
                room.setName(rs.getString("room_name"));
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
                report.setRoom(room);
                return report;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insert(Report report) {
        String sql = "INSERT INTO [report]\n"
                + "           ([title]\n"
                + "           ,[content]\n"
                + "           ,[process_note]\n"
                + "           ,[status]\n"
                + "           ,[room_id]\n"
                + "           ,[customer_id]\n"
                + "           ,[created]\n"
                + "           ,[updated])\n"
                + "     VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, report.getTitle());
            stm.setString(2, report.getContent());
            stm.setString(3, report.getProcess_note());
            stm.setString(4, report.getStatus());
            stm.setInt(5, report.getRoom().getId());
            stm.setInt(6, report.getCustomer().getId());
            stm.setTimestamp(7, report.getCreated());
            stm.setTimestamp(8, report.getUpdated());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void update(Report report) {
        String sql = "UPDATE [report]\n"
                + "        SET [process_note] = ?\n"
                + "           ,[status] = ?\n"
                + "           ,[updated] = ?\n"
                + "    WHERE id = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(4, report.getId());
            stm.setString(1, report.getProcess_note());
            stm.setString(2, report.getStatus());
            stm.setTimestamp(3, report.getUpdated());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public int getSize(String value, String status) {
        try {
            String sql = "SELECT COUNT([report].[id]) as 'size' FROM(SELECT [report].[id]\n"
                    + "  FROM [report]\n"
                    + "  INNER JOIN [customer] ON [customer].[id] = [report].[customer_id]\n"
                    + "  INNER JOIN [room] ON [room].[id] = [report].[room_id]\n"
                    + "  INNER JOIN [room_category] on [room].[categoryId] = [room_category].[id]\n"
                    + "  INNER JOIN [bed_category] on [room_category].[id_bed_category] = [bed_category].[id]\n"
                    + " WHERE (LOWER([room].[name]) LIKE LOWER(?) OR LOWER([customer].[name]) LIKE LOWER(?) OR\n"
                    + " LOWER([customer].[email]) LIKE LOWER(?) OR LOWER([customer].[phone_number]) LIKE LOWER(?))\n";
            if (status != null && !status.trim().isEmpty()) {
                sql += " AND LOWER([report].[status]) = LOWER(?)\n";
            }
            sql += " ) [report]";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + value + "%");
            stm.setString(2, "%" + value + "%");
            stm.setString(3, "%" + value + "%");
            stm.setString(4, "%" + value + "%");
            if (status != null && !status.trim().isEmpty()) {
                stm.setString(5, status);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int size = rs.getInt("size");
                return size;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
