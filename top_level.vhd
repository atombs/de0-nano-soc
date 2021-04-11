--*****************************************************************************
--
-- FILE: top-level.vhd
--
-- DATE: 05/04/2021
--
-- AUTHOR: ATOMBS
--
-- DESCRIPTION: Top level VHDL file for Terasic's DE0 Nano SoC development
--				    board
--
--*****************************************************************************

-- Library import
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY top_level IS
	PORT (
--    ADC Interface
      ADC_CONVST : OUT STD_LOGIC;
      ADC_SCK : OUT STD_LOGIC;
      ADC_SDI : OUT STD_LOGIC;
      ADC_SDO : IN STD_LOGIC;

--    ARDUINO Headers
      ARDUINO_IO : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      ARDUINO_RESET_N : INOUT STD_LOGIC;

--    FPGA 
      FPGA_CLK1_50 : IN STD_LOGIC;
      FPGA_CLK2_50 : IN STD_LOGIC;
      FPGA_CLK3_50 : IN STD_LOGIC;

--    GPIO Headers
      GPIO_0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
      GPIO_1 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);

--    HPS Pins
      HPS_CONV_USB_N : INOUT STD_LOGIC;
      HPS_DDR3_ADDR : OUT STD_LOGIC_VECTOR(14 DOWNTO 0);
      HPS_DDR3_BA : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      HPS_DDR3_CAS_N : OUT STD_LOGIC;
      HPS_DDR3_CKE : OUT STD_LOGIC;
      HPS_DDR3_CK_N : OUT STD_LOGIC;
      HPS_DDR3_CK_P : OUT STD_LOGIC;
      HPS_DDR3_CS_N : OUT STD_LOGIC;
      HPS_DDR3_DM : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      HPS_DDR3_DQ : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      HPS_DDR3_DQS_N : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      HPS_DDR3_DQS_P : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      HPS_DDR3_ODT : OUT STD_LOGIC;
      HPS_DDR3_RAS_N : OUT STD_LOGIC;
      HPS_DDR3_RESET_N : OUT STD_LOGIC;
      HPS_DDR3_RZQ : IN STD_LOGIC;
      HPS_DDR3_WE_N : OUT STD_LOGIC;
      HPS_ENET_GTX_CLK : OUT STD_LOGIC;
      HPS_ENET_INT_N : INOUT STD_LOGIC;
      HPS_ENET_MDC : OUT STD_LOGIC;
      HPS_ENET_MDIO : INOUT STD_LOGIC;
      HPS_ENET_RX_CLK : IN STD_LOGIC;
      HPS_ENET_RX_DATA : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      HPS_ENET_RX_DV : IN STD_LOGIC;
      HPS_ENET_TX_DATA : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      HPS_ENET_TX_EN : OUT STD_LOGIC;
      HPS_GSENSOR_INT : INOUT STD_LOGIC;
      HPS_I2C0_SCLK : INOUT STD_LOGIC;
      HPS_I2C0_SDAT : INOUT STD_LOGIC;
      HPS_I2C1_SCLK : INOUT STD_LOGIC;
      HPS_I2C1_SDAT : INOUT STD_LOGIC;
      HPS_KEY : INOUT STD_LOGIC;
      HPS_LED : INOUT STD_LOGIC;
      HPS_LTC_GPIO : INOUT STD_LOGIC;
      HPS_SD_CLK : OUT STD_LOGIC;
      HPS_SD_CMD : INOUT STD_LOGIC;
      HPS_SD_DATA : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      HPS_SPIM_CLK : OUT STD_LOGIC;
      HPS_SPIM_MISO : IN STD_LOGIC;
      HPS_SPIM_MOSI : OUT STD_LOGIC;
      HPS_SPIM_SS : INOUT STD_LOGIC;
      HPS_UART_RX : IN STD_LOGIC;
      HPS_UART_TX : OUT STD_LOGIC;
      HPS_USB_CLKOUT : IN STD_LOGIC;
      HPS_USB_DATA : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      HPS_USB_DIR : IN STD_LOGIC;
      HPS_USB_NXT : IN STD_LOGIC;
      HPS_USB_STP : OUT STD_LOGIC;

