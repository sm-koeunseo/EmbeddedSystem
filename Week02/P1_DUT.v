module P1_DUT #(
)(  // input, ouput -> 회로의 시작과 끝 (0/1 bit)
	output  Alarm	    ,
	input   Door        ,
    input   Ignition    ,
    input   SeatBelt    
);

    // gate를 거친 input의 값을 저장하는 line
    wire    DoorOpened;
    wire    NoSeatBelt;
    wire    Node1;
    wire    Node2;

    // 각 게이트들. ouput을 먼저 입력한 후 input을 순차적으로 입력
    not     NOT_U0(DoorOpened, Door);
    not     NOT_U1(NoSeatBelt, SeatBelt);
    and     AND_U0(Node1, DoorOpened, Ignition);
    and     AND_U1(Node2, NoSeatBelt, Ignition);
    or      OR_U0(Alarm, Node1, Node2);

endmodule