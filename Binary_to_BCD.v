module BCD (
    input  [7:0] i_data ,
    output [3:0] o_units, o_tens, o_hunds 
);

    wire [3:0] in_C1 , out_C1 ;
    wire [3:0] in_C2 , out_C2 ;
    wire [3:0] in_C3 , out_C3 ;
    wire [3:0] in_C4 , out_C4 ;
    wire [3:0] in_C5 , out_C5 ;
    wire [3:0] in_C6 , out_C6 ;
    wire [3:0] in_C7 , out_C7 ;

    assign in_C1 =   {1'b0 , i_data[7:5]} ;
    assign in_C2 =   {out_C1[2:0] , i_data[4]} ;
    assign in_C3 =   {out_C2[2:0] , i_data[3]} ;
    assign in_C4 =   {out_C3[2:0] , i_data[2]} ;
    assign in_C5 =   {out_C4[2:0] , i_data[1]} ;
    assign in_C6 =   {1'b0 , out_C1[3] , out_C2[3] , out_C3[3]} ;
    assign in_C7 =   {out_C6[2:0] , out_C4[3]} ;
    assign {o_hunds, o_tens, o_units} = {2'b00, out_C6[3], out_C7[3:0], out_C7[3:0], i_data[0]};

    add3 C1(.i_data(in_C1) , .o_converted_data(out_C1)) ;
    add3 C2(.i_data(in_C2) , .o_converted_data(out_C2)) ;
    add3 C3(.i_data(in_C3) , .o_converted_data(out_C3)) ;
    add3 C4(.i_data(in_C4) , .o_converted_data(out_C4)) ;
    add3 C5(.i_data(in_C5) , .o_converted_data(out_C5)) ;
    add3 C6(.i_data(in_C6) , .o_converted_data(out_C6)) ;
    add3 C7(.i_data(in_C7) , .o_converted_data(out_C7)) ;

    
endmodule