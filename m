Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02EEA298B66
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1773111AbgJZLLB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:11:01 -0400
Received: from muru.com ([72.249.23.125]:46498 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1772586AbgJZLLA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:11:00 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id F14E48196;
        Mon, 26 Oct 2020 11:11:01 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 1/9] ARM: OMAP2+: Check for inited flag
Date:   Mon, 26 Oct 2020 13:10:41 +0200
Message-Id: <20201026111049.54835-2-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026111049.54835-1-tony@atomide.com>
References: <20201026111049.54835-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If we have no hwmods configured and omap_hwmod_init() is not called,
we don't want to call omap_hwmod_setup_all() as it will fail with
checks for configured MPU at least.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/omap_hwmod.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -627,6 +627,9 @@ static struct clockdomain *_get_clkdm(struct omap_hwmod *oh)
 {
 	struct clk_hw_omap *clk;
 
+	if (!oh)
+		return NULL;
+
 	if (oh->clkdm) {
 		return oh->clkdm;
 	} else if (oh->_clk) {
@@ -3677,6 +3680,9 @@ static void __init omap_hwmod_setup_earlycon_flags(void)
  */
 static int __init omap_hwmod_setup_all(void)
 {
+	if (!inited)
+		return 0;
+
 	_ensure_mpu_hwmod_is_setup(NULL);
 
 	omap_hwmod_for_each(_init, NULL);
-- 
2.29.1
