Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84D7858C083
	for <lists+linux-omap@lfdr.de>; Mon,  8 Aug 2022 03:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243301AbiHHBwa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 7 Aug 2022 21:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243549AbiHHBvP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 7 Aug 2022 21:51:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D74018B04;
        Sun,  7 Aug 2022 18:38:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0F11360DF5;
        Mon,  8 Aug 2022 01:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA8FEC4347C;
        Mon,  8 Aug 2022 01:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659922692;
        bh=f/BuLTN4u7KLUgN1z0stkr4+2cfAX1Qvcl3cgUYEets=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DNAbbU67OlAS+gA8PWHzHRFyPXPRLcL6p6Pcc4MRH6dB0rSSh13ZW2GqiD+iwnDlJ
         AsN5iV9Vvw0eBLOAbV0MabeFN+WWYKXna4chAGNPJQYsugZqraJFAqXAweEy0hbIyi
         iUTFYFYnjvb/YSJDz3CLOwTfhaZmu0x/we6+OHROBx4mF2j9v3YSPnnUYJq8K+KNjw
         lCqUtpv/n9MVITEmgLphIBz8FlIY0dfRh1iNco83APJ1Eq5J8FUKGGVwhbTwrq23b8
         hzrCajj9gQGjNyyMdTwzbCUUCAPrsiTm4d5YWiM9ymL7LQhvRpslYUZOTu5q9NJVFY
         Si+v7l3yU3vvA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Liang He <windhl@126.com>, Tony Lindgren <tony@atomide.com>,
        Sasha Levin <sashal@kernel.org>, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 18/29] ARM: OMAP2+: display: Fix refcount leak bug
Date:   Sun,  7 Aug 2022 21:37:28 -0400
Message-Id: <20220808013741.316026-18-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220808013741.316026-1-sashal@kernel.org>
References: <20220808013741.316026-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Liang He <windhl@126.com>

[ Upstream commit 50b87a32a79bca6e275918a711fb8cc55e16d739 ]

In omapdss_init_fbdev(), of_find_node_by_name() will return a node
pointer with refcount incremented. We should use of_node_put() when
it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
Message-Id: <20220617145803.4050918-1-windhl@126.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/mach-omap2/display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap2/display.c b/arch/arm/mach-omap2/display.c
index 6098666e928d..fc635eed73ab 100644
--- a/arch/arm/mach-omap2/display.c
+++ b/arch/arm/mach-omap2/display.c
@@ -211,6 +211,7 @@ static int __init omapdss_init_fbdev(void)
 	node = of_find_node_by_name(NULL, "omap4_padconf_global");
 	if (node)
 		omap4_dsi_mux_syscon = syscon_node_to_regmap(node);
+	of_node_put(node);
 
 	return 0;
 }
-- 
2.35.1

