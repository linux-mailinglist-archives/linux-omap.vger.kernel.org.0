Return-Path: <linux-omap+bounces-4763-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E939C081CD
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 22:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 583064E1936
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 20:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7016E2FF673;
	Fri, 24 Oct 2025 20:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nefs8UR7"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097922FB967;
	Fri, 24 Oct 2025 20:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761338799; cv=none; b=g/WmDZ7xAH9ROqgqiUg2pv7ccjC06omQsDP8th6w9iob2TWKQH5B7lilGXv57+OEF6CJEWodBvB+8yy/TfVisYw8V50E8Y0qXxZmz7g5yqFs1ivku0hy1fRcQBHctn1r3gohA8foYJpHvwxJAZmj87KhlQ+ruzH2ainiq9UhosI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761338799; c=relaxed/simple;
	bh=98Zvu5AgaYK6qIu+QJmSlANsfadhBZxpzytMkLF+ZG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kk2MiiWHvrF6VrqgF9gk7FNlpQi/CUzH81awfKbr1HM70KoSGTEqEFIB/6MHv0USd0H5qm+1PhzS2D3GLrOSH8ORi2XLYsN8OLzj0ONeIp3kfWf/Wz+9AmihlGvu9bBtAPkKWoc3qVasVJ4kRLT4LhbPq26axN8Inasd60BKSEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nefs8UR7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FECC4CEF1;
	Fri, 24 Oct 2025 20:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761338798;
	bh=98Zvu5AgaYK6qIu+QJmSlANsfadhBZxpzytMkLF+ZG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nefs8UR750e0K0a+YYbAC2jVN2w+u4rejn/5PerP3v2Fy5ObZhCuyeqLo8Hf7qc20
	 wjZqz0L5iQVrSzqUWhwl3apnJVLdrK+N9wckhlOJwgjNpAWYosAGaJgVIg7VSTuY6n
	 SAKFek9l1NQOotL9DK6jTwlIBTpvlckruL6tcxnSvGpk6OcdQrzGzcWoJV49DX2wRu
	 c8CEBz93aRbD9bF0sod2WzcKwmsJAg7vp/hgQcxM4SoILZ8LyL8Ovd3ke9pwRtc3Kq
	 tMW5hMIi9A/lsx2vPs5j66OUTHD3Me/AjuBabgeMMbNbmEq9PR4tWKdEdy5LROyHd8
	 qRY42Z7dy64tA==
From: Roger Quadros <rogerq@kernel.org>
Date: Fri, 24 Oct 2025 23:46:08 +0300
Subject: [PATCH net-next v5 9/9] net: ethernet: ti: am65-cpsw: remove
 cpsw_ale_classifier_setup_default()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-am65-cpsw-rx-class-v5-9-c7c2950a2d25@kernel.org>
References: <20251024-am65-cpsw-rx-class-v5-0-c7c2950a2d25@kernel.org>
In-Reply-To: <20251024-am65-cpsw-rx-class-v5-0-c7c2950a2d25@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4315; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=98Zvu5AgaYK6qIu+QJmSlANsfadhBZxpzytMkLF+ZG8=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBo++WPqP7IZYNhaxFFIMaOQcg+W3lN/wjISsj2l
 WOyDAc7OfGJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaPvljwAKCRDSWmvTvnYw
 k/5AD/9Uv+uX9P7Q8tdGjufveTOSOoBcgTdQbnFqD2G/uot5NHOXVeukD2FCHR8p0/LbvPNtSdo
 M2/oRvkRlBVNklglGGAMGtW7CbpgXBsUIDotqwjzRVvjl3rR0a/OAuJQM6zGOW5QB7JvAps8REe
 b6STPcdNjOeO6LLazG08e2xKMGoUz4XwpYlW3OKRfedYrHldJBaJ0Tt61jySPxcWclazUL2GyTZ
 v1aaPJCLyIQ7vyLm9nap5ZoKP/N9ZbG451eGYTEVInnYhSexE6epNawKhkD5vp2PXhJ/35oXWsf
 DCFbZGJe7+tTUWScE0CPMDCpWiNH9ZwiuowUxYgFE7aehcGmABiOJqGi79I92JkT+YNy70/nWwh
 EtmDj6nIHj8fa0SDdNOMa7A83jHSCzyD7WNrGExrTTC8Ppon057GId4sPIGRrrZw++BcKKyia/j
 IZGC+G9MpNL9kK31CKR9eWcO4MMgg8WfS+DxEsYRY+pycyyt66Dp7T7T6QTSqui5Ihn7VqTLZUD
 SbUGAOzHAVhNtUxMKEeSZSVLD7huq42OW/XgGEdzqx4/jiwUxs4srh6LrfpbkQtj8nsGX/jejc/
 ufaUkHTWt2sFO1JcRVpg6LmzE7KhlP0zA+HyCymh8iCkAf9DQAU6zW4q0hXi/XKsgMJPraQrbTc
 VZ8oyhiwhCegOZA==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

The RX classifier can now be configured by user using ethtool -N.
So drop cpsw_ale_classifier_setup_default().

The default behaviour is that all RX traffic is routed to channel 0.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c |  3 --
 drivers/net/ethernet/ti/cpsw_ale.c       | 52 --------------------------------
 drivers/net/ethernet/ti/cpsw_ale.h       |  1 -
 3 files changed, 56 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 1466cf5706c911ede9e03d53f58af83c24a66544..366b70fc79726fa7ca26e6d3abafac3468fdfdf8 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -2494,9 +2494,6 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 		}
 	}
 
-	/* setup classifier to route priorities to flows */
-	cpsw_ale_classifier_setup_default(common->ale, common->rx_ch_num_flows);
-
 	return 0;
 
 err_request_irq:
diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 9492d0cf06bbbe227899e9a235f2fe52da3acad6..141523f34d9a9441d47248d24cbd8f3cf0a97bf2 100644
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
index dbc095397389d36df54a29d46e905f7eeb790e87..5c96147309988a675c3ec6d1361250f927695641 100644
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


