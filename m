Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A64C841310D
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 12:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbhIUKDD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 06:03:03 -0400
Received: from muru.com ([72.249.23.125]:35438 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231586AbhIUKDC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 06:03:02 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5264F8207;
        Tue, 21 Sep 2021 10:02:00 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/9] bus: ti-sysc: Add quirk handling for reset on re-init
Date:   Tue, 21 Sep 2021 13:01:10 +0300
Message-Id: <20210921100115.59865-5-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921100115.59865-1-tony@atomide.com>
References: <20210921100115.59865-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

At least am335x gpmc module needs a reset in addition to re-init on resume.
Let's add a quirk handling for reset on re-init.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c                 | 10 ++++++++++
 include/linux/platform_data/ti-sysc.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -157,6 +157,7 @@ struct sysc {
 
 static void sysc_parse_dts_quirks(struct sysc *ddata, struct device_node *np,
 				  bool is_child);
+static int sysc_reset(struct sysc *ddata);
 
 static void sysc_write(struct sysc *ddata, int offset, u32 value)
 {
@@ -1440,6 +1441,15 @@ static int sysc_reinit_module(struct sysc *ddata, bool leave_enabled)
 	if (error)
 		dev_warn(dev, "reinit resume failed: %i\n", error);
 
+	/* Some modules like am335x gpmc need reset and restore of sysconfig */
+	if (ddata->cfg.quirks & SYSC_QUIRK_RESET_ON_CTX_LOST) {
+		error = sysc_reset(ddata);
+		if (error)
+			dev_warn(dev, "reinit reset failed: %i\n", error);
+
+		sysc_write_sysconfig(ddata, ddata->sysconfig);
+	}
+
 	if (leave_enabled)
 		return error;
 
diff --git a/include/linux/platform_data/ti-sysc.h b/include/linux/platform_data/ti-sysc.h
--- a/include/linux/platform_data/ti-sysc.h
+++ b/include/linux/platform_data/ti-sysc.h
@@ -50,6 +50,7 @@ struct sysc_regbits {
 	s8 emufree_shift;
 };
 
+#define SYSC_QUIRK_RESET_ON_CTX_LOST	BIT(29)
 #define SYSC_QUIRK_REINIT_ON_CTX_LOST	BIT(28)
 #define SYSC_QUIRK_REINIT_ON_RESUME	BIT(27)
 #define SYSC_QUIRK_GPMC_DEBUG		BIT(26)
-- 
2.33.0
