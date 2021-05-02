Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6BC370C19
	for <lists+linux-omap@lfdr.de>; Sun,  2 May 2021 16:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232797AbhEBOFU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 2 May 2021 10:05:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:50382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232688AbhEBOFJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 2 May 2021 10:05:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D7A6613DC;
        Sun,  2 May 2021 14:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619964253;
        bh=v5XGusImn6QmKPp8HJBTBjOXUorUWO8M4g+OdsIfnys=;
        h=From:To:Cc:Subject:Date:From;
        b=m31Wm482daOYmFVCWSlWyInU8ZbiFqhdmGMUf9tNmEZmDVKfxo6iKjjRg8IZ4XXVd
         GUlsgXUKx+7sqZpkdCxaLPw9kB5Rva0WqeyYV4kwYioxWNcVdWC519brvSC6VeEIht
         BvG9dMH+wqZZw5gGzA84xNUGmE5Qo8cxwjQWVTk+oMx803NVCtk+YY4/Yl+edGI8yv
         qJ8MlCbLz6CNKT/SEwEypLfT0b02OP6KAgv7wc4TQC97vTwj+lZeGYdESeMFCqhrzw
         r12Mey/DKxrntTuSdG3vDIdldNVT64QW2VfeOsYluor59YTCYgwOt2HeKEdY6N7GsZ
         lvxqXL/V8CBag==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>, Sasha Levin <sashal@kernel.org>,
        linux-omap@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 01/66] bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first
Date:   Sun,  2 May 2021 10:03:06 -0400
Message-Id: <20210502140411.2719301-1-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tony Lindgren <tony@atomide.com>

[ Upstream commit 4700a00755fb5a4bb5109128297d6fd2d1272ee6 ]

We want to probe l4_wkup and l4_cfg interconnect devices first to avoid
issues with missing resources. Otherwise we attempt to probe l4_per
devices first causing pointless deferred probe and also annoyingh
renumbering of the MMC devices for example.

Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/bus/ti-sysc.c | 49 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 16e389dce111..9afbe4992a1d 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -635,6 +635,51 @@ static int sysc_parse_and_check_child_range(struct sysc *ddata)
 	return 0;
 }
 
+/* Interconnect instances to probe before l4_per instances */
+static struct resource early_bus_ranges[] = {
+	/* am3/4 l4_wkup */
+	{ .start = 0x44c00000, .end = 0x44c00000 + 0x300000, },
+	/* omap4/5 and dra7 l4_cfg */
+	{ .start = 0x4a000000, .end = 0x4a000000 + 0x300000, },
+	/* omap4 l4_wkup */
+	{ .start = 0x4a300000, .end = 0x4a300000 + 0x30000,  },
+	/* omap5 and dra7 l4_wkup without dra7 dcan segment */
+	{ .start = 0x4ae00000, .end = 0x4ae00000 + 0x30000,  },
+};
+
+static atomic_t sysc_defer = ATOMIC_INIT(10);
+
+/**
+ * sysc_defer_non_critical - defer non_critical interconnect probing
+ * @ddata: device driver data
+ *
+ * We want to probe l4_cfg and l4_wkup interconnect instances before any
+ * l4_per instances as l4_per instances depend on resources on l4_cfg and
+ * l4_wkup interconnects.
+ */
+static int sysc_defer_non_critical(struct sysc *ddata)
+{
+	struct resource *res;
+	int i;
+
+	if (!atomic_read(&sysc_defer))
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(early_bus_ranges); i++) {
+		res = &early_bus_ranges[i];
+		if (ddata->module_pa >= res->start &&
+		    ddata->module_pa <= res->end) {
+			atomic_set(&sysc_defer, 0);
+
+			return 0;
+		}
+	}
+
+	atomic_dec_if_positive(&sysc_defer);
+
+	return -EPROBE_DEFER;
+}
+
 static struct device_node *stdout_path;
 
 static void sysc_init_stdout_path(struct sysc *ddata)
@@ -859,6 +904,10 @@ static int sysc_map_and_check_registers(struct sysc *ddata)
 	if (error)
 		return error;
 
+	error = sysc_defer_non_critical(ddata);
+	if (error)
+		return error;
+
 	sysc_check_children(ddata);
 
 	error = sysc_parse_registers(ddata);
-- 
2.30.2

