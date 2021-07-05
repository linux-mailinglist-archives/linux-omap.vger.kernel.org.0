Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38C1F3BC333
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jul 2021 21:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbhGETnR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jul 2021 15:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhGETnR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jul 2021 15:43:17 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD401C061574
        for <linux-omap@vger.kernel.org>; Mon,  5 Jul 2021 12:40:38 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id r16so25927475ljk.9
        for <linux-omap@vger.kernel.org>; Mon, 05 Jul 2021 12:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rG8Wa9DCPn+LJLpCJ8agJSEaH0afH0syVdCVNBofvlc=;
        b=b3hjoTkcSMEWISYxZGb1O1Aa/UB2B3LQsRa5PM6gPWhWBj8LPCr7I8VEMUhknm/+m8
         7CaIP7JToj0Gt7eyTdaDdlQTf3Jbir439L8qEppdtEsgDhE8kdxNEm5e/pYisTO7bNqr
         Hxa9+o6n4/U3jRfwVMIyEzRqpYC3ss2voat+BSD9ocMwIvsbX+ThoCDRDzVnjCe6aZCG
         hOtCUDwE9E9xzyLLfgTa+u+go3x8J14IQS/gFCkthJlPHqg1Izo7R7TOV/dXr90l2+lJ
         aPR1qZ+1mku21ma+Jp6bklkIernbNiFucl/Tef/Z912/r7hEpxsXg0KSRggc7rXMzfFQ
         pR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rG8Wa9DCPn+LJLpCJ8agJSEaH0afH0syVdCVNBofvlc=;
        b=WEElZTfgttKBljIo0fQLQaPgTCtIhB0FjBWwoA0B4fss/RHVbVAowGeGJ3ERtwWpQk
         95TRP/kEO4h234sLsxmQxUISu/BnRXPtvyD/CkB44Jl59I3kq/Z3vqA35wM1S7aY01pF
         WoLkyekTGPJ1aNkA49Vj49vOeb6ZqimL5zcmVkm0e/dX2svw2/Qq4LVh1yJTtY27E/se
         pBOoczbYbaQconyWcdDiyGlixV5tThBeTc0yBJNpMuem0v3aeGIBl6DXE3fOBOpfAYHH
         EX8MfEiMFJVDKMUVS/MHdVNPmRNV7HHWUxOvEDpHAvFNEaOIlgKWQVb5BXvwWcT6AxKT
         POqw==
X-Gm-Message-State: AOAM5328T+8VOaWpoFhqawfjSTryz1dbG5b5f+dNyjvW2J4bJLXSG0s1
        q9dv3b02lJkPa4/T8Oqf31I=
X-Google-Smtp-Source: ABdhPJw1yNKGrgp5kQaDmChWSn7ijYDvHPiaDSrCzw0RKEZOUT93M1hzbfnqq7E+apwg+KyhsehmBg==
X-Received: by 2002:a2e:2c0d:: with SMTP id s13mr6746476ljs.439.1625514037174;
        Mon, 05 Jul 2021 12:40:37 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id b5sm1167248lfv.3.2021.07.05.12.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 12:40:36 -0700 (PDT)
From:   Peter Ujfalusi <peter.ujfalusi@gmail.com>
To:     broonie@kernel.org, tony@atomide.com
Cc:     alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, hns@goldelico.com
Subject: [PATCH v2 5/5] ARM: dts: omap4-l4-abe: Add McASP configuration
Date:   Mon,  5 Jul 2021 22:42:49 +0300
Message-Id: <20210705194249.2385-6-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
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

