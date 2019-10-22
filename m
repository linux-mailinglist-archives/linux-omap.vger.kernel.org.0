Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85733DFE2A
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 09:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731016AbfJVHVt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 03:21:49 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33524 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbfJVHVt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Oct 2019 03:21:49 -0400
Received: by mail-ed1-f67.google.com with SMTP id c4so12067134edl.0;
        Tue, 22 Oct 2019 00:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9NYz1fv8DtM02nYJkdT56nIRxUUk7AMh+eJFtmqJunY=;
        b=LpVtf82IQ63LABWPDWUCM7K7fkjn4ZW3FiQehHbrglmvNXmTgPljEEZqUjGv2BEm89
         BsUDKvdz+q0G2Jjg/sPyHyV4EupFc92mVEtUyX24usgdyZUlApwpHK7vDk/GQScWy12m
         rCUmPqP8tV1RQ8hol4U/qkI0hQyytpm+7da/R6d9klgNAbubQIFlXT2ZE68xc0CsqK9w
         xClOAQhlEl6elpWQKkOsKDVFZZY2V9UKmHP/nYONbKP4ZiZQ34RUDrhN2AkDdcHG0Tvs
         O/w98fi3IYtUtxxre+duIKFIuhUkzWWWWJ32vc192St81fPsuGIzbJMdY+zspHf7p14Z
         x0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9NYz1fv8DtM02nYJkdT56nIRxUUk7AMh+eJFtmqJunY=;
        b=UIaLQUOcrzzCWahSM8EOjmdpOKBIRCXkfLXnIL13L53jIEnQrC14qZOeOURWmMsOpk
         QEkO1D/40O8HFA4tcRheh7524jNJmRCMhI2WaNThca44ymVI38DjKVaYPJiaXpQQjC0W
         Qey8jITX6IsVfwCkAmndz1Xwo48609FnQYSkNAxNHnAQtwOxT8Ph0z9GMiLQj6dQCj1s
         SsPtEc1qhBy7P2fFbfuOhxJqso1m1jj+4TsgtDQ+CMcT+YfCs4+8XjrrQC4gxBqNKsF2
         axDnVUsQKdrpQ621PhYtY3evL4Xn0wH0hWMpDo4xOevqyvdvjHILtffpzzTJJcPq8QMQ
         rvng==
X-Gm-Message-State: APjAAAWg/IRmwJ/i5brBA3lAODFOVfhryiWicEA00KNedrZOCWMJ2XfC
        VjieNHHRQf900hSvSndMoBLYzFYRCRQ=
X-Google-Smtp-Source: APXvYqxi5rwiQhtPUPiYWSQJq5XY8M8bXCWKCkTFBLt+Y8jF8aDyP/M30icb1LYb9SpHjoIsWSSDtg==
X-Received: by 2002:aa7:dc47:: with SMTP id g7mr29367166edu.153.1571728907565;
        Tue, 22 Oct 2019 00:21:47 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id t22sm676820edd.79.2019.10.22.00.21.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2019 00:21:46 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
        mark.rutland@arm.com, bcousson@baylibre.com,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH 2/3] ARM: dts: add DTS for NetCom Plus 1xx and 2xx device series
Date:   Tue, 22 Oct 2019 09:21:29 +0200
Message-Id: <20191022072130.17438-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20191022072130.17438-1-yegorslists@googlemail.com>
References: <20191022072130.17438-1-yegorslists@googlemail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Yegor Yefremov <yegorslists@googlemail.com>

This DTS file covers all one and two port NetCom Plus devices.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 arch/arm/boot/dts/Makefile                   |  1 +
 arch/arm/boot/dts/am335x-netcom-plus-2xx.dts | 95 ++++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 arch/arm/boot/dts/am335x-netcom-plus-2xx.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index a92576e17133..05dae516930c 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -754,6 +754,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-moxa-uc-8100-me-t.dtb \
 	am335x-nano.dtb \
 	am335x-netcan-plus-1xx.dtb \
+	am335x-netcom-plus-2xx.dtb \
 	am335x-pdu001.dtb \
 	am335x-pepper.dtb \
 	am335x-phycore-rdk.dtb \
