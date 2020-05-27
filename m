Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E8A1E44BD
	for <lists+linux-omap@lfdr.de>; Wed, 27 May 2020 15:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389024AbgE0Nzu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 May 2020 09:55:50 -0400
Received: from muru.com ([72.249.23.125]:55818 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388991AbgE0Nzu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 27 May 2020 09:55:50 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E5A1780DB;
        Wed, 27 May 2020 13:56:39 +0000 (UTC)
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
Subject: [PATCH] bus: ti-sysc: Flush posted write on enable and disable
Date:   Wed, 27 May 2020 06:55:39 -0700
Message-Id: <20200527135539.49059-1-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Looks like we're missing flush of posted write after module enable and
disable. I've seen occasional errors accessing various modules, and it
is suspected that the lack of posted writes can also cause random reboots.

The errors we can see are similar to the one below from spi for example:

44000000.ocp:L3 Custom Error: MASTER MPU TARGET L4CFG (Read): Data Access
in User mode during Functional access
...
mcspi_wait_for_reg_bit
omap2_mcspi_transfer_one
spi_transfer_one_message
...

We also want to also flush posted write for disable. The clkctrl clock
disable happens after module disable, and we don't want to have the
module potentially stay active while we're trying to disable the clock.

Fixes: d59b60564cbf ("bus: ti-sysc: Add generic enable/disable functions")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -991,6 +991,9 @@ static int sysc_enable_module(struct device *dev)
 		sysc_write_sysconfig(ddata, reg);
 	}
 
+	/* Flush posted write */
+	sysc_read(ddata, ddata->offsets[SYSC_SYSCONFIG]);
+
 	if (ddata->module_enable_quirk)
 		ddata->module_enable_quirk(ddata);
 
@@ -1071,6 +1074,9 @@ static int sysc_disable_module(struct device *dev)
 		reg |= 1 << regbits->autoidle_shift;
 	sysc_write_sysconfig(ddata, reg);
 
+	/* Flush posted write */
+	sysc_read(ddata, ddata->offsets[SYSC_SYSCONFIG]);
+
 	return 0;
 }
 
-- 
2.26.2
