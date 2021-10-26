Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6548443A8BC
	for <lists+linux-omap@lfdr.de>; Tue, 26 Oct 2021 02:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235875AbhJZADp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Oct 2021 20:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235791AbhJZADg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Oct 2021 20:03:36 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5799C061230
        for <linux-omap@vger.kernel.org>; Mon, 25 Oct 2021 17:01:12 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id i5so9024539pla.5
        for <linux-omap@vger.kernel.org>; Mon, 25 Oct 2021 17:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Yh3mBEg2nfQJzEtBIxus+8u5VcBe7iEDAWACHn4tN4=;
        b=kLBZm52ebmLLR5AbZCfckYChB8MvSElC/qx7f2IrlZRdFRb7dYfMAReVWRlt+5q8HA
         /IJF12Z/5mX1d7Kn/IeJvKNQHGVE5crPNApZM0bjKBbG1K7AhGHJpzjZ2XXUwpMtdgX+
         WOcRzpaGqQgq4wo8RQved67DuU874XycCEF1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Yh3mBEg2nfQJzEtBIxus+8u5VcBe7iEDAWACHn4tN4=;
        b=fyFxWcxqrbz/4CajeORAxO2vkgAcvROfeOZnFZh+8AQJ1C1m7gUKbSwZQ5ChGBKKsI
         3u37jomY3mMeG35PSLBjhgLlyFvPTBIYEbpEAEDupqR4NilQvt2x383+e25NqJJ2zw40
         LU4ZDj2fXWQgQlqHd8JolEt1tiaGnYehusf3Fv6UMvumYdrTFnwjrwqtZdfZvnR+ESZY
         zKrGwnEnWu5VDFwLSXl25vU4twXOMR0D+I0NKsQY+1izCw6Pxeml/h89+kQOiFaX/TUJ
         THMnj+vHmtvlqOn/y+JOxL05IVNK9/rYJuY1Q3GCpVxHoXA5UIQoag2pCdUH4yzgFqet
         EOKQ==
X-Gm-Message-State: AOAM531jLQ49jFjegYD8qM2d52oqThngMbZqL9pHAzRNDRLhA4lamofS
        pgTgzcvPUFhvDhX1JRkrOdV42w==
X-Google-Smtp-Source: ABdhPJx0XIPb5Ywwd3lD5sPEg9b587Jhf41BUCPyFhpWoCUtyiqIcSkHoG+JbGob04w/ceH69dR5Kw==
X-Received: by 2002:a17:903:2c2:b029:101:9c88:d928 with SMTP id s2-20020a17090302c2b02901019c88d928mr19413256plk.62.1635206472429;
        Mon, 25 Oct 2021 17:01:12 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
        by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 17:01:12 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 30/34] fbdev: omap2: Migrate to aggregate driver
Date:   Mon, 25 Oct 2021 17:00:40 -0700
Message-Id: <20211026000044.885195-31-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026000044.885195-1-swboyd@chromium.org>
References: <20211026000044.885195-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: <linux-omap@vger.kernel.org>
Cc: <linux-fbdev@vger.kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/video/fbdev/omap2/omapfb/dss/dss.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
index a6b1c1598040..f12663c39ceb 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
@@ -1067,8 +1067,9 @@ static int dss_video_pll_probe(struct platform_device *pdev)
 }
 
 /* DSS HW IP initialisation */
-static int dss_bind(struct device *dev)
+static int dss_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct resource *dss_mem;
 	u32 rev;
@@ -1167,8 +1168,9 @@ static int dss_bind(struct device *dev)
 	return r;
 }
 
-static void dss_unbind(struct device *dev)
+static void dss_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct platform_device *pdev = to_platform_device(dev);
 
 	dss_initialized = false;
@@ -1188,9 +1190,13 @@ static void dss_unbind(struct device *dev)
 	dss_put_clocks();
 }
 
-static const struct component_master_ops dss_component_ops = {
-	.bind = dss_bind,
-	.unbind = dss_unbind,
+static struct aggregate_driver dss_aggregate_driver = {
+	.probe = dss_bind,
+	.remove = dss_unbind,
+	.driver = {
+		.name = "dss_fbdev",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int dss_component_compare(struct device *dev, void *data)
@@ -1225,7 +1231,7 @@ static int dss_probe(struct platform_device *pdev)
 	/* add all the child devices as components */
 	device_for_each_child(&pdev->dev, &match, dss_add_child_component);
 
-	r = component_master_add_with_match(&pdev->dev, &dss_component_ops, match);
+	r = component_aggregate_register(&pdev->dev, &dss_aggregate_driver, match);
 	if (r)
 		return r;
 
@@ -1234,7 +1240,7 @@ static int dss_probe(struct platform_device *pdev)
 
 static int dss_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &dss_component_ops);
+	component_aggregate_unregister(&pdev->dev, &dss_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

