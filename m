Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34216524DED
	for <lists+linux-omap@lfdr.de>; Thu, 12 May 2022 15:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353082AbiELNLp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 May 2022 09:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354377AbiELNLf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 May 2022 09:11:35 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0DD06633B8;
        Thu, 12 May 2022 06:11:33 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 127DE80B3;
        Thu, 12 May 2022 13:07:56 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
Subject: [PATCH] phy: mapphone-mdm6600: Fix runtime disable on probe
Date:   Thu, 12 May 2022 16:11:28 +0300
Message-Id: <20220512131128.631-1-tony@atomide.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit d644e0d79829 ("phy: mapphone-mdm6600: Fix PM error handling in
phy_mdm6600_probe") caused a regression where we now unconditionally
disable runtime PM at the end of the probe while it is only needed on
errors.

Fixes: d644e0d79829 ("phy: mapphone-mdm6600: Fix PM error handling in phy_mdm6600_probe")
Cc: Miaoqian Lin <linmq006@gmail.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/phy/motorola/phy-mapphone-mdm6600.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/motorola/phy-mapphone-mdm6600.c b/drivers/phy/motorola/phy-mapphone-mdm6600.c
--- a/drivers/phy/motorola/phy-mapphone-mdm6600.c
+++ b/drivers/phy/motorola/phy-mapphone-mdm6600.c
@@ -627,10 +627,12 @@ static int phy_mdm6600_probe(struct platform_device *pdev)
 	pm_runtime_put_autosuspend(ddata->dev);
 
 cleanup:
-	if (error < 0)
+	if (error < 0) {
 		phy_mdm6600_device_power_off(ddata);
-	pm_runtime_disable(ddata->dev);
-	pm_runtime_dont_use_autosuspend(ddata->dev);
+		pm_runtime_disable(ddata->dev);
+		pm_runtime_dont_use_autosuspend(ddata->dev);
+	}
+
 	return error;
 }
 
-- 
2.36.1
