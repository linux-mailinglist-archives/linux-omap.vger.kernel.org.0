Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 209F25370E1
	for <lists+linux-omap@lfdr.de>; Sun, 29 May 2022 13:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbiE2L4P (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 29 May 2022 07:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbiE2L4O (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 29 May 2022 07:56:14 -0400
X-Greylist: delayed 167 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 29 May 2022 04:56:12 PDT
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 108EF4B847;
        Sun, 29 May 2022 04:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1653825188;
    s=strato-dkim-0002; d=innoroute.de;
    h=In-Reply-To:Cc:References:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=rGLI8EHEa4TLZETKl33bUuVZ8APssu2QrbjFazSIb9c=;
    b=o6J0vUFgPQ+PkigFa19dziu1HzgA1HfYlm2eOykougiBuHjYK7lTAzBTMX7CUgLBbO
    mBYSM8rba89mnPbQ2obX8TRrqlMw40REr1vcAXdmQT1WfsOEV1a1hPmAhcoXFcjaXBZF
    OrDkluOGq5e9GF3pXgRUhq4k4MheyQci3l1hJrqUZrvbK47QBpC1aI+YViPhqEZbKtfe
    2Dy8rNBGFLuHSV1oVcG2eUh2yXXKZ7/kfUrqkJXrnF9riDkU7KZnV6LubqGq0Y4BZELL
    e4o+8LzyzDg7hDmPCjJ5pz9WVU51tEiSi70krGnQ9ubklJ2MC/EKEuQ4Qli2RHRamGr+
    qSkQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWAGZ0mrc+tzeBOzIxBr1G7s8b1PjEKOzk3CqnAapHd+NkODJb4neJkaR8hVrvzXeIpZlNY69pc="
X-RZG-CLASS-ID: mo00
Received: from [192.168.1.240]
    by smtp.strato.de (RZmta 47.45.0 DYNA|AUTH)
    with ESMTPSA id y05afby4TBr6W5R
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sun, 29 May 2022 13:53:06 +0200 (CEST)
Message-ID: <25af9e3c-fea3-8128-f057-6d4b25c11ce0@innoroute.de>
Date:   Sun, 29 May 2022 13:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: [PATCH v1 1/1] add support for mws4 board
Content-Language: de-DE
From:   Marian Ulbricht <ulbricht@innoroute.de>
To:     devicetree@vger.kernel.org
References: <dcff1f1f-dfe8-a873-e07d-ff100c50822f@innoroute.de>
Cc:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
In-Reply-To: <dcff1f1f-dfe8-a873-e07d-ff100c50822f@innoroute.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Subject: [PATCH v1 1/1] add support for mws4 board

mws4 is an arm based nuclear probe hardware used from
german government to monitor nuclear activity

Signed-off-by: Ulbricht, Marian <ulbricht@innoroute.de>
---

Changes in v1:
* add dts

  arch/arm/boot/dts/omap3-mws4.dts | 297 +++++++++++++++++++++++++++++++
  1 file changed, 297 insertions(+)
  create mode 100644 arch/arm/boot/dts/omap3-mws4.dts

diff --git a/arch/arm/boot/dts/omap3-mws4.dts 
b/arch/arm/boot/dts/omap3-mws4.dts
new file mode 100644
index 000000000000..a3489d4af2cc
--- /dev/null
+++ b/arch/arm/boot/dts/omap3-mws4.dts
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Modified 2015 by Bernhard Gätzschmann, Ultratronik from Beagleboard xM
+ *
+ * Modified 2022 Marian Ulbricht ulbricht@innoroute.de
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+/dts-v1/;
+#include "omap36xx.dtsi"
+/ {
+	model = "Ultratronik BFS MWS4";
+	compatible = "ti,omap3-mmi4", "ti,omap36xx", "ti,omap3";
+	cpus {
+			cpu@0 {
+				cpu0-supply = <&vcc>;
+			};
+		};
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x10000000>; // 256 MB
+	};
+	aliases {
+		i2c0 = &i2c1;
+		i2c1 = &i2c2;
+		i2c2 = &i2c3;
+		serial0 = &uart1;
+		serial1 = &uart2;
+		serial2 = &uart3;
+		mmc1 = &mmc1;
+	};
+	netcard: AX88796BLI@ffdf0000 {
+		compatible = "ax88796_dt";
+		reg = <0xffdf0000 0x1000> ;
+
+};
+
+	watchdog_max: watchdog {
+		compatible = "linux,wdt-gpio";
+		gpios = <&gpio4 21 1>; //117
+		hw_algo = "toggle";
+		always-running;
+		hw_margin_ms = <900>;
+	};
+	hsusb1_phy: hsusb1_phy {
+		status = "disabled";
+	};
+
+	/* HS USB Host PHY on PORT 2 */
+	hsusb2_phy: hsusb2_phy {
+		status = "disabled";
+	};
+	/* fixed 19.2MHz oscillator */
+	hfclk_19m2: oscillator {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <19200000>;
+	};
+leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+		led_sm {
+			label = "led_sm";
+			gpios = <&gpio4 5 GPIO_ACTIVE_HIGH>; /* 101 */
+			default-state = "on";
+		};
+		led1 {
+			label = "led1";
+			gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>; /* 102 */
+			linux,default-trigger = "cpu";
+		};
+		led2 {
+			label = "led2";
+			gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>; /* 103 */
+			linux,default-trigger = "mmc0";
+		};
+		led3 {
+			label = "led3";
+			gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>; /* 104 */
+			linux,default-trigger = "usb-host";
+		};
+		led_usb {
+			label = "led_usb";
+			gpios = <&gpio4 14 GPIO_ACTIVE_HIGH>; /* 110 */
+			default-state = "on";
+		};
+	};
+};
+&gpmc {
+	ranges = <0 0 0x30000000 0x1000000	/* CS0 space, 16MB */
+		  255 0 0x6e000000 0x02d4>;	/* register space */
+
+	/* Chip select 0 */
+	nand@0,0 {
+		compatible = "ti,omap2-nand";
+		reg = <0 0 4		/* NAND I/O window, 4 bytes */
+		       255 0 0x02d4>;	/* GPMC register space */
+		interrupts = <20>;
+		ti,nand-ecc-opt = "bch4";
+		nand-bus-width = <16>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		gpmc,cs-on-ns = <0>;
+		gpmc,cs-rd-off-ns = <36>;
+		gpmc,cs-wr-off-ns = <36>;
+		gpmc,adv-on-ns = <6>;
+		gpmc,adv-rd-off-ns = <24>;
+		gpmc,adv-wr-off-ns = <36>;
+		gpmc,oe-on-ns = <6>;
+		gpmc,oe-off-ns = <48>;
+		gpmc,we-on-ns = <6>;
+		gpmc,we-off-ns = <30>;
+		gpmc,rd-cycle-ns = <72>;
+		gpmc,wr-cycle-ns = <72>;
+		gpmc,access-ns = <54>;
+		gpmc,wr-access-ns = <30>;
+
+		partition@0 {
+			label = "X-Loader";
+			reg = <0 0x40000>;
+		};
+		partition@40000 {
+			label = "U-Boot";
+			reg = <0x40000 0x100000>;
+		};
+		partition@100000 {
+			label = "U-Boot Env";
+			reg = <0x100000 0x120000>;
+		};
+		partition@120000 {
+			label = "dt";
+			reg = <0x120000 0x140000>;
+		};
+		partition@140000 {
+			label = "Kernel";
+			reg = <0x140000 0xB40000>;
+		};
+		partition@B40000 {
+			label = "Filesystem";
+			reg = <0xB40000 0xf4c0000>;
+		};
+	};
+};
+&usbhshost {
+	status = "disabled";
+};
+&omap3_pmx_core {
+		mmc1_pins: pinmux_mmc1_pins {
+		pinctrl-single,pins = <
+			OMAP3_CORE1_IOPAD(0x2144, PIN_INPUT_PULLUP | MUX_MODE0)	/* 
sdmmc1_clk.sdmmc1_clk */
+			OMAP3_CORE1_IOPAD(0x2146, PIN_INPUT_PULLUP | MUX_MODE0)	/* 
sdmmc1_cmd.sdmmc1_cmd */
+			OMAP3_CORE1_IOPAD(0x2148, PIN_INPUT_PULLUP | MUX_MODE0)	/* 
sdmmc1_dat0.sdmmc1_dat0 */
+			OMAP3_CORE1_IOPAD(0x214a, PIN_INPUT_PULLUP | MUX_MODE0)	/* 
sdmmc1_dat1.sdmmc1_dat1 */
+			OMAP3_CORE1_IOPAD(0x214c, PIN_INPUT_PULLUP | MUX_MODE0)	/* 
sdmmc1_dat2.sdmmc1_dat2 */
+			OMAP3_CORE1_IOPAD(0x214e, PIN_INPUT_PULLUP | MUX_MODE0)	/* 
sdmmc1_dat3.sdmmc1_dat3 */
+		>;
+	};
+	wd_pins: pinmux_wd_pins {
+		pinctrl-single,pins = <
+			OMAP3_CORE1_IOPAD(0x213e, PIN_OUTPUT | MUX_MODE4)	// 
CONTROL_PADCONF_MCBSP2_CLKX	0x013E
+		>;
+	};
+	i2c1_pins: pinmux_i2c1_pins {
+		pinctrl-single,pins = <
+			OMAP3_CORE1_IOPAD(0x21ba, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_scl */
+			OMAP3_CORE1_IOPAD(0x21bc, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_sda */
+		>;
+	};
+	hsusb0_pins: pinmux_hsusb0_pins {
+		pinctrl-single,pins = <
+			OMAP3_CORE1_IOPAD(0x21a2, PIN_INPUT_PULLDOWN | MUX_MODE0)		/* 
hsusb0_clk.hsusb0_clk */
+			OMAP3_CORE1_IOPAD(0x21a4, PIN_OUTPUT | MUX_MODE0)		/* 
hsusb0_stp.hsusb0_stp */
+			OMAP3_CORE1_IOPAD(0x21a6, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* 
hsusb0_dir.hsusb0_dir */
+			OMAP3_CORE1_IOPAD(0x21a8, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* 
hsusb0_nxt.hsusb0_nxt */
+			OMAP3_CORE1_IOPAD(0x21aa, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* 
hsusb0_data0.hsusb2_data0 */
+			OMAP3_CORE1_IOPAD(0x21ac, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* 
hsusb0_data1.hsusb0_data1 */
+			OMAP3_CORE1_IOPAD(0x21ae, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* 
hsusb0_data2.hsusb0_data2 */
+			OMAP3_CORE1_IOPAD(0x21b0, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* 
hsusb0_data7.hsusb0_data3 */
+			OMAP3_CORE1_IOPAD(0x21b2, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* 
hsusb0_data7.hsusb0_data4 */
+			OMAP3_CORE1_IOPAD(0x21b4, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* 
hsusb0_data7.hsusb0_data5 */
+			OMAP3_CORE1_IOPAD(0x21b6, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* 
hsusb0_data7.hsusb0_data6 */
+			OMAP3_CORE1_IOPAD(0x21b8, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* 
hsusb0_data7.hsusb0_data7 */
+		>;
+	};
+	led_pins: pinmux_led_pins {
+		pinctrl-single,pins = <
+			OMAP3_CORE1_IOPAD(0x211a, PIN_OUTPUT | MUX_MODE4)	/* gpio101*/
+			OMAP3_CORE1_IOPAD(0x211c, PIN_OUTPUT | MUX_MODE4)	/* gpio102*/
+			OMAP3_CORE1_IOPAD(0x211e, PIN_OUTPUT | MUX_MODE4)	/* gpio103 */
+			OMAP3_CORE1_IOPAD(0x2120, PIN_OUTPUT | MUX_MODE4)	/* gpio103 */
+		>;
+	};
+		gpio_pins: pinmux_gpio_pins {
+		pinctrl-single,pins = <
+			OMAP3_CORE1_IOPAD(0x2122, PIN_INPUT | MUX_MODE4)	/* gpio105 
spontanmeldung*/
+			OMAP3_CORE1_IOPAD(0x212c, PIN_OUTPUT | MUX_MODE4)	/* gpio110 usb2_en*/
+			OMAP3_CORE1_IOPAD(0x218C, PIN_OUTPUT | MUX_MODE4)	/* GPO0*/
+			OMAP3_CORE1_IOPAD(0x218E, PIN_OUTPUT | MUX_MODE4)	/* GPO1*/
+			OMAP3_CORE1_IOPAD(0x2190, PIN_OUTPUT | MUX_MODE4)	/* GPO2*/
+			OMAP3_CORE1_IOPAD(0x2192, PIN_OUTPUT | MUX_MODE4)	/* GPO3*/
+			OMAP3_CORE1_IOPAD(0x2194, PIN_OUTPUT | MUX_MODE4)	/* GPO4*/
+			OMAP3_CORE1_IOPAD(0x2196, PIN_OUTPUT | MUX_MODE4)	/* GPO5*/
+			OMAP3_CORE1_IOPAD(0x2198, PIN_OUTPUT | MUX_MODE4)	/* GPO6*/
+			OMAP3_CORE1_IOPAD(0x2116, PIN_INPUT | MUX_MODE4) //IN1
+			OMAP3_CORE1_IOPAD(0x2118, PIN_INPUT | MUX_MODE4) //IN2
+			OMAP3_CORE1_IOPAD(0x2124, PIN_INPUT | MUX_MODE4) //IN3
+			OMAP3_CORE1_IOPAD(0x2126, PIN_INPUT | MUX_MODE4) //IN4
+			OMAP3_CORE1_IOPAD(0x2128, PIN_INPUT | MUX_MODE4) //IN5
+			OMAP3_CORE1_IOPAD(0x25F4, PIN_OUTPUT | MUX_MODE4)	/* RES_RS232*/
+			OMAP3_CORE1_IOPAD(0x25F6, PIN_OUTPUT | MUX_MODE4)	/* HUB_RESET*/
+
+		>;
+	};
+};
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+
+	clock-frequency = <100000>;
+	twl: twl@48 {
+		reg = <0x48>;
+		interrupts = <7>; /* SYS_NIRQ cascaded to intc */
+		interrupt-parent = <&intc>;
+		clocks = <&hfclk_19m2>;
+		clock-names = "fck";
+		twl_power: power {
+			compatible = "ti,twl4030-power";
+			ti,system-power-controller;
+		};
+	};
+};
+&i2c2 {
+	clock-frequency = <100000>;
+	rtc8564: rtc8564@51 {
+		compatible = "epson,rtc8564";
+		reg = <0x51>;
+		#clock-cells = <0>;
+	};
+};
+&i2c3 {
+	clock-frequency = <100000>;
+};
+#include "twl4030.dtsi"
+#include "twl4030_omap3.dtsi"
+&mmc1 {
+	vmmc-supply = <&vmmc1>;
+	vqmmc-supply = <&vsim>;
+	bus-width = <4>;
+};
+&mmc2 {
+	status = "disabled";
+};
+
+&mmc3 {
+	status = "disabled";
+};
+&uart1 {
+	pinctrl-names = "default";
+};
+&uart2 {
+	pinctrl-names = "default";
+};
+&uart3 {
+	pinctrl-names = "default";
+};
+&usb_otg_hs {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hsusb0_pins>;
+	num-eps = <16>;
+	ram-bits = <12>;
+	interface-type = <0>;
+	usb-phy = <&usb2_phy>;
+	phys = <&usb2_phy>;
+	phy-names = "usb2-phy";
+	mode = <1>;
+	power = <500>;
+};
+
+&iva {
+	status = "disabled";
+};
+
+&sgx_module {
+	status = "disabled";
+};
+&vaux2 {
+	regulator-name = "usb_1v8";
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-always-on;
+};
-- 
2.25.1

