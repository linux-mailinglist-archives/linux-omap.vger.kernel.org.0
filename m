Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5B9CB321
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2019 03:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730923AbfJDBqH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Oct 2019 21:46:07 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46647 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729891AbfJDBqG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Oct 2019 21:46:06 -0400
Received: by mail-pl1-f194.google.com with SMTP id q24so2348948plr.13;
        Thu, 03 Oct 2019 18:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F2Ug4BOLGPrMjjEj52g7g4pWiptas8bJOxWiWz/fDVU=;
        b=PbWTIUYJu/Xb4h87WBSmtho2pGiy7vMg+m3KA0/4TuBxNM68QPvXEM7REe7FEgDyOB
         C/MkrPLVUfrCJT5k3VvlPCCF9Rb4MNn+GRhaiQLEp13xhVdtj/p8UWW0EmefL/sgP9yH
         NcvrfT4cWSbm+IThZXmSPJChYqX7fpuvK/7CDa/JWshZTJ2QZsZClMaouA9xBK3DaW7F
         ouBt54Z44CYdW3PEBMF56LIGVeha5OEUuTXsiwsU13kR3QNqsHhk7Whec9/N5H8LZ40C
         PXbacFyfqvGoSKfo7BHq5T9lJTBeLuIy53+VpVDJdox7FuhP5fI2UwZSlbnztdxVUTL1
         HDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F2Ug4BOLGPrMjjEj52g7g4pWiptas8bJOxWiWz/fDVU=;
        b=me/5r4v7114Bf/4khV7RPUiktiSTLcbqjyZ/dmmlmSM+MT+OhIqbPtGNhkyTFjKR2I
         R19fjID5tVSXcmYGMTNb7b9Nvutx3i7LDyXkR7x8t3ZEIiiD76u9zybDCh6Vcu4Gp/Wl
         jd45C75Axhdrad1n6/ZL9nayyOjv+kwRk5bkI80CRN1c+yPpa4b1f4ZQ97a41pZU6JFz
         brXKiXfdd5yypsEH/z1JIj5lw/hIBOnVi5uE+A9WhDNVd8y2qua4rkaYbyYnDN/oTG/j
         WpX6Nr6YM5j+RyUszM8r8n8Koh8N1Vp0pgM5HncUWvf8VXVEHbMPCwrgFmGLUMbZUjPY
         3Y1w==
X-Gm-Message-State: APjAAAVNtr+qmdWOBZ/Smy7H88BIrlRP7KzkXYqzwXfe1TTKEV0rE4nL
        AgGE7dWce7UBhfafkp5GZl33XMe0wNA=
X-Google-Smtp-Source: APXvYqzD5JuUHJ3dQCJweyuHhGuiHfqNxgxYzkz0cxux7VBByd5MhYM993TSZb5o7eTm04RUHnJyfA==
X-Received: by 2002:a17:902:5983:: with SMTP id p3mr12808037pli.156.1570153564249;
        Thu, 03 Oct 2019 18:46:04 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id e4sm4333514pff.22.2019.10.03.18.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 18:46:03 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: am3874-iceboard: Fix 'i2c-mux-idle-disconnect' usage
Date:   Thu,  3 Oct 2019 18:45:48 -0700
Message-Id: <20191004014548.29583-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

According to
Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt,
i2c-mux-idle-disconnect is a property of a parent node since it
pertains to the mux/switch as a whole, so move it there and drop all
of the concurrences in child nodes.

Fixes: d031773169df ("ARM: dts: Adds device tree file for McGill's IceBoard, based on TI AM3874")
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Benoît Cousson <bcousson@baylibre.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>
Cc: linux-omap@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---

This is purely a drive-by fix, since it concerns the HW I've never
heard of before. However I was working with PCA9548
(vf610-zii-scu4-aib is my HW) and looking at various users in the
kernel, when this code caught my eye. Apologies for the noise if this
fix is somehow bogus.

In case that it matters this patch is based on top of 5.4-rc1.

Thanks,
Andrey Smirnov

 arch/arm/boot/dts/am3874-iceboard.dts | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/am3874-iceboard.dts b/arch/arm/boot/dts/am3874-iceboard.dts
index 883fb85135d4..1b4b2b0500e4 100644
--- a/arch/arm/boot/dts/am3874-iceboard.dts
+++ b/arch/arm/boot/dts/am3874-iceboard.dts
@@ -111,13 +111,13 @@
 		reg = <0x70>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
 
 		i2c@0 {
 			/* FMC A */
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
-			i2c-mux-idle-disconnect;
 		};
 
 		i2c@1 {
@@ -125,7 +125,6 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
-			i2c-mux-idle-disconnect;
 		};
 
 		i2c@2 {
@@ -133,7 +132,6 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
-			i2c-mux-idle-disconnect;
 		};
 
 		i2c@3 {
@@ -141,7 +139,6 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
-			i2c-mux-idle-disconnect;
 		};
 
 		i2c@4 {
@@ -149,14 +146,12 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <4>;
-			i2c-mux-idle-disconnect;
 		};
 
 		i2c@5 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <5>;
-			i2c-mux-idle-disconnect;
 
 			ina230@40 { compatible = "ti,ina230"; reg = <0x40>; shunt-resistor = <5000>; };
 			ina230@41 { compatible = "ti,ina230"; reg = <0x41>; shunt-resistor = <5000>; };
@@ -182,14 +177,12 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <6>;
-			i2c-mux-idle-disconnect;
 		};
 
 		i2c@7 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <7>;
-			i2c-mux-idle-disconnect;
 
 			u41: pca9575@20 {
 				compatible = "nxp,pca9575";
-- 
2.21.0

