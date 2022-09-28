Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5502A5ED626
	for <lists+linux-omap@lfdr.de>; Wed, 28 Sep 2022 09:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233599AbiI1Hcp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Sep 2022 03:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233619AbiI1Hch (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Sep 2022 03:32:37 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 09252EFF55;
        Wed, 28 Sep 2022 00:32:15 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 6F5A6816A;
        Wed, 28 Sep 2022 07:21:46 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Romain Naour <romain.naour@smile.fr>
Subject: [RFC PATCH 2/5] serial: 8250: omap: Fix unpaired pm_runtime_put_sync() in omap8250_remove()
Date:   Wed, 28 Sep 2022 10:29:31 +0300
Message-Id: <20220928072934.48359-3-tony@atomide.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928072934.48359-1-tony@atomide.com>
References: <20220928072934.48359-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On remove, we get an error for "Runtime PM usage count underflow!". I guess
this driver is mostly built-in, and this issue has gone unnoticed for a
while. Somehow I did not catch this issue with my earlier fix done with
commit 4e0f5cc65098 ("serial: 8250_omap: Fix probe and remove for PM
runtime").

Fixes: 4e0f5cc65098 ("serial: 8250_omap: Fix probe and remove for PM runtime")
Depends-on: dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/serial/8250/8250_omap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1475,6 +1475,11 @@ static int omap8250_probe(struct platform_device *pdev)
 static int omap8250_remove(struct platform_device *pdev)
 {
 	struct omap8250_priv *priv = platform_get_drvdata(pdev);
+	int err;
+
+	err = pm_runtime_resume_and_get(&pdev->dev);
+	if (err)
+		return err;
 
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
-- 
2.37.3
