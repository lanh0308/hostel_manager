/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.TreeMap;

/**
 *
 * @author lanh0
 */
public class RoomRental {

    private int id;
    private Customer customer;
    private Room room;
    private int deposit_money;
    private Date start_date;
    private Date end_date;
    private boolean state;
    private TreeMap<Date,ArrayList<Service>> services;

    public TreeMap<Date,ArrayList<Service>> getServices() {
        return services;
    }

    public void setServices(TreeMap<Date,ArrayList<Service>> services) {
        this.services = services;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public Customer getCustomer() {
        return customer;
    }
    
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
    
    public Room getRoom() {
        return room;
    }
    
    public void setRoom(Room room) {
        this.room = room;
    }
    
    public int getDeposit_money() {
        return deposit_money;
    }
    
    public void setDeposit_money(int deposit_money) {
        this.deposit_money = deposit_money;
    }
    
    public Date getStart_date() {
        return start_date;
    }
    
    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }
    
    public Date getEnd_date() {
        return end_date;
    }
    
    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }
    
    public boolean isState() {
        return state;
    }
    
    public void setState(boolean state) {
        this.state = state;
    }
    
    public BigDecimal getToltalPriceByDate(Date date){
        BigDecimal toltalPrice = new BigDecimal(0);
        for (Map.Entry<Date, ArrayList<Service>> entry : services.entrySet()) {
            Date key = entry.getKey();
            ArrayList<Service> value = entry.getValue();
            if(key.equals(date)){
                for (Service service : value) {
                    toltalPrice = toltalPrice.add(service.getPrice());
                }
                break;
            }
        }
        return toltalPrice.add(new BigDecimal(this.room.getRoomCategory().getUnit_price()));
    }
    
    
    public BigDecimal getToltalPriceByDateDebit(Date date){
        BigDecimal toltalPrice = new BigDecimal(0);
        boolean isPay = true;
        for (Map.Entry<Date, ArrayList<Service>> entry : services.entrySet()) {
            Date key = entry.getKey();
            ArrayList<Service> value = entry.getValue();
            if(key.equals(date)){
                if(value==null || value.isEmpty() || value.size()<=0){
                    isPay=false;
                }
                for (Service service : value) {
                    if (!service.isState()) {
                         toltalPrice = toltalPrice.add(service.getPrice());
                         isPay = false;
                    }
                }
                break;
            }
        }
        if(!isPay){
            toltalPrice = toltalPrice.add(new BigDecimal(this.room.getRoomCategory().getUnit_price()));
        }
        return toltalPrice;
    }
    
    public BigDecimal getToltalPriceByMonth(int month){
        BigDecimal toltalPrice = new BigDecimal(0);
        for (Map.Entry<Date, ArrayList<Service>> entry : services.entrySet()) {
            Date key = entry.getKey();
            ArrayList<Service> value = entry.getValue();
            if(key.getMonth()==month){
                for (Service service : value) {
                    toltalPrice = toltalPrice.add(service.getPrice());
                }
                break;
            }
        }
        return toltalPrice.add(new BigDecimal(this.room.getRoomCategory().getUnit_price()));
    }
    
    public BigDecimal getToltalPriceByMonthDebit(int month){
        BigDecimal toltalPrice = new BigDecimal(0);
        boolean isPay = true;
        for (Map.Entry<Date, ArrayList<Service>> entry : services.entrySet()) {
            Date key = entry.getKey();
            ArrayList<Service> value = entry.getValue();
            if(key.getMonth() == month){
                if(value==null || value.isEmpty() || value.size()<=0){
                    isPay=false;
                }
                for (Service service : value) {
                    if (!service.isState()) {
                         toltalPrice = toltalPrice.add(service.getPrice());
                         isPay = false;
                    }
                }
                break;
            }
        }
        if(!isPay){
            toltalPrice = toltalPrice.add(new BigDecimal(this.room.getRoomCategory().getUnit_price()));
        }
        return toltalPrice;
    }
    
}
