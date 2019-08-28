Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C469DA0986
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 20:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbfH1SeA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 14:34:00 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:37092 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbfH1SeA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 14:34:00 -0400
Received: by mail-io1-f68.google.com with SMTP id q12so1576008iog.4;
        Wed, 28 Aug 2019 11:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/MCZVi6gjQnZzoBjDSkBgdTOk/6xTGkg3e6v7Fw/HG0=;
        b=MX5SyXOUxD2vJG2x6hKpHKvhGuMWvvBTWHZYjsUQdx6ZY2viicTRwtxSMD47wa409Y
         JvjUa55W/633dQyDYaHCNrSZaGRJiuUBZI1QWPRsuzKDmHjhzvvdJMPP1PvLHlbLyzfb
         uTpB7933v3IBYa5I21x2OLWbVDNUaEeXtqqRddXuxYe0nJoPKa98DxVssomiX5cpmAkF
         5JGLTXeujpJLuSz1lnxVv9oLt5cq9HBSKjlptjjOvbKtPv2TSyy4rfp6PkccRZQhDyTc
         YHctd6QYUvP6r4TrPlet9Vg+cePEAlqG3oKvy2/1u/D14R3D/KvPafvJ20gfnfagcZ+X
         +gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/MCZVi6gjQnZzoBjDSkBgdTOk/6xTGkg3e6v7Fw/HG0=;
        b=hSdScAqEcWnyg8PgEiLeDJDKDMcKMUkzoj6uKwsSQ9gxlWQa+E3FPCfQNy32hiFkVo
         wM++vS5EpqCBeSr4XYNgl/NTXlfcCfrV5mPzD44pJ8r7I424IdHLjDFyY/54y+X+4CdF
         5GfrxC3xjGEn2JBg3ztgy743lbVLa+yhQjUDl9b1jekx2Eeckx6V1/vJPtKWDElR6pLv
         UJ3eUwgS+3fUNHI7RIyJW7VvddcN8uVPisL/FrR7xPkPoJE+/zES43oRk5f5iIB8U+rk
         cWUC7lD+JrcZZqlDu0i312SEZLhon3ibqkf+UabQIeuQ64mQhlbCHkRrg85dQRQFUe1n
         gAFQ==
X-Gm-Message-State: APjAAAVR6Gx3JRTYx9m22l3AGHRsCtX4dMYmrtNIcqDmmLdSAFxvCH0n
        DVIREMciwb+6Mq1+PtQH5I+pCL7dpW4=
X-Google-Smtp-Source: APXvYqzmuCBqbBBlo0qBs8s6y7oPoSyp9ckKM7QjXTCJ6WTRe6Z523OcD2B18vcA1COotQmCvdcC8g==
X-Received: by 2002:a6b:ea02:: with SMTP id m2mr5943823ioc.155.1567017238874;
        Wed, 28 Aug 2019 11:33:58 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id o3sm2494650ioo.74.2019.08.28.11.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 11:33:58 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] ARM: dts: logicpd-torpedo-baseboard: Fix missing video
Date:   Wed, 28 Aug 2019 13:33:50 -0500
Message-Id: <20190828183351.822-2-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828183351.822-1-aford173@gmail.com>
References: <20190828183351.822-1-aford173@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

A previous commit removed the panel-dpi driver, which made the
Torpedo video stop working because it relied on the dpi driver
for setting video timings.  Now that the simple-panel driver is
available in omap2plus, this patch migrates the Torpedo dev kits
to use a similar panel and remove the manual timing requirements.

Fixes: 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
index 642e809e757a..449cc7616da6 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
+++ b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
@@ -108,7 +108,6 @@
 &dss {
 	status = "ok";
 	vdds_dsi-supply = <&vpll2>;
-	vdda_video-supply = <&video_reg>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins1>;
 	port {
@@ -124,44 +123,20 @@
 		display0 = &lcd0;
 	};
 
-	video_reg: video_reg {
-		pinctrl-names = "default";
-		pinctrl-0 = <&panel_pwr_pins>;
-		compatible = "regulator-fixed";
-		regulator-name = "fixed-supply";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio5 27 GPIO_ACTIVE_HIGH>;	/* gpio155, lcd INI */
-	};
-
 	lcd0: display {
-		compatible = "panel-dpi";
+		/* This isn't the exact LCD, but the timings meet spec */
+		/* To make it work, set CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=4 */
+		compatible = "newhaven,nhd-4.3-480272ef-atxl";
 		label = "15";
-		status = "okay";
-		/* default-on; */
 		pinctrl-names = "default";
-
+		pinctrl-0 = <&panel_pwr_pins>;
+		backlight = <&bl>;
+		enable-gpios = <&gpio5 27 GPIO_ACTIVE_HIGH>;
 		port {
 			lcd_in: endpoint {
 				remote-endpoint = <&dpi_out>;
 			};
 		};
-
-		panel-timing {
-			clock-frequency = <9000000>;
-			hactive = <480>;
-			vactive = <272>;
-			hfront-porch = <3>;
-			hback-porch = <2>;
-			hsync-len = <42>;
-			vback-porch = <3>;
-			vfront-porch = <4>;
-			vsync-len = <11>;
-			hsync-active = <0>;
-			vsync-active = <0>;
-			de-active = <1>;
-			pixelclk-active = <1>;
-		};
 	};
 
 	bl: backlight {
-- 
2.17.1

