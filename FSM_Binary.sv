module FSM_Binary (
    input logic clk,
    input logic reset,
    input logic in,
    output logic [3:0] out
);
    typedef enum logic [3:0] {
        S0 = 4'b0000,
        S1 = 4'b0001,
        S2 = 4'b0010,
        S3 = 4'b0011,
        S4 = 4'b0100,
        S5 = 4'b0101,
        S6 = 4'b0110,
        S7 = 4'b0111,
        S8 = 4'b1000
    } state_t;
    
    state_t state, next_state;

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    always_comb begin
        case (state)
            S0: next_state = (in) ? S1 : S0;
            S1: next_state = (in) ? S2 : S1;
            S2: next_state = (in) ? S3 : S2;
            S3: next_state = (in) ? S4 : S3;
            S4: next_state = (in) ? S5 : S4;
            S5: next_state = (in) ? S6 : S5;
            S6: next_state = (in) ? S7 : S6;
            S7: next_state = (in) ? S8 : S7;
            S8: next_state = (in) ? S8 : S0;
            default: next_state = S0;
        endcase
    end

    always_comb begin
        case (state)
            S0: out = 4'b0000;
            S1: out = 4'b0001;
            S2: out = 4'b0010;
            S3: out = 4'b0011;
            S4: out = 4'b0100;
            S5: out = 4'b0101;
            S6: out = 4'b0110;
            S7: out = 4'b0111;
            S8: out = 4'b1000;
            default: out = 4'b0000;
        endcase
    end
endmodule

