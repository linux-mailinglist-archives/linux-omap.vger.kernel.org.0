Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEEA86C5A
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 23:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404183AbfHHV2W (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 17:28:22 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:44225 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732609AbfHHV2W (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 17:28:22 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MFb38-1i6JXW47cE-00HBDf; Thu, 08 Aug 2019 23:28:05 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [PATCH 06/22] ARM: omap1: move some headers to include/linux/soc
Date:   Thu,  8 Aug 2019 23:22:15 +0200
Message-Id: <20190808212234.2213262-7-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190808212234.2213262-1-arnd@arndb.de>
References: <20190808212234.2213262-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:idy6Lea7UmTcnlNgoyrbiJS0Zc9hIIsd5pglu6VTK4FC+iaziM5
 Nc1rIHCO8XUywBBgSTYOy22ka2vrty2w4E+3N9N4rx4ncj3X6khdWIngzEI2LfHiwYDkiII
 TMw40jRvfpPXQqUpKGydTJXa3i4IdGLlXkT78pbmOND5dPyfDvs5Di+8qEgAbZTPNRx86Cg
 Ypw2o19fyGadsikDFkhgQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CTXJZb33Cbw=:zqaiPZVfWdY+l2xNafnb8c
 gWlI2SzVJqyhyHQhAkq0kR3nlH+15Ja8anM3jY8FW5/lkrJdEuSgok/5AUQcMPdxVnOmJXHRH
 R6QPOY+8+ZGPU0Dc+MNbGcqPn0biNAclDq8pq0BKnt4O0cv1C1dyDU7PTB3qGyyiwPqGitg14
 y08xA8wCOlbQ7esCgJ6roV4ewc/IevN89s903L+Ke24I3Kyid2JyhRBJo4Y41tpMzOmiH84qG
 FB2ohRuTW34/53eptQpfTklllvGKeiPLyeUAOsLASq1zSKBbsoQ6ku0lPLWDNmkcMmHDKid99
 n6s8+cwzbvTq+eRLLuySIJXkpjJ1NNA6xcbujlNsf5U3CjunH0fo64XiEiQmLWbagDnHXcQUP
 1OxY5cv2S9MK3cU0rBcFm64WoPTf9FBtNYPK4T/0FHQcQf+iEPnoJWYE0kP5X/lSGlLuM5UAt
 4DgE9VbuWtjYT+UboEx3aooozEzygn1XH9aBrnRQ83C7XhFU2wiszV2/DAXijeb+XV71X2NGB
 Zo3vChf2+HSFUg9Vm9rfDNdBUsVWizTMxFpbGH2OnakhNcYyr0No3fBCPTj2DiH2LgSKgrnWm
 vxoZRMC/IEkgGxeNWaEBi78+ZWdW3fotwaxOQCcrcCRk0b+Ldu0q99sfDOF68sk2KHIjC0Zpn
 mX48YCoj4homHcBzYGXB0H0OD7q5pNibEoFpbLgXaFgglSoxn6U03t/YR2pcFp1419V4OLCQj
 zJyBdW2suKB5jjWf468pBJUxZVumwjFPmUv4tQ==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There are three remaining header files that are used by omap1
specific device drivers:

- mach/soc.h provides cpu_is_omapXXX abstractions
- mach/hardware.h provides omap_read/omap_write functions
  and physical addresses
- mach/mux.h provides an omap specific pinctrl abstraction

This is generally not how we do platform abstractions today,
and it would be good to completely get rid of these in favor
of passing information through platform devices and the pinctrl
subsystem.

However, given that nobody is working on that, just move it
one step forward by splitting out the header files that are
used by drivers today from the machine headers that are only
used internally.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/include/mach/hardware.h   | 128 +------
 arch/arm/mach-omap1/include/mach/memory.h     |   2 +-
 arch/arm/mach-omap1/include/mach/mux.h        | 299 +----------------
 arch/arm/mach-omap1/soc.h                     |   6 +-
 arch/arm/plat-omap/dma.c                      |   4 +-
 include/linux/soc/ti/omap1-io.h               | 143 ++++++++
 include/linux/soc/ti/omap1-mux.h              | 311 ++++++++++++++++++
 .../soc.h => include/linux/soc/ti/omap1-soc.h |  22 --
 8 files changed, 466 insertions(+), 449 deletions(-)
 create mode 100644 include/linux/soc/ti/omap1-io.h
 create mode 100644 include/linux/soc/ti/omap1-mux.h
 rename arch/arm/mach-omap1/include/mach/soc.h => include/linux/soc/ti/omap1-soc.h (90%)

diff --git a/arch/arm/mach-omap1/include/mach/hardware.h b/arch/arm/mach-omap1/include/mach/hardware.h
index e7c8ac7d83e3..05c5cd3e95f4 100644
--- a/arch/arm/mach-omap1/include/mach/hardware.h
+++ b/arch/arm/mach-omap1/include/mach/hardware.h
@@ -37,19 +37,10 @@
 #define __ASM_ARCH_OMAP_HARDWARE_H
 
 #include <linux/sizes.h>
+#include <linux/soc/ti/omap1-io.h>
 #ifndef __ASSEMBLER__
 #include <asm/types.h>
-#include <mach/soc.h>
-
-/*
- * NOTE: Please use ioremap + __raw_read/write where possible instead of these
- */
-extern u8 omap_readb(u32 pa);
-extern u16 omap_readw(u32 pa);
-extern u32 omap_readl(u32 pa);
-extern void omap_writeb(u8 v, u32 pa);
-extern void omap_writew(u16 v, u32 pa);
-extern void omap_writel(u32 v, u32 pa);
+#include <linux/soc/ti/omap1-soc.h>
 
 #include <mach/tc.h>
 
@@ -98,66 +89,6 @@ static inline u32 omap_cs3_phys(void)
 #define MPU_TIMER_AR		(1 << 1)
 #define MPU_TIMER_ST		(1 << 0)
 
-/*
- * ----------------------------------------------------------------------------
- * Clocks
- * ----------------------------------------------------------------------------
- */
-#define CLKGEN_REG_BASE		(0xfffece00)
-#define ARM_CKCTL		(CLKGEN_REG_BASE + 0x0)
-#define ARM_IDLECT1		(CLKGEN_REG_BASE + 0x4)
-#define ARM_IDLECT2		(CLKGEN_REG_BASE + 0x8)
-#define ARM_EWUPCT		(CLKGEN_REG_BASE + 0xC)
-#define ARM_RSTCT1		(CLKGEN_REG_BASE + 0x10)
-#define ARM_RSTCT2		(CLKGEN_REG_BASE + 0x14)
-#define ARM_SYSST		(CLKGEN_REG_BASE + 0x18)
-#define ARM_IDLECT3		(CLKGEN_REG_BASE + 0x24)
-
-#define CK_RATEF		1
-#define CK_IDLEF		2
-#define CK_ENABLEF		4
-#define CK_SELECTF		8
-#define SETARM_IDLE_SHIFT
-
-/* DPLL control registers */
-#define DPLL_CTL		(0xfffecf00)
-
-/* DSP clock control. Must use __raw_readw() and __raw_writew() with these */
-#define DSP_CONFIG_REG_BASE     IOMEM(0xe1008000)
-#define DSP_CKCTL		(DSP_CONFIG_REG_BASE + 0x0)
-#define DSP_IDLECT1		(DSP_CONFIG_REG_BASE + 0x4)
-#define DSP_IDLECT2		(DSP_CONFIG_REG_BASE + 0x8)
-#define DSP_RSTCT2		(DSP_CONFIG_REG_BASE + 0x14)
-
-/*
- * ---------------------------------------------------------------------------
- * UPLD
- * ---------------------------------------------------------------------------
- */
-#define ULPD_REG_BASE		(0xfffe0800)
-#define ULPD_IT_STATUS		(ULPD_REG_BASE + 0x14)
-#define ULPD_SETUP_ANALOG_CELL_3	(ULPD_REG_BASE + 0x24)
-#define ULPD_CLOCK_CTRL		(ULPD_REG_BASE + 0x30)
-#	define DIS_USB_PVCI_CLK		(1 << 5)	/* no USB/FAC synch */
-#	define USB_MCLK_EN		(1 << 4)	/* enable W4_USB_CLKO */
-#define ULPD_SOFT_REQ		(ULPD_REG_BASE + 0x34)
-#	define SOFT_UDC_REQ		(1 << 4)
-#	define SOFT_USB_CLK_REQ		(1 << 3)
-#	define SOFT_DPLL_REQ		(1 << 0)
-#define ULPD_DPLL_CTRL		(ULPD_REG_BASE + 0x3c)
-#define ULPD_STATUS_REQ		(ULPD_REG_BASE + 0x40)
-#define ULPD_APLL_CTRL		(ULPD_REG_BASE + 0x4c)
-#define ULPD_POWER_CTRL		(ULPD_REG_BASE + 0x50)
-#define ULPD_SOFT_DISABLE_REQ_REG	(ULPD_REG_BASE + 0x68)
-#	define DIS_MMC2_DPLL_REQ	(1 << 11)
-#	define DIS_MMC1_DPLL_REQ	(1 << 10)
-#	define DIS_UART3_DPLL_REQ	(1 << 9)
-#	define DIS_UART2_DPLL_REQ	(1 << 8)
-#	define DIS_UART1_DPLL_REQ	(1 << 7)
-#	define DIS_USB_HOST_DPLL_REQ	(1 << 6)
-#define ULPD_SDW_CLK_DIV_CTRL_SEL	(ULPD_REG_BASE + 0x74)
-#define ULPD_CAM_CLK_CTRL	(ULPD_REG_BASE + 0x7c)
-
 /*
  * ---------------------------------------------------------------------------
  * Watchdog timer
@@ -213,52 +144,6 @@ static inline u32 omap_cs3_phys(void)
 
 #endif
 
-/*
- * ----------------------------------------------------------------------------
- * System control registers
- * ----------------------------------------------------------------------------
- */
-#define MOD_CONF_CTRL_0		0xfffe1080
-#define MOD_CONF_CTRL_1		0xfffe1110
-
-/*
- * ----------------------------------------------------------------------------
- * Pin multiplexing registers
- * ----------------------------------------------------------------------------
- */
-#define FUNC_MUX_CTRL_0		0xfffe1000
-#define FUNC_MUX_CTRL_1		0xfffe1004
-#define FUNC_MUX_CTRL_2		0xfffe1008
-#define COMP_MODE_CTRL_0	0xfffe100c
-#define FUNC_MUX_CTRL_3		0xfffe1010
-#define FUNC_MUX_CTRL_4		0xfffe1014
-#define FUNC_MUX_CTRL_5		0xfffe1018
-#define FUNC_MUX_CTRL_6		0xfffe101C
-#define FUNC_MUX_CTRL_7		0xfffe1020
-#define FUNC_MUX_CTRL_8		0xfffe1024
-#define FUNC_MUX_CTRL_9		0xfffe1028
-#define FUNC_MUX_CTRL_A		0xfffe102C
-#define FUNC_MUX_CTRL_B		0xfffe1030
-#define FUNC_MUX_CTRL_C		0xfffe1034
-#define FUNC_MUX_CTRL_D		0xfffe1038
-#define PULL_DWN_CTRL_0		0xfffe1040
-#define PULL_DWN_CTRL_1		0xfffe1044
-#define PULL_DWN_CTRL_2		0xfffe1048
-#define PULL_DWN_CTRL_3		0xfffe104c
-#define PULL_DWN_CTRL_4		0xfffe10ac
-
-/* OMAP-1610 specific multiplexing registers */
-#define FUNC_MUX_CTRL_E		0xfffe1090
-#define FUNC_MUX_CTRL_F		0xfffe1094
-#define FUNC_MUX_CTRL_10	0xfffe1098
-#define FUNC_MUX_CTRL_11	0xfffe109c
-#define FUNC_MUX_CTRL_12	0xfffe10a0
-#define PU_PD_SEL_0		0xfffe10b4
-#define PU_PD_SEL_1		0xfffe10b8
-#define PU_PD_SEL_2		0xfffe10bc
-#define PU_PD_SEL_3		0xfffe10c0
-#define PU_PD_SEL_4		0xfffe10c4
-
 /* Timer32K for 1610 and 1710*/
 #define OMAP_TIMER32K_BASE	0xFFFBC400
 
@@ -299,15 +184,6 @@ static inline u32 omap_cs3_phys(void)
 #define OMAP_LPG2_LCR			(OMAP_LPG2_BASE + 0x00)
 #define OMAP_LPG2_PMR			(OMAP_LPG2_BASE + 0x04)
 
-/*
- * ----------------------------------------------------------------------------
- * Pulse-Width Light
- * ----------------------------------------------------------------------------
- */
-#define OMAP_PWL_BASE			0xfffb5800
-#define OMAP_PWL_ENABLE			(OMAP_PWL_BASE + 0x00)
-#define OMAP_PWL_CLK_ENABLE		(OMAP_PWL_BASE + 0x04)
-
 /*
  * ---------------------------------------------------------------------------
  * Processor specific defines
diff --git a/arch/arm/mach-omap1/include/mach/memory.h b/arch/arm/mach-omap1/include/mach/memory.h
index ba3a350479c8..ee91a6cb548d 100644
--- a/arch/arm/mach-omap1/include/mach/memory.h
+++ b/arch/arm/mach-omap1/include/mach/memory.h
@@ -7,6 +7,6 @@
 #define __ASM_ARCH_MEMORY_H
 
 /* REVISIT: omap1 legacy drivers still rely on this */
-#include <mach/soc.h>
+#include <mach/hardware.h>
 
 #endif
diff --git a/arch/arm/mach-omap1/include/mach/mux.h b/arch/arm/mach-omap1/include/mach/mux.h
index adfe1f6bd0c5..362abb9f1dcf 100644
--- a/arch/arm/mach-omap1/include/mach/mux.h
+++ b/arch/arm/mach-omap1/include/mach/mux.h
@@ -20,6 +20,8 @@
 #ifndef __ASM_ARCH_MUX_H
 #define __ASM_ARCH_MUX_H
 
+#include <linux/soc/ti/omap1-mux.h>
+
 #define PU_PD_SEL_NA		0	/* No pu_pd reg available */
 #define PULL_DWN_CTRL_NA	0	/* No pull-down control needed */
 
@@ -124,301 +126,6 @@ struct pin_config {
 
 };
 
-enum omap7xx_index {
-	/* OMAP 730 keyboard */
-	E2_7XX_KBR0,
-	J7_7XX_KBR1,
-	E1_7XX_KBR2,
-	F3_7XX_KBR3,
-	D2_7XX_KBR4,
-	C2_7XX_KBC0,
-	D3_7XX_KBC1,
-	E4_7XX_KBC2,
-	F4_7XX_KBC3,
-	E3_7XX_KBC4,
-
-	/* USB */
-	AA17_7XX_USB_DM,
-	W16_7XX_USB_PU_EN,
-	W17_7XX_USB_VBUSI,
-	W18_7XX_USB_DMCK_OUT,
-	W19_7XX_USB_DCRST,
-
-	/* MMC */
-	MMC_7XX_CMD,
-	MMC_7XX_CLK,
-	MMC_7XX_DAT0,
-
-	/* I2C */
-	I2C_7XX_SCL,
-	I2C_7XX_SDA,
-
-	/* SPI */
-	SPI_7XX_1,
-	SPI_7XX_2,
-	SPI_7XX_3,
-	SPI_7XX_4,
-	SPI_7XX_5,
-	SPI_7XX_6,
-
-	/* UART */
-	UART_7XX_1,
-	UART_7XX_2,
-};
-
-enum omap1xxx_index {
-	/* UART1 (BT_UART_GATING)*/
-	UART1_TX = 0,
-	UART1_RTS,
-
-	/* UART2 (COM_UART_GATING)*/
-	UART2_TX,
-	UART2_RX,
-	UART2_CTS,
-	UART2_RTS,
-
-	/* UART3 (GIGA_UART_GATING) */
-	UART3_TX,
-	UART3_RX,
-	UART3_CTS,
-	UART3_RTS,
-	UART3_CLKREQ,
-	UART3_BCLK,	/* 12MHz clock out */
-	Y15_1610_UART3_RTS,
-
-	/* PWT & PWL */
-	PWT,
-	PWL,
-
-	/* USB master generic */
-	R18_USB_VBUS,
-	R18_1510_USB_GPIO0,
-	W4_USB_PUEN,
-	W4_USB_CLKO,
-	W4_USB_HIGHZ,
-	W4_GPIO58,
-
-	/* USB1 master */
-	USB1_SUSP,
-	USB1_SEO,
-	W13_1610_USB1_SE0,
-	USB1_TXEN,
-	USB1_TXD,
-	USB1_VP,
-	USB1_VM,
-	USB1_RCV,
-	USB1_SPEED,
-	R13_1610_USB1_SPEED,
-	R13_1710_USB1_SE0,
-
-	/* USB2 master */
-	USB2_SUSP,
-	USB2_VP,
-	USB2_TXEN,
-	USB2_VM,
-	USB2_RCV,
-	USB2_SEO,
-	USB2_TXD,
-
-	/* OMAP-1510 GPIO */
-	R18_1510_GPIO0,
-	R19_1510_GPIO1,
-	M14_1510_GPIO2,
-
-	/* OMAP1610 GPIO */
-	P18_1610_GPIO3,
-	Y15_1610_GPIO17,
-
-	/* OMAP-1710 GPIO */
-	R18_1710_GPIO0,
-	V2_1710_GPIO10,
-	N21_1710_GPIO14,
-	W15_1710_GPIO40,
-
-	/* MPUIO */
-	MPUIO2,
-	N15_1610_MPUIO2,
-	MPUIO4,
-	MPUIO5,
-	T20_1610_MPUIO5,
-	W11_1610_MPUIO6,
-	V10_1610_MPUIO7,
-	W11_1610_MPUIO9,
-	V10_1610_MPUIO10,
-	W10_1610_MPUIO11,
-	E20_1610_MPUIO13,
-	U20_1610_MPUIO14,
-	E19_1610_MPUIO15,
-
-	/* MCBSP2 */
-	MCBSP2_CLKR,
-	MCBSP2_CLKX,
-	MCBSP2_DR,
-	MCBSP2_DX,
-	MCBSP2_FSR,
-	MCBSP2_FSX,
-
-	/* MCBSP3 */
-	MCBSP3_CLKX,
-
-	/* Misc ballouts */
-	BALLOUT_V8_ARMIO3,
-	N20_HDQ,
-
-	/* OMAP-1610 MMC2 */
-	W8_1610_MMC2_DAT0,
-	V8_1610_MMC2_DAT1,
-	W15_1610_MMC2_DAT2,
-	R10_1610_MMC2_DAT3,
-	Y10_1610_MMC2_CLK,
-	Y8_1610_MMC2_CMD,
-	V9_1610_MMC2_CMDDIR,
-	V5_1610_MMC2_DATDIR0,
-	W19_1610_MMC2_DATDIR1,
-	R18_1610_MMC2_CLKIN,
-
-	/* OMAP-1610 External Trace Interface */
-	M19_1610_ETM_PSTAT0,
-	L15_1610_ETM_PSTAT1,
-	L18_1610_ETM_PSTAT2,
-	L19_1610_ETM_D0,
-	J19_1610_ETM_D6,
-	J18_1610_ETM_D7,
-
-	/* OMAP16XX GPIO */
-	P20_1610_GPIO4,
-	V9_1610_GPIO7,
-	W8_1610_GPIO9,
-	N20_1610_GPIO11,
-	N19_1610_GPIO13,
-	P10_1610_GPIO22,
-	V5_1610_GPIO24,
-	AA20_1610_GPIO_41,
-	W19_1610_GPIO48,
-	M7_1610_GPIO62,
-	V14_16XX_GPIO37,
-	R9_16XX_GPIO18,
-	L14_16XX_GPIO49,
-
-	/* OMAP-1610 uWire */
-	V19_1610_UWIRE_SCLK,
-	U18_1610_UWIRE_SDI,
-	W21_1610_UWIRE_SDO,
-	N14_1610_UWIRE_CS0,
-	P15_1610_UWIRE_CS3,
-	N15_1610_UWIRE_CS1,
-
-	/* OMAP-1610 SPI */
-	U19_1610_SPIF_SCK,
-	U18_1610_SPIF_DIN,
-	P20_1610_SPIF_DIN,
-	W21_1610_SPIF_DOUT,
-	R18_1610_SPIF_DOUT,
-	N14_1610_SPIF_CS0,
-	N15_1610_SPIF_CS1,
-	T19_1610_SPIF_CS2,
-	P15_1610_SPIF_CS3,
-
-	/* OMAP-1610 Flash */
-	L3_1610_FLASH_CS2B_OE,
-	M8_1610_FLASH_CS2B_WE,
-
-	/* First MMC */
-	MMC_CMD,
-	MMC_DAT1,
-	MMC_DAT2,
-	MMC_DAT0,
-	MMC_CLK,
-	MMC_DAT3,
-
-	/* OMAP-1710 MMC CMDDIR and DATDIR0 */
-	M15_1710_MMC_CLKI,
-	P19_1710_MMC_CMDDIR,
-	P20_1710_MMC_DATDIR0,
-
-	/* OMAP-1610 USB0 alternate pin configuration */
-	W9_USB0_TXEN,
-	AA9_USB0_VP,
-	Y5_USB0_RCV,
-	R9_USB0_VM,
-	V6_USB0_TXD,
-	W5_USB0_SE0,
-	V9_USB0_SPEED,
-	V9_USB0_SUSP,
-
-	/* USB2 */
-	W9_USB2_TXEN,
-	AA9_USB2_VP,
-	Y5_USB2_RCV,
-	R9_USB2_VM,
-	V6_USB2_TXD,
-	W5_USB2_SE0,
-
-	/* 16XX UART */
-	R13_1610_UART1_TX,
-	V14_16XX_UART1_RX,
-	R14_1610_UART1_CTS,
-	AA15_1610_UART1_RTS,
-	R9_16XX_UART2_RX,
-	L14_16XX_UART3_RX,
-
-	/* I2C OMAP-1610 */
-	I2C_SCL,
-	I2C_SDA,
-
-	/* Keypad */
-	F18_1610_KBC0,
-	D20_1610_KBC1,
-	D19_1610_KBC2,
-	E18_1610_KBC3,
-	C21_1610_KBC4,
-	G18_1610_KBR0,
-	F19_1610_KBR1,
-	H14_1610_KBR2,
-	E20_1610_KBR3,
-	E19_1610_KBR4,
-	N19_1610_KBR5,
-
-	/* Power management */
-	T20_1610_LOW_PWR,
-
-	/* MCLK Settings */
-	V5_1710_MCLK_ON,
-	V5_1710_MCLK_OFF,
-	R10_1610_MCLK_ON,
-	R10_1610_MCLK_OFF,
-
-	/* CompactFlash controller */
-	P11_1610_CF_CD2,
-	R11_1610_CF_IOIS16,
-	V10_1610_CF_IREQ,
-	W10_1610_CF_RESET,
-	W11_1610_CF_CD1,
-
-	/* parallel camera */
-	J15_1610_CAM_LCLK,
-	J18_1610_CAM_D7,
-	J19_1610_CAM_D6,
-	J14_1610_CAM_D5,
-	K18_1610_CAM_D4,
-	K19_1610_CAM_D3,
-	K15_1610_CAM_D2,
-	K14_1610_CAM_D1,
-	L19_1610_CAM_D0,
-	L18_1610_CAM_VS,
-	L15_1610_CAM_HS,
-	M19_1610_CAM_RSTZ,
-	Y15_1610_CAM_OUTCLK,
-
-	/* serial camera */
-	H19_1610_CAM_EXCLK,
-	Y12_1610_CCP_CLKP,
-	W13_1610_CCP_CLKM,
-	W14_1610_CCP_DATAP,
-	Y14_1610_CCP_DATAM,
-
-};
-
 struct omap_mux_cfg {
 	struct pin_config	*pins;
 	unsigned long		size;
@@ -429,11 +136,9 @@ struct omap_mux_cfg {
 /* setup pin muxing in Linux */
 extern int omap1_mux_init(void);
 extern int omap_mux_register(struct omap_mux_cfg *);
-extern int omap_cfg_reg(unsigned long reg_cfg);
 #else
 /* boot loader does it all (no warnings from CONFIG_OMAP_MUX_WARNINGS) */
 static inline int omap1_mux_init(void) { return 0; }
-static inline int omap_cfg_reg(unsigned long reg_cfg) { return 0; }
 #endif
 
 extern int omap2_mux_init(void);
diff --git a/arch/arm/mach-omap1/soc.h b/arch/arm/mach-omap1/soc.h
index 69daf0187b1d..22931839a666 100644
--- a/arch/arm/mach-omap1/soc.h
+++ b/arch/arm/mach-omap1/soc.h
@@ -1,4 +1,6 @@
 /*
- * We can move mach/soc.h here once the drivers are fixed
+ * We can move linux/soc/ti/omap1-soc.h here once the drivers are fixed
  */
-#include <mach/soc.h>
+#include <mach/hardware.h>
+#include <mach/irqs.h>
+#include <asm/irq.h>
diff --git a/arch/arm/plat-omap/dma.c b/arch/arm/plat-omap/dma.c
index 79f43acf9acb..749d3cae15c0 100644
--- a/arch/arm/plat-omap/dma.c
+++ b/arch/arm/plat-omap/dma.c
@@ -35,7 +35,9 @@
 #include <linux/omap-dma.h>
 
 #ifdef CONFIG_ARCH_OMAP1
-#include <mach/soc.h>
+#include <mach/hardware.h>
+#include <linux/soc/ti/omap1-io.h>
+#include <linux/soc/ti/omap1-soc.h>
 #endif
 
 /*
diff --git a/include/linux/soc/ti/omap1-io.h b/include/linux/soc/ti/omap1-io.h
new file mode 100644
index 000000000000..9a60f45899d3
--- /dev/null
+++ b/include/linux/soc/ti/omap1-io.h
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_ARCH_OMAP_IO_H
+#define __ASM_ARCH_OMAP_IO_H
+
+#ifndef __ASSEMBLER__
+#include <linux/types.h>
+
+#ifdef CONFIG_ARCH_OMAP1
+/*
+ * NOTE: Please use ioremap + __raw_read/write where possible instead of these
+ */
+extern u8 omap_readb(u32 pa);
+extern u16 omap_readw(u32 pa);
+extern u32 omap_readl(u32 pa);
+extern void omap_writeb(u8 v, u32 pa);
+extern void omap_writew(u16 v, u32 pa);
+extern void omap_writel(u32 v, u32 pa);
+#elif defined(CONFIG_COMPILE_TEST)
+static inline u8 omap_readb(u32 pa)  { return 0; }
+static inline u16 omap_readw(u32 pa) { return 0; }
+static inline u32 omap_readl(u32 pa) { return 0; }
+static inline void omap_writeb(u8 v, u32 pa)   { }
+static inline void omap_writew(u16 v, u32 pa)  { }
+static inline void omap_writel(u32 v, u32 pa)  { }
+#endif
+#endif
+
+/*
+ * ----------------------------------------------------------------------------
+ * System control registers
+ * ----------------------------------------------------------------------------
+ */
+#define MOD_CONF_CTRL_0		0xfffe1080
+#define MOD_CONF_CTRL_1		0xfffe1110
+
+/*
+ * ---------------------------------------------------------------------------
+ * UPLD
+ * ---------------------------------------------------------------------------
+ */
+#define ULPD_REG_BASE		(0xfffe0800)
+#define ULPD_IT_STATUS		(ULPD_REG_BASE + 0x14)
+#define ULPD_SETUP_ANALOG_CELL_3	(ULPD_REG_BASE + 0x24)
+#define ULPD_CLOCK_CTRL		(ULPD_REG_BASE + 0x30)
+#	define DIS_USB_PVCI_CLK		(1 << 5)	/* no USB/FAC synch */
+#	define USB_MCLK_EN		(1 << 4)	/* enable W4_USB_CLKO */
+#define ULPD_SOFT_REQ		(ULPD_REG_BASE + 0x34)
+#	define SOFT_UDC_REQ		(1 << 4)
+#	define SOFT_USB_CLK_REQ		(1 << 3)
+#	define SOFT_DPLL_REQ		(1 << 0)
+#define ULPD_DPLL_CTRL		(ULPD_REG_BASE + 0x3c)
+#define ULPD_STATUS_REQ		(ULPD_REG_BASE + 0x40)
+#define ULPD_APLL_CTRL		(ULPD_REG_BASE + 0x4c)
+#define ULPD_POWER_CTRL		(ULPD_REG_BASE + 0x50)
+#define ULPD_SOFT_DISABLE_REQ_REG	(ULPD_REG_BASE + 0x68)
+#	define DIS_MMC2_DPLL_REQ	(1 << 11)
+#	define DIS_MMC1_DPLL_REQ	(1 << 10)
+#	define DIS_UART3_DPLL_REQ	(1 << 9)
+#	define DIS_UART2_DPLL_REQ	(1 << 8)
+#	define DIS_UART1_DPLL_REQ	(1 << 7)
+#	define DIS_USB_HOST_DPLL_REQ	(1 << 6)
+#define ULPD_SDW_CLK_DIV_CTRL_SEL	(ULPD_REG_BASE + 0x74)
+#define ULPD_CAM_CLK_CTRL	(ULPD_REG_BASE + 0x7c)
+
+/*
+ * ----------------------------------------------------------------------------
+ * Clocks
+ * ----------------------------------------------------------------------------
+ */
+#define CLKGEN_REG_BASE		(0xfffece00)
+#define ARM_CKCTL		(CLKGEN_REG_BASE + 0x0)
+#define ARM_IDLECT1		(CLKGEN_REG_BASE + 0x4)
+#define ARM_IDLECT2		(CLKGEN_REG_BASE + 0x8)
+#define ARM_EWUPCT		(CLKGEN_REG_BASE + 0xC)
+#define ARM_RSTCT1		(CLKGEN_REG_BASE + 0x10)
+#define ARM_RSTCT2		(CLKGEN_REG_BASE + 0x14)
+#define ARM_SYSST		(CLKGEN_REG_BASE + 0x18)
+#define ARM_IDLECT3		(CLKGEN_REG_BASE + 0x24)
+
+#define CK_RATEF		1
+#define CK_IDLEF		2
+#define CK_ENABLEF		4
+#define CK_SELECTF		8
+#define SETARM_IDLE_SHIFT
+
+/* DPLL control registers */
+#define DPLL_CTL		(0xfffecf00)
+
+/* DSP clock control. Must use __raw_readw() and __raw_writew() with these */
+#define DSP_CONFIG_REG_BASE     IOMEM(0xe1008000)
+#define DSP_CKCTL		(DSP_CONFIG_REG_BASE + 0x0)
+#define DSP_IDLECT1		(DSP_CONFIG_REG_BASE + 0x4)
+#define DSP_IDLECT2		(DSP_CONFIG_REG_BASE + 0x8)
+#define DSP_RSTCT2		(DSP_CONFIG_REG_BASE + 0x14)
+
+/*
+ * ----------------------------------------------------------------------------
+ * Pulse-Width Light
+ * ----------------------------------------------------------------------------
+ */
+#define OMAP_PWL_BASE			0xfffb5800
+#define OMAP_PWL_ENABLE			(OMAP_PWL_BASE + 0x00)
+#define OMAP_PWL_CLK_ENABLE		(OMAP_PWL_BASE + 0x04)
+
+/*
+ * ----------------------------------------------------------------------------
+ * Pin multiplexing registers
+ * ----------------------------------------------------------------------------
+ */
+#define FUNC_MUX_CTRL_0		0xfffe1000
+#define FUNC_MUX_CTRL_1		0xfffe1004
+#define FUNC_MUX_CTRL_2		0xfffe1008
+#define COMP_MODE_CTRL_0	0xfffe100c
+#define FUNC_MUX_CTRL_3		0xfffe1010
+#define FUNC_MUX_CTRL_4		0xfffe1014
+#define FUNC_MUX_CTRL_5		0xfffe1018
+#define FUNC_MUX_CTRL_6		0xfffe101C
+#define FUNC_MUX_CTRL_7		0xfffe1020
+#define FUNC_MUX_CTRL_8		0xfffe1024
+#define FUNC_MUX_CTRL_9		0xfffe1028
+#define FUNC_MUX_CTRL_A		0xfffe102C
+#define FUNC_MUX_CTRL_B		0xfffe1030
+#define FUNC_MUX_CTRL_C		0xfffe1034
+#define FUNC_MUX_CTRL_D		0xfffe1038
+#define PULL_DWN_CTRL_0		0xfffe1040
+#define PULL_DWN_CTRL_1		0xfffe1044
+#define PULL_DWN_CTRL_2		0xfffe1048
+#define PULL_DWN_CTRL_3		0xfffe104c
+#define PULL_DWN_CTRL_4		0xfffe10ac
+
+/* OMAP-1610 specific multiplexing registers */
+#define FUNC_MUX_CTRL_E		0xfffe1090
+#define FUNC_MUX_CTRL_F		0xfffe1094
+#define FUNC_MUX_CTRL_10	0xfffe1098
+#define FUNC_MUX_CTRL_11	0xfffe109c
+#define FUNC_MUX_CTRL_12	0xfffe10a0
+#define PU_PD_SEL_0		0xfffe10b4
+#define PU_PD_SEL_1		0xfffe10b8
+#define PU_PD_SEL_2		0xfffe10bc
+#define PU_PD_SEL_3		0xfffe10c0
+#define PU_PD_SEL_4		0xfffe10c4
+
+#endif
diff --git a/include/linux/soc/ti/omap1-mux.h b/include/linux/soc/ti/omap1-mux.h
new file mode 100644
index 000000000000..59c239b5569c
--- /dev/null
+++ b/include/linux/soc/ti/omap1-mux.h
@@ -0,0 +1,311 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __SOC_TI_OMAP1_MUX_H
+#define __SOC_TI_OMAP1_MUX_H
+/*
+ * This should not really be a global header, it reflects the
+ * traditional way that omap1 does pin muxing without the
+ * pinctrl subsystem.
+ */
+
+enum omap7xx_index {
+	/* OMAP 730 keyboard */
+	E2_7XX_KBR0,
+	J7_7XX_KBR1,
+	E1_7XX_KBR2,
+	F3_7XX_KBR3,
+	D2_7XX_KBR4,
+	C2_7XX_KBC0,
+	D3_7XX_KBC1,
+	E4_7XX_KBC2,
+	F4_7XX_KBC3,
+	E3_7XX_KBC4,
+
+	/* USB */
+	AA17_7XX_USB_DM,
+	W16_7XX_USB_PU_EN,
+	W17_7XX_USB_VBUSI,
+	W18_7XX_USB_DMCK_OUT,
+	W19_7XX_USB_DCRST,
+
+	/* MMC */
+	MMC_7XX_CMD,
+	MMC_7XX_CLK,
+	MMC_7XX_DAT0,
+
+	/* I2C */
+	I2C_7XX_SCL,
+	I2C_7XX_SDA,
+
+	/* SPI */
+	SPI_7XX_1,
+	SPI_7XX_2,
+	SPI_7XX_3,
+	SPI_7XX_4,
+	SPI_7XX_5,
+	SPI_7XX_6,
+
+	/* UART */
+	UART_7XX_1,
+	UART_7XX_2,
+};
+
+enum omap1xxx_index {
+	/* UART1 (BT_UART_GATING)*/
+	UART1_TX = 0,
+	UART1_RTS,
+
+	/* UART2 (COM_UART_GATING)*/
+	UART2_TX,
+	UART2_RX,
+	UART2_CTS,
+	UART2_RTS,
+
+	/* UART3 (GIGA_UART_GATING) */
+	UART3_TX,
+	UART3_RX,
+	UART3_CTS,
+	UART3_RTS,
+	UART3_CLKREQ,
+	UART3_BCLK,	/* 12MHz clock out */
+	Y15_1610_UART3_RTS,
+
+	/* PWT & PWL */
+	PWT,
+	PWL,
+
+	/* USB master generic */
+	R18_USB_VBUS,
+	R18_1510_USB_GPIO0,
+	W4_USB_PUEN,
+	W4_USB_CLKO,
+	W4_USB_HIGHZ,
+	W4_GPIO58,
+
+	/* USB1 master */
+	USB1_SUSP,
+	USB1_SEO,
+	W13_1610_USB1_SE0,
+	USB1_TXEN,
+	USB1_TXD,
+	USB1_VP,
+	USB1_VM,
+	USB1_RCV,
+	USB1_SPEED,
+	R13_1610_USB1_SPEED,
+	R13_1710_USB1_SE0,
+
+	/* USB2 master */
+	USB2_SUSP,
+	USB2_VP,
+	USB2_TXEN,
+	USB2_VM,
+	USB2_RCV,
+	USB2_SEO,
+	USB2_TXD,
+
+	/* OMAP-1510 GPIO */
+	R18_1510_GPIO0,
+	R19_1510_GPIO1,
+	M14_1510_GPIO2,
+
+	/* OMAP1610 GPIO */
+	P18_1610_GPIO3,
+	Y15_1610_GPIO17,
+
+	/* OMAP-1710 GPIO */
+	R18_1710_GPIO0,
+	V2_1710_GPIO10,
+	N21_1710_GPIO14,
+	W15_1710_GPIO40,
+
+	/* MPUIO */
+	MPUIO2,
+	N15_1610_MPUIO2,
+	MPUIO4,
+	MPUIO5,
+	T20_1610_MPUIO5,
+	W11_1610_MPUIO6,
+	V10_1610_MPUIO7,
+	W11_1610_MPUIO9,
+	V10_1610_MPUIO10,
+	W10_1610_MPUIO11,
+	E20_1610_MPUIO13,
+	U20_1610_MPUIO14,
+	E19_1610_MPUIO15,
+
+	/* MCBSP2 */
+	MCBSP2_CLKR,
+	MCBSP2_CLKX,
+	MCBSP2_DR,
+	MCBSP2_DX,
+	MCBSP2_FSR,
+	MCBSP2_FSX,
+
+	/* MCBSP3 */
+	MCBSP3_CLKX,
+
+	/* Misc ballouts */
+	BALLOUT_V8_ARMIO3,
+	N20_HDQ,
+
+	/* OMAP-1610 MMC2 */
+	W8_1610_MMC2_DAT0,
+	V8_1610_MMC2_DAT1,
+	W15_1610_MMC2_DAT2,
+	R10_1610_MMC2_DAT3,
+	Y10_1610_MMC2_CLK,
+	Y8_1610_MMC2_CMD,
+	V9_1610_MMC2_CMDDIR,
+	V5_1610_MMC2_DATDIR0,
+	W19_1610_MMC2_DATDIR1,
+	R18_1610_MMC2_CLKIN,
+
+	/* OMAP-1610 External Trace Interface */
+	M19_1610_ETM_PSTAT0,
+	L15_1610_ETM_PSTAT1,
+	L18_1610_ETM_PSTAT2,
+	L19_1610_ETM_D0,
+	J19_1610_ETM_D6,
+	J18_1610_ETM_D7,
+
+	/* OMAP16XX GPIO */
+	P20_1610_GPIO4,
+	V9_1610_GPIO7,
+	W8_1610_GPIO9,
+	N20_1610_GPIO11,
+	N19_1610_GPIO13,
+	P10_1610_GPIO22,
+	V5_1610_GPIO24,
+	AA20_1610_GPIO_41,
+	W19_1610_GPIO48,
+	M7_1610_GPIO62,
+	V14_16XX_GPIO37,
+	R9_16XX_GPIO18,
+	L14_16XX_GPIO49,
+
+	/* OMAP-1610 uWire */
+	V19_1610_UWIRE_SCLK,
+	U18_1610_UWIRE_SDI,
+	W21_1610_UWIRE_SDO,
+	N14_1610_UWIRE_CS0,
+	P15_1610_UWIRE_CS3,
+	N15_1610_UWIRE_CS1,
+
+	/* OMAP-1610 SPI */
+	U19_1610_SPIF_SCK,
+	U18_1610_SPIF_DIN,
+	P20_1610_SPIF_DIN,
+	W21_1610_SPIF_DOUT,
+	R18_1610_SPIF_DOUT,
+	N14_1610_SPIF_CS0,
+	N15_1610_SPIF_CS1,
+	T19_1610_SPIF_CS2,
+	P15_1610_SPIF_CS3,
+
+	/* OMAP-1610 Flash */
+	L3_1610_FLASH_CS2B_OE,
+	M8_1610_FLASH_CS2B_WE,
+
+	/* First MMC */
+	MMC_CMD,
+	MMC_DAT1,
+	MMC_DAT2,
+	MMC_DAT0,
+	MMC_CLK,
+	MMC_DAT3,
+
+	/* OMAP-1710 MMC CMDDIR and DATDIR0 */
+	M15_1710_MMC_CLKI,
+	P19_1710_MMC_CMDDIR,
+	P20_1710_MMC_DATDIR0,
+
+	/* OMAP-1610 USB0 alternate pin configuration */
+	W9_USB0_TXEN,
+	AA9_USB0_VP,
+	Y5_USB0_RCV,
+	R9_USB0_VM,
+	V6_USB0_TXD,
+	W5_USB0_SE0,
+	V9_USB0_SPEED,
+	V9_USB0_SUSP,
+
+	/* USB2 */
+	W9_USB2_TXEN,
+	AA9_USB2_VP,
+	Y5_USB2_RCV,
+	R9_USB2_VM,
+	V6_USB2_TXD,
+	W5_USB2_SE0,
+
+	/* 16XX UART */
+	R13_1610_UART1_TX,
+	V14_16XX_UART1_RX,
+	R14_1610_UART1_CTS,
+	AA15_1610_UART1_RTS,
+	R9_16XX_UART2_RX,
+	L14_16XX_UART3_RX,
+
+	/* I2C OMAP-1610 */
+	I2C_SCL,
+	I2C_SDA,
+
+	/* Keypad */
+	F18_1610_KBC0,
+	D20_1610_KBC1,
+	D19_1610_KBC2,
+	E18_1610_KBC3,
+	C21_1610_KBC4,
+	G18_1610_KBR0,
+	F19_1610_KBR1,
+	H14_1610_KBR2,
+	E20_1610_KBR3,
+	E19_1610_KBR4,
+	N19_1610_KBR5,
+
+	/* Power management */
+	T20_1610_LOW_PWR,
+
+	/* MCLK Settings */
+	V5_1710_MCLK_ON,
+	V5_1710_MCLK_OFF,
+	R10_1610_MCLK_ON,
+	R10_1610_MCLK_OFF,
+
+	/* CompactFlash controller */
+	P11_1610_CF_CD2,
+	R11_1610_CF_IOIS16,
+	V10_1610_CF_IREQ,
+	W10_1610_CF_RESET,
+	W11_1610_CF_CD1,
+
+	/* parallel camera */
+	J15_1610_CAM_LCLK,
+	J18_1610_CAM_D7,
+	J19_1610_CAM_D6,
+	J14_1610_CAM_D5,
+	K18_1610_CAM_D4,
+	K19_1610_CAM_D3,
+	K15_1610_CAM_D2,
+	K14_1610_CAM_D1,
+	L19_1610_CAM_D0,
+	L18_1610_CAM_VS,
+	L15_1610_CAM_HS,
+	M19_1610_CAM_RSTZ,
+	Y15_1610_CAM_OUTCLK,
+
+	/* serial camera */
+	H19_1610_CAM_EXCLK,
+	Y12_1610_CCP_CLKP,
+	W13_1610_CCP_CLKM,
+	W14_1610_CCP_DATAP,
+	Y14_1610_CCP_DATAM,
+
+};
+
+#ifdef CONFIG_OMAP_MUX
+extern int omap_cfg_reg(unsigned long reg_cfg);
+#else
+static inline int omap_cfg_reg(unsigned long reg_cfg) { return 0; }
+#endif
+
+#endif
diff --git a/arch/arm/mach-omap1/include/mach/soc.h b/include/linux/soc/ti/omap1-soc.h
similarity index 90%
rename from arch/arm/mach-omap1/include/mach/soc.h
rename to include/linux/soc/ti/omap1-soc.h
index 1897cbabfc93..81008d400bb6 100644
--- a/arch/arm/mach-omap1/include/mach/soc.h
+++ b/include/linux/soc/ti/omap1-soc.h
@@ -14,14 +14,6 @@
 #ifndef __ASM_ARCH_OMAP_CPU_H
 #define __ASM_ARCH_OMAP_CPU_H
 
-#include <asm/irq.h>
-#include <mach/hardware.h>
-#include <mach/irqs.h>
-
-#ifndef __ASSEMBLY__
-
-#include <linux/bitops.h>
-
 /*
  * Test if multicore OMAP support is needed
  */
@@ -176,20 +168,7 @@ IS_OMAP_TYPE(1710, 0x1710)
 #define cpu_is_omap1621()		0
 #define cpu_is_omap1710()		0
 
-/* These are needed to compile common code */
-#ifdef CONFIG_ARCH_OMAP1
-#define cpu_is_omap242x()		0
-#define cpu_is_omap2430()		0
-#define cpu_is_omap243x()		0
-#define cpu_is_omap24xx()		0
-#define cpu_is_omap34xx()		0
-#define cpu_is_omap44xx()		0
-#define soc_is_omap54xx()		0
-#define soc_is_dra7xx()			0
-#define soc_is_am33xx()			0
 #define cpu_class_is_omap1()		1
-#define cpu_class_is_omap2()		0
-#endif
 
 /*
  * Whether we have MULTI_OMAP1 or not, we still need to distinguish
@@ -216,5 +195,4 @@ IS_OMAP_TYPE(1710, 0x1710)
 # define cpu_is_omap1710()		is_omap1710()
 #endif
 
-#endif	/* __ASSEMBLY__ */
 #endif
-- 
2.20.0

