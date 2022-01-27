Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C8749EC07
	for <lists+linux-omap@lfdr.de>; Thu, 27 Jan 2022 21:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240342AbiA0UDi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Jan 2022 15:03:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343854AbiA0UCe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Jan 2022 15:02:34 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86AB6C06177B
        for <linux-omap@vger.kernel.org>; Thu, 27 Jan 2022 12:02:32 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id q75so3229929pgq.5
        for <linux-omap@vger.kernel.org>; Thu, 27 Jan 2022 12:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=91Z2d0mjHlreqpecJ7pSmgXY2IVlH38FqXsuAjWZmko=;
        b=azXGQXgKkiXx9Hrb2SvK5M/d+nnYVFTKHAAmgUFanjAJD8SmcK8n3rWARtQsmdzh1w
         uT0oNhth/wwX7p41tikgOyhpCmwn7PJgfgI7N8EJxphlXwshQpQiPh+AyY1cRqwxa6YN
         fLmW6iHObG4gITceNhHTVVf1OF7Mysd4CU0IY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=91Z2d0mjHlreqpecJ7pSmgXY2IVlH38FqXsuAjWZmko=;
        b=gD2Vsu2Kmy5kLTpuOOsu3xfE0CcIyKwvMISj9J8IPfw09OWHdrASx7yFHISBSEwqCd
         65VBL3jXEKnjgfhE5Rqg1bCiNIyReU8jGhJgJmAbRzE02B3ZXgnT30+wW0ZjIPpvr4FY
         UGdG4uinhyxs490ZpXcWsEDlRs6yNjbQKbqB6KUXwPaatEIjsVnw7GWeoluY4nAzwNNe
         a5qqQuwdi+pKCl7cbdw8YPSb0EG3w5aw+TopEi+2cjUMFwhgVRodbhx3S1i+pwOI4W0R
         0FtH4xUD2e9CoBexU0SUEYfj24qtHoFTKkFzW82WPzckLG8xiWxk4+dEeiv9Rpyg8hNh
         P5Cg==
X-Gm-Message-State: AOAM532FT/284GdXqq83r4y6b2E54t0ubCYI8k6XW07nf9u/SirKO7fg
        PuDQ7wzNzCVK/F+7KAH76MhqEA==
X-Google-Smtp-Source: ABdhPJxqGqvR7cwrQBut5IHmzB0xhFmu1buz49cWUzx4Hg9ZdT83OqiQnqJ+DRrh0+GRK3FZyg7Hzw==
X-Received: by 2002:a65:6041:: with SMTP id a1mr3876357pgp.231.1643313752060;
        Thu, 27 Jan 2022 12:02:32 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
        by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 12:02:31 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v6 28/35] fbdev: omap2: Migrate to aggregate driver
Date:   Thu, 27 Jan 2022 12:01:34 -0800
Message-Id: <20220127200141.1295328-29-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220127200141.1295328-1-swboyd@chromium.org>
References: <20220127200141.1295328-1-swboyd@chromium.org>
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
index a6b1c1598040..0bdb9f909992 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
@@ -1067,8 +1067,9 @@ static int dss_video_pll_probe(struct platform_device *pdev)
 }
 
 /* DSS HW IP initialisation */
-static int dss_bind(struct device *dev)
+static int dss_bind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct platform_device *pdev = to_platform_device(dev);
 	struct resource *dss_mem;
 	u32 rev;
@@ -1167,8 +1168,9 @@ static int dss_bind(struct device *dev)
 	return r;
 }
 
-static void dss_unbind(struct device *dev)
+static void dss_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
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

