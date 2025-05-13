Return-Path: <linux-omap+bounces-3703-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7423AB5467
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 14:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8226719E7A84
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 12:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408A628E5E1;
	Tue, 13 May 2025 12:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOlOM7SS"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAF228DB5F;
	Tue, 13 May 2025 12:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747138402; cv=none; b=A+2v5iFCtTHvnStM/+IG1Crv+Z2ROwZBhGb879OBZNL/gz9CmGJPxcXAx0tr9II2PM9YHv9iCbNxC59iOtcVORFqUUPQL1WD1ZPe9UlvEaYHk6JJjd4in6ivWv2gMjV27pZVx9c4NdHeD53rThSfu+KigTEAPHAFYpnJAI2t8i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747138402; c=relaxed/simple;
	bh=XODr01mBk67NGT5K13Cytm++Hq/blxxRyGOdquDJpL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D1MgeMdnjI2UdJWsJ6rxl9jIer7f+EIoChdd6tfAx+7PvM/3cQ+tzc/ekEbIIrKMsFZSnb357qYavtosIhGW9ZceM4tpdhLU67rHgkgDniQ8UMGvQQhgOExz5M7ypYpGqc33Lr1jOOf24WxhnxGcUyJqHWkMCZQB8EvdOKRQHPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOlOM7SS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB73C4CEE4;
	Tue, 13 May 2025 12:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747138402;
	bh=XODr01mBk67NGT5K13Cytm++Hq/blxxRyGOdquDJpL4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bOlOM7SSNQAa0XSlcgCB6MLeDUhTtRk/WX7iwgywXX4huyy8p9vHpj3Xf80ZFEbpL
	 q4lNYBvyHuifZqHfMaeMW6eAy24Sb6dPqEDBFGVZHymumInm5e2+wvBBN2PmIyo/Sn
	 gW72t4oxxDk3IxWTgozYelIws35ZZr7+o31POnI0bfnBUlnHkcZLk70N31hZiSRjC4
	 MB59GKouDMQPoDVNRtrGIcrkCt5ePz2e/bSeS0EpSfh3/u6tx2BjZZD87gwNHFfmZ+
	 FTFTx+5cuDHkn0nWnhGAEPiyTOAN5JwQgCm0PciSC/JSyaS91UGYk2KBP3t9yp9MT/
	 vo3cEaox6hknA==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 13 May 2025 15:13:07 +0300
Subject: [PATCH net-next v3 3/9] net: ethernet: ti: cpsw_ale: return ALE
 index in cpsw_ale_vlan_add_modify()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-am65-cpsw-rx-class-v3-3-492d9a2586b6@kernel.org>
References: <20250513-am65-cpsw-rx-class-v3-0-492d9a2586b6@kernel.org>
In-Reply-To: <20250513-am65-cpsw-rx-class-v3-0-492d9a2586b6@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4563; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=XODr01mBk67NGT5K13Cytm++Hq/blxxRyGOdquDJpL4=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoIzdUOS+nWbeqMV+dlrpDS6yzwtmWMdFOlWCf8
 aKCACUAlwyJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCM3VAAKCRDSWmvTvnYw
 k0kYD/0QHkA4Nh4P1Pgo746DgSWCjp1YSGeERnUa1+RmK2bk9RBdr9naXvGcyGNt+7QP8nYM/q6
 UDpo0xs3ada/kDQn3rZGq6Fx12KSLg2eAcsrjRieX3XWz8y8+qEn2/M6uro8Q5QCBOkdcjJ284Z
 +/YplJang0xGqmJseQbjq9k62R0+JkfBq1YGrMsZ8Bhm4byX0/VoUoRFum/ubQovtBulgWsDMFQ
 IxfhqeQy2a3b/uYoPvuUueMCnLLvFltXrSQFmtZI1FUOPkgKyAptSdlHBKy4SspcTCK5VosLEL8
 +mmpf+mvkM3CoxUODiTR6VVzublTwD0w539oVKY3P6sKA/RnFD3M0f1efZR3hZwlZsmAbz5fN4d
 zdd2VO2RT86TeftKeSblIbN1nptfUbvaBXmZNdKjgtEEH7UKY0nio95pipIaQ6OIHlR2U8ABxOB
 ScmC2MzSUKnomTKC2CXKJ3EvcyfwUgwiqJw65UzHAeh7/KBRQERi0NSbTJ20lQa0Nz0MpYZRje0
 NsF+zN2GXLrc7IXoyLC4gV61ROZYTnY2xxfNhQ9yxIIudhyWXVMyzNQ4Ckmux2j7yKzKBvx92Sl
 rO5ki2Uf/UmF7A9JYHMNn+Ec0Aq8pLuM9vjJd9v7bbFBvGEDeKeJZ3FXTkvp1srlv8gsj1UGbXw
 qWzGgmR3RWRAzTg==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Policer helpers will need to know what ALE index was used for
the added VLAN entry. So return the ALE index instead of zero
on success.

