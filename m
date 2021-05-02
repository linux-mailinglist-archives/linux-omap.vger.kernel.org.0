Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B62E370BE0
	for <lists+linux-omap@lfdr.de>; Sun,  2 May 2021 16:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232420AbhEBOEk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 2 May 2021 10:04:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:49656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232410AbhEBOEj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 2 May 2021 10:04:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 117176135D;
        Sun,  2 May 2021 14:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619964227;
        bh=9rBdmnqcNBYq4mulLLtVltQzh9zTOIB56p2i5oS17/I=;
        h=From:To:Cc:Subject:Date:From;
        b=Vnv0BLpnKhCv6b+g7MHN5W405uURlIbvG5UVkthUM4+4BePwRpk4rPId/XpojQU3C
         lGPsEjwYcN9xfJXbXoXOdca2MV8e3sebQzQsr7mSQ2A806bv1CRHT03vv9k3VNqQWj
         /gXyg3HDkp0mA5Cu2Rwt2BoAl05nNQLK1rKHEKeizZeI01bOJTV3DrA+7n8p7RksT3
         Ra/NjBMUlsq3yFiFi6uyPYtN4I7VnKEOBZXGU1aM23o9Zn0TPribGuFyyUnQk9F795
         27hihn48Tkc8QfFNZ9T5J0QrNdJ83DxF+Hh53U1lo4gzAig6XwGNRlVzSlejasB/Kq
         cGyQJFwN8Kz6w==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>, Sasha Levin <sashal@kernel.org>,
        linux-omap@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 01/70] bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first
Date:   Sun,  2 May 2021 10:02:35 -0400
Message-Id: <20210502140344.2719040-1-sashal@kernel.org>
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
index 3d74f237f005..9e535336689f 100644
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
@@ -863,6 +908,10 @@ static int sysc_map_and_check_registers(struct sysc *ddata)
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

