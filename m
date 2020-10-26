Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC1B298B2D
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1772509AbgJZLAA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:00:00 -0400
Received: from muru.com ([72.249.23.125]:46462 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1772785AbgJZK6i (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 06:58:38 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E00FB8196;
        Mon, 26 Oct 2020 10:58:40 +0000 (UTC)
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
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] bus: ti-sysc: Fix bogus resetdone warning for cpsw
Date:   Mon, 26 Oct 2020 12:58:12 +0200
Message-Id: <20201026105812.38418-5-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026105812.38418-1-tony@atomide.com>
References: <20201026105812.38418-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The cpsw SOFT_RESET register is cleard when out of reset so let's
add SYSS_QUIRK_RESETDONE_INVERTED flag for cpsw. Otherwise we will
get bogus "OCP softreset timed out" warnings on boot.

Fixes: d46f9fbec719 ("bus: ti-sysc: Use optional clocks on for enable and wait for softreset bit")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1364,6 +1364,8 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	/* Quirks that need to be set based on detected module */
 	SYSC_QUIRK("aess", 0, 0, 0x10, -ENODEV, 0x40000000, 0xffffffff,
 		   SYSC_MODULE_QUIRK_AESS),
+	SYSC_QUIRK("cpgmac", 0, 0x1200, 0x1208, 0x1204, 0x4edb1902,
+		   0xffff00f0, SYSS_QUIRK_RESETDONE_INVERTED),
 	SYSC_QUIRK("dcan", 0x48480000, 0x20, -ENODEV, -ENODEV, 0xa3170504, 0xffffffff,
 		   SYSC_QUIRK_CLKDM_NOAUTO),
 	SYSC_QUIRK("dss", 0x4832a000, 0, 0x10, 0x14, 0x00000020, 0xffffffff,
@@ -1423,8 +1425,6 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("atl", 0, 0, -ENODEV, -ENODEV, 0x0a070100, 0xffffffff, 0),
 	SYSC_QUIRK("cm", 0, 0, -ENODEV, -ENODEV, 0x40000301, 0xffffffff, 0),
 	SYSC_QUIRK("control", 0, 0, 0x10, -ENODEV, 0x40000900, 0xffffffff, 0),
-	SYSC_QUIRK("cpgmac", 0, 0x1200, 0x1208, 0x1204, 0x4edb1902,
-		   0xffff00f0, 0),
 	SYSC_QUIRK("dcan", 0, 0x20, -ENODEV, -ENODEV, 0xa3170504, 0xffffffff, 0),
 	SYSC_QUIRK("dcan", 0, 0x20, -ENODEV, -ENODEV, 0x4edb1902, 0xffffffff, 0),
 	SYSC_QUIRK("dispc", 0x4832a400, 0, 0x10, 0x14, 0x00000030, 0xffffffff, 0),
-- 
2.29.1
