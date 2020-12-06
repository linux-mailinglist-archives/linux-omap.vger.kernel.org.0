Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C30F92D034E
	for <lists+linux-omap@lfdr.de>; Sun,  6 Dec 2020 12:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgLFLWI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 6 Dec 2020 06:22:08 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:8834 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbgLFLWI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 6 Dec 2020 06:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1607253553;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=kqewSCjE+8blrc/kjg2xlvB1LONhp0VFAK2g/S1PWe4=;
        b=XtLZo3U6QvewwCYdX+IaLsBvOhOlGnYmUldwPbRvjhaigyMU9JZHznrfoFoeY+ljRq
        4bF28G7moyM+wfqmkFgvVtH0e+1kHdpyjw5P0yoaqEcq6GQ/0rnYERPSMQ1KkdemZ6wn
        9/M6CHywrsQQtuYcCvvh4uXwodhnnGtS9sIAURoqxD8bOYL0jPIIw16MWPfgxyUIdJLl
        jBm46fhauSRgkfy8BEuYoonz9WPRzKZ7MK8MiLtiQBtvjY2QdGg49emzrLf3ouBoHQS3
        9OAeteH7lfz38uFT/X/XCwGUe+U3wGK5YBy4yGYcncODxYTqOXHOHlv9aLwB/aoItRK/
        qPsw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6G1+fL0A="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
        with ESMTPSA id N02faawB6BIqlQk
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 6 Dec 2020 12:18:52 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Tero Kristo <t-kristo@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, David Shah <dave@ds0.me>,
        tony@atomide.com, "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH] clk: ti: omap5: Fix reboot DPLL lock failure when using ABE TIMERs
Date:   Sun,  6 Dec 2020 12:18:51 +0100
Message-Id: <1d3abe2512054866cc2ea7b2592238f4fa06502a.1607253531.git.hns@goldelico.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: David Shah <dave@ds0.me>

Having the ABE DPLL ref and bypass muxes set to different inputs was
causing the DPLL not to lock when TIMER8 was used, as it is in the Pyra
for the backlight.

This patch fixes this by setting abe_dpll_bypass_clk_mux to sys_32k_ck
in omap5xxx_dt_clk_init.

A similar patch may also be needed for OMAP44xx which has similar code
in omap4xxx_dt_clk_init, but I have not added this as I have no hardware
to test on.

Signed-off-by: David Shah <dave@ds0.me>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/clk/ti/clk-54xx.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk-54xx.c b/drivers/clk/ti/clk-54xx.c
index 8694bc9f5fc7f..f0542391ca4bd 100644
--- a/drivers/clk/ti/clk-54xx.c
+++ b/drivers/clk/ti/clk-54xx.c
@@ -605,7 +605,7 @@ static struct ti_dt_clk omap54xx_clks[] = {
 int __init omap5xxx_dt_clk_init(void)
 {
 	int rc;
-	struct clk *abe_dpll_ref, *abe_dpll, *sys_32k_ck, *usb_dpll;
+	struct clk *abe_dpll_ref, *abe_dpll, *abe_dpll_byp, *sys_32k_ck, *usb_dpll;
 
 	ti_dt_clocks_register(omap54xx_clks);
 
@@ -616,6 +616,16 @@ int __init omap5xxx_dt_clk_init(void)
 	abe_dpll_ref = clk_get_sys(NULL, "abe_dpll_clk_mux");
 	sys_32k_ck = clk_get_sys(NULL, "sys_32k_ck");
 	rc = clk_set_parent(abe_dpll_ref, sys_32k_ck);
+
+	/*
+	 * This must also be set to sys_32k_ck to match or
+	 * the ABE DPLL will not lock on a warm reboot when
+	 * ABE timers are used.
+	 */
+	abe_dpll_byp = clk_get_sys(NULL, "abe_dpll_bypass_clk_mux");
+	if (!rc)
+		rc = clk_set_parent(abe_dpll_byp, sys_32k_ck);
+
 	abe_dpll = clk_get_sys(NULL, "dpll_abe_ck");
 	if (!rc)
 		rc = clk_set_rate(abe_dpll, OMAP5_DPLL_ABE_DEFFREQ);
-- 
2.26.2

