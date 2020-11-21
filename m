Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4642C2BBC7B
	for <lists+linux-omap@lfdr.de>; Sat, 21 Nov 2020 04:03:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbgKUDCK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Nov 2020 22:02:10 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50544 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgKUDCI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 20 Nov 2020 22:02:08 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AL323gJ047229;
        Fri, 20 Nov 2020 21:02:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605927723;
        bh=ZGbBvHAaW9TuS/ALC0dm1MvfWI+JMpJVqQhQoSxmGh0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=JVJ8Z9pHncmDkOGoIEtqNUZ+gAnmT/rmkFizb/ZFAAqfLM+K7ROm9DHh54TT6bCVM
         gO71B/FJF4dMCy24XUtrw6MG3yLQHcFHuWxxYjigpSx+MixgA+nDdnp4/oETMTyJ+4
         szMvqVvbfMDEAGAvpdGCUzfmnzKxBJy8DeSrzO24=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AL322NW021583
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Nov 2020 21:02:03 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 20
 Nov 2020 21:02:03 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 21:02:02 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AL322nG006924;
        Fri, 20 Nov 2020 21:02:02 -0600
Received: from localhost ([10.250.68.46])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 0AL321Q8038584;
        Fri, 20 Nov 2020 21:02:01 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic Pallardy <loic.pallardy@st.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 1/3] remoteproc: Fix unbalanced boot with sysfs for no auto-boot rprocs
Date:   Fri, 20 Nov 2020 21:01:54 -0600
Message-ID: <20201121030156.22857-2-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201121030156.22857-1-s-anna@ti.com>
References: <20201121030156.22857-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The remoteproc core performs automatic boot and shutdown of a remote
processor during rproc_add() and rproc_del() for remote processors
supporting 'auto-boot'. The remoteproc devices not using 'auto-boot'
require either a remoteproc client driver or a userspace client to
use the sysfs 'state' variable to perform the boot and shutdown. The
in-kernel client drivers hold the corresponding remoteproc driver
module's reference count when they acquire a rproc handle through
the rproc_get_by_phandle() API, but there is no such support for
userspace applications performing the boot through sysfs interface.

The shutdown of a remoteproc upon removing a remoteproc platform
driver is automatic only with 'auto-boot' and this can cause a
remoteproc with no auto-boot to stay powered on and never freed
up if booted using the sysfs interface without a matching stop,
and when the remoteproc driver module is removed or unbound from
the device. This will result in a memory leak as well as the
corresponding remoteproc ida being never deallocated. Fix this
by holding a module reference count for the remoteproc's driver
during a sysfs 'start' and releasing it during the sysfs 'stop'
operation.

Signed-off-by: Suman Anna <s-anna@ti.com>
Acked-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
v2: rebased version, no changes
v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20180915003725.17549-2-s-anna@ti.com/

 drivers/remoteproc/remoteproc_sysfs.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index d1cf7bf277c4..bd2950a246c9 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -3,6 +3,7 @@
  * Remote Processor Framework
  */
 
+#include <linux/module.h>
 #include <linux/remoteproc.h>
 #include <linux/slab.h>
 
@@ -228,14 +229,27 @@ static ssize_t state_store(struct device *dev,
 		if (rproc->state == RPROC_RUNNING)
 			return -EBUSY;
 
+		/*
+		 * prevent underlying implementation from being removed
+		 * when remoteproc does not support auto-boot
+		 */
+		if (!rproc->auto_boot &&
+		    !try_module_get(dev->parent->driver->owner))
+			return -EINVAL;
+
 		ret = rproc_boot(rproc);
-		if (ret)
+		if (ret) {
 			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
+			if (!rproc->auto_boot)
+				module_put(dev->parent->driver->owner);
+		}
 	} else if (sysfs_streq(buf, "stop")) {
 		if (rproc->state != RPROC_RUNNING)
 			return -EINVAL;
 
 		rproc_shutdown(rproc);
+		if (!rproc->auto_boot)
+			module_put(dev->parent->driver->owner);
 	} else {
 		dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);
 		ret = -EINVAL;
-- 
2.28.0

