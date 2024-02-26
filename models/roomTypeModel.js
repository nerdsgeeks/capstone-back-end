class RoomType {
  constructor(Id, RoomTypeName, RoomTasks, CleaningDuration, RoomTier) {
    this.Id = Id;
    this.RoomTypeName = RoomTypeName;
    this.RoomTasks = RoomTasks;
    this.CleaningDuration = CleaningDuration;
    this.RoomTier = RoomTier;
  }
}

module.exports = RoomType;
