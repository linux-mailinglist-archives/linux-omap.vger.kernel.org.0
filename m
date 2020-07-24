Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635E022BFD7
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbgGXHmy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:42:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:36882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726617AbgGXHmy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:42:54 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B5ED420748;
        Fri, 24 Jul 2020 07:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576573;
        bh=2Rm5mXLPGu2klynxz/wgAlx0P00OyT74+wkJ2mwUL2k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=t7ZFTeXFvEV2cZHuvz+CymGUEumDZ2dHE5mdLJexSCZUCdJ5l/koZErDREG867iAf
         af3T+CNQkO+IJM2dMIHzDozQEm4JRVZ7LeccpWIQ4lvzhc0tjZnQsm2g0hTbIo5wiD
         Jy4mu6SdpYNoiL7kcOjp1FIUQ23Ib1hA00VJR4Ss=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT v2 21/29] memory: omap-gpmc: Remove GPMC_SET_ONE_CD_MAX macro for safety
Date:   Fri, 24 Jul 2020 09:40:30 +0200
Message-Id: <20200724074038.5597-22-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The GPMC_SET_ONE_CD_MAX macro uses return statement and variable 'cs'
coming from called scope.  This is not a good practice.  Also
checkpatch complained:

    WARNING: Macros with flow control statements should be avoided
    ERROR: Macros starting with if should be enclosed by a do - while
        loop to avoid possible if/else logic defects

Since GPMC_SET_ONE_CD_MAX macro just calls one function, it can be open
coded.  The difference with original code is that function will exit on
error not after every register set, but after a group of sets.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Not tested

Changes since v1:
1. Drop the macro, after comments from Arnd.
---
 drivers/memory/omap-gpmc.c | 137 +++++++++++++++++++++++++------------
 1 file changed, 93 insertions(+), 44 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 1e370142dfca..2a2d0297e071 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -635,14 +635,6 @@ static int set_gpmc_timing_reg(int cs, int reg, int st_bit, int end_bit, int max
 	return 0;
 }
 
