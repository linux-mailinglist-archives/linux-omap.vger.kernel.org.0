Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4454CFCDE
	for <lists+linux-omap@lfdr.de>; Mon,  7 Mar 2022 12:29:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240378AbiCGLaZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Mar 2022 06:30:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235374AbiCGLaP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Mar 2022 06:30:15 -0500
X-Greylist: delayed 215 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Mar 2022 03:14:21 PST
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF795DA70
        for <linux-omap@vger.kernel.org>; Mon,  7 Mar 2022 03:14:20 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 304316000C;
        Mon,  7 Mar 2022 11:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1646651655;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=QK0XQtPD8JoMHuPVj8WcMiny8pEk+K5XmeLMZMUydEQ=;
        b=ANNiqf2hfpLEGqKOCH5iQ6WHgL4NHcVvK4idAcT51GHiTlLz359vho4Fx9RsONb9WF2aCc
        Q/MawShUYJpRSOC857s7UQ123j1ydT1uvv2f1zTCmgeny+sv7SOlpbsjFaYUCDcgNViR3h
        FBgdz2XD5yQlg/oN+cI8aF6RUK0aCaxSZ4OYJxoVgMvlzv/Po7PYfPi1LdFWHnHyUMKwRo
        iMiTLWFPAfxldqc+4vx1x3cGohSTyWqtGf3gvXJ9r2SCUhqEmiq2yh8XZYhQfHsyFVm2tn
        mkLOzCGDui/T1deHxkyQgmvVkksQeSuAsXh9/JzNmRA6XAqRUoJAAVICgabDuA==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH] ARM: dts: am33xx-l4: Add missing touchscreen clock properties
Date:   Mon,  7 Mar 2022 12:14:13 +0100
Message-Id: <20220307111413.8903-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When adding support for TI magadc, the MFD driver (common to the
touchscreen and the ADC) got updated to ease the insertion of a new DT
node for the ADC, with its own compatible, clocks, etc. Commit
235a96e92c16 ("mfd: ti_am335x_tscadc: Don't search the tree for our
clock") removed one compatible specific information which was the clock
name, because the clock was looked up from scratch in the DT while this
hardware block was only fed by a single clock, already defined and
properly filled in the DT.

Problem is, this change was only validated with an am437x-based board,
where the clocks are effectively correctly defined and referenced. But
on am33xx, the ADC clock is also correctly defined but is not referenced
with a clock phandle as it out to be.

The touchscreen bindings clearly state that the clocks/clock-names
properties are mandatory, but they have been forgotten in one DTSI. This
was probably not noticed in the first place because of the clock
actually existing and the clk_get() call going through all the tree
anyway.

Add the missing clock phandles in the am33xx touchscreen description.

Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Fixes: 235a96e92c16 ("mfd: ti_am335x_tscadc: Don't search the tree for our clock")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Hello Nikolaus, as I told you I don't have the relevant hardware to
verify that this actually fixes your situation but I am rather
confident. Could you please give this a try?
Thanks! Miquel

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

