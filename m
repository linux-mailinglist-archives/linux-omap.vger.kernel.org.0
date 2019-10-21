Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB25DF6D1
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 22:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729388AbfJUUgn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 16:36:43 -0400
Received: from muru.com ([72.249.23.125]:38742 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726672AbfJUUgm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Oct 2019 16:36:42 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E936A80CC;
        Mon, 21 Oct 2019 20:37:15 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] bus: ti-sysc: Handle mstandby quirk and use it for musb
Date:   Mon, 21 Oct 2019 13:36:38 -0700
Message-Id: <20191021203638.4605-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We need swsup quirks for sidle and mstandby for musb to work
properly.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -917,6 +917,9 @@ static int sysc_enable_module(struct device *dev)
 		return -EINVAL;
 	}
 
+	if (ddata->cfg.quirks & SYSC_QUIRK_SWSUP_MSTANDBY)
+		best_mode = SYSC_IDLE_NO;
+
 	reg &= ~(SYSC_IDLE_MASK << regbits->midle_shift);
 	reg |= best_mode << regbits->midle_shift;
 	sysc_write(ddata, ddata->offsets[SYSC_SYSCONFIG], reg);
@@ -978,6 +981,9 @@ static int sysc_disable_module(struct device *dev)
 		return ret;
 	}
 
+	if (ddata->cfg.quirks & SYSC_QUIRK_SWSUP_MSTANDBY)
+		best_mode = SYSC_IDLE_FORCE;
+
 	reg &= ~(SYSC_IDLE_MASK << regbits->midle_shift);
 	reg |= best_mode << regbits->midle_shift;
 	sysc_write(ddata, ddata->offsets[SYSC_SYSCONFIG], reg);
@@ -1251,6 +1257,8 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("gpu", 0x50000000, 0x14, -1, -1, 0x00010201, 0xffffffff, 0),
 	SYSC_QUIRK("gpu", 0x50000000, 0xfe00, 0xfe10, -1, 0x40000000 , 0xffffffff,
 		   SYSC_MODULE_QUIRK_SGX),
+	SYSC_QUIRK("usb_otg_hs", 0, 0x400, 0x404, 0x408, 0x00000050,
+		   0xffffffff, SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
 	SYSC_QUIRK("wdt", 0, 0, 0x10, 0x14, 0x502a0500, 0xfffff0f0,
 		   SYSC_MODULE_QUIRK_WDT),
 	/* Watchdog on am3 and am4 */
@@ -1309,8 +1317,6 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	SYSC_QUIRK("usbhstll", 0, 0, 0x10, 0x14, 0x00000008, 0xffffffff, 0),
 	SYSC_QUIRK("usb_host_hs", 0, 0, 0x10, 0x14, 0x50700100, 0xffffffff, 0),
 	SYSC_QUIRK("usb_host_hs", 0, 0, 0x10, -1, 0x50700101, 0xffffffff, 0),
-	SYSC_QUIRK("usb_otg_hs", 0, 0x400, 0x404, 0x408, 0x00000050,
-		   0xffffffff, 0),
 	SYSC_QUIRK("vfpe", 0, 0, 0x104, -1, 0x4d001200, 0xffffffff, 0),
 #endif
 };
-- 
2.23.0
