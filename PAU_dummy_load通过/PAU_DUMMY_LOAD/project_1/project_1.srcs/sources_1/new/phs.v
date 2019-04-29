module phs#(
    parameter CHN = 4
)
(
    input              rst     ,
    input              clk     ,
    input              clk_phs , //async clock
    input              trig    ,
    input              glb_sw  ,
    input  [CHN-1  :0] chn_sw  ,
    input  [CHN*8-1:0] cfg     ,   
    output [CHN-1  :0] phs_a   , //drive by clock clk_phs
    output [CHN-1  :0] phs_b   , //drive by clock clk_phs
    output             phs_zero  //drive by clock clk_phs
);
    genvar j;
    
    
    //___________________________________________________________reg by clk
    reg [CHN-1  :0] en_chn;
    reg             en_zero;
    reg [CHN*8-1:0] cfg_opp; //opposite, cfg_opp = 256 - cfg
    reg [CHN*8-1:0] cfg_rvs; //reverse , cfg_rvs = 128 - cfg

    always@(posedge clk) begin
        en_chn  <= {CHN{trig}} & {CHN{glb_sw}} & chn_sw;
        en_zero <= trig;
    end
    
    generate
        for(j=0;j<CHN;j=j+1)
        begin : u_cfg        
            always@(posedge clk) begin
                cfg_opp[j*8+:8] <= 8'd0   - cfg[j*8+:8];
                cfg_rvs[j*8+:8] <= 8'd128 - cfg[j*8+:8];
            end 
        end
    endgenerate  
    
    
    //______________________________________________en_zero sync by clk_phs
    localparam SYNC=2;                        
    reg [SYNC-1 :0]en_zero_sync_pipe ; 
    wire en_zero_sync;
    always@(posedge clk_phs)                  
        en_zero_sync_pipe  <= {en_zero_sync_pipe[SYNC-2:0],en_zero};
    assign en_zero_sync = en_zero_sync_pipe[SYNC-1];
    
    //BUFG u_bufg_rst_sync(.I(rst_sync_pipe[SYNC-1]),.O(rst_sync));    
    //BUFG u_bufg_clk_sync(.I(clk_phs),.O(clk_sync));
    
    
    //___________________________rst/en_chn/cfg_opp/cfg_rvs sync bu clk_phs
    reg  [SYNC-1  :0] rst_sync_pipe    [CHN-1:0];   
    reg  [SYNC-1  :0] en_chn_sync_pipe [CHN-1:0];
    reg  [SYNC*8-1:0] cfg_opp_sync_pipe[CHN-1:0];
    reg  [SYNC*8-1:0] cfg_rvs_sync_pipe[CHN-1:0];
    wire [CHN-1   :0] rst_sync;    
    wire [CHN-1   :0] en_chn_sync;
    wire [CHN*8-1 :0] cfg_opp_sync;
    wire [CHN*8-1 :0] cfg_rvs_sync;
    
    generate
        for(j=0;j<CHN;j=j+1)
        begin : u_sync      
            always@(posedge clk_phs) begin   
                rst_sync_pipe    [j] <= {rst_sync_pipe    [j][SYNC-2  :0],rst            };              
                en_chn_sync_pipe [j] <= {en_chn_sync_pipe [j][SYNC-2  :0],en_chn[j]      };
                cfg_opp_sync_pipe[j] <= {cfg_opp_sync_pipe[j][SYNC*8-9:0],cfg_opp[j*8+:8]};
                cfg_rvs_sync_pipe[j] <= {cfg_rvs_sync_pipe[j][SYNC*8-9:0],cfg_rvs[j*8+:8]};
            end
            
            assign rst_sync[j]          = rst_sync_pipe    [j][SYNC-1]           ;
            assign en_chn_sync[j]       = en_chn_sync_pipe [j][SYNC-1]           ;
            assign cfg_opp_sync[j*8+:8] = cfg_opp_sync_pipe[j][SYNC*8-1:SYNC*8-8];
            assign cfg_rvs_sync[j*8+:8] = cfg_rvs_sync_pipe[j][SYNC*8-1:SYNC*8-8];  
        end
    endgenerate  
    
    
    //_________________________________________________________phs_gen inst
    wire [CHN-1:0] phs_a_src;
    wire [CHN-1:0] phs_b_src;   
    wire phs_zero_src; 
    
    generate
        for(j=0;j<CHN;j=j+1)
        begin : u_phs_a_b     
        
            phs_gen u_a (    
                .rst(rst_sync[j]         ),
                .clk(clk_phs             ),
                .en (en_chn_sync[j]      ),
                .cfg(cfg_opp_sync[j*8+:8]),
                .o  (phs_a_src[j]        )
            );
            
            phs_gen u_b (    
                .rst(rst_sync[j]         ),
                .clk(clk_phs             ),
                .en (en_chn_sync[j]      ),
                .cfg(cfg_rvs_sync[j*8+:8]),
                .o  (phs_b_src[j]        )
            );
                
        end
    endgenerate  
    
    phs_gen u_zero (
        .rst(rst_sync[0] ),
        .clk(clk_phs	 ),
        .en (en_zero_sync),
        .cfg(8'd0        ),
        .o  (phs_zero_src)
    );  
    
    
    //________________________________________________output dly by clk_phs
    localparam PHS_DLY = 2;
    
    reg [CHN*PHS_DLY-1:0]phs_a_dly   ;
    reg [CHN*PHS_DLY-1:0]phs_b_dly   ;  
    reg [PHS_DLY-1    :0]phs_zero_dly;
    
    always@(posedge clk_phs) begin
        phs_a_dly    <= {phs_a_dly[CHN*(PHS_DLY-1)-1:0],phs_a_src};
        phs_b_dly    <= {phs_b_dly[CHN*(PHS_DLY-1)-1:0],phs_b_src};
        phs_zero_dly <= {phs_zero_dly[PHS_DLY-2:0],phs_zero_src};
    end
    
    assign phs_a    = phs_a_dly[CHN*(PHS_DLY-1)+:CHN];
    assign phs_b    = phs_b_dly[CHN*(PHS_DLY-1)+:CHN];
    assign phs_zero = phs_zero_dly[PHS_DLY-1];
    
endmodule
