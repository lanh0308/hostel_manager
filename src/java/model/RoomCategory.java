/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author lanh0
 */
public class RoomCategory {
    private int ID;
    private String name;
    private int areage;
    private int floor_number;
    private boolean is_window;
    private boolean is_balcony;
    private boolean is_kitchen;
    private int desk_number;
    private BedCategory bed_category;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAreage() {
        return areage;
    }

    public void setAreage(int areage) {
        this.areage = areage;
    }

    public int getFloor_number() {
        return floor_number;
    }

    public void setFloor_number(int floor_number) {
        this.floor_number = floor_number;
    }

    public boolean isIs_window() {
        return is_window;
    }

    public void setIs_window(boolean is_window) {
        this.is_window = is_window;
    }

    public boolean isIs_balcony() {
        return is_balcony;
    }

    public void setIs_balcony(boolean is_balcony) {
        this.is_balcony = is_balcony;
    }

    public boolean isIs_kitchen() {
        return is_kitchen;
    }

    public void setIs_kitchen(boolean is_kitchen) {
        this.is_kitchen = is_kitchen;
    }

    public int getDesk_number() {
        return desk_number;
    }

    public void setDesk_number(int desk_number) {
        this.desk_number = desk_number;
    }

    public BedCategory getBed_category() {
        return bed_category;
    }

    public void setBed_category(BedCategory bed_category) {
        this.bed_category = bed_category;
    }
    
    
}
