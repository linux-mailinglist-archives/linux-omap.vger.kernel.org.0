Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91709446084
	for <lists+linux-omap@lfdr.de>; Fri,  5 Nov 2021 09:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbhKEIXd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Nov 2021 04:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232556AbhKEIXa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 5 Nov 2021 04:23:30 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD908C061714;
        Fri,  5 Nov 2021 01:20:51 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id g13so6069875qtk.12;
        Fri, 05 Nov 2021 01:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JV2GI1ElyWKj5nJkvVr78bo555smaUwaPP1WNumT+bI=;
        b=hAtVwydAdMBI3HF1HcU50DSqHSm5F9VkFO3sk3cJZMZlOfHL8GE5RitgoSYteU7GJZ
         C1kdW2JclKD1V4s0SDiKp94F4KsZnBOtk6AluW1VR1YbGYngepXDaJKyJWNwVm6HnPeh
         bfjB8M9KFrSJGegaIqkEd3wLHHyJDe7+xoNMWrgZKCypcH2nDikjGZZ3Pw92/8P4t3ZK
         tiiuwyEZpru7nAAiS4pSITyI4LPw8jEBV5xnvBlh1YvFQIJExJcOUZ9nwBN13bZ/TSzL
         qTmw+FSx5zcaGxk/jv+JYZiQZ9vD2+63N2exK3N2Kum6hGLc/jPLikxm1BVkcN9AGbz2
         CLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JV2GI1ElyWKj5nJkvVr78bo555smaUwaPP1WNumT+bI=;
        b=O7+7d/LJKAik53Y8VA220/+1qR/pqgQYRW5xx+kSYJZCHCvxdNFChJNg9kHB9CxLCU
         5/MT+lX5+42b+sioaJ5nZqGfme90aP/8h6+NL4lNMK5beULSsQOBxEv8GRF2f0/1iVdj
         hb2WnQw4dRvObcQNzioCQHxUC0qhOor4QhCNaWfSTA+MLADTNgfbTONLC/TroXkR8Npx
         vJelNoriTI2CWSRQPfq78kNAisgnXDvMiLXZAnXP4NDaW0Cq2+ZFmTs7ZzzMXJTa/Dpu
         5howXM4Bh3zvJPaaxtsweIqJaepeGyNgBCwlb1ryCk3NJafM3W25+ymTTQV9TMsH55Yi
         73nA==
X-Gm-Message-State: AOAM533gyjF/+kx5coCF489fDe7Clya7dNpydojJEABTjCUvcBMytGaw
        9H9q50rOtNMqo0NXUHd9LkH79LSlhXw=
X-Google-Smtp-Source: ABdhPJy8sNu+X2LbVDfgoGjzfow4qraNvBUGA5R/CR484AyQ83qpzjMZ61VRonVoiLf+ZJAqgSn10Q==
X-Received: by 2002:a05:622a:c5:: with SMTP id p5mr43146417qtw.96.1636100450840;
        Fri, 05 Nov 2021 01:20:50 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id j192sm1791743qke.13.2021.11.05.01.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 01:20:50 -0700 (PDT)
From:   cgel.zte@gmail.com
X-Google-Original-From: yao.jing2@zte.com.cn
To:     linux-omap@vger.kernel.org
Cc:     yao.jing2@zte.com.cn, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] omapfb: panel-tpo-td043mtea1: Replace snprintf in show functions with  sysfs_emit
Date:   Fri,  5 Nov 2021 08:20:44 +0000
Message-Id: <20211105082044.77035-1-yao.jing2@zte.com.cn>
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
 .../video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
index afac1d9445aa..57b7d1f49096 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
@@ -169,7 +169,7 @@ static ssize_t tpo_td043_vmirror_show(struct device *dev,
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", ddata->vmirror);
+	return sysfs_emit(buf, "%d\n", ddata->vmirror);
 }
 
 static ssize_t tpo_td043_vmirror_store(struct device *dev,
@@ -199,7 +199,7 @@ static ssize_t tpo_td043_mode_show(struct device *dev,
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", ddata->mode);
+	return sysfs_emit(buf, "%d\n", ddata->mode);
 }
 
 static ssize_t tpo_td043_mode_store(struct device *dev,
-- 
2.25.1