-#define GPMC_SET_ONE_CD_MAX(reg, st, end, max, field, cd)  \
-	if (set_gpmc_timing_reg(cs, (reg), (st), (end), (max), \
-	    t->field, (cd), #field) < 0)                       \
-		return -ENXIO
-
-#define GPMC_SET_ONE(reg, st, end, field) \
-	GPMC_SET_ONE_CD_MAX(reg, st, end, 0, field, GPMC_CD_FCLK)
-
 /**
  * gpmc_calc_waitmonitoring_divider - calculate proper GPMCFCLKDIVIDER based on WAITMONITORINGTIME
  * WAITMONITORINGTIME will be _at least_ as long as desired, i.e.
@@ -703,7 +695,7 @@ int gpmc_calc_divider(unsigned int sync_clk)
 int gpmc_cs_set_timings(int cs, const struct gpmc_timings *t,
 			const struct gpmc_settings *s)
 {
-	int div;
+	int div, ret;
 	u32 l;
 
 	div = gpmc_calc_divider(t->sync_clk);
@@ -737,53 +729,110 @@ int gpmc_cs_set_timings(int cs, const struct gpmc_timings *t,
 		}
 	}
 
-	GPMC_SET_ONE(GPMC_CS_CONFIG2,  0,  3, cs_on);
-	GPMC_SET_ONE(GPMC_CS_CONFIG2,  8, 12, cs_rd_off);
-	GPMC_SET_ONE(GPMC_CS_CONFIG2, 16, 20, cs_wr_off);
+	ret = 0;
+	ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2, 0, 3, 0, t->cs_on,
+				   GPMC_CD_FCLK, "cs_on");
+	ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2, 8, 12, 0, t->cs_rd_off,
+				   GPMC_CD_FCLK, "cs_rd_off");
+	ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2, 16, 20, 0, t->cs_wr_off,
+				   GPMC_CD_FCLK, "cs_wr_off");
+	if (ret)
+		return -ENXIO;
+
+	ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG3, 0, 3, 0, t->adv_on,
+				   GPMC_CD_FCLK, "adv_on");
+	ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG3, 8, 12, 0, t->adv_rd_off,
+				   GPMC_CD_FCLK, "adv_rd_off");
+	ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG3, 16, 20, 0, t->adv_wr_off,
+				   GPMC_CD_FCLK, "adv_wr_off");
+	if (ret)
+		return -ENXIO;
 
-	GPMC_SET_ONE(GPMC_CS_CONFIG3,  0,  3, adv_on);
-	GPMC_SET_ONE(GPMC_CS_CONFIG3,  8, 12, adv_rd_off);
-	GPMC_SET_ONE(GPMC_CS_CONFIG3, 16, 20, adv_wr_off);
 	if (gpmc_capability & GPMC_HAS_MUX_AAD) {
-		GPMC_SET_ONE(GPMC_CS_CONFIG3,  4,  6, adv_aad_mux_on);
-		GPMC_SET_ONE(GPMC_CS_CONFIG3, 24, 26, adv_aad_mux_rd_off);
-		GPMC_SET_ONE(GPMC_CS_CONFIG3, 28, 30, adv_aad_mux_wr_off);
+		ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG3, 4, 6, 0,
+					   t->adv_aad_mux_on, GPMC_CD_FCLK,
+					   "adv_aad_mux_on");
+		ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG3, 24, 26, 0,
+					   t->adv_aad_mux_rd_off, GPMC_CD_FCLK,
+					   "adv_aad_mux_rd_off");
+		ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG3, 28, 30, 0,
+					   t->adv_aad_mux_wr_off, GPMC_CD_FCLK,
+					   "adv_aad_mux_wr_off");
+		if (ret)
+			return -ENXIO;
 	}
 
-	GPMC_SET_ONE(GPMC_CS_CONFIG4,  0,  3, oe_on);
-	GPMC_SET_ONE(GPMC_CS_CONFIG4,  8, 12, oe_off);
+	ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG4, 0, 3, 0, t->oe_on,
+				   GPMC_CD_FCLK, "oe_on");
+	ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG4, 8, 12, 0, t->oe_off,
+				   GPMC_CD_FCLK, "oe_off");
 	if (gpmc_capability & GPMC_HAS_MUX_AAD) {
-		GPMC_SET_ONE(GPMC_CS_CONFIG4,  4,  6, oe_aad_mux_on);
-		GPMC_SET_ONE(GPMC_CS_CONFIG4, 13, 15, oe_aad_mux_off);
+		ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG4, 4, 6, 0,
+					   t->oe_aad_mux_on, GPMC_CD_FCLK,
+					   "oe_aad_mux_on");
+		ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG4, 13, 15, 0,
+					   t->oe_aad_mux_off, GPMC_CD_FCLK,
+					   "oe_aad_mux_off");
+	}
+	ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG4, 16, 19, 0, t->we_on,
+				   GPMC_CD_FCLK, "we_on");
+	ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG4, 24, 28, 0, t->we_off,
+				   GPMC_CD_FCLK, "we_off");
+	if (ret)
+		return -ENXIO;
+
+	ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG5, 0, 4, 0, t->rd_cycle,
+				   GPMC_CD_FCLK, "rd_cycle");
+	ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG5, 8, 12, 0, t->wr_cycle,
+				   GPMC_CD_FCLK, "wr_cycle");
+	ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG5, 16, 20, 0, t->access,
+				   GPMC_CD_FCLK, "access");
+	ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG5, 24, 27, 0,
+				   t->page_burst_access, GPMC_CD_FCLK,
+				   "page_burst_access");
+	if (ret)
+		return -ENXIO;
+
+	ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG6, 0, 3, 0,
+				   t->bus_turnaround, GPMC_CD_FCLK,
+				   "bus_turnaround");
+	ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG6, 8, 11, 0,
+				   t->cycle2cycle_delay, GPMC_CD_FCLK,
+				   "cycle2cycle_delay");
+	if (ret)
+		return -ENXIO;
+
+	if (gpmc_capability & GPMC_HAS_WR_DATA_MUX_BUS) {
+		ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG6, 16, 19, 0,
+					   t->wr_data_mux_bus, GPMC_CD_FCLK,
+					   "wr_data_mux_bus");
+		if (ret)
+			return -ENXIO;
+	}
+	if (gpmc_capability & GPMC_HAS_WR_ACCESS) {
+		ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG6, 24, 28, 0,
+					   t->wr_access, GPMC_CD_FCLK,
+					   "wr_access");
+		if (ret)
+			return -ENXIO;
 	}
-	GPMC_SET_ONE(GPMC_CS_CONFIG4, 16, 19, we_on);
-	GPMC_SET_ONE(GPMC_CS_CONFIG4, 24, 28, we_off);
-
-	GPMC_SET_ONE(GPMC_CS_CONFIG5,  0,  4, rd_cycle);
-	GPMC_SET_ONE(GPMC_CS_CONFIG5,  8, 12, wr_cycle);
-	GPMC_SET_ONE(GPMC_CS_CONFIG5, 16, 20, access);
-
-	GPMC_SET_ONE(GPMC_CS_CONFIG5, 24, 27, page_burst_access);
-
-	GPMC_SET_ONE(GPMC_CS_CONFIG6, 0, 3, bus_turnaround);
-	GPMC_SET_ONE(GPMC_CS_CONFIG6, 8, 11, cycle2cycle_delay);
-
-	if (gpmc_capability & GPMC_HAS_WR_DATA_MUX_BUS)
-		GPMC_SET_ONE(GPMC_CS_CONFIG6, 16, 19, wr_data_mux_bus);
-	if (gpmc_capability & GPMC_HAS_WR_ACCESS)
-		GPMC_SET_ONE(GPMC_CS_CONFIG6, 24, 28, wr_access);
 
 	l = gpmc_cs_read_reg(cs, GPMC_CS_CONFIG1);
 	l &= ~0x03;
 	l |= (div - 1);
 	gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, l);
 
-	GPMC_SET_ONE_CD_MAX(GPMC_CS_CONFIG1, 18, 19,
-			    GPMC_CONFIG1_WAITMONITORINGTIME_MAX,
-			    wait_monitoring, GPMC_CD_CLK);
-	GPMC_SET_ONE_CD_MAX(GPMC_CS_CONFIG1, 25, 26,
-			    GPMC_CONFIG1_CLKACTIVATIONTIME_MAX,
-			    clk_activation, GPMC_CD_FCLK);
+	ret = 0;
+	ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG1, 18, 19,
+				   GPMC_CONFIG1_WAITMONITORINGTIME_MAX,
+				   t->wait_monitoring, GPMC_CD_CLK,
+				   "wait_monitoring");
+	ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG1, 25, 26,
+				   GPMC_CONFIG1_CLKACTIVATIONTIME_MAX,
+				   t->clk_activation, GPMC_CD_FCLK,
+				   "clk_activation");
+	if (ret)
+		return -ENXIO;
 
 #ifdef CONFIG_OMAP_GPMC_DEBUG
 	pr_info("GPMC CS%d CLK period is %lu ns (div %d)\n",
-- 
2.17.1

