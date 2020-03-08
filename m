Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 201EC17D5D0
	for <lists+linux-omap@lfdr.de>; Sun,  8 Mar 2020 20:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgCHTUo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 8 Mar 2020 15:20:44 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43827 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbgCHTUo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 8 Mar 2020 15:20:44 -0400
Received: by mail-wr1-f66.google.com with SMTP id v9so8395668wrf.10;
        Sun, 08 Mar 2020 12:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=qALcG3CGuBaboVD1Vu6sKa7UNKTJMIZmbr5ctcnIjvQ=;
        b=KuTzOrLQIYKb2aSSDndfU+R4OkG8+39CunsygU0n4TfXkT3rs607w8JdEwc7EkhXsh
         SUI5U4xuqaM9u2kio3yF8L+iH80FaSzYKojyVif5EOGrwXyEC0Gkbe8H9x+6I9uVWaUI
         RT/td7r6E8m4X97pUhBUDriTf1zOhmskFBfaaLvSXV09uCRoeWeGCxvzjDVCvADrX0m4
         OGajyiizFLDGpLeKePswPh2ZPdrG2VOjhvLszoQZn4RX7Ym4zRLpiXb393YGlng3qaUl
         NNvgvs6yjZUeroVVwUj2aJvhGwQCRM6pQEpwXfS1MoFKGf14J3Kxm6LJzSHPh6b6Dsqc
         HcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qALcG3CGuBaboVD1Vu6sKa7UNKTJMIZmbr5ctcnIjvQ=;
        b=sg/JXf+KfmImKXo5DzZnUEwJbgMHkwVBwlCxFmJrQu6qKTwd6zcdwwSzms6N1AR86d
         7XxBFArRTkP++/lbi2PfrhzdGnA5A8MvW/XivXsiREDgfA+QdOAXzghYMsuoXxPw4QhM
         RrJ6taRqva78EObGHG8Y3gaKPLVl0jMWrhL8GxURTWF/CfFDXzzIIJxNVqzVxzXlW5Dv
         cXbkQPPA5bhbftZ3sfdDjjsTp/V8rlr23PKeKwwSnxJffsde8/f8ZDjv0ikEYBq9DGLD
         qNFbT+RLJKpl1iRzGx9P+S920+KSZHay+zDYYpoVxz0nv6UJAzTGkLPP33yqwKxNqhZ1
         lN+A==
X-Gm-Message-State: ANhLgQ3OI0qcKFk+kp9WD9s2tAKpT+TCBx+cvxIZLmOJEEOPs4I+fdBf
        HG5w2NWhOaG7z/ZF95s7mZk=
X-Google-Smtp-Source: ADFU+vv3rcWG5MMYWXUHe4T6UqDBb1TBfzXy2V9IGq5bFXchWpdP6YGsyWHg0RWNUP8FI7gV+0nbcA==
X-Received: by 2002:adf:e98f:: with SMTP id h15mr16675277wrm.263.1583695241942;
        Sun, 08 Mar 2020 12:20:41 -0700 (PDT)
Received: from supervisor.net28 ([46.53.253.27])
        by smtp.gmail.com with ESMTPSA id f127sm23281865wma.4.2020.03.08.12.20.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Mar 2020 12:20:41 -0700 (PDT)
From:   Arthur Demchenkov <spinal.by@gmail.com>
Cc:     Arthur Demchenkov <spinal.by@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Ladislav Michl <ladis@linux-mips.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: OMAP: DTS: N900: fix onenand timings
Date:   Sun,  8 Mar 2020 22:19:33 +0300
Message-Id: <20200308191934.8263-1-spinal.by@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit a758f50f10cf ("mtd: onenand: omap2: Configure driver from DT")
started using DT specified timings for GPMC, and as a result the
OneNAND stopped working on N900 as we had wrong values in the DT.
Fix by updating the values to bootloader timings that have been tested
to be working on Nokia N900 with OneNAND manufacturers: Samsung,
Numonyx.

Fixes: a758f50f10cf ("mtd: onenand: omap2: Configure driver from DT")
Signed-off-by: Arthur Demchenkov <spinal.by@gmail.com>
---
 arch/arm/boot/dts/omap3-n900.dts | 44 +++++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index c3c6d7d04a76..4089d97405c9 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -854,34 +854,46 @@
 		compatible = "ti,omap2-onenand";
 		reg = <0 0 0x20000>;	/* CS0, offset 0, IO size 128K */
 
+		/*
+		 * These timings are based on CONFIG_OMAP_GPMC_DEBUG=y reported
+		 * bootloader set values when booted with v5.1
+		 * (OneNAND Manufacturer: Samsung):
+		 *
+		 *   cs0 GPMC_CS_CONFIG1: 0xfb001202
+		 *   cs0 GPMC_CS_CONFIG2: 0x00111100
+		 *   cs0 GPMC_CS_CONFIG3: 0x00020200
+		 *   cs0 GPMC_CS_CONFIG4: 0x11001102
+		 *   cs0 GPMC_CS_CONFIG5: 0x03101616
+		 *   cs0 GPMC_CS_CONFIG6: 0x90060000
+		 */
 		gpmc,sync-read;
 		gpmc,sync-write;
 		gpmc,burst-length = <16>;
 		gpmc,burst-read;
 		gpmc,burst-wrap;
 		gpmc,burst-write;
-		gpmc,device-width = <2>; /* GPMC_DEVWIDTH_16BIT */
-		gpmc,mux-add-data = <2>; /* GPMC_MUX_AD */
+		gpmc,device-width = <2>;
+		gpmc,mux-add-data = <2>;
 		gpmc,cs-on-ns = <0>;
-		gpmc,cs-rd-off-ns = <87>;
-		gpmc,cs-wr-off-ns = <87>;
+		gpmc,cs-rd-off-ns = <102>;
+		gpmc,cs-wr-off-ns = <102>;
 		gpmc,adv-on-ns = <0>;
-		gpmc,adv-rd-off-ns = <10>;
-		gpmc,adv-wr-off-ns = <10>;
-		gpmc,oe-on-ns = <15>;
-		gpmc,oe-off-ns = <87>;
+		gpmc,adv-rd-off-ns = <12>;
+		gpmc,adv-wr-off-ns = <12>;
+		gpmc,oe-on-ns = <12>;
+		gpmc,oe-off-ns = <102>;
 		gpmc,we-on-ns = <0>;
-		gpmc,we-off-ns = <87>;
-		gpmc,rd-cycle-ns = <112>;
-		gpmc,wr-cycle-ns = <112>;
-		gpmc,access-ns = <81>;
-		gpmc,page-burst-access-ns = <15>;
+		gpmc,we-off-ns = <102>;
+		gpmc,rd-cycle-ns = <132>;
+		gpmc,wr-cycle-ns = <132>;
+		gpmc,access-ns = <96>;
+		gpmc,page-burst-access-ns = <18>;
 		gpmc,bus-turnaround-ns = <0>;
 		gpmc,cycle2cycle-delay-ns = <0>;
 		gpmc,wait-monitoring-ns = <0>;
-		gpmc,clk-activation-ns = <5>;
-		gpmc,wr-data-mux-bus-ns = <30>;
-		gpmc,wr-access-ns = <81>;
+		gpmc,clk-activation-ns = <6>;
+		gpmc,wr-data-mux-bus-ns = <36>;
+		gpmc,wr-access-ns = <96>;
 		gpmc,sync-clk-ps = <15000>;
 
 		/*
-- 
2.11.0

