/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Customer;

/**
 *
 * @author lanh0
 */
public class AccountDBContext extends DBContext {

    public boolean getPermision(Account account, String feature, String code) {
        try {
            String sql = "SELECT COUNT(*) as total \n"
                    + "FROM [account] INNER JOIN [user_group]\n"
                    + "ON [user_group].[username] = [account].[username]\n"
                    + "INNER JOIN [group]\n"
                    + "ON [group].[id] = [user_group].[group_id]\n"
                    + "INNER JOIN [group_action] \n"
                    + "ON [group_action].[group_id] = [user_group].[group_id]\n"
                    + "INNER JOIN [action] ON [action].[id] = [group_action].[action_id]\n"
                    + "WHERE [account].[username] = ? AND LOWER([action].[feature]) = LOWER(?) AND LOWER([action].[code]) = LOWER(?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getUsername());
            stm.setString(2, feature);
            stm.setString(3, code);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int total = rs.getInt("total");
                return total >= 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public Account getAccount(String username, String password) {
        try {
            String sql = "select username, password\n"
                    + "from account\n"
                    + "where LOWER(username) = LOWER(?) and password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account getAccount(String username) {
        try {
            String sql = "select username, password\n"
                    + "from account\n"
                    + "where LOWER(username) = LOWER(?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insert(Account account) {
        int id = 1;
        String sql = "INSERT INTO [account]\n"
                + "           ([username]\n"
                + "           ,[password])\n"
                + "     VALUES(?,?)";

        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, account.getUsername());
            stm.setString(2, account.getPassword());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void update(Account account) {
        int id = 1;
        String sql = "UPDATE [account]\n"
                + "         SET [password] = ?\n"
                + "   WHERE username = ?";

        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, account.getPassword());
            stm.setString(2, account.getUsername());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
}
