Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22DE5BE32D
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2019 19:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbfIYRPB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 25 Sep 2019 13:15:01 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41334 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbfIYRO6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 25 Sep 2019 13:14:58 -0400
Received: by mail-io1-f68.google.com with SMTP id r26so702668ioh.8
        for <linux-omap@vger.kernel.org>; Wed, 25 Sep 2019 10:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=tustjGhBUF11rx885HACJ9rTuwnb1TxiOoFdNWQ4/Po=;
        b=FhncIf0AY8sCx6/5CgCFvTvklW2lKnjRB6ooOUa28gqFws7RlHajymJJ3SHYDR4d85
         lVVBhHFb8jCC4aui3156Bgx/b+Jpciy3HN3PcfOX7U8H+9XCYnciMbX5XmF09K1ETxgi
         IdC9NXoMXu5L38NwZEZ4W5GfnvRnNMCsbTxvYkUSjB1qfeI4Weh98fq+HSJ+aJLSgssJ
         lQIuJdH+flMEMNYS3CvtA27VWOsWVS+V9cacWl8e3/FzUa8VWZtgUzEtrLfuO6QJuXZG
         eIe1R/HzAR5+Xk88lt9J/0FoqUieJ///olorggHKDh1VeAF+c8C7SlKSI3UpSlE6oN/j
         7NVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tustjGhBUF11rx885HACJ9rTuwnb1TxiOoFdNWQ4/Po=;
        b=f8buSUpmKgjdG+WUHrcffLyn4dxM2aKrImkqFTBkdyVVTBoQwDZ9TzpGI8zs2K3x4b
         IqwyFZeAxDD2EV6JHcKDxQgGv6GrbhmrYD6/uCfsaO/l/4Wnv9EajhtS7f52cjnUP6xy
         +um+6S3Jl7jw4p81JP2Xnkv/j2AEl7T6lnngeFh0FLXB/89lYVinkjcNUZcKcIsTYs18
         qEhMBeR7G9hbLFwbNRjNJ2kuXAOR/IrFbKbhkruoMULKVARNbYYYhg1LIHwUfY/IJ406
         PnVzP2cNdswUhQmmfVDY5Po4WeqoW+Lfi+e9BKTSHqDghtynDWmwEj5ysxGmnEJTf4SL
         mKOw==
X-Gm-Message-State: APjAAAWHp36u/RaqMRdIS1JSZ3lWYPRAuA2+Ky8ybERFf84tvB0SbxKv
        pnDp0ddBR/f6JJYhqhJFkQxNNFZhsrw=
X-Google-Smtp-Source: APXvYqy2xYvC05CxrJU5nc8/lHN0zeH0I/OBAUnEIBMPD9Pk62ja/OIm6+LzC0rrLXSSSyb4aUJj7A==
X-Received: by 2002:a6b:e706:: with SMTP id b6mr452690ioh.236.1569431695854;
        Wed, 25 Sep 2019 10:14:55 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id a17sm287708ilf.22.2019.09.25.10.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 10:14:55 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: omap3.dtsi: Fix AES and SHA Engines
Date:   Wed, 25 Sep 2019 12:14:44 -0500
Message-Id: <20190925171444.9904-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The AES and SHA engines for the OMAP3 are currently not functional.
When the stopped working is unknown, but we have a regression.

This patch uses the ti,sysc-omap2 to address the issue and enables
to the AES and SHA engines on the DM3730 and OMAP3530 to work once
again.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
index 4043ecb38016..5123dc80b694 100644
--- a/arch/arm/boot/dts/omap3.dtsi
+++ b/arch/arm/boot/dts/omap3.dtsi
@@ -156,13 +156,28 @@
 			};
 		};
 
-		aes: aes@480c5000 {
-			compatible = "ti,omap3-aes";
-			ti,hwmods = "aes";
-			reg = <0x480c5000 0x50>;
-			interrupts = <0>;
-			dmas = <&sdma 65 &sdma 66>;
-			dma-names = "tx", "rx";
+		aes_target: target-module@480c5000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x480c5044 0x4>,
+			     <0x480c5048 0x4>,
+			     <0x480c504c 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+				       <SYSC_IDLE_NO>;
+			ti,syss-mask = <1>;
+			clocks = <&aes2_ick>;
+			clock-names = "ick";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x480c5000 0x2000>;
+			aes: aes@0 {
+				compatible = "ti,omap3-aes";
+				reg = <0 0x50>;
+				interrupts = <0>;
+				dmas = <&sdma 65 &sdma 66>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		prm: prm@48306000 {
@@ -579,13 +594,28 @@
 			status = "disabled";
 		};
 
-		sham: sham@480c3000 {
-			compatible = "ti,omap3-sham";
-			ti,hwmods = "sham";
-			reg = <0x480c3000 0x64>;
-			interrupts = <49>;
-			dmas = <&sdma 69>;
-			dma-names = "rx";
+		sham_target: target-module@480c3000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x480c3056 0x4>,
+			     <0x480c3060 0x4>,
+			     <0x480c3064 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+				       <SYSC_IDLE_NO>;
+			ti,syss-mask = <1>;
+			clocks = <&sha12_ick>;
+			clock-names = "ick";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x480c3000 0x2000>;
+			sham: sham@0 {
+				compatible = "ti,omap3-sham";
+				reg = <0 0x64>;
+				interrupts = <49>;
+				dmas = <&sdma 69>;
+				dma-names = "rx";
+			};
 		};
 
 		timer1: timer@48318000 {
-- 
2.17.1

