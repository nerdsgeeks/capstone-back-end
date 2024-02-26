class Reservation {
  constructor(
    Id,
    RoomId,
    CheckIn,
    CheckOut,
    GuestName,
    NoOfGuest,
    AdditionalNotes,
    IsCompleted,
  ) {
    this.Id = Id;
    this.RoomId = RoomId;
    this.CheckIn = CheckIn;
    this.CheckOut = CheckOut;
    this.GuestName = GuestName;
    this.NoOfGuest = NoOfGuest;
    this.AdditionalNotes = AdditionalNotes;
    this.IsCompleted = IsCompleted;
  }
}

module.exports = Reservation;
