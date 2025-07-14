module Top (
    input        i_clk ,
    input        i_rst ,
    output [6:0] o_seconds_1 ,
    output [6:0] o_seconds_2 ,
    output [6:0] o_minutes_1 ,
    output [6:0] o_minutes_2 ,  
    output [6:0] o_hours_1 ,
    output [6:0] o_hours_2 
);
    wire [5:0] timer_seconds , timer_minutes ;
    wire [6:0] timer_hours ;
    wire [11:0] hours_bcd , minutes_bcd , seconds_bcd ;
    
    timer timer_inst(
        .i_clk(i_clk) ,
        .i_rst(i_rst) ,
        .o_seconds(timer_seconds) ,
        .o_minutes(timer_minutes) ,
        .o_hours(timer_hours)
    );

    BCD BCD_hours_inst(
        .i_data({1'b0 , timer_hours}) ,
        .o_units(hours_bcd[3:0]) ,
        .o_tens(hours_bcd[7:4]) ,
        .o_hunds(hours_bcd[11:8]) 
    );

    BCD BCD_minutes_inst(
        .i_data({1'b0 , timer_minutes}) ,
        .o_units(minutes_bcd[3:0]) ,
        .o_tens(minutes_bcd[7:4]) ,
        .o_hunds(minutes_bcd[11:8]) 
    );

    BCD BCD_seconds_inst(
        .i_data({1'b0 , timer_seconds}) ,
        .o_units(seconds_bcd[3:0]) ,
        .o_tens(seconds_bcd[7:4]) ,
        .o_hunds(seconds_bcd[11:8]) 
    );

    seven_segment_decoder ints_hours_1 (
        .i_bits(hours_bcd[3:0]) ,
        .o_display(o_hours_1)
    );

    seven_segment_decoder ints_hours_2 (
        .i_bits(hours_bcd[7:4]) ,
        .o_display(o_hours_2)
    );

    seven_segment_decoder ints_minutes_1(
        .i_bits(minutes_bcd[3:0]) ,
        .o_display(o_minutes_1)
    );

    seven_segment_decoder ints_minutes_2(
        .i_bits(minutes_bcd[7:4]) ,
        .o_display(o_minutes_2)
    );

    seven_segment_decoder inst_seconds_1(
        .i_bits(seconds_bcd[3:0]) ,
        .o_display(o_seconds_1)
    );
    
    seven_segment_decoder inst_seconds_2(
        .i_bits(seconds_bcd[7:4]) ,
        .o_display(o_seconds_2)
    );

endmodule