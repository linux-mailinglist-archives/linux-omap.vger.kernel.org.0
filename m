Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14E894D14A0
	for <lists+linux-omap@lfdr.de>; Tue,  8 Mar 2022 11:21:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbiCHKWF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Mar 2022 05:22:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234017AbiCHKWE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Mar 2022 05:22:04 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 99BD642EC2;
        Tue,  8 Mar 2022 02:21:08 -0800 (PST)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3A61180F1;
        Tue,  8 Mar 2022 10:19:45 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] ARM: dts: dra7: Fix suspend warning for vpe powerdomain
Date:   Tue,  8 Mar 2022 12:21:03 +0200
Message-Id: <20220308102103.39086-1-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
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

We currently are getting the following warning after a system suspend:

Powerdomain (vpe_pwrdm) didn't enter target state 0

Looks like this is because the STANDBYMODE bit for SMART_IDLE should
not be used. The TRM "Table 12-348. VPE_SYSCONFIG" says that the value
for SMART_IDLE is "0x2: Same behavior as bit-field value of 0x1". But
if the SMART_IDLE value is used, PM_VPE_PWRSTST LASTPOWERSTATEENTERED
bits always show value of 3.

Let's fix the issue by dropping SMART_IDLE for vpe. And let's also add
the missing the powerdomain for vpe.

Fixes: 1a2095160594 ("ARM: dts: dra7: Add ti-sysc node for VPE")
Cc: Benoit Parrot <bparrot@ti.com>
Reported-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -4189,11 +4189,11 @@ target-module@1d0010 {			/* 0x489d0000, ap 27 30.0 */
 			reg = <0x1d0010 0x4>;
 			reg-names = "sysc";
 			ti,sysc-midle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>;
+					<SYSC_IDLE_NO>;
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
 					<SYSC_IDLE_SMART>;
+			power-domains = <&prm_vpe>;
 			clocks = <&vpe_clkctrl DRA7_VPE_VPE_CLKCTRL 0>;
 			clock-names = "fck";
 			#address-cells = <1>;
-- 
2.35.1
