Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A66F0DFE2C
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 09:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731072AbfJVHVv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 03:21:51 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39292 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbfJVHVv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Oct 2019 03:21:51 -0400
Received: by mail-ed1-f68.google.com with SMTP id l25so800904edt.6;
        Tue, 22 Oct 2019 00:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5n0ruhM7b3ETkmeFAIWQPkckLaALTXWulC/FrO5C88Q=;
        b=myl0rSBkYwxCrxHhqfshyGsM8KECuw/Z+94mB4t8QVg2ybBeL+qszqibPcdGextbLL
         lELTFy+Wb3CzSzZr1N7SGwBI/y9B/UL6cNxc0NajWRbC3H1g+6xtNoO8eywUM8DMLmAv
         EDGQoP1WteagBH2G1Fx227CxVS3QoiMedn7aesQ3hI6yoIV+srl7ifitwbmuuHOFRM4U
         2x9vPvWK47cYFb7osslor3IZ0H4rrw7h/LTgBB8/CcTZhjsPC0U6qxyfrxwR1mnwTCiK
         nrHHaZwy8sLffmaleY1uTPRVeBshelqEhz+EvgzqddC8eJEkcId9vywlZsdPmBYvXGLh
         CpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5n0ruhM7b3ETkmeFAIWQPkckLaALTXWulC/FrO5C88Q=;
        b=ZXmSy7ywxw2ZXQxmA/JKsIFGTIfZFuHVF9n2IbOrmlr45xIRNWZhSn795dKxo3z0Py
         s4Ufs66Ulk1I2PZBZCzgE14GdcevWfvN4Cc9ZETDgQQwneoV2BER3XHrkc1l/x6jAmOB
         tGO3GI/1n8B537T1qKt1mU7ZKPoQwug/hc488Bg8mzVHub2EuNzsnvJemSc4VCISNFQe
         7a7klKsnV1VQIawTJmHo/puQJZuHSWR11mgeoAwNr7OcFDXgRsITVE5T1kji/Q3pJ17W
         daJYHLcMrjEcn36618nDVvwJcO/LnQyoB5tARqFv8BCxwpwGI8tkEx0+omwFnHXa3m7q
         7IpQ==
X-Gm-Message-State: APjAAAWBlCh577O1UnWimR4qXJ322idOhRNchA+2U3nNPm/47TXKlol1
        1BHqkKuLamNJh8vOR37Rs1kDdVzgGbo=
X-Google-Smtp-Source: APXvYqzHTZp1KCnRlUXOjADcqKS/t06wHk77eGMFymxpt6rKmq692TXRLU9ebSwpmtvmrj/J/lBg/w==
X-Received: by 2002:a17:906:27ce:: with SMTP id k14mr8135529ejc.72.1571728909323;
        Tue, 22 Oct 2019 00:21:49 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id t22sm676820edd.79.2019.10.22.00.21.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2019 00:21:48 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
        mark.rutland@arm.com, bcousson@baylibre.com,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH 3/3] ARM: dts: add DTS for NetCom Plus 4xx and 8xx device series
Date:   Tue, 22 Oct 2019 09:21:30 +0200
Message-Id: <20191022072130.17438-3-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20191022072130.17438-1-yegorslists@googlemail.com>
References: <20191022072130.17438-1-yegorslists@googlemail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Yegor Yefremov <yegorslists@googlemail.com>

This DTS file covers all four and eight port NetCom Plus devices.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 arch/arm/boot/dts/Makefile                   |   1 +
 arch/arm/boot/dts/am335x-netcom-plus-8xx.dts | 115 +++++++++++++++++++
 2 files changed, 116 insertions(+)
 create mode 100644 arch/arm/boot/dts/am335x-netcom-plus-8xx.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 05dae516930c..5b0232c45a97 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -755,6 +755,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-nano.dtb \
 	am335x-netcan-plus-1xx.dtb \
 	am335x-netcom-plus-2xx.dtb \
+	am335x-netcom-plus-8xx.dtb \
 	am335x-pdu001.dtb \
 	am335x-pepper.dtb \
 	am335x-phycore-rdk.dtb \
diff --git a/arch/arm/boot/dts/am335x-netcom-plus-8xx.dts b/arch/arm/boot/dts/am335x-netcom-plus-8xx.dts
new file mode 100644
index 000000000000..2298563f7334
--- /dev/null
+++ b/arch/arm/boot/dts/am335x-netcom-plus-8xx.dts
@@ -0,0 +1,115 @@
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
+
+/ {
+	model = "NetCom Plus";
+};
+
+&am33xx_pinmux {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dip_switches>;
+
+	dip_switches: pinmux_dip_switches {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD12, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD13, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD14, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD15, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+	};
+
+	tca6416_pins: pinmux_tca6416_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR1, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+	};
+
+	i2c2_pins: pinmux_i2c2_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_UART1_CTSN, PIN_INPUT_PULLDOWN, MUX_MODE3)
+			AM33XX_PADCONF(AM335X_PIN_UART1_RTSN, PIN_INPUT_PULLDOWN, MUX_MODE3)
+		>;
+	};
+};
+
+&usb0_phy {
+	status = "okay";
+};
+
+&usb1_phy {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+	dr_mode = "host";
+};
+
+&usb1 {
+	status = "okay";
+	dr_mode = "host";
+};
+
+&i2c1 {
+	tca6416a: gpio@20 {
+		compatible = "ti,tca6416";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <20 IRQ_TYPE_EDGE_RISING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&tca6416_pins>;
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	tca6416b: gpio@20 {
+		compatible = "ti,tca6416";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	tca6416c: gpio@21 {
+		compatible = "ti,tca6416";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
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

