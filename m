Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BDB01687DB
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 20:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbgBUTxQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 14:53:16 -0500
Received: from muru.com ([72.249.23.125]:56882 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728028AbgBUTxN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 Feb 2020 14:53:13 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 42F958192;
        Fri, 21 Feb 2020 19:53:57 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 3/7] ti-sysc: Improve reset to work with modules with no sysconfig
Date:   Fri, 21 Feb 2020 11:52:52 -0800
Message-Id: <20200221195256.54016-4-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200221195256.54016-1-tony@atomide.com>
References: <20200221195256.54016-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

At least display susbsystem (DSS) has modules with no sysconfig registers
and rely on custom function for module reset handling. Let's make reset
work with that too.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1571,7 +1571,7 @@ static int sysc_reset(struct sysc *ddata)
 	sysc_offset = ddata->offsets[SYSC_SYSCONFIG];
 	syss_offset = ddata->offsets[SYSC_SYSSTATUS];
 
-	if (ddata->legacy_mode || sysc_offset < 0 ||
+	if (ddata->legacy_mode ||
 	    ddata->cap->regbits->srst_shift < 0 ||
 	    ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT)
 		return 0;
@@ -1586,9 +1586,11 @@ static int sysc_reset(struct sysc *ddata)
 	if (ddata->pre_reset_quirk)
 		ddata->pre_reset_quirk(ddata);
 
-	sysc_val = sysc_read_sysconfig(ddata);
-	sysc_val |= sysc_mask;
-	sysc_write(ddata, sysc_offset, sysc_val);
+	if (sysc_offset >= 0) {
+		sysc_val = sysc_read_sysconfig(ddata);
+		sysc_val |= sysc_mask;
+		sysc_write(ddata, sysc_offset, sysc_val);
+	}
 
 	if (ddata->cfg.srst_udelay)
 		usleep_range(ddata->cfg.srst_udelay,
-- 
2.25.1
