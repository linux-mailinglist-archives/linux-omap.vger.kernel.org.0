Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89F523CC2E8
	for <lists+linux-omap@lfdr.de>; Sat, 17 Jul 2021 14:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233378AbhGQMKT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 17 Jul 2021 08:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233361AbhGQMJ7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 17 Jul 2021 08:09:59 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA0DC061762;
        Sat, 17 Jul 2021 05:07:01 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id u14so17971701ljh.0;
        Sat, 17 Jul 2021 05:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VbgDDzHJ7sDQiuRaoRWaCyhnkU1zVU77wEAjR1S7/Os=;
        b=V+TIrlBmU/P/DdrTWFd3h3OZT/PhwMktc2Y2KbA6i4ReHBVCDTMbHfeaqB7HQQu7R2
         9B/YRbvDk3qRe58NgT/0qYXX0GXDiMnmV68pExPelASEqKU200ZQLwTBDOaI3ZaHS8Wu
         uAHpsZkodfbpA0me/WsjqMn/tVkiZ29vKxW7BUEgmZRttaXCMpOsPuAQ1geb79wjpQzg
         LUdvMHbGFV8KVssmWtiSTMGLET+qiiYH45I+A4QJZseU0MiztQ66UmiYFZrH9u/iEoGC
         V2PowSwmCKK0OcLy9LgGRY756WRJuwEtcNf2DX5PatNpH3L4IPq9ux9ZWk4hFL6eUiPC
         DApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VbgDDzHJ7sDQiuRaoRWaCyhnkU1zVU77wEAjR1S7/Os=;
        b=SlcrA3HZRrDeFHidwTk+CHTJtA5UuuukkXCyyQLhbdEVvvHnj7icgPYWnHtIH7h839
         UJwIP8y4C4Kaz2HNx1KtxNQ+ym0HlKBjD3TcxZGsBUUUiOu31v/84E3rLKdPDpblHMDb
         oHFPZCxddx/GKnYq3+T24+YwBlkIHfZObQ5JzjfhP36g2S8V3oeQtn6GIXyFVqCsF/90
         s94D/FcEE++Z2CHtyyx+VBwuJAmLprE6T4QxufP+ovPYF20ioKQ57n9AMNO0/9K/peAg
         rcpSI+8khu4W0GPmk6JNpQfOgMWh0rq2m58Y4uajR6k6QeyOzwmYVpzGwkokSw5cE8mY
         32yQ==
X-Gm-Message-State: AOAM532iJrOsIkiQffs6K44fe8n8xAyh8jbLuVkB1pNaCVUBFe3VleKY
        r4Ox5VfSg7/zBPCL4d9NqLk=
X-Google-Smtp-Source: ABdhPJxMtw0EvtdBfkSRgyJVfZB5jFRSJb4tsAtLLPU+GMI9Al9MrjY3ormEYv2pXhDKPZBpg/VITQ==
X-Received: by 2002:a2e:503:: with SMTP id 3mr13391598ljf.234.1626523620100;
        Sat, 17 Jul 2021 05:07:00 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id e5sm155334ljn.72.2021.07.17.05.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 05:06:59 -0700 (PDT)
From:   Peter Ujfalusi <peter.ujfalusi@gmail.com>
To:     tony@atomide.com, bcousson@baylibre.com
Cc:     robh+dt@kernel.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        hns@goldelico.com
Subject: [PATCH 3/3] ARM: dts: omap4-l4-abe: Add McASP configuration
Date:   Sat, 17 Jul 2021 15:09:25 +0300
Message-Id: <20210717120925.24505-4-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717120925.24505-1-peter.ujfalusi@gmail.com>
References: <20210717120925.24505-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

OMAP4 has a single McASP instance with single serializer and locked for DIT
mode.
To be able to enable the support the following fixes needed:
- Add the DAT port ranges to the target module's ranges

We can already fill in the op-mode and serial-dir  for McASP as it only
supports this configuration, but keep the module disabled as there is no
known device available where it is used.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 arch/arm/boot/dts/omap4-l4-abe.dtsi | 35 ++++++++++++++++-------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4-abe.dtsi b/arch/arm/boot/dts/omap4-l4-abe.dtsi
index 8287fdaa526e..7ae8b620515c 100644
--- a/arch/arm/boot/dts/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap4-l4-abe.dtsi
@@ -186,6 +186,7 @@ mcbsp3: mcbsp@0 {
 		};
 
 		target-module@28000 {			/* 0x40128000, ap 8 08.0 */
+							/* 0x4012a000, ap 10 0a.0 */
 			compatible = "ti,sysc-mcasp", "ti,sysc";
 			reg = <0x28000 0x4>,
 			      <0x28004 0x4>;
@@ -199,23 +200,25 @@ target-module@28000 {			/* 0x40128000, ap 8 08.0 */
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

