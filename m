Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B583416871C
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 19:58:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729397AbgBUS6i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 13:58:38 -0500
Received: from muru.com ([72.249.23.125]:56822 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729355AbgBUS6i (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 Feb 2020 13:58:38 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E003F807E;
        Fri, 21 Feb 2020 18:59:22 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: OMAP2+: Improve handling of ti-sysc related sysc_fields
Date:   Fri, 21 Feb 2020 10:58:33 -0800
Message-Id: <20200221185833.40419-1-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can currently get a cryptic warning sysc_fields (ptrval) != (ptrval)
if the legacy platform data has no sysc_fields defined while the newer
dts data has them. This warning appears only when booting still with
legacy "ti,hwmods" custom property set. This can happen at least with
DSS related modules where we may not have sysc_fields defined in the
in the legacy data.

Let's not error out on missing legacy data sysc_fields, and show a more
descriptive warning for other cases.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/omap_hwmod.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -3148,15 +3148,14 @@ static int omap_hwmod_check_sysc(struct device *dev,
 /**
  * omap_hwmod_init_regbits - init sysconfig specific register bits
  * @dev: struct device
+ * @oh: module
  * @data: module data
  * @sysc_fields: new sysc configuration
  */
-static int omap_hwmod_init_regbits(struct device *dev,
+static int omap_hwmod_init_regbits(struct device *dev, struct omap_hwmod *oh,
 				   const struct ti_sysc_module_data *data,
 				   struct sysc_regbits **sysc_fields)
 {
-	*sysc_fields = NULL;
-
 	switch (data->cap->type) {
 	case TI_SYSC_OMAP2:
 	case TI_SYSC_OMAP2_TIMER:
@@ -3191,6 +3190,12 @@ static int omap_hwmod_init_regbits(struct device *dev,
 		*sysc_fields = &omap_hwmod_sysc_type_usb_host_fs;
 		break;
 	default:
+		*sysc_fields = NULL;
+		if (!oh->class->sysc->sysc_fields)
+			return 0;
+
+		dev_err(dev, "sysc_fields not found\n");
+
 		return -EINVAL;
 	}
 
@@ -3356,9 +3361,9 @@ static int omap_hwmod_check_module(struct device *dev,
 	if (!oh->class->sysc)
 		return -ENODEV;
 
-	if (sysc_fields != oh->class->sysc->sysc_fields)
-		dev_warn(dev, "sysc_fields %p != %p\n", sysc_fields,
-			 oh->class->sysc->sysc_fields);
+	if (oh->class->sysc->sysc_fields &&
+	    sysc_fields != oh->class->sysc->sysc_fields)
+		dev_warn(dev, "sysc_fields mismatch\n");
 
 	if (rev_offs != oh->class->sysc->rev_offs)
 		dev_warn(dev, "rev_offs %08x != %08x\n", rev_offs,
@@ -3574,7 +3579,7 @@ int omap_hwmod_init_module(struct device *dev,
 
 	cookie->data = oh;
 
-	error = omap_hwmod_init_regbits(dev, data, &sysc_fields);
+	error = omap_hwmod_init_regbits(dev, oh, data, &sysc_fields);
 	if (error)
 		return error;
 
-- 
2.25.1
