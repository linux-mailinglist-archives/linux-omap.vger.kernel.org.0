Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52D80212B83
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jul 2020 19:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbgGBRte (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jul 2020 13:49:34 -0400
Received: from muru.com ([72.249.23.125]:60468 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726754AbgGBRtd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Jul 2020 13:49:33 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E431F80B0;
        Thu,  2 Jul 2020 17:50:25 +0000 (UTC)
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
Subject: [PATCH 2/2] bus: ti-sysc: Fix sleeping function called from invalid context for RTC quirk
Date:   Thu,  2 Jul 2020 10:49:29 -0700
Message-Id: <20200702174929.26506-2-tony@atomide.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702174929.26506-1-tony@atomide.com>
References: <20200702174929.26506-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With CONFIG_DEBUG_ATOMIC_SLEEP enabled we can see the following with RTC probe:

BUG: sleeping function called from invalid context at drivers/bus/ti-sysc.c:1736
...
(sysc_quirk_rtc) from [<c060d01c>] (sysc_write_sysconfig+0x1c/0x60)
(sysc_write_sysconfig) from [<c060d9f4>] (sysc_enable_module+0x11c/0x274)
(sysc_enable_module) from [<c060f37c>] (sysc_probe+0xe9c/0x1380)
(sysc_probe) from [<c06e9384>] (platform_drv_probe+0x48/0x98)

Fixes: e8639e1c986a ("bus: ti-sysc: Handle module unlock quirk needed for some RTC")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1727,8 +1727,8 @@ static void sysc_quirk_rtc(struct sysc *ddata, bool lock)
 
 	local_irq_save(flags);
 	/* RTC_STATUS BUSY bit may stay active for 1/32768 seconds (~30 usec) */
-	error = readl_poll_timeout(ddata->module_va + 0x44, val,
-				   !(val & BIT(0)), 100, 50);
+	error = readl_poll_timeout_atomic(ddata->module_va + 0x44, val,
+					  !(val & BIT(0)), 100, 50);
 	if (error)
 		dev_warn(ddata->dev, "rtc busy timeout\n");
 	/* Now we have ~15 microseconds to read/write various registers */
-- 
2.27.0
