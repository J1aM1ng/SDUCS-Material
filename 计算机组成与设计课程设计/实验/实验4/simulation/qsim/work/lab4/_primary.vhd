library verilog;
use verilog.vl_types.all;
entity lab4 is
    port(
        altera_reserved_tms: in     vl_logic;
        altera_reserved_tck: in     vl_logic;
        altera_reserved_tdi: in     vl_logic;
        altera_reserved_tdo: out    vl_logic;
        W1              : out    vl_logic;
        CLK             : in     vl_logic;
        \OPEN\          : in     vl_logic;
        T               : out    vl_logic_vector(3 downto 0);
        MOV1            : out    vl_logic;
        Ctrl            : out    vl_logic_vector(19 downto 0);
        CLR             : in     vl_logic;
        MOV2            : out    vl_logic;
        MOV3            : out    vl_logic;
        MOV4            : out    vl_logic;
        ADD             : out    vl_logic;
        \XOR\           : out    vl_logic;
        \OR\            : out    vl_logic;
        \AND\           : out    vl_logic;
        \NOT\           : out    vl_logic;
        SUB             : out    vl_logic;
        MUL             : out    vl_logic;
        LM              : out    vl_logic;
        RM              : out    vl_logic;
        HALT            : out    vl_logic;
        W2              : out    vl_logic;
        OP              : out    vl_logic_vector(3 downto 0);
        rama            : out    vl_logic_vector(7 downto 0);
        ramd            : out    vl_logic_vector(7 downto 0);
        ramq            : out    vl_logic_vector(7 downto 0)
    );
end lab4;
