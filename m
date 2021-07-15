Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074143CAE75
	for <lists+linux-omap@lfdr.de>; Thu, 15 Jul 2021 23:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhGOVXV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Jul 2021 17:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhGOVXU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Jul 2021 17:23:20 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A41BC06175F
        for <linux-omap@vger.kernel.org>; Thu, 15 Jul 2021 14:20:26 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id h1so4110615plf.6
        for <linux-omap@vger.kernel.org>; Thu, 15 Jul 2021 14:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vKQ/CiV7L5I9PrDYrmQUbnr6O9MPnaylibzP/vYlqC0=;
        b=G48AgIdxLCeq1PP6uO/OhrZN9TQBCA8f7B/aaysrFfdAtaUZuw5cigaP3OA3sBRfp4
         0EyoYeuSd3J5s2Dyjqn5EgTW3wRcHhxfU6MzlQY+0HZu+w9pJMnGUrQnWx27eoxIHyjb
         jmLPybbYhSPkwxi2zPqF39bEG5m86t5ht+C3eX3SsyOl9hGM7IIjtspYUIcR4vPTPpuv
         z+QFDUZDj/YDPxJ8X7ICS4BBfYB9lMJpbxi3xPmuYtDu6JqyirHzZARnuOzgQX0gJFW6
         m3gw9KLdM58DRYUzNI20RAv2mYsb/N17tnk1WOpXMzZuORQEYReF/WsObEQQf6MSi8ND
         08Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vKQ/CiV7L5I9PrDYrmQUbnr6O9MPnaylibzP/vYlqC0=;
        b=lQEoeqtT+W4Mj3wwm9xlna33++fj6ChrT9KioeA1lmamt0CrVknbxPNXY47Ru1zkuG
         y1CIgN+r6vNUFqEZQuXopcpkbBHpHtLTyCOl/lvMJZ+0R0EyNKb6giMls6j5mdbprDwx
         JPblgujoq0NNonT6I54eWV9Y8eCnAJDXMM5ExkUr+dMLI1GpbgLW24DpEYGDDFTvI0v8
         zuV5aLv8WtEZPgdKZh520nVjg0+kiloiKlMrh3/SzOi0n20oWsES3A8qBA3aO4FgHu/F
         FC0SnHxl4ovgY+sm/YN3B65rUsLB4Bd0ZzSC1xHrn8obpfvyOwfiHRX6Xs6SVA6mkIB3
         +TgA==
X-Gm-Message-State: AOAM530BoWi8xE1Y8qFBH8FRNSQVz86Zdmwb6iVzz7p9eREhrWXK2GDw
        PWlUUUTVXDZSw9Vvd/oxIIt6UkS133ut1g==
X-Google-Smtp-Source: ABdhPJzuTlbRDB1PChfQESW3Zbc82zmJuqQaVIjlLBfGbbQe4seBbYBcbBU7bLRKQEmGP9aHVt+z0Q==
X-Received: by 2002:a17:90b:3607:: with SMTP id ml7mr11981414pjb.153.1626384025833;
        Thu, 15 Jul 2021 14:20:25 -0700 (PDT)
Received: from localhost ([2601:602:9200:1465:da9d:67ff:fec6:ee6b])
        by smtp.gmail.com with ESMTPSA id f3sm7859269pfk.206.2021.07.15.14.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 14:20:24 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     linux-omap@vger.kernel.org
Cc:     Lokesh Vutla <lokeshvutla@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>
Subject: [PATCH] ARM: dts: Add support for dra762 abz package
Date:   Thu, 15 Jul 2021 14:20:24 -0700
Message-Id: <20210715212024.35738-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Lokesh Vutla <lokeshvutla@ti.com>

dra762 abz package is pin compatible with dra742 and few peripherals
like DDR with upgraded speed. Add dt support for this SoC.

