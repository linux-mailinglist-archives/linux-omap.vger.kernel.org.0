Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8DB41D59D
	for <lists+linux-omap@lfdr.de>; Thu, 30 Sep 2021 10:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348117AbhI3Iqk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Sep 2021 04:46:40 -0400
Received: from muru.com ([72.249.23.125]:39106 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348097AbhI3Iqj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Sep 2021 04:46:39 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0FB318050;
        Thu, 30 Sep 2021 08:45:24 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] bus: ti-sysc: Use CLKDM_NOAUTO for dra7 dcan1 for errata i893
Date:   Thu, 30 Sep 2021 11:44:51 +0300
Message-Id: <20210930084452.63762-1-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit 94f6345712b3 ("bus: ti-sysc: Implement quirk handling for
CLKDM_NOAUTO") should have also added the quirk for dra7 dcan1 in
addition to dcan2 for errata i893 handling.

Let's also pass the quirk flag for legacy mode booting for if "ti,hwmods"
dts property is used with related dcan hwmod data. This should be only
needed if anybody needs to git bisect earlier stable trees though.

Fixes: 94f6345712b3 ("bus: ti-sysc: Implement quirk handling for CLKDM_NOAUTO")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/omap_hwmod.c | 2 ++
 drivers/bus/ti-sysc.c            | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -3614,6 +3614,8 @@ int omap_hwmod_init_module(struct device *dev,
 		oh->flags |= HWMOD_SWSUP_SIDLE_ACT;
 	if (data->cfg->quirks & SYSC_QUIRK_SWSUP_MSTANDBY)
 		oh->flags |= HWMOD_SWSUP_MSTANDBY;
+	if (data->cfg->quirks & SYSC_QUIRK_CLKDM_NOAUTO)
+		oh->flags |= HWMOD_CLKDM_NOAUTO;
 
 	error = omap_hwmod_check_module(dev, oh, data, sysc_fields,
 					rev_offs, sysc_offs, syss_offs,
diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1468,6 +1468,9 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	/* Quirks that need to be set based on detected module */
 	SYSC_QUIRK("aess", 0, 0, 0x10, -ENODEV, 0x40000000, 0xffffffff,
 		   SYSC_MODULE_QUIRK_AESS),
+	/* Errata i893 handling for dra7 dcan1 and 2 */
+	SYSC_QUIRK("dcan", 0x4ae3c000, 0x20, -ENODEV, -ENODEV, 0xa3170504, 0xffffffff,
+		   SYSC_QUIRK_CLKDM_NOAUTO),
 	SYSC_QUIRK("dcan", 0x48480000, 0x20, -ENODEV, -ENODEV, 0xa3170504, 0xffffffff,
 		   SYSC_QUIRK_CLKDM_NOAUTO),
 	SYSC_QUIRK("dss", 0x4832a000, 0, 0x10, 0x14, 0x00000020, 0xffffffff,
-- 
2.33.0
