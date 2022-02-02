Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8DAC4A7A69
	for <lists+linux-omap@lfdr.de>; Wed,  2 Feb 2022 22:27:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232900AbiBBV1M (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Feb 2022 16:27:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiBBV1L (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Feb 2022 16:27:11 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 759EAC06173B
        for <linux-omap@vger.kernel.org>; Wed,  2 Feb 2022 13:27:11 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id cq9-20020a17090af98900b001b8262fe2d5so2747721pjb.0
        for <linux-omap@vger.kernel.org>; Wed, 02 Feb 2022 13:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+MX3D9q8d3LzKE4FBcDvQ2a3FDyu2HVNWGmSJadrBn8=;
        b=4sTFPyi53OOLG+HQ5SejHODLgQ+qUrtD9GZxSJ7ShYrvsFG4QhoWkdAIPReC6G1p0J
         UHYQCyxOIYt36ZxoKfizbwTzGNEIeaHQKrSchgJZBHkcwOWbI5BgNN2wBStCbBwvH7sB
         1CmW1G7IXVOHIMTv2TMgULJaHzW0qCFO1gWe26y5STKIUcfsmC5xB9y06BD3zT5/9yCF
         ywzNX1MaXh13XVPrU6Umz52Ygzw4/iaJ9B1qXyS85YfwrDBUmoKjLRBnN5q3/apX8yaQ
         HMfoHYU5Okv216E6Gsglt60xd9ICAkbh7CMRQxNvBHBke6RUZUOk9cN2UjzQdYhKhNJC
         4uzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+MX3D9q8d3LzKE4FBcDvQ2a3FDyu2HVNWGmSJadrBn8=;
        b=NRWAjRN0+003G3i1ouSE1O6NiODBgZ6ar9P3rRJjhGJ75YW2YZzYiAZE5YZkhzyuT1
         N4Onf0bQU6Q1Snzb45zXB3eRnep3LT2VuRJr2bFcZHWE00VgLc1K4DyqRSxADwfqPRII
         Dy0bC6SArzNj+L8a2Y7VT9dzZ5DtzhagoIQGE3dQ6GU9xWxPN7h76Pj0T/xt8l6kWm6t
         HB2OLqXqTB1uKF2Wq05y5ehPLN4QN8hr/D33Q6UEK6f/P15y5ZtNceBd8bFyS1drdx56
         fuKB3gJwxRhpnGYgiQ8SQBH2TBPNIveKpi9Kxw43iqUX7rjnmb/P2XFPAtTSef7qN7tX
         uGLQ==
X-Gm-Message-State: AOAM533uTml96evDvcTivOFjvJbcX7fBivrQkAzALUroj2Om6tjBYoGK
        jZikcPm0+OOnLWaqPGxtaV3kFQ==
X-Google-Smtp-Source: ABdhPJzKzue1OErPgU/Ol0OyFasfeCXXO8paAjP9TLPGwHbmhBypSxEY8Nsey15YsuIy5WiTLfvPYA==
X-Received: by 2002:a17:902:ea0f:: with SMTP id s15mr31734177plg.118.1643837230684;
        Wed, 02 Feb 2022 13:27:10 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1001:7090:9646:73e6:2457:2f0f])
        by smtp.gmail.com with ESMTPSA id mi11sm7579087pjb.37.2022.02.02.13.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 13:27:10 -0800 (PST)
From:   Drew Fustini <dfustini@baylibre.com>
To:     Tony Lindgren <tony@atomide.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tero Kristo <kristo@kernel.org>, khilman@baylibre.com,
        s-anna@ti.com
Cc:     Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH] clocksource/drivers/timer-ti-dm: fix regression from errata i940 fix
Date:   Wed,  2 Feb 2022 13:25:55 -0800
Message-Id: <20220202212554.1316032-1-dfustini@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The existing fix for errata i940 causes a conflict for IPU2 which is
using timer 3 and 4. From arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi:

  &ipu2 {
          mboxes = <&mailbox6 &mbox_ipu2_ipc3x>;
          ti,timers = <&timer3>;
          ti,watchdog-timers = <&timer4>, <&timer9>;
  };

