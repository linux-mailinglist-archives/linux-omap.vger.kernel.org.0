Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F152A466C9A
	for <lists+linux-omap@lfdr.de>; Thu,  2 Dec 2021 23:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377575AbhLBWcR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Dec 2021 17:32:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377482AbhLBWby (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Dec 2021 17:31:54 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0238C0613B4
        for <linux-omap@vger.kernel.org>; Thu,  2 Dec 2021 14:28:00 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id x7so882745pjn.0
        for <linux-omap@vger.kernel.org>; Thu, 02 Dec 2021 14:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Yh3mBEg2nfQJzEtBIxus+8u5VcBe7iEDAWACHn4tN4=;
        b=AxX8KNRZA+wHuQG9cmu6uyQXNXpNtwIq6kReRzvqhC7DKvgVeLsfqNFckio5CqcnDA
         IambEJt91gZ+LcJwCFW2dxEC4shBxXv8qM4fK3D4PNySlxe0HYd/C91/Ra4VpWir5n9V
         3qKVLxBMkK9asro6XoRwUr4AQ4WMfgSFsfgus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Yh3mBEg2nfQJzEtBIxus+8u5VcBe7iEDAWACHn4tN4=;
        b=rBkfKsT298ilV5kG6sWt1OX6A7ksyRO9jlcP6a0et3Tgl6PAGQ5YZqK7FDBRtMpfJy
         JE0SRx7o+twZ1BAKfY9lWgBS6atQO5+xKZpn5IsLEAWNv8e53XjNbxCke5C9FvkuGNbD
         ZNAzvRm6Y9ZiaNtlwQbLaFEXqZdRT9CsGElNXwfH1SpN1ht/i4GvbXUp+QI+r/pAcUXe
         swHVGbPnd8xCkaK/lnh1RJo0RFrVwuN303x+XGuFGf6HabCXf+vOnvecmVG5KyDtyqbV
         lw5RjzNPWsJcK4vaUDtBYrcjiJCOsXfwFYWtAXk8ORKcLtembQjBMfwJ/1QNTXvFkqDB
         /lzA==
X-Gm-Message-State: AOAM532sWWfrVH6V5+cuiZCHp3QXGsc3pbSBGCBAPZKvx7Gw2W+plMW7
        DaVs7o5d7zpsL4IDTr4EudFk4Q==
X-Google-Smtp-Source: ABdhPJwWWaoXo6RAa2oS9kAIlappw6GQrq7MVtBMy7vND9JLl0sLERmN8auphygexhOMY9NICZU0VA==
X-Received: by 2002:a17:90b:1806:: with SMTP id lw6mr9098680pjb.53.1638484080247;
        Thu, 02 Dec 2021 14:28:00 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
        by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 14:27:59 -0800 (PST)
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
Subject: [PATCH v4 29/34] fbdev: omap2: Migrate to aggregate driver
Date:   Thu,  2 Dec 2021 14:27:27 -0800
Message-Id: <20211202222732.2453851-30-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
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

