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
import java.util.Collections;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;
import model.RoomRental;
import model.Service;
import model.ServiceCategory;

/**
 *
 * @author lanh0
 */
public class ServiceDBContext extends DBContext {

    public ArrayList<Service> getServices() {
        ArrayList<Service> services = new ArrayList<>();
        try {
            String sql = "SELECT [service].[id]\n"
                    + "      ,[service].[room_rental_id]\n"
                    + "      ,[service].[service_id]\n"
                    + "      ,[service].[start_date]\n"
                    + "      ,[service].[end_date]\n"
                    + "      ,[service].[new_indicator]\n"
                    + "      ,[service].[old_indicator]\n"
                    + "      ,[service].[state]\n"
                    + "	  ,[room_rental].[customer_id]\n"
                    + "	  ,[room_rental].[room_id]\n"
                    + "	  ,[room_rental].[deposit_money]\n"
                    + "	  ,[room_rental].[start_date] as 'room_rental_start_date'\n"
                    + "	  ,[room_rental].[end_date] as 'room_rental_end_date'\n"
                    + "	  ,[room_rental].[state] as 'room_reantal_state'\n"
                    + "	  ,[customer].[name]\n"
                    + "	  ,[customer].[email]\n"
                    + "	  ,[customer].[phone_number]\n"
                    + "	  ,[customer].[cmnd]\n"
                    + "	  ,[customer].[address]\n"
                    + "	  ,[service_category].[name] as 'serviceCategoryName'\n"
                    + "	  ,[service_category].[unit_price] \n"
                    + "  FROM [service] \n"
                    + "  INNER JOIN [service_category] on [service_category].[id] =  [service].[service_id]\n"
                    + " INNER JOIN [room_rental] on  [room_rental].[id] = [service].[room_rental_id]\n"
                    + " INNER JOIN [customer] on  [customer].[id] = [room_rental].[customer_id]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Service service = new Service();
                service.setId(rs.getInt("id"));
                service.setStart_date(rs.getDate("start_date"));
                service.setEnd_date(rs.getDate("end_date"));
                service.setNew_indicator(rs.getInt("new_indicator"));
                service.setOld_indicator(rs.getInt("old_indicator"));
                service.setState(rs.getBoolean("state"));

                RoomRental roomRental = new RoomRental();
                roomRental.setId(rs.getInt("room_rental_id"));
                roomRental.setDeposit_money(rs.getInt("deposit_money"));
                roomRental.setStart_date(rs.getDate("room_rental_start_date"));
                roomRental.setEnd_date(rs.getDate("room_rental_end_date"));
                roomRental.setState(rs.getBoolean("room_reantal_state"));
                Customer customer = new Customer();
                customer.setId(rs.getInt("customer_id"));
                customer.setName(rs.getString("name"));
                customer.setPhone_number(rs.getString("phone_number"));
                customer.setAddress(rs.getString("address"));
                customer.setEmail(rs.getString("email"));
                customer.setCmnd(rs.getString("cmnd"));
                roomRental.setCustomer(customer);

                ServiceCategory sc = new ServiceCategory();
                sc.setId(rs.getInt("service_id"));
                sc.setName(rs.getString("serviceCategoryName"));
                sc.setUnit_price(rs.getInt("unit_price"));

                service.setRoom_retal(roomRental);
                service.setService_category(sc);

                services.add(service);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return services;
    }

    public TreeMap<Date, ArrayList<Service>> findByRoomRental(int roomRentalId) {
        TreeMap<Date, ArrayList<Service>> services = new TreeMap<>(Collections.reverseOrder());
        try {
            String sql = "SELECT [service].[id]\n"
                    + "      ,[service].[room_rental_id]\n"
                    + "      ,[service].[service_id]\n"
                    + "      ,[service].[start_date]\n"
                    + "      ,[service].[end_date]\n"
                    + "      ,[service].[new_indicator]\n"
                    + "      ,[service].[old_indicator]\n"
                    + "      ,[service].[state]\n"
                    + "	  ,[room_rental].[customer_id]\n"
                    + "	  ,[room_rental].[room_id]\n"
                    + "	  ,[room_rental].[deposit_money]\n"
                    + "	  ,[room_rental].[start_date] as 'room_rental_start_date'\n"
                    + "	  ,[room_rental].[end_date] as 'room_rental_end_date'\n"
                    + "	  ,[room_rental].[state] as 'room_reantal_state'\n"
                    + "	  ,[customer].[name]\n"
                    + "	  ,[customer].[email]\n"
                    + "	  ,[customer].[phone_number]\n"
                    + "	  ,[customer].[cmnd]\n"
                    + "	  ,[customer].[address]\n"
                    + "	  ,[service_category].[name] as 'serviceCategoryName'\n"
                    + "	  ,[service_category].[unit_price] \n"
                    + "  FROM [service] \n"
                    + " INNER JOIN [service_category] on [service_category].[id] =  [service].[service_id]\n"
                    + " INNER JOIN [room_rental] on  [room_rental].[id] = [service].[room_rental_id]\n"
                    + " INNER JOIN [customer] on  [customer].[id] = [room_rental].[customer_id]\n"
                    + " WHERE [service].[room_rental_id] = ?\n"
                    + " ORDER BY [service].[start_date] DESC";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, roomRentalId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Service service = new Service();
                service.setId(rs.getInt("id"));
                service.setStart_date(rs.getDate("start_date"));
                service.setEnd_date(rs.getDate("end_date"));
                service.setNew_indicator(rs.getInt("new_indicator"));
                service.setOld_indicator(rs.getInt("old_indicator"));
                service.setState(rs.getBoolean("state"));

                RoomRental roomRental = new RoomRental();
                roomRental.setId(rs.getInt("room_rental_id"));
                roomRental.setDeposit_money(rs.getInt("deposit_money"));
                roomRental.setStart_date(rs.getDate("room_rental_start_date"));
                roomRental.setEnd_date(rs.getDate("room_rental_end_date"));
                roomRental.setState(rs.getBoolean("room_reantal_state"));
                Customer customer = new Customer();
                customer.setId(rs.getInt("customer_id"));
                customer.setName(rs.getString("name"));
                customer.setPhone_number(rs.getString("phone_number"));
                customer.setAddress(rs.getString("address"));
                customer.setEmail(rs.getString("email"));
                customer.setCmnd(rs.getString("cmnd"));
                roomRental.setCustomer(customer);

                ServiceCategory sc = new ServiceCategory();
                sc.setId(rs.getInt("service_id"));
                sc.setName(rs.getString("serviceCategoryName"));
                sc.setUnit_price(rs.getInt("unit_price"));

                service.setRoom_retal(roomRental);
                service.setService_category(sc);

                boolean isExit = false;
                for (Map.Entry<Date, ArrayList<Service>> entry : services.entrySet()) {
                    Date key = entry.getKey();
                    ArrayList<Service> value = entry.getValue();
                    if (key.equals(service.getStart_date())) {
                        value.add(service);
                        isExit = true;
                        break;
                    }
                }
                if (!isExit) {
                    ArrayList<Service> new_services = new ArrayList<>();
                    new_services.add(service);
                    services.put(service.getStart_date(), new_services);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return services;
    }

    public TreeMap<Date, ArrayList<Service>> findByRoomRentalAndSerach(int roomRentalId,String start_date, String end_date, int pageIndex, int pageSize) {
        TreeMap<Date, ArrayList<Service>> services = new TreeMap<>(Collections.reverseOrder());
        try {
            String sql = "SELECT * FROM (SELECT * FROM (SELECT [service].[id]\n"
                    + ",[service].[room_rental_id]\n"
                    + ",[service].[service_id]\n"
                    + ",[service].[start_date]\n"
                    + ",[service].[end_date]\n"
                    + ",[service].[new_indicator]\n"
                    + ",[service].[old_indicator]\n"
                    + ",[service].[state]\n"
                    + " ,[room_rental].[customer_id]\n"
                    + "  ,[room_rental].[room_id]\n"
                    + ",[room_rental].[deposit_money]\n"
                    + " ,[room_rental].[start_date] as 'room_rental_start_date'\n"
                    + " ,[room_rental].[end_date] as 'room_rental_end_date'\n"
                    + ",[room_rental].[state] as 'room_reantal_state'\n"
                    + " ,[customer].[name]\n"
                    + ",[customer].[email]\n"
                    + ",[customer].[phone_number]\n"
                    + ",[customer].[cmnd]\n"
                    + " ,[customer].[address]\n"
                    + ",[service_category].[name] as 'serviceCategoryName'\n"
                    + ",[service_category].[unit_price] \n"
                    + " FROM [service] \n"
                    + "INNER JOIN [service_category] on [service_category].[id] =  [service].[service_id]\n"
                    + " INNER JOIN [room_rental] on  [room_rental].[id] = [service].[room_rental_id]\n"
                    + "INNER JOIN [customer] on  [customer].[id] = [room_rental].[customer_id]) [service]\n"
                    + "INNER JOIN (SELECT [service].[start_date] as 'group_start_date'\n"
                    + ",ROW_NUMBER() OVER (ORDER BY [service].[start_date] DESC) as row_index\n"
                    + "FROM [service] WHERE LOWER([service].[start_date]) LIKE LOWER(?) OR LOWER([service].[end_date]) LIKE LOWER(?)\n"
                    + "GROUP BY [service].[start_date]) [date] ON [date].[group_start_date]=[service].[start_date]\n"
                    + "WHERE [service].[room_rental_id] = ?)  [service]\n"
                    + "WHERE row_index >= (? - 1) * ? + 1 AND row_index <= ? * ?\n"
                    + "ORDER BY  [service].[row_index] ASC\n";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + start_date + "%");
            stm.setString(2, "%" + end_date + "%");
            stm.setInt(3, roomRentalId);
            stm.setInt(4, pageIndex);
            stm.setInt(5, pageSize);
            stm.setInt(6, pageIndex);
            stm.setInt(7, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Service service = new Service();
                service.setId(rs.getInt("id"));
                service.setStart_date(rs.getDate("start_date"));
                service.setEnd_date(rs.getDate("end_date"));
                service.setNew_indicator(rs.getInt("new_indicator"));
                service.setOld_indicator(rs.getInt("old_indicator"));
                service.setState(rs.getBoolean("state"));

                RoomRental roomRental = new RoomRental();
                roomRental.setId(rs.getInt("room_rental_id"));
                roomRental.setDeposit_money(rs.getInt("deposit_money"));
                roomRental.setStart_date(rs.getDate("room_rental_start_date"));
                roomRental.setEnd_date(rs.getDate("room_rental_end_date"));
                roomRental.setState(rs.getBoolean("room_reantal_state"));
                Customer customer = new Customer();
                customer.setId(rs.getInt("customer_id"));
                customer.setName(rs.getString("name"));
                customer.setPhone_number(rs.getString("phone_number"));
                customer.setAddress(rs.getString("address"));
                customer.setEmail(rs.getString("email"));
                customer.setCmnd(rs.getString("cmnd"));
                roomRental.setCustomer(customer);

                ServiceCategory sc = new ServiceCategory();
                sc.setId(rs.getInt("service_id"));
                sc.setName(rs.getString("serviceCategoryName"));
                sc.setUnit_price(rs.getInt("unit_price"));

                service.setRoom_retal(roomRental);
                service.setService_category(sc);

                boolean isExit = false;
                for (Map.Entry<Date, ArrayList<Service>> entry : services.entrySet()) {
                    Date key = entry.getKey();
                    ArrayList<Service> value = entry.getValue();
                    if (key.equals(service.getStart_date())) {
                        value.add(service);
                        isExit = true;
                        break;
                    }
                }
                if (!isExit) {
                    ArrayList<Service> new_services = new ArrayList<>();
                    new_services.add(service);
                    services.put(service.getStart_date(), new_services);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return services;
    }

    public Service getService(int id) {
        ArrayList<Service> services = new ArrayList<>();
        try {
            String sql = "SELECT [service].[id]\n"
                    + "      ,[service].[room_rental_id]\n"
                    + "      ,[service].[service_id]\n"
                    + "      ,[service].[start_date]\n"
                    + "      ,[service].[end_date]\n"
                    + "      ,[service].[new_indicator]\n"
                    + "      ,[service].[old_indicator]\n"
                    + "      ,[service].[state]\n"
                    + "	  ,[room_rental].[customer_id]\n"
                    + "	  ,[room_rental].[room_id]\n"
                    + "	  ,[room_rental].[deposit_money]\n"
                    + "	  ,[room_rental].[start_date] as 'room_rental_start_date'\n"
                    + "	  ,[room_rental].[end_date] as 'room_rental_end_date'\n"
                    + "	  ,[room_rental].[state] as 'room_reantal_state'\n"
                    + "	  ,[customer].[name]\n"
                    + "	  ,[customer].[email]\n"
                    + "	  ,[customer].[phone_number]\n"
                    + "	  ,[customer].[cmnd]\n"
                    + "	  ,[customer].[address]\n"
                    + "	  ,[service_category].[name] as 'serviceCategoryName'\n"
                    + "	  ,[service_category].[unit_price] \n"
                    + "  FROM [service] \n"
                    + "  INNER JOIN [service_category] on [service_category].[id] =  [service].[service_id]\n"
                    + " INNER JOIN [room_rental] on  [room_rental].[id] = [service].[room_rental_id]\n"
                    + " INNER JOIN [customer] on  [customer].[id] = [room_rental].[customer_id]\n"
                    + " WHERE [service].[id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Service service = new Service();
                service.setId(rs.getInt("id"));
                service.setStart_date(rs.getDate("start_date"));
                service.setEnd_date(rs.getDate("end_date"));
                service.setNew_indicator(rs.getInt("new_indicator"));
                service.setOld_indicator(rs.getInt("old_indicator"));
                service.setState(rs.getBoolean("state"));

                RoomRental roomRental = new RoomRental();
                roomRental.setId(rs.getInt("room_rental_id"));
                roomRental.setDeposit_money(rs.getInt("deposit_money"));
                roomRental.setStart_date(rs.getDate("room_rental_start_date"));
                roomRental.setEnd_date(rs.getDate("room_rental_end_date"));
                roomRental.setState(rs.getBoolean("room_reantal_state"));
                Customer customer = new Customer();
                customer.setId(rs.getInt("customer_id"));
                customer.setName(rs.getString("name"));
                customer.setPhone_number(rs.getString("phone_number"));
                customer.setAddress(rs.getString("address"));
                customer.setEmail(rs.getString("email"));
                customer.setCmnd(rs.getString("cmnd"));
                roomRental.setCustomer(customer);

                ServiceCategory sc = new ServiceCategory();
                sc.setId(rs.getInt("service_id"));
                sc.setName(rs.getString("serviceCategoryName"));
                sc.setUnit_price(rs.getInt("unit_price"));

                service.setRoom_retal(roomRental);
                service.setService_category(sc);

                return service;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertService(Service service) {
        String sql = "INSERT INTO [service]([room_rental_id],[service_id],[start_date],[end_date],"
                + "[new_indicator],[old_indicator],[state])\n"
                + "     VALUES(?,?,?,?,?,?,?)";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, service.getRoom_retal().getId());
            stm.setInt(2, service.getService_category().getId());
            stm.setDate(3, service.getStart_date());
            stm.setDate(4, service.getEnd_date());
            stm.setInt(5, service.getNew_indicator());
            stm.setInt(6, service.getOld_indicator());
            stm.setBoolean(7, service.isState());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void updateService(Service service) {
        String sql = "UPDATE [service]\n"
                + "   SET [room_rental_id] = ?\n"
                + "      ,[service_id] = ?\n"
                + "      ,[start_date] = ?\n"
                + "      ,[end_date] = ?\n"
                + "      ,[new_indicator] = ?\n"
                + "      ,[old_indicator] = ?\n"
                + "      ,[state] = ?\n"
                + " WHERE id = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(8, service.getId());
            stm.setInt(1, service.getRoom_retal().getId());
            stm.setInt(2, service.getService_category().getId());
            stm.setDate(3, service.getStart_date());
            stm.setDate(4, service.getEnd_date());
            stm.setInt(5, service.getNew_indicator());
            stm.setInt(6, service.getOld_indicator());
            stm.setBoolean(7, service.isState());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void deleteService(int id) {
        String sql = "DELETE FROM [service]\n"
                + " WHERE id = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteByServiceCategory(int id) {
        String sql = "DELETE FROM [service]\n"
                + " WHERE service_id = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getSize(int roomRentalId, String start_date, String end_date) {
        try {
            String sql = "SELECT COUNT(*) AS 'size' FROM(SELECT [service].[row_index] FROM (SELECT * FROM (SELECT [service].[id]\n"
                    + ",[service].[room_rental_id]\n"
                    + ",[service].[service_id]\n"
                    + ",[service].[start_date]\n"
                    + ",[service].[end_date]\n"
                    + ",[service].[new_indicator]\n"
                    + ",[service].[old_indicator]\n"
                    + ",[service].[state]\n"
                    + " ,[room_rental].[customer_id]\n"
                    + "  ,[room_rental].[room_id]\n"
                    + ",[room_rental].[deposit_money]\n"
                    + " ,[room_rental].[start_date] as 'room_rental_start_date'\n"
                    + " ,[room_rental].[end_date] as 'room_rental_end_date'\n"
                    + ",[room_rental].[state] as 'room_reantal_state'\n"
                    + " ,[customer].[name]\n"
                    + ",[customer].[email]\n"
                    + ",[customer].[phone_number]\n"
                    + ",[customer].[cmnd]\n"
                    + " ,[customer].[address]\n"
                    + ",[service_category].[name] as 'serviceCategoryName'\n"
                    + ",[service_category].[unit_price] \n"
                    + " FROM [service] \n"
                    + "INNER JOIN [service_category] on [service_category].[id] =  [service].[service_id]\n"
                    + "INNER JOIN [room_rental] on  [room_rental].[id] = [service].[room_rental_id]\n"
                    + "INNER JOIN [customer] on  [customer].[id] = [room_rental].[customer_id]) [service]\n"
                    + "INNER JOIN (SELECT [service].[start_date] as 'group_start_date'\n"
                    + ",ROW_NUMBER() OVER (ORDER BY [service].[start_date] DESC) as row_index\n"
                    + "FROM [service] WHERE LOWER([service].[start_date]) LIKE LOWER(?) OR LOWER([service].[end_date]) LIKE LOWER(?)\n"
                    + "GROUP BY [service].[start_date]) [date] ON [date].[group_start_date]=[service].[start_date]\n"
                    + "WHERE [service].[room_rental_id] = ?)  [service]\n"
                    + "GROUP BY [service].[row_index]) [service]\n";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + start_date + "%");
            stm.setString(2, "%" + end_date+"%");
            stm.setInt(3, roomRentalId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int size = rs.getInt("size");
                return size;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Date> getAllStartDate(int id) {
        ArrayList<Date> start_dates = new ArrayList<>();
        try {
            String sql = " SELECT [service].[start_date] \n"
                    + ",ROW_NUMBER() OVER (ORDER BY [service].[start_date] DESC) as row_index\n"
                    + "From [service] \n"
                    + "WHERE  [service].[room_rental_id] = ?"
                    + "GROUP BY [service].[start_date]";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                start_dates.add(rs.getDate("start_date"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return start_dates;
    }

    public ArrayList<Date> getAllEndDate(int id) {
        ArrayList<Date> start_dates = new ArrayList<>();
        try {
            String sql = " SELECT [service].[end_date]\n"
                    + ",ROW_NUMBER() OVER (ORDER BY [service].[end_date] DESC) as row_index\n"
                    + "From [service] \n"
                    + " WHERE  [service].[room_rental_id] = ?"
                    + "GROUP BY [service].[end_date]";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                start_dates.add(rs.getDate("end_date"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return start_dates;
    }
}
