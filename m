Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5931F2D7EAD
	for <lists+linux-omap@lfdr.de>; Fri, 11 Dec 2020 19:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436871AbgLKSto (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Dec 2020 13:49:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436714AbgLKStD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Dec 2020 13:49:03 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C5FC0617A7
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 10:48:32 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id y22so12031486ljn.9
        for <linux-omap@vger.kernel.org>; Fri, 11 Dec 2020 10:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NWoP9tZ6oHWWAkB8TJmlPklU15pvtoRQyvnFdEsRKOI=;
        b=mt+MbXD2G45R++itmA44Y3a+euSVz+hpvfoElDRG++OVuwkByNS1vc7OabMmUtKWeo
         v0aT/8IrkEN8cN+shN8XTIaW878S+/7ha2P44D/Gt5gdkLvQvWArOX65vhoT4R645744
         MIcxllWspC2Fa4BSwLkH+F0lgpokTvyV6Fnkh5CpE30AU+EvM1KFTdnl9KtSk5m0Fhz9
         IkOyHfcFvMEPOnFTpXFS2eHCd+xwURCig+1YH3X+BeIQGH8bWrWFNhI9JaC4subDoRR7
         avXiBmKiXVXxcSErpYNVbsJfvje5997xmBa9SNYAGvFMeqtEuNM4dUGSDu0+Ci3geU/Y
         5s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NWoP9tZ6oHWWAkB8TJmlPklU15pvtoRQyvnFdEsRKOI=;
        b=PflQiWrK6q2FuBWjvkpNg4IHmnfmdVtC1EVXGjvYFRpFgAJr9dvSfiKvpsy6RtKs7D
         rgeoyBsCDu19MWG+ajVt9Y/DLZABbHFyTTDSIDDOvmJa9SU2zMJfKhwTmzdNpkhU5gyK
         uCCjz7e1W+PldEPgiOHKGCGoPqioM0delPkjl7wRB8SEPX2kvtWRE9w1i+eB3bwKGTuQ
         35k5r+9fplkJrnLtdNcrUwms6W9iiDd6ZX8muH4pXJ5vXUgG6aLeHaTe+bmXosBUCQPr
         nYLIvfK2bxIJKErcGr1P66XAGb1iwxKxbQ2IqnY7CN2ISSaj1155O03/TZ6d2BKjAsUd
         8bwg==
X-Gm-Message-State: AOAM532I4OkPQyCt3yq3+g2NSi+FpKDwFMR+AX4cItsZGoKuQYp5Gxtb
        6DbaX5bjILtD0sHHvM6V6qhAqg==
X-Google-Smtp-Source: ABdhPJz5UPyn6jKMpYkDka4oQOxNHzkev1Wzu8F53tLxnvwGa3/eIViwQYJ7dK5JY98Thny9+u8ikw==
X-Received: by 2002:a2e:5753:: with SMTP id r19mr5356621ljd.240.1607712510751;
        Fri, 11 Dec 2020 10:48:30 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id b12sm903316lfb.139.2020.12.11.10.48.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Dec 2020 10:48:30 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        lee.jones@linaro.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com,
        linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org
Subject: [PATCH 1/6] soc: ti: pruss: Add pruss_get()/put() API
Date:   Fri, 11 Dec 2020 19:48:06 +0100
Message-Id: <20201211184811.6490-2-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201211184811.6490-1-grzegorz.jaszczyk@linaro.org>
References: <20201211184811.6490-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tero Kristo <t-kristo@ti.com>

Add two new get and put API, pruss_get() and pruss_put() to the
PRUSS platform driver to allow client drivers to request a handle
to a PRUSS device. This handle will be used by client drivers to
request various operations of the PRUSS platform driver through
additional API that will be added in the following patches.

The pruss_get() function returns the pruss handle corresponding
to a PRUSS device referenced by a PRU remoteproc instance. The
pruss_put() is the complimentary function to pruss_get().

Co-developed-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 drivers/soc/ti/pruss.c       | 58 ++++++++++++++++++++++++++++++++++++
 include/linux/pruss.h        | 19 ++++++++++++
 include/linux/pruss_driver.h |  1 +
 3 files changed, 78 insertions(+)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index 5d6e7132a5c4..28eb6415cb95 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -6,6 +6,7 @@
  * Author(s):
  *	Suman Anna <s-anna@ti.com>
  *	Andrew F. Davis <afd@ti.com>
+ *	Tero Kristo <t-kristo@ti.com>
  */
 
 #include <linux/clk-provider.h>
@@ -18,6 +19,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/pruss_driver.h>
 #include <linux/regmap.h>
+#include <linux/remoteproc.h>
 #include <linux/slab.h>
 
 /**
@@ -30,6 +32,62 @@ struct pruss_private_data {
 	bool has_core_mux_clock;
 };
 
+/**
+ * pruss_get() - get the pruss for a given PRU remoteproc
+ * @rproc: remoteproc handle of a PRU instance
+ *
+ * Finds the parent pruss device for a PRU given the @rproc handle of the
+ * PRU remote processor. This function increments the pruss device's refcount,
+ * so always use pruss_put() to decrement it back once pruss isn't needed
+ * anymore.
+ *
+ * Return: pruss handle on success, and an ERR_PTR on failure using one
+ * of the following error values
+ *    -EINVAL if invalid parameter
+ *    -ENODEV if PRU device or PRUSS device is not found
+ */
+struct pruss *pruss_get(struct rproc *rproc)
+{
+	struct pruss *pruss;
+	struct device *dev;
+	struct platform_device *ppdev;
+
+	if (IS_ERR_OR_NULL(rproc))
+		return ERR_PTR(-EINVAL);
+
+	dev = &rproc->dev;
+
+	/* make sure it is PRU rproc */
+	if (!dev->parent || !is_pru_rproc(dev->parent))
+		return ERR_PTR(-ENODEV);
+
+	ppdev = to_platform_device(dev->parent->parent);
+	pruss = platform_get_drvdata(ppdev);
+	if (!pruss)
+		return ERR_PTR(-ENODEV);
+
+	get_device(pruss->dev);
+
+	return pruss;
+}
+EXPORT_SYMBOL_GPL(pruss_get);
+
+/**
+ * pruss_put() - decrement pruss device's usecount
+ * @pruss: pruss handle
+ *
+ * Complimentary function for pruss_get(). Needs to be called
+ * after the PRUSS is used, and only if the pruss_get() succeeds.
+ */
+void pruss_put(struct pruss *pruss)
+{
+	if (IS_ERR_OR_NULL(pruss))
+		return;
+
+	put_device(pruss->dev);
+}
+EXPORT_SYMBOL_GPL(pruss_put);
+
 static void pruss_of_free_clk_provider(void *data)
 {
 	struct device_node *clk_mux_np = data;
diff --git a/include/linux/pruss.h b/include/linux/pruss.h
index 903d0c0b75be..403951910515 100644
--- a/include/linux/pruss.h
+++ b/include/linux/pruss.h
@@ -4,12 +4,14 @@
  *
  * Copyright (C) 2015-2020 Texas Instruments Incorporated - http://www.ti.com
  *	Suman Anna <s-anna@ti.com>
+ *	Tero Kristo <t-kristo@ti.com>
  */
 
 #ifndef __LINUX_PRUSS_H
 #define __LINUX_PRUSS_H
 
 #include <linux/device.h>
+#include <linux/err.h>
 #include <linux/types.h>
 
 #define PRU_RPROC_DRVNAME "pru-rproc"
@@ -39,6 +41,23 @@ enum pru_ctable_idx {
 
 struct device_node;
 struct rproc;
+struct pruss;
+
+#if IS_ENABLED(CONFIG_TI_PRUSS)
+
+struct pruss *pruss_get(struct rproc *rproc);
+void pruss_put(struct pruss *pruss);
+
+#else
+
+static inline struct pruss *pruss_get(struct rproc *rproc)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
+static inline void pruss_put(struct pruss *pruss) { }
+
+#endif /* CONFIG_TI_PRUSS */
 
 #if IS_ENABLED(CONFIG_PRU_REMOTEPROC)
 
diff --git a/include/linux/pruss_driver.h b/include/linux/pruss_driver.h
index ecfded30ed05..d054d2179d82 100644
--- a/include/linux/pruss_driver.h
+++ b/include/linux/pruss_driver.h
@@ -9,6 +9,7 @@
 #ifndef _PRUSS_DRIVER_H_
 #define _PRUSS_DRIVER_H_
 
+#include <linux/pruss.h>
 #include <linux/types.h>
 
 /*
-- 
2.29.0

