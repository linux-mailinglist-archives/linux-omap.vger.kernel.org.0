Return-Path: <linux-omap+bounces-3467-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B78FBA68E13
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 14:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB88B16046A
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 13:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC6625A651;
	Wed, 19 Mar 2025 13:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcdxIDB1"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5897D25A633;
	Wed, 19 Mar 2025 13:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742391700; cv=none; b=UvD8Xsw8qtCURtuBvBiLdQw08g/Tro3Nz6KoHUpqEk6mP1RYxlpFVKR2HDr0Zh0ctvXnsYXQd5WHGZIHAxiAafdHl6q9MiZ7XN7Yme67rcn/oLhTyK4piIYOUavqCUDRoptVR3vo5axYdqkif9nngCgYyosfObVuTHHwdN4/TY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742391700; c=relaxed/simple;
	bh=Ara1eTRtgS9rlnEyA0OeNE3ZvBzOMbrRhAfO22PCfzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0nRnQCrQ7b5KktMnw6DpfWR0w1KKIrA4qM2AZE/0LIK4c9N8ZZVLwclpC6QdPo2FHBEXbaJP5Ys03TLXhAXUv0p1r5dZCpIGUyam322eQ34HOhY55cd9SmaeS3/EjLLp1L1Ijj0iO6tUlURZAgUZEXpZyDk03JoYuxHgTsM2wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcdxIDB1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573FDC4CEE9;
	Wed, 19 Mar 2025 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742391700;
	bh=Ara1eTRtgS9rlnEyA0OeNE3ZvBzOMbrRhAfO22PCfzs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QcdxIDB1EZzlQrkp6rm95OG1wp3dvhHDhSPLc50Pzy2FYa5hIsBU2qFQRDlcp3KPx
	 6hH4SuwUSD4+vB2IpgOF3y1/KHxFMmm5cJ52xss0IVATuSdLMxICwBBMuF9Pp5btB6
	 yxLODdLFJwF72V4k/OCsmYmj0p1V69o9gLLHoWm7KUk/N2Iz5xMW/zV+ip4QYxzbYH
	 uRcv0bgMLAMWC5uxbXf4m7UKTVMjuzTXs6tHJxQbGG6btWjSjaUZan9lZj+QuPqgUw
	 vIW93w5kpAkbOkcZlME2lJ1nHE9L2wYUTfcLXnAv4FRvOaKQIXXpoZ2g1BgtgjUBZG
	 TaE3y0SKmgG8g==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 19 Mar 2025 15:38:35 +0200
Subject: [PATCH net-next 9/9] net: ethernet: ti: am65-cpsw: remove
 cpsw_ale_classifier_setup_default()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-am65-cpsw-rx-class-v1-9-2bfded07490e@kernel.org>
References: <20250319-am65-cpsw-rx-class-v1-0-2bfded07490e@kernel.org>
In-Reply-To: <20250319-am65-cpsw-rx-class-v1-0-2bfded07490e@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=Ara1eTRtgS9rlnEyA0OeNE3ZvBzOMbrRhAfO22PCfzs=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBn2slyzkJ+yalp2OI63PxmaCvhjL2KqlB9qWnjv
 h+9iAGmpSyJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZ9rJcgAKCRDSWmvTvnYw
 k+b3EAC07QdtXXEsKpV99Jj3h4gQLrNvnMgOgP76JWCvTWVtGMk84TXtxnIzdxJnHbnRWTXKBQZ
 2omXh9O4eyNC4HNmtoO1fw8indQdu41/pqxJMpd/RbGvQNp5Igvdv2Hi9ghtP8O33WubbXudvn2
 7BZO4SQpBqRGN9/YgcHAKQ5kTbMwtxDjoFklU5850OW7rvj7loZVVm1SGSB1sLP+U7KxyNTfnIQ
 ihKY1WCsWHQ538vJ7F0R/Vj5wO3KsidprXBC8hp3iswsacGQclhtUe57EnqkTqD2kZWNnze3Hq9
 3piSRPZ2hvdispTThRpTib6anuj8Yw/EfkC7LI2oRBn3uSpvlOX3oyYiq3hLaTbaoudblrXtvfK
 6rFrJXFv6OXNopaF8APsHvO8kpUbTb52Aych3+GaLOKd/mctKDybo8j79Dmuhmkz15ot7lq4OPd
 ARF/AY1IgLDXb8c1vDI7vye/ciEcguIxoix8B5yo7EzAjP5ATuXO+clq3nQy8ljjiguuGWcxFum
 eYd3fVA6VTnCOima+g+dG6P6YoEUw+PrNRSa8wgT+qPH07J+ta/cund7Pwn07u+ZiCZ/72OqH6G
 Jzf103Z0sXdxBsehs2ukLFpVNzyMNTyDCypyewN/hrYUEYaETAwP4hftC8HojA7nmhutKrkLSVp
 hy4lLuCkRjgLsrg==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