-- 	Push buttons
      KEY : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

--    LED 
      LED : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

--		Switches
      SW : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END top_level;


ARCHITECTURE a OF top_level IS

COMPONENT soc_system is 
port (
		button_pio_external_connection_export : in    std_logic_vector(3 downto 0); -- button_pio_external_connection.export
		clk_clk                               : in    std_logic ;             --                            clk.clk
		dipsw_pio_external_connection_export  : in    std_logic_vector(3 downto 0); --  dipsw_pio_external_connection.export
		hps_0_h2f_reset_reset_n               : out   std_logic;                                        --                hps_0_h2f_reset.reset_n
		hps_0_hps_io_hps_io_emac1_inst_TX_CLK : out   std_logic;                                        --                   hps_0_hps_io.hps_io_emac1_inst_TX_CLK
		hps_0_hps_io_hps_io_emac1_inst_TXD0   : out   std_logic;                                        --                               .hps_io_emac1_inst_TXD0
		hps_0_hps_io_hps_io_emac1_inst_TXD1   : out   std_logic;                                        --                               .hps_io_emac1_inst_TXD1
		hps_0_hps_io_hps_io_emac1_inst_TXD2   : out   std_logic;                                        --                               .hps_io_emac1_inst_TXD2
		hps_0_hps_io_hps_io_emac1_inst_TXD3   : out   std_logic;                                        --                               .hps_io_emac1_inst_TXD3
		hps_0_hps_io_hps_io_emac1_inst_RXD0   : in    std_logic;             --                               .hps_io_emac1_inst_RXD0
		hps_0_hps_io_hps_io_emac1_inst_MDIO   : inout std_logic;             --                               .hps_io_emac1_inst_MDIO
		hps_0_hps_io_hps_io_emac1_inst_MDC    : out   std_logic;                                        --                               .hps_io_emac1_inst_MDC
		hps_0_hps_io_hps_io_emac1_inst_RX_CTL : in    std_logic;             --                               .hps_io_emac1_inst_RX_CTL
		hps_0_hps_io_hps_io_emac1_inst_TX_CTL : out   std_logic;                                        --                               .hps_io_emac1_inst_TX_CTL
		hps_0_hps_io_hps_io_emac1_inst_RX_CLK : in    std_logic ;             --                               .hps_io_emac1_inst_RX_CLK
		hps_0_hps_io_hps_io_emac1_inst_RXD1   : in    std_logic ;             --                               .hps_io_emac1_inst_RXD1
		hps_0_hps_io_hps_io_emac1_inst_RXD2   : in    std_logic;             --                               .hps_io_emac1_inst_RXD2
		hps_0_hps_io_hps_io_emac1_inst_RXD3   : in    std_logic ;             --                               .hps_io_emac1_inst_RXD3
		hps_0_hps_io_hps_io_sdio_inst_CMD     : inout std_logic;             --                               .hps_io_sdio_inst_CMD
		hps_0_hps_io_hps_io_sdio_inst_D0      : inout std_logic;             --                               .hps_io_sdio_inst_D0
		hps_0_hps_io_hps_io_sdio_inst_D1      : inout std_logic;             --                               .hps_io_sdio_inst_D1
		hps_0_hps_io_hps_io_sdio_inst_CLK     : out   std_logic;                                        --                               .hps_io_sdio_inst_CLK
		hps_0_hps_io_hps_io_sdio_inst_D2      : inout std_logic ;             --                               .hps_io_sdio_inst_D2
		hps_0_hps_io_hps_io_sdio_inst_D3      : inout std_logic ;             --                               .hps_io_sdio_inst_D3
		hps_0_hps_io_hps_io_usb1_inst_D0      : inout std_logic;             --                               .hps_io_usb1_inst_D0
		hps_0_hps_io_hps_io_usb1_inst_D1      : inout std_logic;             --                               .hps_io_usb1_inst_D1
		hps_0_hps_io_hps_io_usb1_inst_D2      : inout std_logic;             --                               .hps_io_usb1_inst_D2
		hps_0_hps_io_hps_io_usb1_inst_D3      : inout std_logic ;             --                               .hps_io_usb1_inst_D3
		hps_0_hps_io_hps_io_usb1_inst_D4      : inout std_logic;             --                               .hps_io_usb1_inst_D4
		hps_0_hps_io_hps_io_usb1_inst_D5      : inout std_logic ;             --                               .hps_io_usb1_inst_D5
		hps_0_hps_io_hps_io_usb1_inst_D6      : inout std_logic ;             --                               .hps_io_usb1_inst_D6
		hps_0_hps_io_hps_io_usb1_inst_D7      : inout std_logic;             --                               .hps_io_usb1_inst_D7
		hps_0_hps_io_hps_io_usb1_inst_CLK     : in    std_logic ;             --                               .hps_io_usb1_inst_CLK
		hps_0_hps_io_hps_io_usb1_inst_STP     : out   std_logic;                                        --                               .hps_io_usb1_inst_STP
		hps_0_hps_io_hps_io_usb1_inst_DIR     : in    std_logic;             --                               .hps_io_usb1_inst_DIR
		hps_0_hps_io_hps_io_usb1_inst_NXT     : in    std_logic ;             --                               .hps_io_usb1_inst_NXT
		hps_0_hps_io_hps_io_spim1_inst_CLK    : out   std_logic;                                        --                               .hps_io_spim1_inst_CLK
		hps_0_hps_io_hps_io_spim1_inst_MOSI   : out   std_logic;                                        --                               .hps_io_spim1_inst_MOSI
		hps_0_hps_io_hps_io_spim1_inst_MISO   : in    std_logic;             --                               .hps_io_spim1_inst_MISO
		hps_0_hps_io_hps_io_spim1_inst_SS0    : out   std_logic;                                        --                               .hps_io_spim1_inst_SS0
		hps_0_hps_io_hps_io_uart0_inst_RX     : in    std_logic;             --                               .hps_io_uart0_inst_RX
		hps_0_hps_io_hps_io_uart0_inst_TX     : out   std_logic;                                        --                               .hps_io_uart0_inst_TX
		hps_0_hps_io_hps_io_i2c0_inst_SDA     : inout std_logic;             --                               .hps_io_i2c0_inst_SDA
		hps_0_hps_io_hps_io_i2c0_inst_SCL     : inout std_logic;             --                               .hps_io_i2c0_inst_SCL
		hps_0_hps_io_hps_io_i2c1_inst_SDA     : inout std_logic;             --                               .hps_io_i2c1_inst_SDA
		hps_0_hps_io_hps_io_i2c1_inst_SCL     : inout std_logic       ;             --                               .hps_io_i2c1_inst_SCL
		hps_0_hps_io_hps_io_gpio_inst_GPIO09  : inout std_logic                ;             --                               .hps_io_gpio_inst_GPIO09
		hps_0_hps_io_hps_io_gpio_inst_GPIO35  : inout std_logic        ;             --                               .hps_io_gpio_inst_GPIO35
		hps_0_hps_io_hps_io_gpio_inst_GPIO40  : inout std_logic           ;             --                               .hps_io_gpio_inst_GPIO40
		hps_0_hps_io_hps_io_gpio_inst_GPIO53  : inout std_logic          ;             --                               .hps_io_gpio_inst_GPIO53
		hps_0_hps_io_hps_io_gpio_inst_GPIO54  : inout std_logic        ;             --                               .hps_io_gpio_inst_GPIO54
		hps_0_hps_io_hps_io_gpio_inst_GPIO61  : inout std_logic   ;             --                               .hps_io_gpio_inst_GPIO61
		led_pio_external_connection_export    : out   std_logic_vector(7 downto 0);                     --    led_pio_external_connection.export
		memory_mem_a                          : out   std_logic_vector(14 downto 0);                    --                         memory.mem_a
		memory_mem_ba                         : out   std_logic_vector(2 downto 0);                     --                               .mem_ba
		memory_mem_ck                         : out   std_logic;                                        --                               .mem_ck
		memory_mem_ck_n                       : out   std_logic;                                        --                               .mem_ck_n
		memory_mem_cke                        : out   std_logic;                                        --                               .mem_cke
		memory_mem_cs_n                       : out   std_logic;                                        --                               .mem_cs_n
		memory_mem_ras_n                      : out   std_logic;                                        --                               .mem_ras_n
		memory_mem_cas_n                      : out   std_logic;                                        --                               .mem_cas_n
		memory_mem_we_n                       : out   std_logic;                                        --                               .mem_we_n
		memory_mem_reset_n                    : out   std_logic;                                        --                               .mem_reset_n
		memory_mem_dq                         : inout std_logic_vector(31 downto 0); --                               .mem_dq
		memory_mem_dqs                        : inout std_logic_vector(3 downto 0); --                               .mem_dqs
		memory_mem_dqs_n                      : inout std_logic_vector(3 downto 0) ; --                               .mem_dqs_n
		memory_mem_odt                        : out   std_logic;                                        --                               .mem_odt
		memory_mem_dm                         : out   std_logic_vector(3 downto 0);                     --                               .mem_dm
		memory_oct_rzqin                      : in    std_logic                    ;             --                               .oct_rzqin
		reset_reset_n                         : in    std_logic                                  --                          reset.reset_n
	);
	END COMPONENT soc_system;
	signal hps_fpga_reset_n : std_logic;
	
