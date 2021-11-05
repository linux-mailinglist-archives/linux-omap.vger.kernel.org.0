Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 228F1446074
	for <lists+linux-omap@lfdr.de>; Fri,  5 Nov 2021 09:13:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232321AbhKEIQW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Nov 2021 04:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231837AbhKEIQV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 5 Nov 2021 04:16:21 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646B2C061714;
        Fri,  5 Nov 2021 01:13:42 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id o12so6501512qtv.4;
        Fri, 05 Nov 2021 01:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fVlZRJCKXUiqoF7G7hyUyfyk+5I40Id7HCqnbB08HMQ=;
        b=kTtDhSSUVBAaLquaHLkNCUmCFlhIfFNbkpBVUYWy/kf4GCXD82Rp+uFqFFnjosL91f
         GJet10XZfMoRgklh86ym1VJPDkjGjsl8HX25SW41/0tMoF7tQ/u+7mZIAiDz2JBPomRE
         SH5JPoqYH3/rpRIRstCz9budfZujQhFpdJ3Dij51Y0avydA/BEkM7KqUs5i2QSbIRQ6o
         qcyx0MW1AgCk+xqEvuHIcmQyVxr/sxeSVL6BV47RG+r4fB3skeUvIMu/A+Q3kjvbvwIT
         QXDGbl0dMbun5EYa1X+6PILPjL0ZZIiN6tJ5/mycAbBaQjBZYoqkcAeYin6eYSJP0Agk
         Ci2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fVlZRJCKXUiqoF7G7hyUyfyk+5I40Id7HCqnbB08HMQ=;
        b=z0ukC34zePgcGF/rV3+vgppLIyuhTtMyDxChXWD2eUuzlRD3F04TEmgQ8Wa/KPqdGz
         lftJ/T5slYXMGp64MIkwVa8yHTg9iJLj3pYmfGe9VxgpCgWfNwLsCOwwdsDR8W//c0TG
         YTAeZx1VKZkaK2i2Vp6xr39Yo9G4xbRt1ZY8BDeAtoB9M769T/IXMoxGIpFuzeBYVjyr
         gtZe5sTGENndPeyYMU0t5TrZRb+wbMgE1VzYnZqTEoqq+EMa+dOYQSNivfRIpEDc+QRO
         gkf43r4VpU0WO1O/TUBhhnt0o+ZJTF30eGFd53rHXn3/VczYh6xW+66cRFQeOUVBYw4A
         RQDw==
X-Gm-Message-State: AOAM533Vu971o0v/G2TUPaVTM29onfNMvAhF5urvQ3JKbHCgdkgy7MNZ
        bPuMzSwF5rXjpZJ+OMVQcou5QnracyU=
X-Google-Smtp-Source: ABdhPJxUNp4kKqoDFXNGw/s5Alxe9f3i4Axux6ohHFVYJVgy0gVbIefnUP4h24e3WH9Tvqnk9m80Yg==
X-Received: by 2002:a05:622a:1705:: with SMTP id h5mr36744355qtk.228.1636100021385;
        Fri, 05 Nov 2021 01:13:41 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id e10sm5428630qte.57.2021.11.05.01.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 01:13:40 -0700 (PDT)
From:   cgel.zte@gmail.com
X-Google-Original-From: yao.jing2@zte.com.cn
To:     linux-omap@vger.kernel.org
Cc:     yao.jing2@zte.com.cn, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] omapfb: panel-dsi-cm: Replace snprintf in show functions with sysfs_emit
Date:   Fri,  5 Nov 2021 08:13:33 +0000
Message-Id: <20211105081333.76861-1-yao.jing2@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Jing Yao <yao.jing2@zte.com.cn>

coccicheck complains about the use of snprintf() in sysfs show
functions:
WARNING use scnprintf or sprintf

Use sysfs_emit instead of scnprintf, snprintf or sprintf makes more
sense.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jing Yao <yao.jing2@zte.com.cn>
---
 drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
index 4b0793abdd84..a2c7c5cb1523 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
@@ -409,7 +409,7 @@ static ssize_t dsicm_num_errors_show(struct device *dev,
 	if (r)
 		return r;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", errors);
+	return sysfs_emit(buf, "%d\n", errors);
 }
 
 static ssize_t dsicm_hw_revision_show(struct device *dev,
@@ -439,7 +439,7 @@ static ssize_t dsicm_hw_revision_show(struct device *dev,
 	if (r)
 		return r;
 
-	return snprintf(buf, PAGE_SIZE, "%02x.%02x.%02x\n", id1, id2, id3);
+	return sysfs_emit(buf, "%02x.%02x.%02x\n", id1, id2, id3);
 }
 
 static ssize_t dsicm_store_ulps(struct device *dev,
@@ -487,7 +487,7 @@ static ssize_t dsicm_show_ulps(struct device *dev,
 	t = ddata->ulps_enabled;
 	mutex_unlock(&ddata->lock);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", t);
+	return sysfs_emit(buf, "%u\n", t);
 }
 
 static ssize_t dsicm_store_ulps_timeout(struct device *dev,
@@ -532,7 +532,7 @@ static ssize_t dsicm_show_ulps_timeout(struct device *dev,
 	t = ddata->ulps_timeout;
 	mutex_unlock(&ddata->lock);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", t);
+	return sysfs_emit(buf, "%u\n", t);
 }
 
 static DEVICE_ATTR(num_dsi_errors, S_IRUGO, dsicm_num_errors_show, NULL);
-- 
2.25.1

