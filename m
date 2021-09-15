Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 354DB40BFD2
	for <lists+linux-omap@lfdr.de>; Wed, 15 Sep 2021 08:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbhIOGv7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Sep 2021 02:51:59 -0400
Received: from muru.com ([72.249.23.125]:33112 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231195AbhIOGv7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Sep 2021 02:51:59 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 271D680C3;
        Wed, 15 Sep 2021 06:51:04 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH] bus: ti-sysc: Fix external abort for am335x pruss probe
Date:   Wed, 15 Sep 2021 09:50:32 +0300
Message-Id: <20210915065032.45013-1-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Starting with v5.15-rc1, I'm now seeing am335x beaglebone black produce
the following error on pruss probe:

Unhandled fault: external abort on non-linefetch (0x1008) at 0xe0326000

This seems to have started with the enabling of pruss for am335x in the
dts files. Adding a read-back after write to the sysconfig register fixes
the issue for me.

Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -2037,6 +2037,9 @@ static int sysc_reset(struct sysc *ddata)
 		sysc_val = sysc_read_sysconfig(ddata);
 		sysc_val |= sysc_mask;
 		sysc_write(ddata, sysc_offset, sysc_val);
+
+		/* Flush posted write */
+		sysc_read_sysconfig(ddata);
 	}
 
 	if (ddata->cfg.srst_udelay)
-- 
2.33.0
