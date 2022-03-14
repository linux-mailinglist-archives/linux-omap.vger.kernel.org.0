Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2AD14D8946
	for <lists+linux-omap@lfdr.de>; Mon, 14 Mar 2022 17:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232757AbiCNQgF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Mar 2022 12:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235788AbiCNQgA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 14 Mar 2022 12:36:00 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D892631C;
        Mon, 14 Mar 2022 09:34:48 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 09BD1FF804;
        Mon, 14 Mar 2022 16:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1647275687;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Y0JJS8E+gvZKxPOGnlgdSKREVAl6/09J8HEn+iRo56s=;
        b=KEJB/qyG8O/biaQiFu3lo9FkiqUkYQFS40uKcFAMEBSfutvk/TRCOAYmAq2wehx8KI1oC9
        9rc5os6XhF9J9QuMcCjeHSN3kwF+CKPtIclFiLLaX/K+TewxKIn7bUsljz/dn/Sbczc5mD
        /FXKTppaK3mB3FYypd/iHVi/EPyHhtDmptLS5v+hAkwxzrXpZxDub0Fl7I1yi2qNDT/B+C
        P53/pMYW6hQyOcrSJ21Y3j3PmUzEGJ7K6+fNoDOIr5TTobGaexKT4mchn49Dt0gzqQ7kKX
        a+5bgtxCaCg5CmJpsmw2KptMAyaphgAcZUaTlk6BjyMcsE39nHUwrX+XgKE5Rg==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Benoit Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2] ARM: dts: am33xx-l4: Add missing touchscreen clock properties
Date:   Mon, 14 Mar 2022 17:34:45 +0100
Message-Id: <20220314163445.79807-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When adding support for TI magadc (Magnetic Stripe Reader and ADC), the
MFD driver common to the touchscreen and the ADC got updated to ease the
insertion of a new DT node for the ADC, with its own compatible, clocks,
etc. Commit 235a96e92c16 ("mfd: ti_am335x_tscadc: Don't search the tree
for our clock") removed one compatible specific information which was
the clock name, because the clock was looked up from scratch in the DT
while this hardware block was only fed by a single clock, already
defined and properly filled in the DT.

Problem is, this change was only validated with an am437x-based board,
where the clocks are effectively correctly defined and referenced. But
on am33xx, the ADC clock is also correctly defined but is not referenced
with a clock phandle as it ought to be.

The touchscreen bindings clearly state that the clocks/clock-names
properties are mandatory, but they have been forgotten in one DTSI. This
was probably not noticed in the first place because of the clock
actually existing and the clk_get() call going through all the tree
anyway.

Add the missing clock phandles in the am33xx touchscreen description.

Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Fixes: 235a96e92c16 ("mfd: ti_am335x_tscadc: Don't search the tree for our clock")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Changes in v2:
- Explained the "magadc" name
- s/out to be/ought to be/
- Added Nikolaus Tested-by

 arch/arm/boot/dts/am33xx-l4.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index c9629cb5ccd1..7da42a5b959c 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -263,6 +263,8 @@ tscadc: tscadc@0 {
 				compatible = "ti,am3359-tscadc";
 				reg = <0x0 0x1000>;
 				interrupts = <16>;
+				clocks = <&adc_tsc_fck>;
+				clock-names = "fck";
 				status = "disabled";
 				dmas = <&edma 53 0>, <&edma 57 0>;
 				dma-names = "fifo0", "fifo1";
-- 
2.27.0