The RX classifier can now be configured by user using ethtool -N.
So drop cpsw_ale_classifier_setup_default().

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c |  3 --
 drivers/net/ethernet/ti/cpsw_ale.c       | 52 --------------------------------
 drivers/net/ethernet/ti/cpsw_ale.h       |  1 -
 3 files changed, 56 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 700eb42dd381..12edf2a3bea7 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -2497,9 +2497,6 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 			       am65_cpsw_nuss_rx_poll);
 	}
 
-	/* setup classifier to route priorities to flows */
-	cpsw_ale_classifier_setup_default(common->ale, common->rx_ch_num_flows);
-
 	return 0;
 
 err_flow:
diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 48592441085a..6058c0125af4 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -1695,58 +1695,6 @@ void cpsw_ale_policer_reset(struct cpsw_ale *ale)
 		cpsw_ale_policer_reset_entry(ale, i);
 }
 
-/* Default classifier is to map 8 user priorities to N receive channels */
-void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch)
-{
-	int pri, idx;
-
-	/* Reference:
-	 * IEEE802.1Q-2014, Standard for Local and metropolitan area networks
-	 *    Table I-2 - Traffic type acronyms
-	 *    Table I-3 - Defining traffic types
-	 * Section I.4 Traffic types and priority values, states:
-	 * "0 is thus used both for default priority and for Best Effort, and
-	 *  Background is associated with a priority value of 1. This means
-	 * that the value 1 effectively communicates a lower priority than 0."
-	 *
-	 * In the table below, Priority Code Point (PCP) 0 is assigned
-	 * to a higher priority thread than PCP 1 wherever possible.
-	 * The table maps which thread the PCP traffic needs to be
-	 * sent to for a given number of threads (RX channels). Upper threads
-	 * have higher priority.
-	 * e.g. if number of threads is 8 then user priority 0 will map to
-	 * pri_thread_map[8-1][0] i.e. thread 1
-	 */
-
-	int pri_thread_map[8][8] = {   /* BK,BE,EE,CA,VI,VO,IC,NC */
-					{ 0, 0, 0, 0, 0, 0, 0, 0, },
-					{ 0, 0, 0, 0, 1, 1, 1, 1, },
-					{ 0, 0, 0, 0, 1, 1, 2, 2, },
-					{ 0, 0, 1, 1, 2, 2, 3, 3, },
-					{ 0, 0, 1, 1, 2, 2, 3, 4, },
-					{ 1, 0, 2, 2, 3, 3, 4, 5, },
-					{ 1, 0, 2, 3, 4, 4, 5, 6, },
-					{ 1, 0, 2, 3, 4, 5, 6, 7 } };
-
-	cpsw_ale_policer_reset(ale);
-
-	/* use first 8 classifiers to map 8 (DSCP/PCP) priorities to channels */
-	for (pri = 0; pri < 8; pri++) {
-		idx = pri;
-
-		/* Classifier 'idx' match on priority 'pri' */
-		cpsw_ale_policer_read_idx(ale, idx);
-		regmap_field_write(ale->fields[POL_PRI_VAL], pri);
-		regmap_field_write(ale->fields[POL_PRI_MEN], 1);
-		cpsw_ale_policer_write_idx(ale, idx);
-
-		/* Map Classifier 'idx' to thread provided by the map */
-		cpsw_ale_policer_thread_idx_enable(ale, idx,
-						   pri_thread_map[num_rx_ch - 1][pri],
-						   1);
-	}
-}
-
 #define HOST_PORT_NUM 0
 
 /* Clear Policer and associated ALE table entries */
diff --git a/drivers/net/ethernet/ti/cpsw_ale.h b/drivers/net/ethernet/ti/cpsw_ale.h
index dbc095397389..5c9614730998 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.h
+++ b/drivers/net/ethernet/ti/cpsw_ale.h
@@ -223,7 +223,6 @@ int cpsw_ale_vlan_add_modify(struct cpsw_ale *ale, u16 vid, int port_mask,
 int cpsw_ale_vlan_del_modify(struct cpsw_ale *ale, u16 vid, int port_mask);
 void cpsw_ale_set_unreg_mcast(struct cpsw_ale *ale, int unreg_mcast_mask,
 			      bool add);
-void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch);
 void cpsw_ale_policer_reset(struct cpsw_ale *ale);
 int cpsw_ale_policer_set_entry(struct cpsw_ale *ale, u32 policer_idx,
 			       struct cpsw_ale_policer_cfg *cfg);

-- 
2.34.1


