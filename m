Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63F0D2449B4
	for <lists+linux-omap@lfdr.de>; Fri, 14 Aug 2020 14:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727905AbgHNMYx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Aug 2020 08:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgHNMYx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 14 Aug 2020 08:24:53 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC3BC061384;
        Fri, 14 Aug 2020 05:24:52 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id r13so3825931iln.0;
        Fri, 14 Aug 2020 05:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+ElKAxCeMvixaBaV/Xg1XsAoLBeStHXgmdlK4qT1ov0=;
        b=UmuBuatkkwEwvgUfEv6/w63/3OCnNwI7xb9n+XWRFZz7KhkL482mphJyRk77LfKVV+
         bThdCpXxP/BRhA+TmwEMkQ4PSHxoHRXsEwhNaWYFbJ/q6br1R+g8cvaEKrvWLasoCpBu
         jsbF0u7He0pkqpc7zios3+iy3xUlDi0L/JLHU2blIuXRPM0uTHaQ4WezpWG3i+5DhT12
         UUkq5pz6VNusQqZdmS3AQIdAmAvp75esvbeNyesAODYo2Xk5+QJNlEZwsEXwnbs1isGc
         Qmn/7eA8Xr6W1XpOIoZ43rSqWIscKEiATMmLJpu4wdAFhls12nThTi+5Fx1R3jOZRYgO
         xUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+ElKAxCeMvixaBaV/Xg1XsAoLBeStHXgmdlK4qT1ov0=;
        b=SfQzjYP7KVLYjz4/tGyUMXgnQfEhP82/zBG7D20LcyziXqt4wJOaiPvGXZtxa82gJY
         vqe4F7aSPVOjCgGLSZQ4lWBGC/4mlt+3AXN3/McEQ2eKSeq8a57MuQqy0+NxEWz8n9xW
         8RZnVLh4TV3Ysi8uwO8PliBQ0szQUZwxQIQA/fA7K6K48mFfR+KywptJQR9c8hqwisLM
         Aq4M2yM6umRJ5TJf1Xq1RqyjXhg+zNXfBO/z+vTeNn9Um1CdM90N8gcSEjGdGGhX3CZe
         Jh5cysjpTnUsIuWyirwc7vwfn5UVzHC1efq7l7K+DhoU/Lz4vTEWC1FM4zGdWV/qBnLw
         A9IQ==
X-Gm-Message-State: AOAM533P/xgQV93f7XJxRNLgqCfIdpQNTCIvuLXwPix8uRj1sQs0na4b
        DjSm/u2QZIqhJ+wRFShSw3xAkE44Lbr5gg==
X-Google-Smtp-Source: ABdhPJyXw6rmXo0vyOBADbFcQVkJOtIX8FrppQIOUxhUfffQSdqcSTWDL4Y9sPLD6OOU6pQFk2WDXA==
X-Received: by 2002:a92:980f:: with SMTP id l15mr2341987ili.56.1597407891965;
        Fri, 14 Aug 2020 05:24:51 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:7d86:99d6:a568:98e8])
        by smtp.gmail.com with ESMTPSA id i191sm607349ild.69.2020.08.14.05.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 05:24:51 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: logicpd-som-lv-baseboard: Fix missing video
Date:   Fri, 14 Aug 2020 07:24:41 -0500
Message-Id: <20200814122441.2425966-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

A previous commit removed the panel-dpi driver, which made the
SOM-LV video stop working because it relied on the DPI driver
for setting video timings.  Now that the simple-panel driver is
available in omap2plus, this patch migrates the SOM-LV dev kits
to use a similar panel and remove the manual timing requirements.
A similar patch was already done and applied to the Torpedo family.

Fixes: 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi b/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
index 100396f6c2fe..79e9e24328b9 100644
--- a/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
+++ b/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
@@ -102,35 +102,18 @@ video_reg: video_reg {
 		regulator-max-microvolt = <3300000>;
 	};
 
-	lcd0: display@0 {
-		compatible = "panel-dpi";
-		label = "28";
-		status = "okay";
-		/* default-on; */
+	lcd0: display {
+		/* This isn't the exact LCD, but the timings meet spec */
+		compatible = "logicpd,type28";
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_enable_pin>;
-		enable-gpios = <&gpio5 27 GPIO_ACTIVE_HIGH>;	/* gpio155, lcd INI */
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
-			vfront-porch = <2>;
-			vsync-len = <11>;
-			hsync-active = <1>;
-			vsync-active = <1>;
-			de-active = <1>;
-			pixelclk-active = <0>;
-		};
 	};
 
 	bl: backlight {
-- 
2.25.1

