Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 725D615DEEA
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 17:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390273AbgBNQF6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Feb 2020 11:05:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:56160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389483AbgBNQF6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 14 Feb 2020 11:05:58 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1557B2067D;
        Fri, 14 Feb 2020 16:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581696357;
        bh=GOeJ1Am3Wg4tRNg8HglrIbM7WUIYtK8v9/ojJJPnBX8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Pn+6osZw2jhvQVwKkAjA9lqiCcgu02EF9Wfr0VgIUV24UkykHiJ3HqUaTf00ZZCMO
         8Xl4xAQPtAfFf+yTKq/Mcqo/eRw2/nGcVJ+2Zj7YBIgA+hu4MclTQu2asZOQfUvzLf
         zzwLOSBMc0FA96fd3SODPq2D26TQbOir1F2wuml0=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>,
        Sasha Levin <sashal@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 190/459] ARM: OMAP2+: pdata-quirks: add PRM data for reset support
Date:   Fri, 14 Feb 2020 10:57:20 -0500
Message-Id: <20200214160149.11681-190-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tero Kristo <t-kristo@ti.com>

[ Upstream commit 8de44fb70659a5bc0c53a443e6129ea1bf00fd8b ]

The parent clockdomain for reset must be in force wakeup mode, otherwise
the reset may never complete. Add pdata quirks for this purpose for PRM
driver.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
Acked-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/mach-omap2/pdata-quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
index 247e3f8acffe6..2657752b90670 100644
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -24,6 +24,7 @@
 #include <linux/platform_data/ti-sysc.h>
 #include <linux/platform_data/wkup_m3.h>
 #include <linux/platform_data/asoc-ti-mcbsp.h>
+#include <linux/platform_data/ti-prm.h>
 
 #include "clockdomain.h"
 #include "common.h"
@@ -463,6 +464,12 @@ void omap_pcs_legacy_init(int irq, void (*rearm)(void))
 	pcs_pdata.rearm = rearm;
 }
 
+static struct ti_prm_platform_data ti_prm_pdata = {
+	.clkdm_deny_idle = clkdm_deny_idle,
+	.clkdm_allow_idle = clkdm_allow_idle,
+	.clkdm_lookup = clkdm_lookup,
+};
+
 /*
  * GPIOs for TWL are initialized by the I2C bus and need custom
  * handing until DSS has device tree bindings.
@@ -565,6 +572,7 @@ static struct of_dev_auxdata omap_auxdata_lookup[] = {
 	/* Common auxdata */
 	OF_DEV_AUXDATA("ti,sysc", 0, NULL, &ti_sysc_pdata),
 	OF_DEV_AUXDATA("pinctrl-single", 0, NULL, &pcs_pdata),
+	OF_DEV_AUXDATA("ti,omap-prm-inst", 0, NULL, &ti_prm_pdata),
 	{ /* sentinel */ },
 };
 
-- 
2.20.1

