Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5FEF41310C
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 12:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbhIUKDB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 06:03:01 -0400
Received: from muru.com ([72.249.23.125]:35410 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231483AbhIUKC5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 06:02:57 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 959BA812F;
        Tue, 21 Sep 2021 10:01:55 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/9] bus: ti-sysc: Check for lost context in sysc_reinit_module()
Date:   Tue, 21 Sep 2021 13:01:08 +0300
Message-Id: <20210921100115.59865-3-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921100115.59865-1-tony@atomide.com>
References: <20210921100115.59865-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There is no need to restore context if it was not lost. Let's add a new
function sysc_check_context() to check for lost context. To make use of it,
we need to save the sysconfig register status on enable and disable.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 60 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 49 insertions(+), 11 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -132,6 +132,7 @@ struct sysc {
 	struct ti_sysc_cookie cookie;
 	const char *name;
 	u32 revision;
+	u32 sysconfig;
 	unsigned int reserved:1;
 	unsigned int enabled:1;
 	unsigned int needs_resume:1;
@@ -1135,7 +1136,8 @@ static int sysc_enable_module(struct device *dev)
 	best_mode = fls(ddata->cfg.midlemodes) - 1;
 	if (best_mode > SYSC_IDLE_MASK) {
 		dev_err(dev, "%s: invalid midlemode\n", __func__);
-		return -EINVAL;
+		error = -EINVAL;
+		goto save_context;
 	}
 
 	if (ddata->cfg.quirks & SYSC_QUIRK_SWSUP_MSTANDBY)
@@ -1153,13 +1155,16 @@ static int sysc_enable_module(struct device *dev)
 		sysc_write_sysconfig(ddata, reg);
 	}
 
-	/* Flush posted write */
-	sysc_read(ddata, ddata->offsets[SYSC_SYSCONFIG]);
+	error = 0;
+
+save_context:
+	/* Save context and flush posted write */
+	ddata->sysconfig = sysc_read(ddata, ddata->offsets[SYSC_SYSCONFIG]);
 
 	if (ddata->module_enable_quirk)
 		ddata->module_enable_quirk(ddata);
 
-	return 0;
+	return error;
 }
 
 static int sysc_best_idle_mode(u32 idlemodes, u32 *best_mode)
@@ -1216,8 +1221,10 @@ static int sysc_disable_module(struct device *dev)
 set_sidle:
 	/* Set SIDLE mode */
 	idlemodes = ddata->cfg.sidlemodes;
-	if (!idlemodes || regbits->sidle_shift < 0)
-		return 0;
+	if (!idlemodes || regbits->sidle_shift < 0) {
+		ret = 0;
+		goto save_context;
+	}
 
 	if (ddata->cfg.quirks & SYSC_QUIRK_SWSUP_SIDLE) {
 		best_mode = SYSC_IDLE_FORCE;
@@ -1225,7 +1232,8 @@ static int sysc_disable_module(struct device *dev)
 		ret = sysc_best_idle_mode(idlemodes, &best_mode);
 		if (ret) {
 			dev_err(dev, "%s: invalid sidlemode\n", __func__);
-			return ret;
+			ret = -EINVAL;
+			goto save_context;
 		}
 	}
 
@@ -1236,10 +1244,13 @@ static int sysc_disable_module(struct device *dev)
 		reg |= 1 << regbits->autoidle_shift;
 	sysc_write_sysconfig(ddata, reg);
 
-	/* Flush posted write */
-	sysc_read(ddata, ddata->offsets[SYSC_SYSCONFIG]);
+	ret = 0;
 
-	return 0;
+save_context:
+	/* Save context and flush posted write */
+	ddata->sysconfig = sysc_read(ddata, ddata->offsets[SYSC_SYSCONFIG]);
+
+	return ret;
 }
 
 static int __maybe_unused sysc_runtime_suspend_legacy(struct device *dev,
@@ -1377,13 +1388,40 @@ static int __maybe_unused sysc_runtime_resume(struct device *dev)
 	return error;
 }
 
+/*
+ * Checks if device context was lost. Assumes the sysconfig register value
+ * after lost context is different from the configured value. Only works for
+ * enabled devices.
+ *
+ * Eventually we may want to also add support to using the context lost
+ * registers that some SoCs have.
+ */
+static int sysc_check_context(struct sysc *ddata)
+{
+	u32 reg;
+
+	if (!ddata->enabled)
+		return -ENODATA;
+
+	reg = sysc_read(ddata, ddata->offsets[SYSC_SYSCONFIG]);
+	if (reg == ddata->sysconfig)
+		return 0;
+
+	return -EACCES;
+}
+
 static int sysc_reinit_module(struct sysc *ddata, bool leave_enabled)
 {
 	struct device *dev = ddata->dev;
 	int error;
 
-	/* Disable target module if it is enabled */
 	if (ddata->enabled) {
+		/* Nothing to do if enabled and context not lost */
+		error = sysc_check_context(ddata);
+		if (!error)
+			return 0;
+
+		/* Disable target module if it is enabled */
 		error = sysc_runtime_suspend(dev);
 		if (error)
 			dev_warn(dev, "reinit suspend failed: %i\n", error);
-- 
2.33.0
