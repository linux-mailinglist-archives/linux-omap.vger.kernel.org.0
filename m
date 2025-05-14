Return-Path: <linux-omap+bounces-3721-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43072AB6AFF
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 14:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BED563A8082
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 12:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3107827EC80;
	Wed, 14 May 2025 12:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQWVr4ce"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36D027E7F0;
	Wed, 14 May 2025 12:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747224298; cv=none; b=B4i/20nOJTPdjZOGY1zjGiLcw3JxvYPyGuEXrrvcrTMBdyYBYP1tKOtQHSr1PuJ5a53Cv3jA5d6RwcwAVEcxurHul6s5gppmoZx1N1ZgjDXO2n5CVlnsiomurymCOg+QHSMftQB/66whKzHhAxZvBkNyR+IsSQa9HwOTEUpoqOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747224298; c=relaxed/simple;
	bh=ZLuQ+QKiv6AHk6aYVgypKAalpJm1udHDw0jrk7Sr2HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jDnDmDfTydEWmpJqhnHVEhkx/Og17/H6ZVwkFPTii06KZuSjYIHSliqyk2hRUdkD9mSDKWwYPGJ58bqBxku+mTZh8L1pWGYzPDibpUdBWpRgMUEjmYIC3uaoElOsPwIYSfH8UUx9+uMok7et9kOnpdqJSStuqXRvvdAJmr44odE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQWVr4ce; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76566C4CEF0;
	Wed, 14 May 2025 12:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747224298;
	bh=ZLuQ+QKiv6AHk6aYVgypKAalpJm1udHDw0jrk7Sr2HM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nQWVr4ceomZQiVyJDD2RLJXhCp007SAaQ3hux2k5W2JzwcUW/2KBfYBAbmHKSnHjd
	 RnyovmoDllw6CW5QwAWHMMLyCYWaIYQ/zMn7vlAmsGN/9bejTckcpQ8I4RREN6lI4e
	 qzJitNlYzDqwX1tdwZtC6OGYV6G/IHaawSHfPRaqK3FOnlrT9V0CbWlwJHJ0KJcul/
	 4fMXX22vtyqNLLNwkSPeFglAOKTKZ3SRvyy6hz9io4Q/qFCQPzlTkW8QAdFPE95YAd
	 zBS6Pt6PmrccdT3sK7sYj75FIAhSnNCRUHpTBJiF7ncmt/3qEwCyh7P8Rfc8BSr4QQ
	 l6pOOP92h+Y5A==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 14 May 2025 15:04:29 +0300
Subject: [PATCH net-next v4 9/9] net: ethernet: ti: am65-cpsw: remove
 cpsw_ale_classifier_setup_default()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-am65-cpsw-rx-class-v4-9-5202d8119241@kernel.org>
References: <20250514-am65-cpsw-rx-class-v4-0-5202d8119241@kernel.org>
In-Reply-To: <20250514-am65-cpsw-rx-class-v4-0-5202d8119241@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4075; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=ZLuQ+QKiv6AHk6aYVgypKAalpJm1udHDw0jrk7Sr2HM=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoJIbJgvwvVRPMVMrXLHpU7je+8Sp2Temu9+DTu
 B7XMCjhsYmJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCSGyQAKCRDSWmvTvnYw
 kyFkD/4o2JEvfduzn104O4gNsUiLmyaKFR+/ymEzhChd2ruMMvzuXYqiIApQu4hcpO/ioRp4gcu
 f3A4EMscKxuHkLTuWNHecHFy5kwU278sYmtvuZnfNeZhY0/4tDc5StzHTMjz5SrMJ34IVyYJGaz
 E5CRSXhjYozVtgvEsq1YqHd0oZWvso0C26uZjMm2A+DpLN4OblPOmvMKyB09310lk/OC9eN0Vxb
 a+k+xIuX8IC+9HjuXY8GAi8rUjTItrCBxKR9mogdwwHy+Yd+NA9zINUqa1FtuIsKaBENNwQmXTw
 +lEjvzrbq3H28uVnUNaI2DN7npfaFGB1+LAjSYdhOam80jbaDxd3GbAhKBQaQ8eOQhASxCHhxnI
 e9q2JwPMl+jP3IYAm6oetl233VNwiR9kbcyjcn0BENe4UijJ8iiDwWoXDm7z86UzaFz3SRtCYKg
 3N0yZQcKmrqgmUnpC/YKWvIwt9JKh6SNf3HIGhB1nP1k18+Gy56fJzXS55J1c6crIU+d6TXt6ip
 /VUwfSxtrz5TG17P+NCZfm83RmXGD5uaWF+8kx/JTkLHjFoOSpT0FpRdeU8ZcCuWpyfYiZkza1Z
 dqGgiGs+tGKZXy8BYC0fDd0D1WLbdgVNsAogbq1NhbRX8AZnJYdHgI2nv86XO7Syc5aK7LuOz3n
 sKnUga6x5p6sjrA==
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
index 0cd27a6fe575..ba639d87706b 100644
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


