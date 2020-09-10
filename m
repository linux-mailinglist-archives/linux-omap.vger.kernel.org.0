Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 605B426454E
	for <lists+linux-omap@lfdr.de>; Thu, 10 Sep 2020 13:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730104AbgIJLWH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 07:22:07 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:12556 "EHLO
        cmccmta2.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730438AbgIJLTK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Sep 2020 07:19:10 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.3]) by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee85f5a0899992-8a133; Thu, 10 Sep 2020 19:06:01 +0800 (CST)
X-RM-TRANSID: 2ee85f5a0899992-8a133
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.112.105.130])
        by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee25f5a0896cdb-115c6;
        Thu, 10 Sep 2020 19:06:01 +0800 (CST)
X-RM-TRANSID: 2ee25f5a0896cdb-115c6
From:   Tang Bin <tangbin@cmss.chinamobile.com>
To:     gregkh@linuxfoundation.org, paul@pwsan.com, aaro.koskinen@iki.fi,
        tony@atomide.com
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Subject: [PATCH] ARM: OMAP1: clock: Use IS_ERR_OR_NULL() to clean code
Date:   Thu, 10 Sep 2020 19:06:40 +0800
Message-Id: <20200910110640.4308-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use IS_ERR_OR_NULL() to make the code cleaner.

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 arch/arm/mach-omap1/clock.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
index bd5be8210..9d4a0ab50 100644
--- a/arch/arm/mach-omap1/clock.c
+++ b/arch/arm/mach-omap1/clock.c
@@ -612,7 +612,7 @@ int clk_enable(struct clk *clk)
 	unsigned long flags;
 	int ret;
 
-	if (clk == NULL || IS_ERR(clk))
+	if (IS_ERR_OR_NULL(clk))
 		return -EINVAL;
 
 	spin_lock_irqsave(&clockfw_lock, flags);
@@ -627,7 +627,7 @@ void clk_disable(struct clk *clk)
 {
 	unsigned long flags;
 
-	if (clk == NULL || IS_ERR(clk))
+	if (IS_ERR_OR_NULL(clk))
 		return;
 
 	spin_lock_irqsave(&clockfw_lock, flags);
@@ -650,7 +650,7 @@ unsigned long clk_get_rate(struct clk *clk)
 	unsigned long flags;
 	unsigned long ret;
 
-	if (clk == NULL || IS_ERR(clk))
+	if (IS_ERR_OR_NULL(clk))
 		return 0;
 
 	spin_lock_irqsave(&clockfw_lock, flags);
@@ -670,7 +670,7 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 	unsigned long flags;
 	long ret;
 
-	if (clk == NULL || IS_ERR(clk))
+	if (IS_ERR_OR_NULL(clk))
 		return 0;
 
 	spin_lock_irqsave(&clockfw_lock, flags);
@@ -686,7 +686,7 @@ int clk_set_rate(struct clk *clk, unsigned long rate)
 	unsigned long flags;
 	int ret = -EINVAL;
 
-	if (clk == NULL || IS_ERR(clk))
+	if (IS_ERR_OR_NULL(clk))
 		return ret;
 
 	spin_lock_irqsave(&clockfw_lock, flags);
@@ -791,7 +791,7 @@ void clk_preinit(struct clk *clk)
 
 int clk_register(struct clk *clk)
 {
-	if (clk == NULL || IS_ERR(clk))
+	if (IS_ERR_OR_NULL(clk))
 		return -EINVAL;
 
 	/*
@@ -817,7 +817,7 @@ EXPORT_SYMBOL(clk_register);
 
 void clk_unregister(struct clk *clk)
 {
-	if (clk == NULL || IS_ERR(clk))
+	if (IS_ERR_OR_NULL(clk))
 		return;
 
 	mutex_lock(&clocks_mutex);
-- 
2.20.1.windows.1



