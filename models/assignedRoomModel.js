class AssignedRoom {
  constructor(
    Id,
    RoomId,
    RoomStatus,
    AssignedDateTime,
    AssignedHousekeeperId,
    CleaningStatus,
    IsCompleted,
    VerifiedPhotoUrl,
    StartTime,
    EndTime,
    CleaningDuration,
    IsHelperRequested,
    RequestedHelperId,
    AdditionalNotes,
  ) {
    this.Id = Id;
    this.RoomId = RoomId;
    this.RoomStatus = RoomStatus;
    this.AssignedDateTime = AssignedDateTime;
    this.AssignedHousekeeperId = AssignedHousekeeperId;
    this.CleaningStatus = CleaningStatus;
    this.IsCompleted = IsCompleted;
    this.VerifiedPhotoUrl = VerifiedPhotoUrl;
    this.StartTime = StartTime;
    this.EndTime = EndTime;
    this.CleaningDuration = CleaningDuration;
    this.IsHelperRequested = IsHelperRequested;
    this.RequestedHelperId = RequestedHelperId;
    this.AdditionalNotes = AdditionalNotes;
  }
}

module.exports = AssignedRoom;
