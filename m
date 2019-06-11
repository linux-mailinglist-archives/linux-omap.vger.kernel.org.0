Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBD43CE40
	for <lists+linux-omap@lfdr.de>; Tue, 11 Jun 2019 16:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388194AbfFKONy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Jun 2019 10:13:54 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44224 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388168AbfFKONy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Jun 2019 10:13:54 -0400
Received: by mail-ed1-f68.google.com with SMTP id k8so20292076edr.11;
        Tue, 11 Jun 2019 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=bcSC//GEnJPbvbaMDabVr9qAdxrn6I1NQr+LLKNMNM0=;
        b=hxU9jsUB6Fr6NEbvbJ2gNgMGv7Bd8qYcu2TP7cnPCe2Kfzj/kgY+mHxb7JWB8Psgwy
         m/C23PwGzFWEpJWqM0tL61as38rurN9m6VMVQiHoXh1kkCaEpjMR6eug+MNjDF80g9fG
         zDsC3l0OcbVqgDSkrjv9RegKbON3k4iHoEeH/4KJekZ09BThnDJR48Slpm7hZLG+lJw1
         d85KiP9DYgDHRzx3quVtOF8F+Or/HqPQjjCpRb4lttR8QI0s/W1kYfFnKUcoKHVk3N8z
         jchVmB47g8UyFqm4g7Yrw5/TUW7oK/AX7FxVzHFa9BJlJAz/9PDmAhz3sKY0xhL6N0/d
         qihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bcSC//GEnJPbvbaMDabVr9qAdxrn6I1NQr+LLKNMNM0=;
        b=sbterHB7bNUDg/JeWqRGid6jIcfzPV062daQqnLYsD3pc+kzaTJADuaeTVhwJK0Qky
         U9KIL5tGgwOOkWV4KvcRLHvEJPCWeLQn4Tx5ZVndWU5R8f1k9fdmdM0Vm6IPINpQ9lsC
         69PuNJOC1PLG63ZM8QfkCBmwduHxfa52x/e9pDHlpwsu5tEMUbEo432KFvSD7zN4KfkC
         y5rp9iDGWxwDCnehRMVG+3eYtnrkW5pGSy8RTQ2ZJ80UYLYmdyedGSv4UqOPnU2wgrV4
         MLBBpqN/dvLv05KHmAqcCwH4J3DxP13A1DN0y13GJWCYuFIU/nQuvQa3qTEQUlEKGw9J
         abjQ==
X-Gm-Message-State: APjAAAVnqO5DDyzlTVG6wLdsBYkHtkGZIV5b6NX9s6AJNgz1BK6gwt4J
        tjS/gckZf7ukvcSbGrd0vFaQ6M5g
X-Google-Smtp-Source: APXvYqxiG2ZDCZGk35ZIL6RpeSiUWkR8y2v5sXP9L4bEHCsGGq+JuGAxIcJjZLQqpPhZcQSjemwNQg==
X-Received: by 2002:a17:906:b315:: with SMTP id n21mr17551256ejz.312.1560262432230;
        Tue, 11 Jun 2019 07:13:52 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id l2sm1579473edn.59.2019.06.11.07.13.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 07:13:51 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com, bcousson@baylibre.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH] ARM: dts: am335x-baltos: add support for MMC1 CD pin
Date:   Tue, 11 Jun 2019 16:13:38 +0200
Message-Id: <20190611141338.14787-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Yegor Yefremov <yegorslists@googlemail.com>

Baltos 5221/3220 devices provide CD signal on GPIO2_18.
Baltos 2110 device provides CD signal on GPIO1_15.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 arch/arm/boot/dts/am335x-baltos-ir2110.dts | 12 ++++++++++++
 arch/arm/boot/dts/am335x-baltos-ir3220.dts | 12 ++++++++++++
 arch/arm/boot/dts/am335x-baltos-ir5221.dts | 11 +++++++++++
 3 files changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-baltos-ir2110.dts b/arch/arm/boot/dts/am335x-baltos-ir2110.dts
index 2f650a736b44..984a5cb16c2c 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir2110.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir2110.dts
@@ -33,6 +33,12 @@
 			AM33XX_PADCONF(AM335X_PIN_LCD_AC_BIAS_EN, PIN_INPUT_PULLDOWN, MUX_MODE7)      /* lcd_ac_bias_en.gpio2[25] RI */
 		>;
 	};
+
+	mmc1_pins: pinmux_mmc1_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD15, PIN_INPUT, MUX_MODE7)     /* MMC1 CD */
+		>;
+	};
 };
 
 &uart1 {
@@ -72,3 +78,9 @@
 	dual_emac_res_vlan = <2>;
 	phy-handle = <&phy1>;
 };
+
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	cd-gpios = <&gpio1 15 GPIO_ACTIVE_LOW>;
+};
diff --git a/arch/arm/boot/dts/am335x-baltos-ir3220.dts b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
index 1ba66d5e21e8..37e61bfaaf44 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir3220.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
@@ -54,6 +54,12 @@
 			AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKR, PIN_INPUT_PULLUP, MUX_MODE7)      /* mcasp0_aclkr.gpio3[18], INPUT_PULLDOWN | MODE7 */
 		>;
 	};
+
+	mmc1_pins: pinmux_mmc1_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD3, PIN_INPUT, MUX_MODE7)     /* MMC1 CD */
+		>;
+	};
 };
 
 &uart1 {
@@ -114,3 +120,9 @@
 	dual_emac_res_vlan = <2>;
 	phy-handle = <&phy1>;
 };
+
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	cd-gpios = <&gpio2 18 GPIO_ACTIVE_LOW>;
+};
diff --git a/arch/arm/boot/dts/am335x-baltos-ir5221.dts b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
index eed65fc0e8e6..59580e683e79 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir5221.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
@@ -63,6 +63,11 @@
 		>;
 	};
 
+	mmc1_pins: pinmux_mmc1_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD3, PIN_INPUT, MUX_MODE7)     /* MMC1 CD */
+		>;
+	};
 };
 
 &uart1 {
@@ -139,3 +144,9 @@
 
 	status = "okay";
 };
+
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	cd-gpios = <&gpio2 18 GPIO_ACTIVE_LOW>;
+};
-- 
2.17.0

