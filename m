Return-Path: <linux-omap+bounces-3714-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61581AB6AEE
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 14:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A88DE1B63B64
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 12:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE64279780;
	Wed, 14 May 2025 12:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AX5r23C4"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9AB224AED;
	Wed, 14 May 2025 12:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747224276; cv=none; b=uwVGEnOCIRUXNxfLByIjAAybs1B7Ad+GZGyqSWGrID5dqLiA5pPeb5UFFrdLeq18M1SmKFRvytei/kSGZUVfrSPgmx53Ry0vt0K0TbiKe40MApNHkwHpp0tfHoHu/xScxbZCbhJ9s+FQh+hTQQCDNi+5kSMOC7/t5dth7P1D/Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747224276; c=relaxed/simple;
	bh=YbtaSFXvEqscgWdaWU4X/6cPyfGpueE1ti1NCjiITjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IzphKiFmRORlb9uBHBqqc3mi1HCOy039HG6jvTdsd0N1WJQRX68Fm+R6F0U7o1HHgw80EslKRxKyVVsIzendLtOhiErRY67XSVcZvXmALbtZNJTi/vF4Ohz0aeb2AUD5m/600ygt2/jj6zlscPBeX8OsZdWXzpVqTQW5aYxug28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AX5r23C4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF32C4CEE9;
	Wed, 14 May 2025 12:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747224275;
	bh=YbtaSFXvEqscgWdaWU4X/6cPyfGpueE1ti1NCjiITjk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AX5r23C4h84VDY7k2SjRXXVS+Ez8UA9sMmjHKvknh/YsUHjn5lqod29mgjJsbJtQ7
	 SAdgVG59qPvHNp6vQYAVz4h5XhxT3PnblqfAggzF1l3iFbi2CU3xuzdtbRzVzpWbOA
	 pl6iLOMDX7HsbBT7C6z/dIADQurDLxUfxKmn3cG4flN7b0S0tSzDw9Pl30oqswz2Ii
	 XXcWn19jbmjlkZ/CvFywOk3xWDx/RdWeraFhj+ESYuYjPIUjH9sRC9VmTDK3JY61R2
	 2ppiVJTrkZ5tCrON7EmfNtrKssXefS5HfvB+4Qax1s/otsZ/2BRaZZtVOa3zfR/r+5
	 Y1dCNCa2VmeJQ==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 14 May 2025 15:04:22 +0300
Subject: [PATCH net-next v4 2/9] net: ethernet: ti: cpsw_ale: return ALE
 index in cpsw_ale_add_vlan()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-am65-cpsw-rx-class-v4-2-5202d8119241@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2474; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=YbtaSFXvEqscgWdaWU4X/6cPyfGpueE1ti1NCjiITjk=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoJIbIi6cIbsAzjH6bHTkh9BchbPkP1lpLK28JF
 TUjeFraD92JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCSGyAAKCRDSWmvTvnYw
 k5ibD/9y2eBWVHqD5RH5Jmf8Uy2QBH00IA1gQh4M+S9ctcN8VlYe6r7lmLuforULZsBVoyOBi8m
 ocv0YyLPZfdoIP6oHW51L1bvKkG7lgkGq6wv5mjt7pjQAKum2C/I24Um4EbbwMd1eN+ihINSUJg
 rIzCYKXhV4WkwLoElQHHFPKHAGFSUSkKCP5mxW1K2mnFoqCDk9toAxgRK/i/TPdoi/HjHXGNSf3
 8gxoQ4hMT3XyIgz17/LceAJgUr66Y+ilvT/iIvZrsc4+Ynm1gQfC+9cREgPhAnWzN3lXZ3SkH06
 OIl1I8prcT92h0cFD1BdXMs7v9IZ/em/ZPmzXxaTY7zD6gSOBtdqQ28GQ90WqYCrzhOMbgwD6uq
 aVRaEmqS3Ri7Q0dUBRomDmNA71osD2ow123Jt64gaE0kSIrickQ3nW26nxWPfamv5isr0VPtK4G
 G3Oc4XIab3pgT7sH3aMjFpQ7gSeBA4Mbcx7yqxVHUlqEdKRrXoIvUFNkIAaMPAgEEVnLZPDr7mg
 lNb2bIftsSICzfFNA/Dk3m2joXvQcdJ5Sznw707ga50VDEuswb/+Bl34CVLc6suWGlr46aMq5/G
 ZuY2Bfu7N+qzRm3ZzNbX54+HgYRrsD4Z0HaVCtXy+ZtlkhCNGDh6smIQA2yZs8zU7cAbEwz6Sgc
 WGFlbbBjz2ObO5Q==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Policer helpers will be interested to know what ALE index was used
for the added VLAN entry. So return the ALE index instead of zero
on success.

Modify existing users to check for less than zero as error case.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw.c     | 2 +-
 drivers/net/ethernet/ti/cpsw_ale.c | 6 +++---
 drivers/net/ethernet/ti/cpsw_new.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index a984b7d84e5e..2d23cba557f3 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1026,7 +1026,7 @@ static inline int cpsw_add_vlan_ale_entry(struct cpsw_priv *priv,
 
 	ret = cpsw_ale_add_vlan(cpsw->ale, vid, port_mask, 0, port_mask,
 				unreg_mcast_mask);
-	if (ret != 0)
+	if (ret < 0)
 		return ret;
 
 	ret = cpsw_ale_add_ucast(cpsw->ale, priv->mac_addr,
diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 7bb63aad7724..0bdc95552410 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -680,7 +680,7 @@ int cpsw_ale_add_vlan(struct cpsw_ale *ale, u16 vid, int port_mask, int untag,
 		return -ENOMEM;
 
 	cpsw_ale_write(ale, idx, ale_entry);
-	return 0;
+	return idx;
 }
 
 static void cpsw_ale_vlan_del_modify_int(struct cpsw_ale *ale,  u32 *ale_entry,
@@ -803,14 +803,14 @@ int cpsw_ale_vlan_add_modify(struct cpsw_ale *ale, u16 vid, int port_mask,
 
 	ret = cpsw_ale_add_vlan(ale, vid, vlan_members, untag_members,
 				reg_mcast_members, unreg_mcast_members);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(ale->params.dev, "Unable to add vlan\n");
 		return ret;
 	}
 	dev_dbg(ale->params.dev, "port mask 0x%x untag 0x%x\n", vlan_members,
 		untag_mask);
 
-	return ret;
+	return 0;
 }
 
 void cpsw_ale_set_unreg_mcast(struct cpsw_ale *ale, int unreg_mcast_mask,
diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti/cpsw_new.c
index 5b5b52e4e7a7..1516171352cd 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -417,7 +417,7 @@ static int cpsw_add_vlan_ale_entry(struct cpsw_priv *priv,
 
 	ret = cpsw_ale_add_vlan(cpsw->ale, vid, port_mask, 0, port_mask,
 				unreg_mcast_mask);
-	if (ret != 0)
+	if (ret < 0)
 		return ret;
 
 	ret = cpsw_ale_add_ucast(cpsw->ale, priv->mac_addr,

-- 
2.34.1


