/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.math.BigDecimal;
import java.sql.Date;

/**
 *
 * @author lanh0
 */
public class Service {
    private int id;
    private RoomRental room_retal;
    private ServiceCategory service_category;
    private Date start_date;
    private Date end_date;
    private int new_indicator;
    private int old_indicator;
    private boolean state;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public RoomRental getRoom_retal() {
        return room_retal;
    }

    public void setRoom_retal(RoomRental room_retal) {
        this.room_retal = room_retal;
    }

    public ServiceCategory getService_category() {
        return service_category;
    }

    public void setService_category(ServiceCategory service_category) {
        this.service_category = service_category;
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

    public int getNew_indicator() {
        return new_indicator;
    }

    public void setNew_indicator(int new_indicator) {
        this.new_indicator = new_indicator;
    }

    public int getOld_indicator() {
        return old_indicator;
    }

    public void setOld_indicator(int old_indicator) {
        this.old_indicator = old_indicator;
    }

    public boolean isState() {
        return state;
    }

    public void setState(boolean State) {
        this.state = State;
    }
    
    
    public BigDecimal getPrice(){
        int indicator = new_indicator - old_indicator;
        if(indicator > 0 || ( indicator == 0 && (service_category.getId() == 1 || service_category.getId() == 2))){
            return new BigDecimal(service_category.getUnit_price()*indicator);
        }else{
            return new BigDecimal(service_category.getUnit_price());
        }
    }
    
    
}
