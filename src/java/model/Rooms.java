/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dao.BedDAO;

/**
 *
 * @author Admin
 */
public class Rooms {
    private int RID;
    private String name;
    private double price;
    private int Size;
    private int Capacity;
    private String Img;
    private int Status;
    private String detail;
    private int BID; // Foreign key referencing Beds(BID)

    // Constructors, getters, setters, and other methods

    public int getRID() {
        return RID;
    }

    public void setRID(int RID) {
        this.RID = RID;
    }

    public int getSize() {
        return Size;
    }

    public void setSize(int size) {
        Size = size;
    }

    public int getCapacity() {
        return Capacity;
    }

    public void setCapacity(int capacity) {
        Capacity = capacity;
    }

    public String getImg() {
        return Img;
    }

    public void setImg(String img) {
        Img = img;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int status) {
        Status = status;
    }

    public int getBID() {
        return BID;
    }

    public void setBID(int BID) {
        this.BID = BID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
    public BedS getBedSById() {
        return new BedDAO().getBedById(BID);
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
    
    @Override
    public String toString() {
        return "Rooms{" + "RID=" + RID + ", name=" + name + ", price=" + price + ", Size=" + Size + ", Capacity=" + Capacity + ", Img=" + Img + ", Status=" + Status + ", BID=" + BID + '}';
    }

    
    
    
    
}
