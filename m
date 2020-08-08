Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE06523F72D
	for <lists+linux-omap@lfdr.de>; Sat,  8 Aug 2020 12:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgHHKDS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 8 Aug 2020 06:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgHHKDS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 8 Aug 2020 06:03:18 -0400
Received: from ds0.me (ds0.me [IPv6:2602:ffc5::f9bc:b4ce])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 637BAC061756
        for <linux-omap@vger.kernel.org>; Sat,  8 Aug 2020 03:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ds0.me; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From; bh=9rm62jKdMOX2BycAqq8nJnYpDutiVhxvToh7SPsYLxo=;
        b=IElf/tL2t30N7TB/JovD7lNzq1lNcpd3vHr17OvI91Mc2a6m/TCzwEYJN04OG8fQ8xVY8WK21vHrbnZ4dVYWE+/PEnEYBwvH6Wkt6HAOLRdaySQrbQi5dGSqXAzLsDIX17p9tQFMoHh6LadhpC2pwmQ12WMZjCBz/QjBZ2GeTpE=;
Received: from 97e0b068.skybroadband.com ([151.224.176.104] helo=localhost.localdomain)
        by ds0.me with esmtpa (Exim 4.84_2)
        (envelope-from <dave@ds0.me>)
        id 1k4Lgw-0006FR-Tm; Sat, 08 Aug 2020 06:03:07 -0400
From:   David Shah <dave@ds0.me>
To:     letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org, tony@atomide.com
Subject: [PATCH] omap5: Fix reboot DPLL lock failure when using ABE TIMERs
Date:   Sat,  8 Aug 2020 11:02:50 +0100
Message-Id: <20200808100250.35076-1-dave@ds0.me>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Having the ABE DPLL ref and bypass muxes set to different inputs was
causing the DPLL not to lock  when TIMER8 was used, as it is in the Pyra
for the backlight.

This patch fixes this by setting abe_dpll_bypass_clk_mux to sys_32k_ck
in omap5xxx_dt_clk_init.

A similar patch may also be needed for OMAP44xx which has similar code
in omap4xxx_dt_clk_init, but I have not added this as I have no hardware
to test on.

Signed-off-by: David Shah <dave@ds0.me>
---
 drivers/clk/ti/clk-54xx.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk-54xx.c b/drivers/clk/ti/clk-54xx.c
index a4c5be533fbf..0a998e0e7d3b 100644
--- a/drivers/clk/ti/clk-54xx.c
+++ b/drivers/clk/ti/clk-54xx.c
@@ -617,7 +617,7 @@ static struct ti_dt_clk omap54xx_clks[] = {
 int __init omap5xxx_dt_clk_init(void)
 {
 	int rc;
-	struct clk *abe_dpll_ref, *abe_dpll, *sys_32k_ck, *usb_dpll;
+	struct clk *abe_dpll_ref, *abe_dpll, *abe_dpll_byp, *sys_32k_ck, *usb_dpll;
 
 	ti_dt_clocks_register(omap54xx_clks);
 
@@ -628,6 +628,16 @@ int __init omap5xxx_dt_clk_init(void)
 	abe_dpll_ref = clk_get_sys(NULL, "abe_dpll_clk_mux");
 	sys_32k_ck = clk_get_sys(NULL, "sys_32k_ck");
 	rc = clk_set_parent(abe_dpll_ref, sys_32k_ck);
+
+	/* 
+	 * This must also be set to sys_32k_ck to match or
+	 * the ABE DPLL will not lock on a warm reboot when
+	 * ABE timers are used.
+	*/
+	abe_dpll_byp = clk_get_sys(NULL, "abe_dpll_bypass_clk_mux");
+	if (!rc)
+		rc = clk_set_parent(abe_dpll_byp, sys_32k_ck);
+
 	abe_dpll = clk_get_sys(NULL, "dpll_abe_ck");
 	if (!rc)
 		rc = clk_set_rate(abe_dpll, OMAP5_DPLL_ABE_DEFFREQ);
-- 
2.27.0

