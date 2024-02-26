class Item{
    constructor(Id,ItemName,AvailableNum,Description,ImageUrl,GroupName){
        this.Id = Id; 
        this.ItemName = ItemName; 
        this.AvailableNum = AvailableNum;
        this.Description = Description;
        this.ImageUrl = ImageUrl;
        this.GroupName = GroupName;
        this.ItemType = ItemType
    }
}

module.exports = Item;