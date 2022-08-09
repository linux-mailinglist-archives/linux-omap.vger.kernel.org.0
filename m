Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B493758D4B0
	for <lists+linux-omap@lfdr.de>; Tue,  9 Aug 2022 09:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237465AbiHIHf5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Aug 2022 03:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239263AbiHIHf3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Aug 2022 03:35:29 -0400
X-Greylist: delayed 783 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 09 Aug 2022 00:35:07 PDT
Received: from mx5.cs.washington.edu (mx5.cs.washington.edu [IPv6:2607:4000:200:11::6a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 622052124D
        for <linux-omap@vger.kernel.org>; Tue,  9 Aug 2022 00:35:07 -0700 (PDT)
Received: from mx5.cs.washington.edu (localhost [IPv6:0:0:0:0:0:0:0:1])
        by mx5.cs.washington.edu (8.17.1/8.17.1/1.26) with ESMTP id 2797LJOS139036;
        Tue, 9 Aug 2022 00:21:19 -0700
Received: from attu7.cs.washington.edu (attu7.cs.washington.edu [IPv6:2607:4000:200:10:0:0:0:86])
        (authenticated bits=128)
        by mx5.cs.washington.edu (8.17.1/8.17.1/1.26) with ESMTPSA id 2797LF1p139032
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
        Tue, 9 Aug 2022 00:21:16 -0700
Received: from attu7.cs.washington.edu (localhost [127.0.0.1])
        by attu7.cs.washington.edu (8.15.2/8.15.2/1.23) with ESMTP id 2797LFCU1734120;
        Tue, 9 Aug 2022 00:21:15 -0700
Received: (from klee33@localhost)
        by attu7.cs.washington.edu (8.15.2/8.15.2/Submit/1.2) id 2797L9Bv1734086;
        Tue, 9 Aug 2022 00:21:09 -0700
From:   Kenneth Lee <klee33@uw.edu>
To:     bcousson@baylibre.com, paul@pwsan.com, tony@atomide.com
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Kenneth Lee <klee33@uw.edu>
Subject: [PATCH] ARM: OMAP2+: hwmod: Use kzalloc for allocating only one element
Date:   Tue,  9 Aug 2022 00:20:50 -0700
Message-Id: <20220809072050.1733996-1-klee33@uw.edu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use kzalloc(...) rather than kcalloc(1, ...) because the number of
elements we are specifying in this case is 1, so kzalloc would
accomplish the same thing and we can simplify.

Signed-off-by: Kenneth Lee <klee33@uw.edu>
---
 arch/arm/mach-omap2/omap_hwmod.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index 31d1a21f6041..da0381051207 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -3455,7 +3455,7 @@ static int omap_hwmod_allocate_module(struct device *dev, struct omap_hwmod *oh,
 	}
 
 	if (list_empty(&oh->slave_ports)) {
-		oi = kcalloc(1, sizeof(*oi), GFP_KERNEL);
+		oi = kzalloc(sizeof(*oi), GFP_KERNEL);
 		if (!oi)
 			goto out_free_class;
 
-- 
2.31.1

