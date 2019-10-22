Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B59EDDFE28
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 09:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731007AbfJVHVq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 03:21:46 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33518 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbfJVHVq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Oct 2019 03:21:46 -0400
Received: by mail-ed1-f65.google.com with SMTP id c4so12066994edl.0;
        Tue, 22 Oct 2019 00:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=DjEBdqnZLq5tYkog9xC+QQ1EUHihKpCuGKvuqKVy6KU=;
        b=f5TcZ2Bu8HDzyebAoaHLnHKqUvi+BnsaRbYzBZ/zz7bsatQ7Ki49tbbRfBURZSnPtD
         wbpvMFwzY2A83pfoR8LSnpYbLjg/JSokRorGFU016nWUA7RNqTUzHFydl5MqJOsUjd6J
         UNCSDSJikOvArNpedNklhSL09hsATlVQ3KPBAXBUzo+QJm0Ttkq0CI5QZXEuMCO6l9J4
         PI6zE0TygyBBt5XprwMV0zjOcTTIA9ZcBkRS8nmztI9JD38xr23L2vTHqPriJkLJXP9D
         Ee3TJAQEoI6Rx7mrkojNvNGXcnulETQKRPbCojy4wF3833CuY83agCeoCkmN8F9OVfUa
         Yltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DjEBdqnZLq5tYkog9xC+QQ1EUHihKpCuGKvuqKVy6KU=;
        b=Z0Z6OPKZ48GV9x6Dcg59Ui2ZhlAtrYJXcPnLYVqxhr4Uxf7GRBJp8VMWX9UmwS598c
         EZbbiq+C0wAn3UiBAraS2FN+zMM0ckjgtd9D1g3po85HcinR5rhhCncEBbr6EQH0Eh5G
         Jj69TuMRFg1k7Es60chebn1AwFx3ABqyMDd5uKjhGaCKIxMMP5R/yI/PZamHsg6Cb2w0
         JEboA5bKZl949c6k5NQIYek3HdTCAZMvU+pF4QAy0Pq5Z94ta0Su8V++NWKWmoexaAXZ
         NR5UTg/QW/ytUb9BQHrDopOeQAph8E0uvDEcde96bE+HCBpdlxfjKmp5PNJudikGy1cH
         B6/g==
X-Gm-Message-State: APjAAAVvnu+BpebbONOIDhvtTdFim+2+jA2GSDKVWHUJlSyIqni+O/1O
        bErmqW+SYdll3NF409WejLk9/ZXWxSA=
X-Google-Smtp-Source: APXvYqw8oWJJqYNOL302Yig3ECxTYKnyG3Jw8WElNJzHdhTeoqEIIe0q0NviZUDmteUbF0lqsxyTdw==
X-Received: by 2002:a17:906:2cca:: with SMTP id r10mr26458617ejr.108.1571728903813;
        Tue, 22 Oct 2019 00:21:43 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id t22sm676820edd.79.2019.10.22.00.21.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2019 00:21:43 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
        mark.rutland@arm.com, bcousson@baylibre.com,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH 1/3] ARM: dts: add DTS for NetCAN Plus devices
Date:   Tue, 22 Oct 2019 09:21:28 +0200
Message-Id: <20191022072130.17438-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Yegor Yefremov <yegorslists@googlemail.com>

This DTS file covers both NetCAN Plus 110 and 120 WLAN models.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 arch/arm/boot/dts/Makefile                   |  1 +
 arch/arm/boot/dts/am335x-netcan-plus-1xx.dts | 87 ++++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 arch/arm/boot/dts/am335x-netcan-plus-1xx.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b21b3a64641a..a92576e17133 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -753,6 +753,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-moxa-uc-2101.dtb \
 	am335x-moxa-uc-8100-me-t.dtb \
 	am335x-nano.dtb \
+	am335x-netcan-plus-1xx.dtb \
 	am335x-pdu001.dtb \
 	am335x-pepper.dtb \
 	am335x-phycore-rdk.dtb \
diff --git a/arch/arm/boot/dts/am335x-netcan-plus-1xx.dts b/arch/arm/boot/dts/am335x-netcan-plus-1xx.dts
new file mode 100644
index 000000000000..1e4dbc85c120
--- /dev/null
+++ b/arch/arm/boot/dts/am335x-netcan-plus-1xx.dts
@@ -0,0 +1,87 @@
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
+	model = "NetCAN";
+
+	leds {
+		pinctrl-names = "default";
+		pinctrl-0 = <&user_leds_s0>;
+
+		compatible = "gpio-leds";
+
+		led@1 {
+			label = "can_data";
+			linux,default-trigger = "netdev";
+			gpios = <&gpio0 14 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+		led@2 {
+			label = "can_error";
+			gpios = <&gpio0 15 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+	};
+};
+
+&am33xx_pinmux {
+	user_leds_s0: user_leds_s0 {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_UART1_RXD, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* CAN Data LED */
+			AM33XX_PADCONF(AM335X_PIN_UART1_TXD, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* CAN Error LED */
+		>;
+	};
+
+	dcan1_pins: pinmux_dcan1_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_UART0_CTSN, PIN_OUTPUT, MUX_MODE2)	/* CAN TX */
+			AM33XX_PADCONF(AM335X_PIN_UART0_RTSN, PIN_INPUT, MUX_MODE2)	/* CAN RX */
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
+
+&dcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dcan1_pins>;
+
+	status = "okay";
+};
-- 
2.17.0

