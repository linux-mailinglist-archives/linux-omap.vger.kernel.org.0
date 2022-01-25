Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95A4949BBD8
	for <lists+linux-omap@lfdr.de>; Tue, 25 Jan 2022 20:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbiAYTLt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jan 2022 14:11:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiAYTLp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Jan 2022 14:11:45 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC50C06173B;
        Tue, 25 Jan 2022 11:11:45 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id bg19-20020a05600c3c9300b0034565e837b6so1096478wmb.1;
        Tue, 25 Jan 2022 11:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A4ahT0xmp4xOnQS+WOnYEJnDytFq3HkX4S2blTgY2eo=;
        b=igeazOwDn0zoezH3eIDqkA38MKDCJK8Surb4AuXHSDOF2LLh4AfKl85W8ub63WfOXN
         J2ZkCRjtZBu1HvEiFViu/a4ADEHySkcOq5qzm5aalEm4oyBiTr9eAN2fLTQe6Smro4ye
         7V8KnrLeAsOIGu2oqlwA1a9MfBuRfownuePMm43KKDNF6X5/RJrPllgf2yf/CbXyH0M4
         co0k1IZzhUosGNBTSOQb1rr9AjvDvYWfCaxNfh5K7/1A09RrqOdlq6bfNRY5HcOEgrm/
         1U4rLnXGj7HJQ/48uGiyrJI1YsI2+M1XIMh/VhvTF7GDY5bfyKcIkKnJW+V3/tBpQddt
         n1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A4ahT0xmp4xOnQS+WOnYEJnDytFq3HkX4S2blTgY2eo=;
        b=K/RQqnLpeQpQOnO86oozmHFmwX4TC2tlJt3BZ4OagYjIKtNG2om86n0alTZ7GxHJG+
         VHyCPQ3PXgYxNrlG2CTfBsNlApky76uXxjTsnWcmYWZHkiZ6DnHUzU9aPQDTEMsVFg4l
         rpcUvNdrD6b9BRI50Pd5Ypwf2k98JfbXo6zen4f2bDeLCEMjig0WNt1Yc6dXWroYG1zx
         x8iFiisdePE5bOz8kO2W/Y3RAIdc7mvxuPVPPk38jilDfuDh/f4TwwwjAA8W+vHif/Zr
         numnx+e8Dl9FCUR63lMd8lR+bt06C7xg+kciDz2kY2BR+sA+jvWvg91GeuuQEjaijHVb
         PbGg==
X-Gm-Message-State: AOAM531s2SwpIsub+Tvr9hS6HlEVMe4YubuM9CtgH8Vw+EnvDqXdrrTJ
        4tWkFDNqBbCrDxDIt/ZPHB+Nu0uEllZ4sQ==
X-Google-Smtp-Source: ABdhPJxx1GagRRT1GpaV87xR2o93/ZvAoE0GbkOYCEkqYUiissc4d102AjG7zB+uaM3h87Y+iIq8Ag==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr4238786wml.42.1643137903536;
        Tue, 25 Jan 2022 11:11:43 -0800 (PST)
Received: from Hera.. ([2a01:e34:ec42:a0d0:220:edff:feff:ffff])
        by smtp.gmail.com with ESMTPSA id c23sm1053785wme.35.2022.01.25.11.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 11:11:43 -0800 (PST)
From:   Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
To:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        tony@atomide.com, bcousson@baylibre.com
Cc:     robh+dt@kernel.org,
        Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
Subject: [PATCH 1/2] ARM: dts: switch timer config to common devkit8000 devicetree
Date:   Tue, 25 Jan 2022 20:11:38 +0100
Message-Id: <20220125191139.2429555-1-anthoine.bourgeois@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch allow lcd43 and lcd70 flavors to benefit from timer
evolution.

Fixed: e428e250fde6 ("ARM: dts: Configure system timers for omap3")
Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
---
 .../arm/boot/dts/omap3-devkit8000-common.dtsi | 33 +++++++++++++++++++
 arch/arm/boot/dts/omap3-devkit8000.dts        | 33 -------------------
 2 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-devkit8000-common.dtsi b/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
index 5e55198e4576..f5197bb31ed8 100644
--- a/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
+++ b/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
@@ -158,6 +158,39 @@ &mmc3 {
 	status = "disabled";
 };
 
+/* Unusable as clocksource because of unreliable oscillator */
+&counter32k {
+	status = "disabled";
+};
+
+/* Unusable as clockevent because if unreliable oscillator, allow to idle */
+&timer1_target {
+	/delete-property/ti,no-reset-on-init;
+	/delete-property/ti,no-idle;
+	timer@0 {
+		/delete-property/ti,timer-alwon;
+	};
+};
+
+/* Preferred always-on timer for clocksource */
+&timer12_target {
+	ti,no-reset-on-init;
+	ti,no-idle;
+	timer@0 {
+		/* Always clocked by secure_32k_fck */
+	};
+};
+
+/* Preferred timer for clockevent */
+&timer2_target {
+	ti,no-reset-on-init;
+	ti,no-idle;
+	timer@0 {
+		assigned-clocks = <&gpt2_fck>;
+		assigned-clock-parents = <&sys_ck>;
+	};
+};
+
 &twl_gpio {
 	ti,use-leds;
 	/*
diff --git a/arch/arm/boot/dts/omap3-devkit8000.dts b/arch/arm/boot/dts/omap3-devkit8000.dts
index c2995a280729..162d0726b008 100644
--- a/arch/arm/boot/dts/omap3-devkit8000.dts
+++ b/arch/arm/boot/dts/omap3-devkit8000.dts
@@ -14,36 +14,3 @@ aliases {
 		display2 = &tv0;
 	};
 };
-
-/* Unusable as clocksource because of unreliable oscillator */
-&counter32k {
-	status = "disabled";
-};
-
-/* Unusable as clockevent because if unreliable oscillator, allow to idle */
-&timer1_target {
-	/delete-property/ti,no-reset-on-init;
-	/delete-property/ti,no-idle;
-	timer@0 {
-		/delete-property/ti,timer-alwon;
-	};
-};
-
-/* Preferred always-on timer for clocksource */
-&timer12_target {
-	ti,no-reset-on-init;
-	ti,no-idle;
-	timer@0 {
-		/* Always clocked by secure_32k_fck */
-	};
-};
-
-/* Preferred timer for clockevent */
-&timer2_target {
-	ti,no-reset-on-init;
-	ti,no-idle;
-	timer@0 {
-		assigned-clocks = <&gpt2_fck>;
-		assigned-clock-parents = <&sys_ck>;
-	};
-};
-- 
2.34.1

