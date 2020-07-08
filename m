Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB91F217DA6
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jul 2020 05:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729302AbgGHDgo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 23:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728885AbgGHDgn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jul 2020 23:36:43 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76455C061755;
        Tue,  7 Jul 2020 20:36:43 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 889C7BC06F;
        Wed,  8 Jul 2020 03:36:40 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        baolin.wang7@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] Replace HTTP links with HTTPS ones: hardware spinlock core
Date:   Wed,  8 Jul 2020 05:36:34 +0200
Message-Id: <20200708033634.62197-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ++++++
X-Spam-Level: ******
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
X-Spam: Yes
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
          If both the HTTP and HTTPS versions
          return 200 OK and serve the same content:
            Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master

 If there are any URLs to be removed completely or at least not HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.
 Rationale:
 I'd like not to submit patches much faster than you maintainers apply them.

 drivers/hwspinlock/hwspinlock_core.c     | 2 +-
 drivers/hwspinlock/hwspinlock_internal.h | 2 +-
 drivers/hwspinlock/omap_hwspinlock.c     | 2 +-
 include/linux/hwspinlock.h               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index fd5f5c5a5244..09568b9246e1 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -2,7 +2,7 @@
 /*
  * Hardware spinlock framework
  *
- * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2010 Texas Instruments Incorporated - https://www.ti.com
  *
  * Contact: Ohad Ben-Cohen <ohad@wizery.com>
  */
diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinlock/hwspinlock_internal.h
index 29892767bb7a..318e257bb4fb 100644
--- a/drivers/hwspinlock/hwspinlock_internal.h
+++ b/drivers/hwspinlock/hwspinlock_internal.h
@@ -2,7 +2,7 @@
 /*
  * Hardware spinlocks internal header
  *
- * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2010 Texas Instruments Incorporated - https://www.ti.com
  *
  * Contact: Ohad Ben-Cohen <ohad@wizery.com>
  */
diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 3b05560456ea..d4491588a49b 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -2,7 +2,7 @@
 /*
  * OMAP hardware spinlock driver
  *
- * Copyright (C) 2010-2015 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2010-2015 Texas Instruments Incorporated - https://www.ti.com
  *
  * Contact: Simon Que <sque@ti.com>
  *          Hari Kanigeri <h-kanigeri2@ti.com>
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index bfe7c1f1ac6d..690810acea7f 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -2,7 +2,7 @@
 /*
  * Hardware spinlock public header
  *
- * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2010 Texas Instruments Incorporated - https://www.ti.com
  *
  * Contact: Ohad Ben-Cohen <ohad@wizery.com>
  */
-- 
2.27.0

