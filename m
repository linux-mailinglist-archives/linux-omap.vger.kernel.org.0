Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 269FEF1597
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2019 12:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730361AbfKFL7w (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Nov 2019 06:59:52 -0500
Received: from imap1.codethink.co.uk ([176.9.8.82]:46427 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728610AbfKFL7w (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Nov 2019 06:59:52 -0500
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iSJyU-0000O3-Aw; Wed, 06 Nov 2019 11:59:46 +0000
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.3)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iSJyT-000185-Uz; Wed, 06 Nov 2019 11:59:45 +0000
From:   "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To:     linux-kernel@lists.codethink.co.uk
Cc:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] OMAP2: fixup doc comments in omap_device
Date:   Wed,  6 Nov 2019 11:59:45 +0000
Message-Id: <20191106115945.4298-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The documentation comments in this file are out of
date with the code, so fix this to avoid the
following warnings:

arch/arm/mach-omap2/omap_device.c:133: warning: Function parameter or member 'pdev' not described in 'omap_device_build_from_dt'
arch/arm/mach-omap2/omap_device.c:133: warning: Excess function parameter 'pdev_name' description in 'omap_device_build_from_dt'
arch/arm/mach-omap2/omap_device.c:133: warning: Excess function parameter 'pdev_id' description in 'omap_device_build_from_dt'
arch/arm/mach-omap2/omap_device.c:133: warning: Excess function parameter 'oh' description in 'omap_device_build_from_dt'
arch/arm/mach-omap2/omap_device.c:133: warning: Excess function parameter 'pdata' description in 'omap_device_build_from_dt'
arch/arm/mach-omap2/omap_device.c:133: warning: Excess function parameter 'pdata_len' description in 'omap_device_build_from_dt'
arch/arm/mach-omap2/omap_device.c:309: warning: Function parameter or member 'pdev' not described in 'omap_device_get_context_loss_count'
arch/arm/mach-omap2/omap_device.c:309: warning: Excess function parameter 'od' description in 'omap_device_get_context_loss_count'
arch/arm/mach-omap2/omap_device.c:335: warning: Function parameter or member 'ohs' not described in 'omap_device_alloc'
arch/arm/mach-omap2/omap_device.c:335: warning: Function parameter or member 'oh_cnt' not described in 'omap_device_alloc'
arch/arm/mach-omap2/omap_device.c:335: warning: Excess function parameter 'oh' description in 'omap_device_alloc'
arch/arm/mach-omap2/omap_device.c:335: warning: Excess function parameter 'pdata' description in 'omap_device_alloc'
arch/arm/mach-omap2/omap_device.c:335: warning: Excess function parameter 'pdata_len' description in 'omap_device_alloc'
arch/arm/mach-omap2/omap_device.c:659: warning: Function parameter or member 'pdev' not described in 'omap_device_register'
arch/arm/mach-omap2/omap_device.c:659: warning: Excess function parameter 'od' description in 'omap_device_register'
arch/arm/mach-omap2/omap_device.c:682: warning: Function parameter or member 'pdev' not described in 'omap_device_enable'
arch/arm/mach-omap2/omap_device.c:682: warning: Excess function parameter 'od' description in 'omap_device_enable'
arch/arm/mach-omap2/omap_device.c:713: warning: Function parameter or member 'pdev' not described in 'omap_device_idle'
arch/arm/mach-omap2/omap_device.c:713: warning: Excess function parameter 'od' description in 'omap_device_idle'

Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
---
Cc: Tony Lindgren <tony@atomide.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-omap@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/mach-omap2/omap_device.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_device.c b/arch/arm/mach-omap2/omap_device.c
index 3acb4192918d..1d55602b3f8f 100644
--- a/arch/arm/mach-omap2/omap_device.c
+++ b/arch/arm/mach-omap2/omap_device.c
@@ -119,11 +119,7 @@ static void _add_hwmod_clocks_clkdev(struct omap_device *od,
 
 /**
  * omap_device_build_from_dt - build an omap_device with multiple hwmods
- * @pdev_name: name of the platform_device driver to use
- * @pdev_id: this platform_device's connection ID
- * @oh: ptr to the single omap_hwmod that backs this omap_device
- * @pdata: platform_data ptr to associate with the platform_device
- * @pdata_len: amount of memory pointed to by @pdata
+ * @pdev: The platform device to update.
  *
  * Function for building an omap_device already registered from device-tree
  *
@@ -292,7 +288,7 @@ static int _omap_device_idle_hwmods(struct omap_device *od)
 
 /**
  * omap_device_get_context_loss_count - get lost context count
- * @od: struct omap_device *
+ * @pdev: The platform device to update.
  *
  * Using the primary hwmod, query the context loss count for this
  * device.
@@ -321,9 +317,8 @@ int omap_device_get_context_loss_count(struct platform_device *pdev)
 /**
  * omap_device_alloc - allocate an omap_device
  * @pdev: platform_device that will be included in this omap_device
- * @oh: ptr to the single omap_hwmod that backs this omap_device
- * @pdata: platform_data ptr to associate with the platform_device
- * @pdata_len: amount of memory pointed to by @pdata
+ * @ohs: ptr to the omap_hwmod for this omap_device
+ * @oh_cnt: the size of the ohs list
  *
  * Convenience function for allocating an omap_device structure and filling
  * hwmods, and resources.
@@ -649,7 +644,7 @@ struct dev_pm_domain omap_device_pm_domain = {
 
 /**
  * omap_device_register - register an omap_device with one omap_hwmod
- * @od: struct omap_device * to register
+ * @pdev: the platform device (omap_device) to register.
  *
  * Register the omap_device structure.  This currently just calls
  * platform_device_register() on the underlying platform_device.
@@ -668,7 +663,7 @@ int omap_device_register(struct platform_device *pdev)
 
 /**
  * omap_device_enable - fully activate an omap_device
- * @od: struct omap_device * to activate
+ * @pdev: the platform device to activate
  *
  * Do whatever is necessary for the hwmods underlying omap_device @od
  * to be accessible and ready to operate.  This generally involves
@@ -702,7 +697,7 @@ int omap_device_enable(struct platform_device *pdev)
 
 /**
  * omap_device_idle - idle an omap_device
- * @od: struct omap_device * to idle
+ * @pdev: The platform_device (omap_device) to idle
  *
  * Idle omap_device @od.  Device drivers call this function indirectly
  * via pm_runtime_put*().  Returns -EINVAL if the omap_device is not
-- 
2.24.0.rc1

