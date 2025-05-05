Return-Path: <linux-omap+bounces-3651-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8CEAA98F3
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 18:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13D5E1B618CD
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 16:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6CD2741A4;
	Mon,  5 May 2025 16:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRtQFPDR"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848AB270EC1;
	Mon,  5 May 2025 16:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462428; cv=none; b=IDs+BP1IdLgm9xxXU7u1qJ9Xf7YE1rnVe/9yWZ4+Zk1h3bcat+F7c08wkb5n7jxjkGCZN9lO8I4dMDbOcX0HtFeGvolPp9MtV+AUdGPIr0lvlaQQLnOpISVYU7KmWCH0X/sDO7mxh/fJW4BodFCXWzQMQZu6kWK1FIKh4kO60a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462428; c=relaxed/simple;
	bh=wHh0BxBceQm28qRNNXj5B9KsKZgsI5S+hHvXu32JIJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQkytuw2rT+TwHxi17iAhbbPwZdl/sM3Cpa0sPPypZdGA8ZchstokfjAVaFqmnSBN2f142BT8qnM19IVc+uQR9grbjFkun1cBhO838jMh4Y9dI4faXnI2IDRNIZCO9Co42gIoyphYYAtwhrB0OUyY5sN4yNToMTrN6jO495okgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRtQFPDR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E750C4CEE4;
	Mon,  5 May 2025 16:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746462428;
	bh=wHh0BxBceQm28qRNNXj5B9KsKZgsI5S+hHvXu32JIJg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bRtQFPDRoj8QVvBhxqqNiNo8hmZjtnt8zNiha/jjf/d5c7m5mnCEGNTdGaDgyDpAI
	 uZ+vkHVORL2TWd/0WdfXHjhKBef33NIZP/YuzB1clKcIAjz1Y/Kmw+rvk7vO9cvjFU
	 CJVacekCqdE/bbYuMFcqAvaP4skaAUJiRMZBooIadeL1VfgiPFy7nMdeKWs9vNjLeZ
	 9kIoKJoYsGaf9pU/8fpWagnlUUKQB26s2vCY+6xVklrGArM0YHRLr1Tr8+nOfxwNaG
	 34v3XXJuGDrFVsgF+L4OYpd2LJzCwQ0F96KJqZoiJMvz0YjHVFcSQM1ZiJdx2OMxjp
	 35CsmxKzl6jNw==
From: Roger Quadros <rogerq@kernel.org>
Date: Mon, 05 May 2025 19:26:39 +0300
Subject: [PATCH net-next v2 9/9] net: ethernet: ti: am65-cpsw: remove
 cpsw_ale_classifier_setup_default()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-am65-cpsw-rx-class-v2-9-5359ea025144@kernel.org>
References: <20250505-am65-cpsw-rx-class-v2-0-5359ea025144@kernel.org>
In-Reply-To: <20250505-am65-cpsw-rx-class-v2-0-5359ea025144@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4075; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=wHh0BxBceQm28qRNNXj5B9KsKZgsI5S+hHvXu32JIJg=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoGOa7NsXxwdwKprEFRSfDEqqY934bqmxijrX9l
 AKnU+wEEyGJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaBjmuwAKCRDSWmvTvnYw
 k33xEADJ8odgtuThHzioSAr/lfpBpypc92cmMCGI5/jCji38P0bh7myevGMdJC+EVO7P/BNFUgR
 iQJTwwQWcXVNY4EQU14c9KemjfGkZrW+X5vNh7Mx/CCC/XhIv4XR3Et3BJ8N5+bDPJXJ8/mga6+
 57tGR5UDdB8ctOgJsE0sYwYPejxG8Y9tnvhX9DLu/yX7wksy/2/i3ZZnLKS/rYTIdYthUU3Dnnq
 nj7FEw1UdokU8yhVhBAy2H4rjOiB6Erfg7qua8DiL2hs+PbBZp3USgSFEeSUX1z3AL3RBjjs4g9
 VZVoWSb0NabNSPtff/SqLTF1cxuW0ndMecL6BaG4P9h/c5MSkA9wwunw9+vAfP2BMwzNqD5lkAs
 9yIbISSNSAX2Y/Xj5e6tFcelMCO7SGz10NHxKPgRaUEhfoPHJahQERLYvgHzt1cYvQ4M+TZ4RLr
 fFVZQ8Sio0IJ17+Wzm0P/+ScxEl1rMSFt2VDk2bl9HR1L6dKCqo9LFSMYbHSHI+keWfDwn700UA
 19MHzxkPWW4s20/MJveXvfLrl5U9BJ+mkarMKLvmR4mizhN2/ToDS04yucvD7vPoKcoXZxSq5Hc
 jA3yxxjp1mBhxuFyvajI3Tqaii3haKpklXVrmxVxGI8wHay+SluYHbor6amA7EEJune2BoYYtUt
 AMyJOEJArFKAP3w==
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
index cdb83ae54656..0523c81a2a54 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -2497,9 +2497,6 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 		}
 	}
 
-	/* setup classifier to route priorities to flows */
-	cpsw_ale_classifier_setup_default(common->ale, common->rx_ch_num_flows);
-
 	return 0;
 
 err_request_irq:
diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 4e29702b86ea..85fcd09fd830 100644
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