BEGIN
	LED <= b"10101010";
	hps : COMPONENT soc_system PORT MAP (
		button_pio_external_connection_export(0) 	=> KEY(0),
		button_pio_external_connection_export(1) 	=> KEY(1),
		clk_clk                              	=> FPGA_CLK1_50,
		dipsw_pio_external_connection_export  	=> SW,
		hps_0_h2f_reset_reset_n               	=> hps_fpga_reset_n, 
		hps_0_hps_io_hps_io_emac1_inst_TX_CLK => HPS_ENET_GTX_CLK,
		hps_0_hps_io_hps_io_emac1_inst_TXD0   =>HPS_ENET_TX_DATA(0),
		hps_0_hps_io_hps_io_emac1_inst_TXD1  =>HPS_ENET_TX_DATA(1),
		hps_0_hps_io_hps_io_emac1_inst_TXD2   =>HPS_ENET_TX_DATA(2),
		hps_0_hps_io_hps_io_emac1_inst_TXD3   =>HPS_ENET_TX_DATA(3),
		hps_0_hps_io_hps_io_emac1_inst_RXD0   =>HPS_ENET_RX_DATA(0),
		hps_0_hps_io_hps_io_emac1_inst_MDIO   =>HPS_ENET_MDIO,
		hps_0_hps_io_hps_io_emac1_inst_MDC    =>HPS_ENET_MDC,
		hps_0_hps_io_hps_io_emac1_inst_RX_CTL =>HPS_ENET_RX_DV,
		hps_0_hps_io_hps_io_emac1_inst_TX_CTL =>HPS_ENET_TX_EN,
		hps_0_hps_io_hps_io_emac1_inst_RX_CLK =>HPS_ENET_RX_CLK,
		hps_0_hps_io_hps_io_emac1_inst_RXD1   =>HPS_ENET_RX_DATA(1),
		hps_0_hps_io_hps_io_emac1_inst_RXD2   =>HPS_ENET_RX_DATA(2),
		hps_0_hps_io_hps_io_emac1_inst_RXD3   =>HPS_ENET_RX_DATA(3),
		hps_0_hps_io_hps_io_sdio_inst_CMD     =>HPS_SD_CMD,
		hps_0_hps_io_hps_io_sdio_inst_D0      =>HPS_SD_DATA(0),
		hps_0_hps_io_hps_io_sdio_inst_D1      =>HPS_SD_DATA(1),
		hps_0_hps_io_hps_io_sdio_inst_CLK     =>HPS_SD_CLK,
		hps_0_hps_io_hps_io_sdio_inst_D2      =>HPS_SD_DATA(2),
		hps_0_hps_io_hps_io_sdio_inst_D3      =>HPS_SD_DATA(3),
		hps_0_hps_io_hps_io_usb1_inst_D0      =>HPS_USB_DATA(0), 
		hps_0_hps_io_hps_io_usb1_inst_D1      =>HPS_USB_DATA(1),
		hps_0_hps_io_hps_io_usb1_inst_D2      =>HPS_USB_DATA(2),
		hps_0_hps_io_hps_io_usb1_inst_D3      =>HPS_USB_DATA(3),
		hps_0_hps_io_hps_io_usb1_inst_D4      =>HPS_USB_DATA(4),
		hps_0_hps_io_hps_io_usb1_inst_D5      =>HPS_USB_DATA(5),
		hps_0_hps_io_hps_io_usb1_inst_D6      =>HPS_USB_DATA(6),
		hps_0_hps_io_hps_io_usb1_inst_D7      =>HPS_USB_DATA(7),
		hps_0_hps_io_hps_io_usb1_inst_CLK     =>HPS_USB_CLKOUT,
		hps_0_hps_io_hps_io_usb1_inst_STP     =>HPS_USB_STP,
		hps_0_hps_io_hps_io_usb1_inst_DIR     =>HPS_USB_DIR,
		hps_0_hps_io_hps_io_usb1_inst_NXT     =>HPS_USB_NXT,
		hps_0_hps_io_hps_io_spim1_inst_CLK    =>HPS_SPIM_CLK,
		hps_0_hps_io_hps_io_spim1_inst_MOSI   =>HPS_SPIM_MOSI,
		hps_0_hps_io_hps_io_spim1_inst_MISO   =>HPS_SPIM_MISO,
		hps_0_hps_io_hps_io_spim1_inst_SS0    =>HPS_SPIM_SS,
		hps_0_hps_io_hps_io_uart0_inst_RX     =>HPS_UART_RX,
		hps_0_hps_io_hps_io_uart0_inst_TX     =>HPS_UART_TX,
		hps_0_hps_io_hps_io_i2c0_inst_SDA     =>HPS_I2C0_SDAT,
		hps_0_hps_io_hps_io_i2c0_inst_SCL     =>HPS_I2C0_SCLK,
		hps_0_hps_io_hps_io_i2c1_inst_SDA     =>HPS_I2C1_SDAT,
		hps_0_hps_io_hps_io_i2c1_inst_SCL     =>HPS_I2C1_SCLK,
		hps_0_hps_io_hps_io_gpio_inst_GPIO09  =>HPS_CONV_USB_N,
		hps_0_hps_io_hps_io_gpio_inst_GPIO35  =>HPS_ENET_INT_N,
		hps_0_hps_io_hps_io_gpio_inst_GPIO40  =>HPS_LTC_GPIO,
		hps_0_hps_io_hps_io_gpio_inst_GPIO53  =>HPS_LED,
		hps_0_hps_io_hps_io_gpio_inst_GPIO54  =>HPS_KEY,
		hps_0_hps_io_hps_io_gpio_inst_GPIO61  =>HPS_GSENSOR_INT,
--		led_pio_external_connection_export    =>LED,
		memory_mem_a                          =>HPS_DDR3_ADDR,
		memory_mem_ba                         =>HPS_DDR3_BA,
		memory_mem_ck                         =>HPS_DDR3_CK_P,
		memory_mem_ck_n                       =>HPS_DDR3_CK_N,
		memory_mem_cke                        =>HPS_DDR3_CKE,
		memory_mem_cs_n                       =>HPS_DDR3_CS_N,
		memory_mem_ras_n                      =>HPS_DDR3_RAS_N,
		memory_mem_cas_n                      =>HPS_DDR3_CAS_N,
		memory_mem_we_n                       =>HPS_DDR3_WE_N,
		memory_mem_reset_n                    =>HPS_DDR3_RESET_N,
		memory_mem_dq                         =>HPS_DDR3_DQ,
		memory_mem_dqs                        =>HPS_DDR3_DQS_P,
		memory_mem_dqs_n                      =>HPS_DDR3_DQS_N,
		memory_mem_odt                        =>HPS_DDR3_ODT,
		memory_mem_dm                         =>HPS_DDR3_DM,
		memory_oct_rzqin                      =>HPS_DDR3_RZQ,
		reset_reset_n                         => '1'
	
	);

	
END ARCHITECTURE a;