I discovered the timer conflict from when booting mainline on a
BeagleBoard X15 (AM5728):

  remoteproc remoteproc1: 55020000.ipu is available
  remoteproc remoteproc1: powering up 55020000.ipu
  remoteproc remoteproc1: Booting fw image dra7-ipu2-fw.xem4
  omap-rproc 55020000.ipu: could not get timer platform device
  omap-rproc 55020000.ipu: omap_rproc_enable_timers failed: -19
  remoteproc remoteproc1: can't start rproc 55020000.ipu: -19

I modified the errata fix to use timer 15 and 16 instead which resolves
the timer conflict.

Fixes: 25de4ce5ed02 ("clocksource/drivers/timer-ti-dm: Handle dra7 timer wrap errata i940")
Link: https://lore.kernel.org/linux-omap/YfWsG0p6to3IJuvE@x1/
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
Note: I am keeping the device tree and driver change together in one
patch as that is how the original errata fix commit was structured.

 arch/arm/boot/dts/dra7-l4.dtsi             | 5 ++---
 arch/arm/boot/dts/dra7.dtsi                | 8 ++++----
 drivers/clocksource/timer-ti-dm-systimer.c | 4 ++--
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index 956a26d52a4c..0a11bacffc1f 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -3482,8 +3482,7 @@ timer14: timer@0 {
 				ti,timer-pwm;
 			};
 		};
-
-		target-module@2c000 {			/* 0x4882c000, ap 17 02.0 */
+		timer15_target: target-module@2c000 {	/* 0x4882c000, ap 17 02.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
 			reg = <0x2c000 0x4>,
 			      <0x2c010 0x4>;
@@ -3511,7 +3510,7 @@ timer15: timer@0 {
 			};
 		};
 
-		target-module@2e000 {			/* 0x4882e000, ap 19 14.0 */
+		timer16_target: target-module@2e000 {	/* 0x4882e000, ap 19 14.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
 			reg = <0x2e000 0x4>,
 			      <0x2e010 0x4>;
diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index 6b485cbed8d5..8f7ffe2f66e9 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -1339,20 +1339,20 @@ timer@0 {
 };
 
 /* Local timers, see ARM architected timer wrap erratum i940 */
-&timer3_target {
+&timer15_target {
 	ti,no-reset-on-init;
 	ti,no-idle;
 	timer@0 {
-		assigned-clocks = <&l4per_clkctrl DRA7_L4PER_TIMER3_CLKCTRL 24>;
+		assigned-clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER15_CLKCTRL 24>;
 		assigned-clock-parents = <&timer_sys_clk_div>;
 	};
 };
 
-&timer4_target {
+&timer16_target {
 	ti,no-reset-on-init;
 	ti,no-idle;
 	timer@0 {
-		assigned-clocks = <&l4per_clkctrl DRA7_L4PER_TIMER4_CLKCTRL 24>;
+		assigned-clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER16_CLKCTRL 24>;
 		assigned-clock-parents = <&timer_sys_clk_div>;
 	};
 };
diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
index b6f97960d8ee..c706d63e9f5c 100644
--- a/drivers/clocksource/timer-ti-dm-systimer.c
+++ b/drivers/clocksource/timer-ti-dm-systimer.c
@@ -695,9 +695,9 @@ static int __init dmtimer_percpu_quirk_init(struct device_node *np, u32 pa)
 		return 0;
 	}
 
-	if (pa == 0x48034000)		/* dra7 dmtimer3 */
+	if (pa == 0x4882C000)           /* dra7 dmtimer15 */
 		return dmtimer_percpu_timer_init(np, 0);
-	else if (pa == 0x48036000)	/* dra7 dmtimer4 */
+	else if (pa == 0x4882E000)      /* dra7 dmtimer16 */
 		return dmtimer_percpu_timer_init(np, 1);
 
 	return 0;
-- 
2.32.0

