//2022_10_31 kerong
//Ring or vibrate
module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);

assign ringer =  ~vibrate_mode & ring;
assign motor  = vibrate_mode   & ring;

endmodule