/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppingcatalog.dto;

/**
 *
 * @author atulb
 */
public class itemDTO {
    private String itemType;
    private String itemName;

    @Override
    public String toString() {
        return "itemDTO{" + "itemType=" + itemType + ", itemName=" + itemName + ", itemPrice=" + itemPrice + ", itemDesc=" + itemDesc + ", itemImage=" + itemImage + ", itemId=" + itemId + '}';
    }

    public itemDTO() {
    }

    public itemDTO(String itemType, String itemName, double itemPrice, String itemDesc, String itemImage, int itemId) {
        this.itemType = itemType;
        this.itemName = itemName;
        this.itemPrice = itemPrice;
        this.itemDesc = itemDesc;
        this.itemImage = itemImage;
        this.itemId = itemId;
    }
    private double itemPrice;
    private String itemDesc;
    private String itemImage;
    private int itemId;

    public String getItemType() {
        return itemType;
    }

    public void setItemType(String itemType) {
        this.itemType = itemType;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public double getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(double itemPrice) {
        this.itemPrice = itemPrice;
    }

    public String getItemDesc() {
        return itemDesc;
    }

    public void setItemDesc(String itemDesc) {
        this.itemDesc = itemDesc;
    }

    public String getItemImage() {
        return itemImage;
    }

    public void setItemImage(String itemImage) {
        this.itemImage = itemImage;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }
    
    
}