Reported-by: Praneeth Bajjuri <praneeth@ti.com>
Tested-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
[khilman: forward port from ti-linux-5.4.y]
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 arch/arm/boot/dts/am5748.dtsi    |  6 +-----
 arch/arm/boot/dts/am574x-idk.dts |  4 ----
 arch/arm/boot/dts/dra74x-p.dtsi  | 27 +++++++++++++++++++++++++++
 arch/arm/boot/dts/dra76x.dtsi    | 12 ------------
 4 files changed, 28 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm/boot/dts/dra74x-p.dtsi

diff --git a/arch/arm/boot/dts/am5748.dtsi b/arch/arm/boot/dts/am5748.dtsi
index 2cb577432766..c260aa1a85bd 100644
--- a/arch/arm/boot/dts/am5748.dtsi
+++ b/arch/arm/boot/dts/am5748.dtsi
@@ -3,7 +3,7 @@
  * Copyright (C) 2019 Texas Instruments Incorporated - https://www.ti.com/
  */
 
-#include "dra76x.dtsi"
+#include "dra74x-p.dtsi"
 #include "am57-pruss.dtsi"
 
 / {
@@ -25,10 +25,6 @@ &usb3_tm {
 	status = "disabled";
 };
 
-&usb4_tm {
-	status = "disabled";
-};
-
 &atl_tm {
 	status = "disabled";
 };
diff --git a/arch/arm/boot/dts/am574x-idk.dts b/arch/arm/boot/dts/am574x-idk.dts
index 1b8f3a28af05..dcc32f4b347f 100644
--- a/arch/arm/boot/dts/am574x-idk.dts
+++ b/arch/arm/boot/dts/am574x-idk.dts
@@ -36,10 +36,6 @@ &mmc2 {
 	pinctrl-2 = <&mmc2_pins_default>;
 };
 
-&m_can0 {
-	status = "disabled";
-};
-
 &emif1 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/dra74x-p.dtsi b/arch/arm/boot/dts/dra74x-p.dtsi
new file mode 100644
index 000000000000..006189dad7a7
--- /dev/null
+++ b/arch/arm/boot/dts/dra74x-p.dtsi
@@ -0,0 +1,27 @@
+/*
+ * Copyright (C) 2017 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include "dra74x.dtsi"
+
+/ {
+	compatible = "ti,dra762", "ti,dra7";
+
+	ocp {
+		emif1: emif@4c000000 {
+			compatible = "ti,emif-dra7xx";
+			reg = <0x4c000000 0x200>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+	};
+};
+
+/* MCAN interrupts are hard-wired to irqs 67, 68 */
+&crossbar_mpu {
+	ti,irqs-skip = <10 67 68 133 139 140>;
+};
diff --git a/arch/arm/boot/dts/dra76x.dtsi b/arch/arm/boot/dts/dra76x.dtsi
index a09e7bd77fc7..bc4ae91cba16 100644
--- a/arch/arm/boot/dts/dra76x.dtsi
+++ b/arch/arm/boot/dts/dra76x.dtsi
@@ -9,13 +9,6 @@ / {
 	compatible = "ti,dra762", "ti,dra7";
 
 	ocp {
-		emif1: emif@4c000000 {
-			compatible = "ti,emif-dra7xx";
-			reg = <0x4c000000 0x200>;
-			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
-			status = "disabled";
-		};
-
 		target-module@42c01900 {
 			compatible = "ti,sysc-dra7-mcan", "ti,sysc";
 			ranges = <0x0 0x42c00000 0x2000>;
@@ -90,11 +83,6 @@ csi2_1: port@1 {
 	};
 };
 
-/* MCAN interrupts are hard-wired to irqs 67, 68 */
-&crossbar_mpu {
-	ti,irqs-skip = <10 67 68 133 139 140>;
-};
-
 &scm_conf_clocks {
 	dpll_gmac_h14x2_ctrl_ck: dpll_gmac_h14x2_ctrl_ck@3fc {
 		#clock-cells = <0>;
-- 
2.31.1

