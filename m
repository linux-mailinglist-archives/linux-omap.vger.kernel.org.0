Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08AF7330D5A
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 13:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbhCHMV4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 07:21:56 -0500
Received: from muru.com ([72.249.23.125]:40794 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231681AbhCHMVe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 07:21:34 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2DF478192;
        Mon,  8 Mar 2021 12:22:14 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 2/4] soc: ti: omap-prm: Allow hardware supported retention when idle
Date:   Mon,  8 Mar 2021 14:21:16 +0200
Message-Id: <20210308122118.62460-3-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122118.62460-1-tony@atomide.com>
References: <20210308122118.62460-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When moving the l4 interconnect instances to probe with simple-pm-bus and
genpd, we will have l4per and core domains stop idling unless we configure
the domain bits to allow retention when idle.

As the TI SoCs have hardware autoidle capabilities, this is safe to do.
The domains will only enter retention on WFI when none of the devices on
the domain block autoidle in the hardware. This follows what we are
already currently doing.

Cc: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Tero Kristo <kristo@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/soc/ti/omap_prm.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -88,6 +88,7 @@ struct omap_reset_data {
 #define OMAP_PRM_HAS_RSTCTRL	BIT(0)
 #define OMAP_PRM_HAS_RSTST	BIT(1)
 #define OMAP_PRM_HAS_NO_CLKDM	BIT(2)
+#define OMAP_PRM_RET_WHEN_IDLE	BIT(3)
 
 #define OMAP_PRM_HAS_RESETS	(OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_RSTST)
 
@@ -174,7 +175,8 @@ static const struct omap_prm_data omap4_prm_data[] = {
 		.name = "core", .base = 0x4a306700,
 		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_reton,
 		.rstctrl = 0x210, .rstst = 0x214, .clkdm_name = "ducati",
-		.rstmap = rst_map_012
+		.rstmap = rst_map_012,
+		.flags = OMAP_PRM_RET_WHEN_IDLE,
 	},
 	{
 		.name = "ivahd", .base = 0x4a306f00,
@@ -199,7 +201,8 @@ static const struct omap_prm_data omap4_prm_data[] = {
 	},
 	{
 		.name = "l4per", .base = 0x4a307400,
-		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_reton
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_reton,
+		.flags = OMAP_PRM_RET_WHEN_IDLE,
 	},
 	{
 		.name = "cefuse", .base = 0x4a307600,
@@ -517,7 +520,7 @@ static int omap_prm_domain_power_on(struct generic_pm_domain *domain)
 {
 	struct omap_prm_domain *prmd;
 	int ret;
-	u32 v;
+	u32 v, mode;
 
 	prmd = genpd_to_prm_domain(domain);
 	if (!prmd->cap)
@@ -530,7 +533,12 @@ static int omap_prm_domain_power_on(struct generic_pm_domain *domain)
 	else
 		v = readl_relaxed(prmd->prm->base + prmd->pwrstctrl);
 
-	writel_relaxed(v | OMAP_PRMD_ON_ACTIVE,
+	if (prmd->prm->data->flags & OMAP_PRM_RET_WHEN_IDLE)
+		mode = OMAP_PRMD_RETENTION;
+	else
+		mode = OMAP_PRMD_ON_ACTIVE;
+
+	writel_relaxed((v & ~PRM_POWERSTATE_MASK) | mode,
 		       prmd->prm->base + prmd->pwrstctrl);
 
 	/* wait for the transition bit to get cleared */
-- 
2.30.1
