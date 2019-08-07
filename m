Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 306E884C5A
	for <lists+linux-omap@lfdr.de>; Wed,  7 Aug 2019 15:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388021AbfHGNFJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Aug 2019 09:05:09 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51486 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387476AbfHGNFJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Aug 2019 09:05:09 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77D564I056045;
        Wed, 7 Aug 2019 08:05:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565183106;
        bh=frBLaLQ0BrBJmM1vM+OF6FUfFxBudXkh00pQru7C5JM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=yhGRoa2lKVLMRRSFEke20CwxVEQdR6YaEARQTamupOkpFJl/NcCIGoyjnr8relvTQ
         ZFdVjcHV1rw7YlngjMlz1rb4vdw0LWzu2j3JWdBKf4KCU/NXzVJNA9q4u9aGoI/w/J
         v6ltniz+5H0/UBdRUa5dWnuJZcOaswoK0FJtHGho=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77D56aE039779
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 08:05:06 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 08:05:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 08:05:06 -0500
Received: from gomoku.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77D4i1e081508;
        Wed, 7 Aug 2019 08:05:03 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCH 2/3] clk: ti: dra7xx: remove idlest polling from disabling ipu/dsp clocks
Date:   Wed, 7 Aug 2019 16:04:38 +0300
Message-ID: <1565183079-27798-3-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
References: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

These cause some unwanted timeouts in the kernel, as they depend on
reset and the execution state of the remotecore itself. These details
should be handled by the driver with proper sequencing of events.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-7xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
index b57fe09..5208eb8 100644
--- a/drivers/clk/ti/clk-7xx.c
+++ b/drivers/clk/ti/clk-7xx.c
@@ -25,7 +25,7 @@
 };
 
 static const struct omap_clkctrl_reg_data dra7_dsp1_clkctrl_regs[] __initconst = {
-	{ DRA7_DSP1_MMU0_DSP1_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_dsp_m2_ck" },
+	{ DRA7_DSP1_MMU0_DSP1_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_NO_IDLE_POLL, "dpll_dsp_m2_ck" },
 	{ 0 },
 };
 
@@ -41,7 +41,7 @@
 };
 
 static const struct omap_clkctrl_reg_data dra7_ipu1_clkctrl_regs[] __initconst = {
-	{ DRA7_IPU1_MMU_IPU1_CLKCTRL, dra7_mmu_ipu1_bit_data, CLKF_HW_SUP, "ipu1-clkctrl:0000:24" },
+	{ DRA7_IPU1_MMU_IPU1_CLKCTRL, dra7_mmu_ipu1_bit_data, CLKF_HW_SUP | CLKF_NO_IDLE_POLL, "ipu1-clkctrl:0000:24" },
 	{ 0 },
 };
 
@@ -137,7 +137,7 @@
 };
 
 static const struct omap_clkctrl_reg_data dra7_dsp2_clkctrl_regs[] __initconst = {
-	{ DRA7_DSP2_MMU0_DSP2_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_dsp_m2_ck" },
+	{ DRA7_DSP2_MMU0_DSP2_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_NO_IDLE_POLL, "dpll_dsp_m2_ck" },
 	{ 0 },
 };
 
@@ -164,7 +164,7 @@
 };
 
 static const struct omap_clkctrl_reg_data dra7_ipu2_clkctrl_regs[] __initconst = {
-	{ DRA7_IPU2_MMU_IPU2_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_core_h22x2_ck" },
+	{ DRA7_IPU2_MMU_IPU2_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_NO_IDLE_POLL, "dpll_core_h22x2_ck" },
 	{ 0 },
 };
 
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
