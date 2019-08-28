Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEC0A0989
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 20:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbfH1SeC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 14:34:02 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35664 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbfH1SeB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 14:34:01 -0400
Received: by mail-io1-f68.google.com with SMTP id b10so1612853ioj.2;
        Wed, 28 Aug 2019 11:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ozNw3NE1JUp9pX6ogvfav5i5ZnpDbmV+xKm3jf0X7EE=;
        b=IdtBb0rvJE9GLEHE60C0qDVcDivvz1Dix/CyDeIeh2jbe1FHOAffT0qEnxaHIw+usM
         gjjciUsJ679hhWLvdLUHPj8J2xDuuHVVL1DZqdzFCYX687nMI0ipAJHvKv9jed4n4Rf7
         f2wQ+WzWA/X6M4EG/3vUOm4MHFTymmvQjm5gWIVklDPYbCtaGLMidTfrChAdpQj5ZnmJ
         j+AW1WxIZuYOpZbJ7lxNes5xL6CHVh/RS1oUDwqG0FrHFVa3jvh7TwkN7TkdkGeEIU/m
         32IieWFw5cVG0oLUlXDFktNea/U1B/iIPD8UILrKPEWMFNWYKi/tqFU5hxc3VvBjVJWr
         EYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ozNw3NE1JUp9pX6ogvfav5i5ZnpDbmV+xKm3jf0X7EE=;
        b=asuaSnXEdzrOQHtSFj4MiDSUWB+5CSB4fIs9H50fzCTq0B9rxlz9rbXtvtREl/Yg0Y
         O0X1oMN6MW/brJtE/qBKH+L+JpOsg7bkBb6C5g1ASuhNj2MTBnNfXFuZoC2MuT6I9MKQ
         g0ZchDjWCgKlMJMCb7H8EhkFBNOux9KrA6HOJj161pXPT2gp9grERJznIQO+kG/GE5GG
         1QbMOCJ9aLGX3EPucVW8P5sFvzidhWkg7PODOaGJdEYyG67O3mZpjKRoqSKNpX//zMcr
         cWtM3sv0A3ZAR0DylI/S+F0BsjH56N5pv4gyI07HPl1ejUj/sPADIn7XElGiBzCT1etc
         d/Yw==
X-Gm-Message-State: APjAAAWb5C8z07zRrQ9ThJsFxjzyDkIILClju2dbYquABf0eAHwd01dR
        UK5nuOFV9I7etAZcNcr6i9qRgSvgnzc=
X-Google-Smtp-Source: APXvYqwoFvpIV1gSugWa+3bteD7X9nYd2/H9p8V+wAO7w9aMkOxysmMwfOPC+IGkS5Bsdt0+TlVjPQ==
X-Received: by 2002:a6b:710a:: with SMTP id q10mr1869231iog.273.1567017240350;
        Wed, 28 Aug 2019 11:34:00 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id o3sm2494650ioo.74.2019.08.28.11.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 11:33:59 -0700 (PDT)
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
Subject: [PATCH 3/3] ARM: dts: am3517-evm: Fix missing video
Date:   Wed, 28 Aug 2019 13:33:51 -0500
Message-Id: <20190828183351.822-3-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828183351.822-1-aford173@gmail.com>
References: <20190828183351.822-1-aford173@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

A previous commit removed the panel-dpi driver, which made the
video on the AM3517-evm stop working because it relied on the dpi
driver for setting video timings.  Now that the simple-panel driver
is available in omap2plus, this patch migrates the am3517-evm
to use a similar panel and remove the manual timing requirements.

Fixes: 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/am3517-evm.dts b/arch/arm/boot/dts/am3517-evm.dts
index ebfe28c2f544..a1fd3e63e86e 100644
--- a/arch/arm/boot/dts/am3517-evm.dts
+++ b/arch/arm/boot/dts/am3517-evm.dts
@@ -124,10 +124,11 @@
 	};
 
 	lcd0: display@0 {
-		compatible = "panel-dpi";
+		/* This isn't the exact LCD, but the timings meet spec */
+		/* To make it work, set CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=4 */
+		compatible = "newhaven,nhd-4.3-480272ef-atxl";
 		label = "15";
-		status = "okay";
-		pinctrl-names = "default";
+		backlight = <&bl>;
 		enable-gpios = <&gpio6 16 GPIO_ACTIVE_HIGH>;	/* gpio176, lcd INI */
 		vcc-supply = <&vdd_io_reg>;
 
@@ -136,22 +137,6 @@
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

