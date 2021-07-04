Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4274B3BAD93
	for <lists+linux-omap@lfdr.de>; Sun,  4 Jul 2021 17:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhGDPFT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 4 Jul 2021 11:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhGDPFT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 4 Jul 2021 11:05:19 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2DA1C061574
        for <linux-omap@vger.kernel.org>; Sun,  4 Jul 2021 08:02:42 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id b40so1158470ljf.12
        for <linux-omap@vger.kernel.org>; Sun, 04 Jul 2021 08:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rG8Wa9DCPn+LJLpCJ8agJSEaH0afH0syVdCVNBofvlc=;
        b=YocJjm6n9bM4Z2Y+D1N1nCcOZKsPF8y7tfeprCgumybmWRfVWqIS75Bq/NmZbdjIyh
         8HskQqleK77e03XhE+Rv0Hoh/05IWd4i+l6zioD56vE+iom+XA5gZn27hpSoHda8s6vi
         VCgTrpVumPjXTxLvnaWYD1CdzPmVHi/LDmAtohu4f32L7KX1Zx8J/0eFl+DzjfaiwHaD
         fZW026LXabirhhW+pmK8M2BvQ6OubZeHmtUVgZXaRJWYNs7FVQsYoVfF0EAIsuiozk+d
         SYBCoT5482YWbt291Bx8FSrwO3HtSLzLqPGK3a2u9is1P83VqGErm7Qqmb7t6vdznDHl
         swcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rG8Wa9DCPn+LJLpCJ8agJSEaH0afH0syVdCVNBofvlc=;
        b=if9RY3ZMOcUDSpkwh+Z8vGtPiUNUvfLiZ1ePd4S69cLtL7NFA9X3CiuqHqoIPlAniH
         YZbp1gHaf7sPlM40heE7Q2gRaUIgGxzEDoMYrCqhQ0Vtvfg+jMiBDiUduGr6mbX/1noP
         8GPKPREFNHtgz/DXfZUszMuze0CTbPi4NlQLQGfuuXNqQqJWIxyy1hAeWub3KZHRNBhY
         veD35mBXyCCM0depYRBItzkuVuggcBYTM/Ylam2H80yYiPrYLvdjcPrMhPqHyORttoT8
         M75RNjb8gKokzn3LmDYI0gEEac+X3YNL0ss6J3yUSrCzqqIaPPxCRbbPvYyCrYpcvIBN
         zJBg==
X-Gm-Message-State: AOAM533ESAremtYT7dDu3ILIJiAiVuYazIUP0SG6Gj46BrsV68S82ywI
        SS7gFbdCrCbqPfXsGMiKENc=
X-Google-Smtp-Source: ABdhPJxGdC/Z3S2H8slU0FlpXoe5lliGF7ERtRDubU533St6/KeGCY1zYnihEdV4TTnw5GlrBcXocg==
X-Received: by 2002:a2e:2a85:: with SMTP id q127mr7396552ljq.77.1625410961018;
        Sun, 04 Jul 2021 08:02:41 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id k11sm268826lfc.272.2021.07.04.08.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 08:02:40 -0700 (PDT)
From:   Peter Ujfalusi <peter.ujfalusi@gmail.com>
To:     broonie@kernel.org, tony@atomide.com
Cc:     alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, hns@goldelico.com
Subject: [PATCH 5/5] ARM: dts: omap4-l4-abe: Add McASP configuration
Date:   Sun,  4 Jul 2021 18:04:50 +0300
Message-Id: <20210704150450.20106-6-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
References: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

OMAP4 has a single McASP instance with single serializer and locked for DIT
mode.
To be able to enable the support the following fixes needed:
- Add the DAT port ranges to the target module's ranges
- SIDLE mode must be disabled as it is not working with McASP
 most likely module integration issue with McASP

We can already fill in the op-mode and serial-dir  for McASP as it only
supports this configuration, but keep the module disabled as there is no
known device available where it is used.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 arch/arm/boot/dts/omap4-l4-abe.dtsi | 38 +++++++++++++++--------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4-abe.dtsi b/arch/arm/boot/dts/omap4-l4-abe.dtsi
index 8287fdaa526e..a8d66240d17d 100644
--- a/arch/arm/boot/dts/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap4-l4-abe.dtsi
@@ -186,36 +186,38 @@ mcbsp3: mcbsp@0 {
 		};
 
 		target-module@28000 {			/* 0x40128000, ap 8 08.0 */
+							/* 0x4012a000, ap 10 0a.0 */
 			compatible = "ti,sysc-mcasp", "ti,sysc";
 			reg = <0x28000 0x4>,
 			      <0x28004 0x4>;
 			reg-names = "rev", "sysc";
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>;
+					<SYSC_IDLE_NO>;
 			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
 			clocks = <&abe_clkctrl OMAP4_MCASP_CLKCTRL 0>;
 			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x28000 0x1000>,
-				 <0x49028000 0x49028000 0x1000>;
-
-			/*
-			 * Child device unsupported by davinci-mcasp. At least
-			 * RX path is disabled for omap4, and only DIT mode
-			 * works with no I2S. See also old Android kernel
-			 * omap-mcasp driver for more information.
-			 */
-		};
-
-		target-module@2a000 {			/* 0x4012a000, ap 10 0a.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0x0 0x2a000 0x1000>,
+				 <0x49028000 0x49028000 0x1000>,
+				 <0x2000 0x2a000 0x1000>,
 				 <0x4902a000 0x4902a000 0x1000>;
+
+			mcasp0: mcasp@0 {
+				compatible = "ti,omap4-mcasp-audio";
+				reg = <0x0 0x2000>,
+				      <0x4902a000 0x1000>;	/* L3 data port */
+				reg-names = "mpu","dat";
+				interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "tx";
+				dmas = <&sdma 8>;
+				dma-names = "tx";
+				clocks = <&abe_clkctrl OMAP4_MCASP_CLKCTRL 0>;
+				clock-names = "fck";
+				op-mode = <1>;	/* MCASP_DIT_MODE */
+				serial-dir = < 1 >; /* 1 TX serializers */
+				status = "disabled";
+			};
 		};
 
 		target-module@2e000 {			/* 0x4012e000, ap 12 0c.0 */
-- 
2.32.0

