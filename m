Return-Path: <linux-omap+bounces-3461-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01392A68E00
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 14:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1509A17419C
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 13:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0C92586CD;
	Wed, 19 Mar 2025 13:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shfS5ucN"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2AB2580FB;
	Wed, 19 Mar 2025 13:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742391680; cv=none; b=PVY1jsv95nwbzyWTicyuzYJpwaGTxsbjP044wOC1Fxf/l8LYcAkbO0wQ07HRxE41XBWWfl538rlmVDBgyrr5tkakP5Ma4eYBxUsZSk9MUrcDWnVaGx0wrCq4B6lH0plCymML1AyU3Pf3X0ValEw5DoTlqr1g+O5sMMWAZvjgrsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742391680; c=relaxed/simple;
	bh=Q4fxgh7LFQD/pdJcZtm9UR1h59oPTyjwoZxdbhyI6/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L7pRMdlnMs33qsLJtzzqUADtLiKt6NxLfCRr1oJI0WXAuvsUyG1vlp0Tl6BLC+H706JV4LVO3JU5YT1ububc/9e0cFs2UP1q1jmN8SrbhkyVpM4MJdCOPixMPGtu3MuUPPzFas5eOJsFxW11AptN+67u0vdJJ9dH9GiZKM1slcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shfS5ucN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584F0C4CEE9;
	Wed, 19 Mar 2025 13:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742391680;
	bh=Q4fxgh7LFQD/pdJcZtm9UR1h59oPTyjwoZxdbhyI6/s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=shfS5ucNfMAETHGqFA27FTplGA3G0jKEjQC/72Nc5m8Mm/AoekMP7zcJvnZ7/lMrM
	 LsBrQl3LV3WLwREPc+3RCkef4SKAqUkwpO6LWXPj9p2lGDypODJnsTq/rl+kZjSKTZ
	 VzOa6LAmuYIoftSzmTxZ3BqW9PGBYggj9VMtRkn3871VwTDVFfr96d5aOsLO4fgI/0
	 cLtDTyU19yfawkjIiRYsH1BLIUonDy7q4f2/gVRFK4yl5Vt7QDbU/6vT+g9ZL0rsq3
	 7qtaIaPU7eSSWW0nt6ZpPoX1JfHutyDjDU8YBNQ3ikTCNIjJUbPaCz5ZmODwLzRCHt
	 eihmRHJpN3rMQ==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 19 Mar 2025 15:38:29 +0200
Subject: [PATCH net-next 3/9] net: ethernet: ti: cpsw_ale: return ALE index
 in cpsw_ale_vlan_add_modify()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-am65-cpsw-rx-class-v1-3-2bfded07490e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4563; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=Q4fxgh7LFQD/pdJcZtm9UR1h59oPTyjwoZxdbhyI6/s=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBn2slwcwJTDGpAhw1meQIZ9bAc4SVNA0rFiQwsa
 ytyf7ZyRPWJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZ9rJcAAKCRDSWmvTvnYw
 kzVJD/0ea4zE3SqUQYw0tul2cnrGycMT8tW5VCBN+xKcotYmQEx9y4h0Z33kNg9kq1d6M3mSJ30
 BLylKng/BDp+46hUBXHdjzjN2KMeZT8HO25uup7bfAKEkic2RzEu6JwNUoMHbZkx3ehfCubFc0M
 1cQdE5hAPREFblFlfSkSdB85rzJfgif96BYcVrG1CyHJFGR2q04o2wnT2cFJYWvTwdWaEt4Ownb
 F3cH5kSBGdehhuCirg2wNMiU/q9mIWeaKAU96jr60K3qAhyVuSu5Qp2T1L7LzkpgHwRa2OucQlS
 tURpd7FfvsIFCGtbrdRyd2WJADyuxDjtxx5SHrMtsTR6sFI0ITmkFCAYQ9eVJbd1Bm9nxdbx164
 KtwyhBr8q6oHc1W3wxmlw8KemmV+8uV+Sjz6GudiDVPd6aQb20vsvB++DUb0O1kxVfcNUadp0sq
 y9RpWFKu6HuaPinPfeYNrMocJhaynP5bPG0firxD/IXGh2dMPEu32IvT9phUAHKNRgNB2KBMWf6
 Bdwa75zpUpKhBNGAZeZwuKzMPbo3KCtF6y7dV84snKVJwzJ0wWdrpX2Ke9+/iiAZaaWxuqDoN60
 OjmSRmfN3S3ruA3fMMmHUHqgQsawsJdqNPeVFn4QNspSs9Cm/GRaIm6Ai6ONQH+ezYduPYtrucA
 49vIG/81KCs6k+g==
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
index 3e671be95d6f..1c0eedf884ce 100644
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
index 16b523e33e47..262abdd3f1b7 100644
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


