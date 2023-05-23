Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9D6A70D6AB
	for <lists+linux-omap@lfdr.de>; Tue, 23 May 2023 10:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235980AbjEWIGn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 May 2023 04:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235938AbjEWIGh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 May 2023 04:06:37 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 536AE1B9;
        Tue, 23 May 2023 01:06:07 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 7E1998181;
        Tue, 23 May 2023 07:56:10 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] ARM: dts: Unify pinctrl-single pin group nodes for omap2
Date:   Tue, 23 May 2023 10:56:07 +0300
Message-Id: <20230523075607.56381-1-tony@atomide.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We want to unify the pinctrl-single pin group nodes to use naming "pins".
Otherwise non-standad pin group names will add make dtbs checks errors
when the pinctrl-single yaml binding gets merged.

Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap2420-n810.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap2420-n810.dts b/arch/arm/boot/dts/omap2420-n810.dts
--- a/arch/arm/boot/dts/omap2420-n810.dts
+++ b/arch/arm/boot/dts/omap2420-n810.dts
@@ -23,7 +23,7 @@ v28_aic: v28_aic {
 };
 
 &omap2420_pmx {
-	mcbsp2_pins: mcbsp2_pins {
+	mcbsp2_pins: mcbsp2-pins {
 		pinctrl-single,pins = <
 			OMAP2420_CORE_IOPAD(0x0124, PIN_INPUT | MUX_MODE1)	/* eac_ac_sclk.mcbsp2_clkx */
 			OMAP2420_CORE_IOPAD(0x0125, PIN_INPUT | MUX_MODE1)	/* eac_ac_fs.mcbsp2_fsx */
@@ -32,7 +32,7 @@ OMAP2420_CORE_IOPAD(0x0127, PIN_OUTPUT | MUX_MODE1)	/* eac_ac_dout.mcbsp2_dx */
 		>;
 	};
 
-	aic33_pins: aic33_pins {
+	aic33_pins: aic33-pins {
 		pinctrl-single,pins = <
 			OMAP2420_CORE_IOPAD(0x0129, PIN_OUTPUT | MUX_MODE3)	/* eac_ac_rst.gpio118 */
 			OMAP2420_CORE_IOPAD(0x00e8, PIN_OUTPUT | MUX_MODE2)	/* vlynq_tx1.sys_clkout2 */
-- 
2.40.1
