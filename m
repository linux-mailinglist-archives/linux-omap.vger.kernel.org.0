Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4496E42DFA1
	for <lists+linux-omap@lfdr.de>; Thu, 14 Oct 2021 18:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232496AbhJNQvF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Oct 2021 12:51:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:37450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233497AbhJNQvB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 Oct 2021 12:51:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2BDD6109E;
        Thu, 14 Oct 2021 16:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634230136;
        bh=/Hf0VjXN6iyYy6YK32OUC6tMBg1hQi/SYJ14SKE5H/4=;
        h=Date:From:To:Subject:From;
        b=ooCImsbvs+VtpH8EU0ZNPxgl6dfPCRirRShNowMC4TH6HA74C7k0jmazO2lO0D4FB
         riKUsg+P3Tw825Db06ypvOYMi00tW/xFnJFc1Obfqp53qI/qhjkBm0iH1StR785T00
         oaQBtBpMgElQP7UP/dEG34IdcqgEH2An1K1HBjaKzzEHlSOldL0drDzqeQbGIb0JFT
         C4AR2wXM5KPbcEDc2IIG89gllO6wPZ9p81Ij4MOL+dzXfL2IzEJSTZYkT2hj+5hiff
         mNAy8+H+ftORN/K2uJcBivQsPuJWRzOK2Fe/JpABAoSmBWQP27zTM4XHmO6m5pK03I
         G79ZH9vfz96dg==
Date:   Thu, 14 Oct 2021 11:53:20 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org, ;
Illegal-Object: Syntax error in To: address found on vger.kernel.org:
        To:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
Subject: [PATCH] video: omapfb: Fix fall-through warning for Clang
Message-ID: <20211014165320.GA1145571@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix the following fallthrough warnings:

drivers/video/fbdev/omap/omapfb_main.c:1558:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           case 0:
           ^
   drivers/video/fbdev/omap/omapfb_main.c:1558:2: note: insert 'break;' to avoid fall-through
           case 0:
           ^
           break;
   1 warning generated.

This helps with the ongoing efforts to globally enable
-Wimplicit-fallthrough for Clang.

Link: https://github.com/KSPP/linux/issues/115
Link: https://lore.kernel.org/lkml/202110141005.hUjaYMEi-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/video/fbdev/omap/omapfb_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 3d090d2d9ed9..b495c09e6102 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1555,6 +1555,7 @@ static void omapfb_free_resources(struct omapfb_device *fbdev, int state)
 	case 1:
 		dev_set_drvdata(fbdev->dev, NULL);
 		kfree(fbdev);
+		break;
 	case 0:
 		/* nothing to free */
 		break;
-- 
2.27.0