diff --git a/arch/arm/boot/dts/am335x-netcom-plus-2xx.dts b/arch/arm/boot/dts/am335x-netcom-plus-2xx.dts
new file mode 100644
index 000000000000..9a6cd8ef821f
--- /dev/null
+++ b/arch/arm/boot/dts/am335x-netcom-plus-2xx.dts
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/*
+ * VScom OnRISC
+ * http://www.vscom.de
+ */
+
+/dts-v1/;
+
+#include "am335x-baltos.dtsi"
+#include "am335x-baltos-leds.dtsi"
+
+/ {
+	model = "NetCom Plus";
+};
+
+&am33xx_pinmux {
+	uart1_pins: pinmux_uart1_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_UART1_RXD, PIN_INPUT, MUX_MODE0)			/* RX */
+			AM33XX_PADCONF(AM335X_PIN_UART1_TXD, PIN_INPUT, MUX_MODE0)			/* TX */
+			AM33XX_PADCONF(AM335X_PIN_UART1_CTSN, PIN_INPUT_PULLDOWN, MUX_MODE0)		/* CTS */
+			AM33XX_PADCONF(AM335X_PIN_UART1_RTSN, PIN_OUTPUT_PULLDOWN, MUX_MODE0)		/* RTS */
+			AM33XX_PADCONF(AM335X_PIN_LCD_VSYNC, PIN_OUTPUT_PULLDOWN, MUX_MODE7)		/* DTR */
+			AM33XX_PADCONF(AM335X_PIN_LCD_HSYNC, PIN_INPUT_PULLDOWN, MUX_MODE7)		/* DSR */
+			AM33XX_PADCONF(AM335X_PIN_LCD_PCLK, PIN_INPUT_PULLDOWN, MUX_MODE7)		/* DCD */
+			AM33XX_PADCONF(AM335X_PIN_LCD_AC_BIAS_EN, PIN_INPUT_PULLDOWN, MUX_MODE7)	/* RI */
+		>;
+	};
+
+	uart2_pins: pinmux_uart2_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_SPI0_SCLK, PIN_INPUT, MUX_MODE1)		/* RX */
+			AM33XX_PADCONF(AM335X_PIN_SPI0_D0, PIN_OUTPUT, MUX_MODE1)      		/* TX */
+			AM33XX_PADCONF(AM335X_PIN_I2C0_SDA, PIN_INPUT_PULLDOWN, MUX_MODE2)	/* CTS */
+			AM33XX_PADCONF(AM335X_PIN_I2C0_SCL, PIN_OUTPUT_PULLDOWN, MUX_MODE2)	/* RTS */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD12, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* DTR */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD13, PIN_INPUT_PULLDOWN, MUX_MODE7)	/* DSR */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD14, PIN_INPUT_PULLDOWN, MUX_MODE7)	/* DCD */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD15, PIN_INPUT_PULLDOWN, MUX_MODE7)	/* RI */
+		>;
+	};
+};
+
+&usb0_phy {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+	dr_mode = "host";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	dtr-gpios = <&gpio2 22 GPIO_ACTIVE_LOW>;
+	dsr-gpios = <&gpio2 23 GPIO_ACTIVE_LOW>;
+	dcd-gpios = <&gpio2 24 GPIO_ACTIVE_LOW>;
+	rng-gpios = <&gpio2 25 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	dtr-gpios = <&gpio1 12 GPIO_ACTIVE_LOW>;
+	dsr-gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
+	dcd-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
+	rng-gpios = <&gpio1 15 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&davinci_mdio {
+	phy0: ethernet-phy@0 {
+		reg = <1>;
+	};
+};
+
+&cpsw_emac0 {
+	phy-mode = "rmii";
+	dual_emac_res_vlan = <1>;
+	phy-handle = <&phy0>;
+};
+
+&cpsw_emac1 {
+	phy-mode = "rgmii-id";
+	dual_emac_res_vlan = <2>;
+	phy-handle = <&phy1>;
+};
-- 
2.17.0

