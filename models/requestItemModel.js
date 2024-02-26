class RequestItem{
    constructor(requestItemId,requestItemDateTime,roomid,requesterid,quantity,isCompleted,approvedBySupervisorId){
        this.requestItemId = requestItemId;
        this.requestItemDateTime = requestItemDateTime;
        this.roomid = roomid;
        this.requesterid = requesterid;
        this.quantity = quantity;
        this.isCompleted = isCompleted;
        this.approvedBySupervisorId = approvedBySupervisorId;
    }

}

module.exports = RequestItem;