Modify existing users to check for less than zero as error case.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c      |  2 ++
 drivers/net/ethernet/ti/am65-cpsw-switchdev.c |  6 +++---
 drivers/net/ethernet/ti/cpsw_ale.c            | 10 +++++-----
 drivers/net/ethernet/ti/cpsw_switchdev.c      |  6 +++---
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 988ce9119306..41dc963493de 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -321,6 +321,8 @@ static int am65_cpsw_nuss_ndo_slave_add_vid(struct net_device *ndev,
 	dev_info(common->dev, "Adding vlan %d to vlan filter\n", vid);
 	ret = cpsw_ale_vlan_add_modify(common->ale, vid, port_mask,
 				       unreg_mcast, port_mask, 0);
+	if (ret > 0)
+		ret = 0;
 
 	pm_runtime_put(common->dev);
 	return ret;
diff --git a/drivers/net/ethernet/ti/am65-cpsw-switchdev.c b/drivers/net/ethernet/ti/am65-cpsw-switchdev.c
index d4c56da98a6a..b284202bf480 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-switchdev.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-switchdev.c
@@ -175,7 +175,7 @@ static int am65_cpsw_port_vlan_add(struct am65_cpsw_port *port, bool untag, bool
 
 	ret = cpsw_ale_vlan_add_modify(cpsw->ale, vid, port_mask, untag_mask,
 				       reg_mcast_mask, unreg_mcast_mask);
-	if (ret) {
+	if (ret < 0) {
 		netdev_err(port->ndev, "Unable to add vlan\n");
 		return ret;
 	}
@@ -184,14 +184,14 @@ static int am65_cpsw_port_vlan_add(struct am65_cpsw_port *port, bool untag, bool
 		cpsw_ale_add_ucast(cpsw->ale, port->slave.mac_addr,
 				   HOST_PORT_NUM, ALE_VLAN | ALE_SECURE, vid);
 	if (!pvid)
-		return ret;
+		return 0;
 
 	am65_cpsw_set_pvid(port, vid, 0, 0);
 
 	netdev_dbg(port->ndev, "VID add: %s: vid:%u ports:%X\n",
 		   port->ndev->name, vid, port_mask);
 
-	return ret;
+	return 0;
 }
 
 static int am65_cpsw_port_vlan_del(struct am65_cpsw_port *port, u16 vid,
diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 0bdc95552410..952444b0c436 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -780,7 +780,7 @@ int cpsw_ale_vlan_add_modify(struct cpsw_ale *ale, u16 vid, int port_mask,
 	u32 ale_entry[ALE_ENTRY_WORDS] = {0, 0, 0};
 	int reg_mcast_members, unreg_mcast_members;
 	int vlan_members, untag_members;
-	int idx, ret = 0;
+	int idx;
 
 	idx = cpsw_ale_match_vlan(ale, vid);
 	if (idx >= 0)
@@ -801,16 +801,16 @@ int cpsw_ale_vlan_add_modify(struct cpsw_ale *ale, u16 vid, int port_mask,
 	reg_mcast_members = (reg_mcast_members & ~port_mask) | reg_mask;
 	unreg_mcast_members = (unreg_mcast_members & ~port_mask) | unreg_mask;
 
-	ret = cpsw_ale_add_vlan(ale, vid, vlan_members, untag_members,
+	idx = cpsw_ale_add_vlan(ale, vid, vlan_members, untag_members,
 				reg_mcast_members, unreg_mcast_members);
-	if (ret < 0) {
+	if (idx < 0) {
 		dev_err(ale->params.dev, "Unable to add vlan\n");
-		return ret;
+		return idx;
 	}
 	dev_dbg(ale->params.dev, "port mask 0x%x untag 0x%x\n", vlan_members,
 		untag_mask);
 
-	return 0;
+	return idx;
 }
 
 void cpsw_ale_set_unreg_mcast(struct cpsw_ale *ale, int unreg_mcast_mask,
diff --git a/drivers/net/ethernet/ti/cpsw_switchdev.c b/drivers/net/ethernet/ti/cpsw_switchdev.c
index ce85f7610273..c767a47b2039 100644
--- a/drivers/net/ethernet/ti/cpsw_switchdev.c
+++ b/drivers/net/ethernet/ti/cpsw_switchdev.c
@@ -191,7 +191,7 @@ static int cpsw_port_vlan_add(struct cpsw_priv *priv, bool untag, bool pvid,
 
 	ret = cpsw_ale_vlan_add_modify(cpsw->ale, vid, port_mask, untag_mask,
 				       reg_mcast_mask, unreg_mcast_mask);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(priv->dev, "Unable to add vlan\n");
 		return ret;
 	}
@@ -200,13 +200,13 @@ static int cpsw_port_vlan_add(struct cpsw_priv *priv, bool untag, bool pvid,
 		cpsw_ale_add_ucast(cpsw->ale, priv->mac_addr,
 				   HOST_PORT_NUM, ALE_VLAN, vid);
 	if (!pvid)
-		return ret;
+		return 0;
 
 	cpsw_set_pvid(priv, vid, 0, 0);
 
 	dev_dbg(priv->dev, "VID add: %s: vid:%u ports:%X\n",
 		priv->ndev->name, vid, port_mask);
-	return ret;
+	return 0;
 }
 
 static int cpsw_port_vlan_del(struct cpsw_priv *priv, u16 vid,

-- 
2.34.1


