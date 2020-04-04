Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE2719E70D
	for <lists+linux-omap@lfdr.de>; Sat,  4 Apr 2020 20:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgDDS2N (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 4 Apr 2020 14:28:13 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41715 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbgDDS2M (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 4 Apr 2020 14:28:12 -0400
Received: by mail-lf1-f67.google.com with SMTP id z23so8485963lfh.8
        for <linux-omap@vger.kernel.org>; Sat, 04 Apr 2020 11:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=tHsn7tIO9Svt9DZhW/8Hyo1IGVPh+Qof3WeSqdHRn7U=;
        b=gjno40peVrzo/rqUnEk2pDqZfaFxSB34CE+dB7Zn65nNKqLAr/yQN6myCR09rx4kuv
         u6oDCw+OgrTHf0o8gPNj6boAdKNV0ebqKsBOYW+yTMJ+5e/+yXgUxJHL+C8UxqDQXY/c
         RxY4xWGp0fVCpUhzpw9rlwhKjCSxQY+t0A5Zrx4onBNEYsoS8pkWkMyAIMuUdOoI0Nou
         C4iSg0KbxJ3dqfnp6bncxQDyTTvIfiz60nBq2p15XIK2NnWdQSdkCnLxlco/kzHsQUtx
         1o5tlyjVzhVtgv6pPZGBZB1lgfqkpc6kStOM5Gn+58aJ1mP1cHa1iXCcC3iIc2WXF1DZ
         ak7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=tHsn7tIO9Svt9DZhW/8Hyo1IGVPh+Qof3WeSqdHRn7U=;
        b=Cny9BFkuEFTIL5HKAmb3DiP6aYszbXc5eYOwc0NDeN01XSOnFZGU8An5eGtvvbqhR7
         neBmXMLpkQ0OkU8+cW6zBNOOTB6rXYe7vxvvNCUFXWKXxbzswMz7jXXDzyDSXVobOEhW
         HhFsKe8icI7PcewbShfgd75xyahm+/c+v6cbP9D6PiMPzPSDtM+Q5MqUAfN8fdWYRu2e
         4xhvDPR/RsvAA3dcow+zISqoDKzgjC31oNowdebjf7pbLAlZxBUUlkVYVJhwY9NvRWq5
         hpvQuihr+m6fh9dr7b5GyHlFMefnMWuQypRJgLCnDO+TpUM7U/JNV/0rhkojuPQCJ5Cv
         LBCA==
X-Gm-Message-State: AGi0PuaIfENaHh/XmG3sbxzsKKCnXQAOeb1gTGpKrgIYKvsgNPOt1mLj
        kf38iNysqrNc1wzLiuv+drlVB/ff78pj2Bfpw6c=
X-Google-Smtp-Source: APiQypL587vEnjs+GjA0hbwmoltk+HYBmyubT08N06+9gWlzuntb57eebrkovowJq37G+OH4SF1paA==
X-Received: by 2002:a05:6512:54e:: with SMTP id h14mr8753828lfl.56.1586024887832;
        Sat, 04 Apr 2020 11:28:07 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id f23sm7303782lja.60.2020.04.04.11.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 11:28:07 -0700 (PDT)
Date:   Sat, 4 Apr 2020 20:28:45 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     linux-omap@vger.kernel.org
Cc:     Jason Kridner <jkridner@gmail.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, Jason Kridner <jdk@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Andreas Dannenberg <dannenberg@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Caleb Robey <c-robey@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        "Andrew F . Davis" <afd@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Tom Rini <trini@konsulko.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] ARM: dts: am5729: beaglebone-ai: adding device tree
Message-ID: <20200404182845.GA27650@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


From: Jason Kridner <jdk@ti.com>

BeagleBoard.org BeagleBone AI is an open source hardware single
board computer based on the Texas Instruments AM5729 SoC featuring
dual-core 1.5GHz Arm Cortex-A15 processor, dual-core C66 digital
signal processor (DSP), quad-core embedded vision engine (EVE),
Arm Cortex-M4 processors, dual programmable realtime unit
industrial control subsystems and more. The board features 1GB
DDR3L, USB3.0 Type-C, USB HS Type-A, microHDMI, 16GB eMMC flash,
1G Ethernet, 802.11ac 2/5GHz, Bluetooth, and BeagleBone expansion
headers.

For more information, refer to:
https://beaglebone.ai

This patch introduces the BeagleBone AI device tree.

Note that the device use the "ti,tpd12s016" component which is
software compatible with "ti,tpd12s015". Thus we only use the
latter driver.

Signed-off-by: Jason Kridner <jdk@ti.com>
Signed-off-by: Caleb Robey <c-robey@ti.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
Cc: Robert Nelson <robertcnelson@gmail.com>
---
V3 Changes:
  - remove changes for dra7.dtsi as they are not needed after commit
    ecdeca6d961c6 by Suman for PRU-ICSS interconnect target-module nodes
  - change compatible to "beagle,am5729-beagleboneai" which matches
    entry for BeagleBoard.org in patch posted for vendor-prefixes.yaml

V2 Changes:
  - dra7.dtsi was reintroduced and components that are only
    not present in upstream linux dts were removed.
---
 arch/arm/boot/dts/Makefile                |   1 +
 arch/arm/boot/dts/am5729-beagleboneai.dts | 731 ++++++++++++++++++++++
 2 files changed, 732 insertions(+)
 create mode 100644 arch/arm/boot/dts/am5729-beagleboneai.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index e8dd99201397..d86ea9ae0190 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -832,6 +832,7 @@ dtb-$(CONFIG_SOC_DRA7XX) += \
 	am57xx-beagle-x15.dtb \
 	am57xx-beagle-x15-revb1.dtb \
 	am57xx-beagle-x15-revc.dtb \
+	am5729-beagleboneai.dtb \
 	am57xx-cl-som-am57x.dtb \
 	am57xx-sbc-am57x.dtb \
 	am572x-idk.dtb \
diff --git a/arch/arm/boot/dts/am5729-beagleboneai.dts b/arch/arm/boot/dts/am5729-beagleboneai.dts
new file mode 100644
index 000000000000..8dda7dd43391
--- /dev/null
+++ b/arch/arm/boot/dts/am5729-beagleboneai.dts
@@ -0,0 +1,731 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2014-2019 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+
+#include "dra74x.dtsi"
+#include "am57xx-commercial-grade.dtsi"
+#include "dra74x-mmc-iodelay.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/dra.h>
+
+/ {
+	model = "BeagleBoard.org BeagleBone AI";
+	compatible = "beagle,am5729-beagleboneai", "ti,am5728",
+		     "ti,dra742", "ti,dra74", "ti,dra7";
+
+	aliases {
+		rtc0 = &tps659038_rtc;
+		rtc1 = &rtc;
+		display0 = &hdmi_conn;
+	};
+
+	chosen {
+		stdout-path = &uart1;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ipu2_memory_region: ipu2-memory@95800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x95800000 0x0 0x3800000>;
+			reusable;
+			status = "okay";
+		};
+
+		dsp1_memory_region: dsp1-memory@99000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x99000000 0x0 0x4000000>;
+			reusable;
+			status = "okay";
+		};
+
+		ipu1_memory_region: ipu1-memory@9d000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x9d000000 0x0 0x2000000>;
+			reusable;
+			status = "okay";
+		};
+
+		dsp2_memory_region: dsp2-memory@9f000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x9f000000 0x0 0x800000>;
+			reusable;
+			status = "okay";
+		};
+
+	};
+
+	vdd_adc: gpioregulator-vdd_adc {
+		compatible = "regulator-gpio";
+		regulator-name = "vdd_adc";
+		vin-supply = <&vdd_5v>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
+		states = <1800000 0
+			3300000 1>;
+	};
+
+	vdd_5v: fixedregulator-vdd_5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vtt_fixed: fixedregulator-vtt {
+		/* TPS51200 */
+		compatible = "regulator-fixed";
+		regulator-name = "vtt_fixed";
+		vin-supply = <&vdd_ddr>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led0 {
+			label = "beaglebone:green:usr0";
+			gpios = <&gpio3 17 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "off";
+		};
+
+		led1 {
+			label = "beaglebone:green:usr1";
+			gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "mmc0";
+			default-state = "off";
+		};
+
+		led2 {
+			label = "beaglebone:green:usr2";
+			gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "cpu";
+			default-state = "off";
+		};
+
+		led3 {
+			label = "beaglebone:green:usr3";
+			gpios = <&gpio3 14 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "mmc1";
+			default-state = "off";
+		};
+
+		led4 {
+			label = "beaglebone:green:usr4";
+			gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "netdev";
+			default-state = "off";
+		};
+	};
+
+	hdmi_conn: connector@0 {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_encoder_out>;
+			};
+		};
+	};
+
+	hdmi_enc: encoder@0 {
+		/* "ti,tpd12s016" software compatible with "ti,tpd12s015"
+		 *  no need for individual driver
+		 */
+		compatible = "ti,tpd12s015";
+		gpios = <0>,
+			<0>,
+			<&gpio7 12 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <0x1>;
+			#size-cells = <0x0>;
+
+			port@0 {
+				reg = <0x0>;
+
+				hdmi_encoder_in: endpoint@0 {
+					remote-endpoint = <&hdmi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <0x1>;
+
+				hdmi_encoder_out: endpoint@0 {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+
+	emmc_pwrseq: emmc_pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio5 7 GPIO_ACTIVE_LOW>;
+	};
+
+	brcmf_pwrseq: brcmf_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio3 22 GPIO_ACTIVE_LOW>,	/* BT-REG-ON */
+				<&gpio3 18 GPIO_ACTIVE_LOW>;	/* WL-REG-ON */
+	};
+
+	extcon_usb1: extcon_usb1 {
+		compatible = "linux,extcon-usb-gpio";
+		ti,enable-id-detection;
+		id-gpio = <&gpio3 13 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	tps659038: tps659038@58 {
+		compatible = "ti,tps659038";
+		reg = <0x58>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+
+		#interrupt-cells = <2>;
+		interrupt-controller;
+
+		ti,system-power-controller;
+		ti,palmas-override-powerhold;
+
+		tps659038_pmic {
+			compatible = "ti,tps659038-pmic";
+
+			smps12-in-supply = <&vdd_5v>;
+			smps3-in-supply = <&vdd_5v>;
+			smps45-in-supply = <&vdd_5v>;
+			smps6-in-supply = <&vdd_5v>;
+			smps7-in-supply = <&vdd_5v>;
+			mps3-in-supply = <&vdd_5v>;
+			smps8-in-supply = <&vdd_5v>;
+			smps9-in-supply = <&vdd_5v>;
+			ldo1-in-supply = <&vdd_5v>;
+			ldo2-in-supply = <&vdd_5v>;
+			ldo3-in-supply = <&vdd_5v>;
+			ldo4-in-supply = <&vdd_5v>;
+			ldo9-in-supply = <&vdd_5v>;
+			ldoln-in-supply = <&vdd_5v>;
+			ldousb-in-supply = <&vdd_5v>;
+			ldortc-in-supply = <&vdd_5v>;
+
+			regulators {
+				vdd_mpu: smps12 {
+					/* VDD_MPU */
+					regulator-name = "smps12";
+					regulator-min-microvolt = <850000>;
+					regulator-max-microvolt = <1250000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_ddr: smps3 {
+					/* VDD_DDR EMIF1 EMIF2 */
+					regulator-name = "smps3";
+					regulator-min-microvolt = <1350000>;
+					regulator-max-microvolt = <1350000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_dspeve: smps45 {
+					/* VDD_DSPEVE on AM572 */
+					regulator-name = "smps45";
+					regulator-min-microvolt = < 850000>;
+					regulator-max-microvolt = <1250000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_gpu: smps6 {
+					/* VDD_GPU */
+					regulator-name = "smps6";
+					regulator-min-microvolt = < 850000>;
+					regulator-max-microvolt = <1250000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_core: smps7 {
+					/* VDD_CORE */
+					regulator-name = "smps7";
+					regulator-min-microvolt = < 850000>;	/*** 1.15V */
+					regulator-max-microvolt = <1150000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_iva: smps8 {
+					/* VDD_IVAHD */				/*** 1.06V */
+					regulator-name = "smps8";
+				};
+
+				vdd_3v3: smps9 {
+					/* VDD_3V3 */
+					regulator-name = "smps9";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_sd: ldo1 {
+					/* VDDSHV8 - VSDMMC  */
+					regulator-name = "ldo1";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-boot-on;
+					regulator-always-on;
+				};
+
+				vdd_1v8: ldo2 {
+					/* VDDSH18V */
+					regulator-name = "ldo2";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_1v8_phy_ldo3: ldo3 {
+					/* R1.3a 572x V1_8PHY_LDO3: USB, SATA */
+					regulator-name = "ldo3";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_1v8_phy_ldo4: ldo4 {
+					/* R1.3a 572x V1_8PHY_LDO4: PCIE, HDMI*/
+					regulator-name = "ldo4";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				/* LDO5-8 unused */
+
+				vdd_rtc: ldo9 {
+					/* VDD_RTC  */
+					regulator-name = "ldo9";
+					regulator-min-microvolt = < 840000>;
+					regulator-max-microvolt = <1160000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_1v8_pll: ldoln {
+					/* VDDA_1V8_PLL */
+					regulator-name = "ldoln";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				ldousb_reg: ldousb {
+					/* VDDA_3V_USB: VDDA_USBHS33 */
+					regulator-name = "ldousb";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				ldortc_reg: ldortc {
+					/* VDDA_RTC  */
+					regulator-name = "ldortc";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				regen1: regen1 {
+					/* VDD_3V3_ON */
+					regulator-name = "regen1";
+					regulator-boot-on;
+					regulator-always-on;
+				};
+
+				regen2: regen2 {
+					/* Needed for PMIC internal resource */
+					regulator-name = "regen2";
+					regulator-boot-on;
+					regulator-always-on;
+				};
+			};
+		};
+
+		tps659038_rtc: tps659038_rtc {
+			compatible = "ti,palmas-rtc";
+			interrupt-parent = <&tps659038>;
+			interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+			wakeup-source;
+		};
+
+		tps659038_pwr_button: tps659038_pwr_button {
+			compatible = "ti,palmas-pwrbutton";
+			interrupt-parent = <&tps659038>;
+			interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+			wakeup-source;
+			ti,palmas-long-press-seconds = <12>;
+		};
+
+		tps659038_gpio: tps659038_gpio {
+			compatible = "ti,palmas-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+	};
+
+	/* STMPE811 touch screen controller */
+	stmpe811@41 {
+		compatible = "st,stmpe811";
+		reg = <0x41>;
+		interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio2>;
+		interrupt-controller;
+		id = <0>;
+		blocks = <0x5>;
+		irq-trigger = <0x1>;
+		st,mod-12b = <1>; /* 12-bit ADC */
+		st,ref-sel = <0>; /* internal ADC reference */
+		st,adc-freq = <1>; /* 3.25 MHz ADC clock speed */
+		st,sample-time = <4>; /* ADC converstion time: 80 clocks */
+
+		stmpe_adc {
+			compatible = "st,stmpe-adc";
+			st,norequest-mask = <0x00>; /* mask any channels to be used by touchscreen */
+			adc0: iio-device@0 {
+				#io-channel-cells = <1>;
+				iio-channels = <&adc0 4>, <&adc0 1>, <&adc0 2>, <&adc0 3>, <&adc0 4>, <&adc0 5>, <&adc0 6>;
+				iio-channel-names = "AIN0_P9_39", "AIN1_P9_40", "AIN2_P9_37", "AIN3_P9_38",
+					"AIN4_P9_33", "AIN5_P9_36", "AIN6_P9_35";
+			};
+		};
+
+		stmpe_touchscreen {
+			status = "disabled";
+			compatible = "st,stmpe-ts";
+			/* 8 sample average control */
+			st,ave-ctrl = <3>;
+			/* 7 length fractional part in z */
+			st,fraction-z = <7>;
+			/*
+			 * 50 mA typical 80 mA max touchscreen drivers
+			 * current limit value
+			 */
+			st,i-drive = <1>;
+			/* 1 ms panel driver settling time */
+			st,settling = <3>;
+			/* 5 ms touch detect interrupt delay */
+			st,touch-det-delay = <5>;
+		};
+
+		stmpe_gpio {
+			compatible = "st,stmpe-gpio";
+		};
+
+		stmpe_pwm {
+			compatible = "st,stmpe-pwm";
+			#pwm-cells = <2>;
+		};
+	};
+};
+
+&mcspi3 {
+	status = "okay";
+	ti,pindir-d0-out-d1-in;
+
+	sn65hvs882: sn65hvs882@0 {
+		compatible = "pisosr-gpio";
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		reg = <0>;
+		spi-max-frequency = <1000000>;
+		spi-cpol;
+	};
+};
+
+&cpu0 {
+	vdd-supply = <&vdd_mpu>;
+	voltage-tolerance = <1>;
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&davinci_mdio {
+	reset-gpios = <&gpio2 23 GPIO_ACTIVE_LOW>;
+	reset-delay-us = <2>;
+
+	phy0: ethernet-phy@1 {
+		reg = <4>;
+		eee-broken-100tx;
+		eee-broken-1000t;
+	};
+};
+
+&mac {
+	slaves = <1>;
+	status = "okay";
+};
+
+&cpsw_emac0 {
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii";
+};
+
+&ocp {
+	pruss1_shmem: pruss_shmem@4b200000 {
+		status = "okay";
+		compatible = "ti,pruss-shmem";
+		reg = <0x4b200000 0x020000>;
+	};
+
+	pruss2_shmem: pruss_shmem@4b280000 {
+		status = "okay";
+		compatible = "ti,pruss-shmem";
+		reg = <0x4b280000 0x020000>;
+	};
+};
+
+&mmc1 {
+	status = "okay";
+	vmmc-supply = <&vdd_3v3>;
+	vqmmc-supply = <&vdd_sd>;
+	bus-width = <4>;
+	cd-gpios = <&gpio6 27 GPIO_ACTIVE_LOW>; /* gpio 219 */
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins_default>;
+};
+
+&mmc2 {
+	status = "okay";
+	vmmc-supply = <&vdd_1v8>;
+	vqmmc-supply = <&vdd_1v8>;
+	bus-width = <8>;
+	ti,non-removable;
+	non-removable;
+	mmc-pwrseq = <&emmc_pwrseq>;
+
+	ti,needs-special-reset;
+	dmas = <&sdma_xbar 47>, <&sdma_xbar 48>;
+	dma-names = "tx", "rx";
+
+};
+
+&mmc4 {
+	/* DS: Default speed (DS) up to 25 MHz, including 1- and 4-bit modes (3.3 V signaling). */
+	/* HS: High speed up to 50 MHz (3.3 V signaling). */
+	/* SDR12: SDR up to 25 MHz (1.8 V signaling). */
+	/* SDR25: SDR up to 50 MHz (1.8 V signaling). */
+	/* SDR50: SDR up to 100 MHz (1.8 V signaling). */
+	/* SDR104: SDR up to 208 MHz (1.8 V signaling) */
+	/* DDR50: DDR up to 50 MHz (1.8 V signaling). */
+	status = "okay";
+
+	ti,needs-special-reset;
+	vmmc-supply = <&vdd_3v3>;
+	cap-power-off-card;
+	keep-power-in-suspend;
+	bus-width = <4>;
+	ti,non-removable;
+	non-removable;
+	no-1-8-v;
+	max-frequency = <24000000>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+	mmc-pwrseq = <&brcmf_pwrseq>;
+
+	brcmf: wifi@1 {
+		status = "okay";
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+
+		brcm,sd-head-align = <4>;
+		brcm,sd_head_align = <4>;
+		brcm,sd_sgentry_align = <512>;
+
+		interrupt-parent = <&gpio3>;
+		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "host-wake";
+	};
+};
+
+&usb2_phy1 {
+	phy-supply = <&ldousb_reg>;
+};
+
+&usb2_phy2 {
+	phy-supply = <&ldousb_reg>;
+};
+
+&usb1 {
+	status = "okay";
+	dr_mode = "otg";
+};
+
+&omap_dwc3_1 {
+	extcon = <&extcon_usb1>;
+};
+
+&usb2 {
+	status = "okay";
+	dr_mode = "host";
+};
+
+&dss {
+	status = "okay";
+	vdda_video-supply = <&vdd_1v8_pll>;
+};
+
+&hdmi {
+	status = "okay";
+	vdda-supply = <&vdd_1v8_phy_ldo4>;
+
+	port {
+		hdmi_out: endpoint {
+			remote-endpoint = <&hdmi_encoder_in>;
+		};
+	};
+};
+
+&bandgap {
+	status = "okay";
+};
+
+&mailbox1 {
+	status = "okay";
+};
+
+&mailbox2 {
+	status = "okay";
+};
+
+&mailbox3 {
+	status = "okay";
+};
+
+&mailbox4 {
+	status = "okay";
+};
+
+&mailbox5 {
+	status = "okay";
+};
+
+&mailbox6 {
+	status = "okay";
+};
+
+&mailbox7 {
+	status = "okay";
+};
+
+&mailbox8 {
+	status = "okay";
+};
+
+&mailbox9 {
+	status = "okay";
+};
+
+&mailbox10 {
+	status = "okay";
+};
+
+&mailbox11 {
+	status = "okay";
+};
+
+&mailbox12 {
+	status = "okay";
+};
+
+&mailbox13 {
+	status = "okay";
+};
+
+&cpu_alert0 {
+	temperature = <55000>; /* milliCelsius */
+};
+
+&cpu_crit {
+	temperature = <85000>; /* milliCelsius */
+};
+
+&gpu_crit {
+	temperature = <85000>; /* milliCelsius */
+};
+
+&core_crit {
+	temperature = <85000>; /* milliCelsius */
+};
+
+&dspeve_crit {
+	temperature = <85000>; /* milliCelsius */
+};
+
+&iva_crit {
+	temperature = <85000>; /* milliCelsius */
+};
+
+&sata {
+	status = "disabled";
+};
+
+&sata_phy {
+	status = "disabled";
+};
+
+/* bluetooth */
+&uart6 {
+	status = "okay";
+};
+
+/* cape header stuff */
+&i2c4 {
+	status = "okay";
+	clock-frequency = <100000>;
+};
+
+&cpu0_opp_table {
+	opp_slow-500000000 {
+		opp-shared;
+	};
+};
-- 
2.20.1

