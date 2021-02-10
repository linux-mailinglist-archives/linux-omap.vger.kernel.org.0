Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B79316138
	for <lists+linux-omap@lfdr.de>; Wed, 10 Feb 2021 09:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbhBJIjC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Feb 2021 03:39:02 -0500
Received: from muru.com ([72.249.23.125]:59702 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230166AbhBJIii (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 10 Feb 2021 03:38:38 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B185D80EB;
        Wed, 10 Feb 2021 08:38:13 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <kristo@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Yongqin Liu <yongqin.liu@linaro.org>
Subject: [PATCH] soc: ti: omap-prm: Fix reboot issue with invalid pcie reset map for dra7
Date:   Wed, 10 Feb 2021 10:37:51 +0200
Message-Id: <20210210083751.19202-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Yongqin Liu <yongqin.liu@linaro.org> reported an issue where reboot hangs
on beagleboard-x15. This started happening after commit 7078a5ba7a58
("soc: ti: omap-prm: Fix boot time errors for rst_map_012 bits 0 and 1").

We now assert any 012 type resets on init to prevent unconfigured
accelerator MMUs getting enabled on init depending on the bootloader or
kexec configured state.

Turns out that we now also wrongly assert dra7 l3init domain PCIe reset
bits causing a hang during reboot. Let's fix the l3init reset bits to
use a 01 map instead of 012 map. There are only two rstctrl bits and not
three. This is documented in TRM "Table 3-1647. RM_PCIESS_RSTCTRL".

Fixes: 5a68c87afde0 ("soc: ti: omap-prm: dra7: add genpd support for remaining PRM instances")
Fixes: 7078a5ba7a58 ("soc: ti: omap-prm: Fix boot time errors for rst_map_012 bits 0 and 1")
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Reported-by: Yongqin Liu <yongqin.liu@linaro.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/soc/ti/omap_prm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -332,7 +332,7 @@ static const struct omap_prm_data dra7_prm_data[] = {
 	{
 		.name = "l3init", .base = 0x4ae07300,
 		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_alwon,
-		.rstctrl = 0x10, .rstst = 0x14, .rstmap = rst_map_012,
+		.rstctrl = 0x10, .rstst = 0x14, .rstmap = rst_map_01,
 		.clkdm_name = "pcie"
 	},
 	{
-- 
2.30.1
