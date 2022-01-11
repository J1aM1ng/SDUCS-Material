library verilog;
use verilog.vl_types.all;
entity lab4_vlg_check_tst is
    port(
        ADD             : in     vl_logic;
        \AND\           : in     vl_logic;
        Ctrl            : in     vl_logic_vector(19 downto 0);
        HALT            : in     vl_logic;
        LM              : in     vl_logic;
        MOV1            : in     vl_logic;
        MOV2            : in     vl_logic;
        MOV3            : in     vl_logic;
        MOV4            : in     vl_logic;
        MUL             : in     vl_logic;
        \NOT\           : in     vl_logic;
        OP              : in     vl_logic_vector(3 downto 0);
        \OR\            : in     vl_logic;
        rama            : in     vl_logic_vector(7 downto 0);
        ramd            : in     vl_logic_vector(7 downto 0);
        ramq            : in     vl_logic_vector(7 downto 0);
        RM              : in     vl_logic;
        SUB             : in     vl_logic;
        T               : in     vl_logic_vector(3 downto 0);
        W1              : in     vl_logic;
        W2              : in     vl_logic;
        \XOR\           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end lab4_vlg_check_tst;
