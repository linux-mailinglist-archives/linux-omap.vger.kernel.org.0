Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB4E49BBD5
	for <lists+linux-omap@lfdr.de>; Tue, 25 Jan 2022 20:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiAYTLs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jan 2022 14:11:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiAYTLp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Jan 2022 14:11:45 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E09BC06173D;
        Tue, 25 Jan 2022 11:11:45 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id c2so26110816wml.1;
        Tue, 25 Jan 2022 11:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KSX0PHd9Ocvn3tAvVF0tVn8XsfkxQYUaf/OX9aKGAq4=;
        b=YU+rfbUSkgSVbHcJZ/oslL4gKStGqsgitj90b25+/aeY2KNnW6y1saUVf9hYC85YMy
         HguS11mKn/Y3Edfj5+yhwVAosEF5v+wLM7PHEaJgOoG0FMESVEnN22wpiD+IOYId+8jL
         mIZzHXpvycwyIaeAx19OfILxnVks2+Il7U+DcpBsXVOXWKykyJ5mdjG+WybvZFdTLDgN
         CpFaRon92rV6IUHMyz8GYPb6l9Y3xJN4e8zcPaDayVOtQLPok9/5pfcA6r1ACWboDe5x
         8YI5QSivd82+v6onse85pS44MmKUz3Q6WQkJft8Z/w+x1hG4lIvO5S91pFrH0lb1M6Ap
         vMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KSX0PHd9Ocvn3tAvVF0tVn8XsfkxQYUaf/OX9aKGAq4=;
        b=wm7+8xr37FrhdI+5vf4sX7q7DpDJ0wXV1Gp9+au0bsGz4ndZjjBDdaNHF/AU8rhTqw
         KMvW+nMJYbvePlPp5L+0T04zpRyE2Td1ZIAbXdbpBAQDmohj+As4+06/6i/X9KXp7ngW
         x3+kfCSO4BorLDLIpS2S+wVGSM7AG5TBcIoQyccpOQ61D2Xle7OXsAfU9A65hTnO9MIX
         Trj/4q17RUueF9qNXnZHlLIOeSOvcZ6C+R6hnSjgzwc/4NBkCF4XjvKVHaT5cSO32Lom
         IhLMynPWhdtPctV5NWSzhC49oLFFaHPQK5G9jl/fm+PUSPSDl9Pb51F0uZ43KAlXAO+c
         hT7Q==
X-Gm-Message-State: AOAM5327W/HDBOQvmwHGRdx2nMb0R2yOFp86uF3aYTjm2naSnLmji7DY
        +iYpw9VtZ472q+M5ZcBNtkkcEO79KLiaNA==
X-Google-Smtp-Source: ABdhPJwd7QrVzrZPe73PajenGrZUyGol/YVImWpV+A3d0qgAep+7LIT+4591FHxC0KhVeVTX3rsy5g==
X-Received: by 2002:a05:600c:22cb:: with SMTP id 11mr4305686wmg.2.1643137904068;
        Tue, 25 Jan 2022 11:11:44 -0800 (PST)
Received: from Hera.. ([2a01:e34:ec42:a0d0:220:edff:feff:ffff])
        by smtp.gmail.com with ESMTPSA id c23sm1053785wme.35.2022.01.25.11.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 11:11:43 -0800 (PST)
From:   Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
To:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        tony@atomide.com, bcousson@baylibre.com
Cc:     robh+dt@kernel.org,
        Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
Subject: [PATCH 2/2] ARM: dts: Use 32KiHz oscillator on devkit8000
Date:   Tue, 25 Jan 2022 20:11:39 +0100
Message-Id: <20220125191139.2429555-2-anthoine.bourgeois@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125191139.2429555-1-anthoine.bourgeois@gmail.com>
References: <20220125191139.2429555-1-anthoine.bourgeois@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Devkit8000 board seems to always used 32k_counter as clocksource.
Restore this behavior.

If clocksource is back to 32k_counter, timer12 is now the clockevent
source (as before) and timer2 is not longer needed here.

This commit fixes the same issue observed with commit 23885389dbbb
("ARM: dts: Fix timer regression for beagleboard revision c") when sleep
is blocked until hitting keys over serial console.

Fixed: aba1ad05da08 ("clocksource/drivers/timer-ti-dm: Add clockevent and clocksource support")
Fixed: e428e250fde6 ("ARM: dts: Configure system timers for omap3")
Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
---
 arch/arm/boot/dts/omap3-devkit8000-common.dtsi | 17 +----------------
 drivers/clocksource/timer-ti-dm-systimer.c     |  3 +--
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-devkit8000-common.dtsi b/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
index f5197bb31ed8..54cd37336be7 100644
--- a/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
+++ b/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
@@ -158,11 +158,6 @@ &mmc3 {
 	status = "disabled";
 };
 
-/* Unusable as clocksource because of unreliable oscillator */
-&counter32k {
-	status = "disabled";
-};
-
 /* Unusable as clockevent because if unreliable oscillator, allow to idle */
 &timer1_target {
 	/delete-property/ti,no-reset-on-init;
@@ -172,7 +167,7 @@ timer@0 {
 	};
 };
 
-/* Preferred always-on timer for clocksource */
+/* Preferred timer for clockevent */
 &timer12_target {
 	ti,no-reset-on-init;
 	ti,no-idle;
@@ -181,16 +176,6 @@ timer@0 {
 	};
 };
 
-/* Preferred timer for clockevent */
-&timer2_target {
-	ti,no-reset-on-init;
-	ti,no-idle;
-	timer@0 {
-		assigned-clocks = <&gpt2_fck>;
-		assigned-clock-parents = <&sys_ck>;
-	};
-};
-
 &twl_gpio {
 	ti,use-leds;
 	/*
diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
index 5c40ca1d4740..1fccb457fcc5 100644
--- a/drivers/clocksource/timer-ti-dm-systimer.c
+++ b/drivers/clocksource/timer-ti-dm-systimer.c
@@ -241,8 +241,7 @@ static void __init dmtimer_systimer_assign_alwon(void)
 	bool quirk_unreliable_oscillator = false;
 
 	/* Quirk unreliable 32 KiHz oscillator with incomplete dts */
-	if (of_machine_is_compatible("ti,omap3-beagle-ab4") ||
-	    of_machine_is_compatible("timll,omap3-devkit8000")) {
+	if (of_machine_is_compatible("ti,omap3-beagle-ab4")) {
 		quirk_unreliable_oscillator = true;
 		counter_32k = -ENODEV;
 	}
-- 
2.34.1

