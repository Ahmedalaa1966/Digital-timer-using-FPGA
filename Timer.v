module timer #(parameter frequency = 32'd50_000_000) (
    input            i_clk ,
    input            i_rst ,
    output reg [5:0] o_seconds ,  //output seconds from zero to 59
    output reg [5:0] o_minutes ,  //output minutes form zero to 59
    output reg [6:0] o_hours     //output hours form zero to 99
);  
    reg [25:0] counter ;
    localparam SEC = frequency-1 ;
    always @(posedge i_clk or posedge i_rst) begin
        if(i_rst) 
        begin
            o_seconds <= 0 ;
            o_hours   <= 0 ;
            o_minutes <= 0 ;
            counter   <= 0;
        end
        else
        begin
            counter <= counter + 1 ;
            if(counter == SEC) 
            begin
                counter <= 0 ;
                o_seconds <= o_seconds + 1 ;
                if(o_seconds == 6'd59) 
                begin
                    o_seconds <= 0 ;
                    o_minutes <= o_minutes + 1 ;
                    if(o_minutes == 6'd59) 
                    begin
                        o_minutes <= 0 ;
                        o_hours <= o_hours + 1 ;
                        if(o_hours == 7'd99) 
                            o_hours <= 0 ;
                    end
                end
            end
        end
    end    

endmodule