Return-Path: <linux-omap+bounces-4757-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2289BC081AF
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 22:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 93C8B357D21
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 20:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EE42FCBF3;
	Fri, 24 Oct 2025 20:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QIWPZYgH"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1842FC893;
	Fri, 24 Oct 2025 20:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761338780; cv=none; b=L1RWjtqc9NKJMw1p3YRbN8DP6oYCnU1iMstxXAPfo3Jte0jA2+Z9XODKwHPa8bLs98jn7bsj+Ds57e3P9JWLSaUew/s3abdOsKj+2WtSc/Qjgfn0pNSFqF8JUpnXAJVSaZfjFtMNzk+ViWzxpZ3P/uDuVuEACs5zUo/u53QrSo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761338780; c=relaxed/simple;
	bh=VproYPN/It1JURWA/m4TsPnS5S/rti+LRb1lbwdpJxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ufUpkEbDsaXoK8IYn4MK2vBJffj0jvUNMtX+4/oVVASzYuE9DFj+az+rpSOYzK5n1sTeF9zk4BDrMm+idBQGaRtMnYIIg7XCWSXIBYt5M1jn2/S9WdIcR7Qs7QQKauNj/keeur+w5K2nXSvqqXqpFqnFKBd0SqTlEg/+yLNBJlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIWPZYgH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD7FC4CEF1;
	Fri, 24 Oct 2025 20:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761338779;
	bh=VproYPN/It1JURWA/m4TsPnS5S/rti+LRb1lbwdpJxU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QIWPZYgHwtGNqjD1IsJs733BeokyN5PTF5PubwnP16laIrQM/APKKTwH4bDvFJRXN
	 FMUM71paazQNT3wVZJ3D7b/aX1exaze6Y3Rku6UX3ZlQiD4TX0E8jNW70+27RrgrWX
	 vbgRcBa5u4WowoqvH7sKj3eKDaUDyWzJ9NROyS0f6AaQB5TGSiuwdA2pT8wvazgl/x
	 AJCCrNB7Vjn75memhZxtdRJObjBFC2or65JpnBLFymc1EoYTBF0JTweEGTfkXC6Azl
	 Pn0kgOJKR8umFKAo5vNXLS1AUyurCl3iQM64Bpxoywwz8aSlBbNqnYIGFElZap22Cr
	 1kDJWgptyZfGA==
From: Roger Quadros <rogerq@kernel.org>
Date: Fri, 24 Oct 2025 23:46:02 +0300
Subject: [PATCH net-next v5 3/9] net: ethernet: ti: cpsw_ale: return ALE
 index in cpsw_ale_vlan_add_modify()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-am65-cpsw-rx-class-v5-3-c7c2950a2d25@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4787; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=VproYPN/It1JURWA/m4TsPnS5S/rti+LRb1lbwdpJxU=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBo++WOrGUTHoiKuYAud5ObYVWB0lyuW3I17e+7Q
 3EXzwLQTjuJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaPvljgAKCRDSWmvTvnYw
 k9iIEAC0Hd9RBv+Pd52F9HtMSNMS1NxgW1fgPvwM1WGfhBBpSs737P52QTV4hqwV0KE9cn2dbbY
 L1XzCTbiUuYtxTMsylcGfOfOje9aF2NHTj8A64Bq9zbgtFUUTuHrLZWZYir6h/txVYGRX5WOmBX
 6L2DO6QKGDikUkTVd77v/XMV51tOLoXnl0ukZGoX1St+We6uucqk2hgsuyHrBK2j+YCxFRL7lRY
 uqQ84hGTtrJuk/+qcN1Yv/ZxcVNfC+lh+qwKmVGyrCMxkvsYVQO6jDiVqn+c+CmPpedaH48M4EM
 OW+ZKW5xSSKL8il3ETqvGjkx3jr2k+JEn0Gc72nEzhFD5yYsWHn98fQJCgRxtebf7pdhPQve0T9
 9ov/6KFCPQCYwXuTNOUIGWWlxY1BgKF32uXmepKPTkJFKqmRo6kR6nnBBRHYifpUPuJ+cxMnnET
 jYsA/GCTE6dVg+eF8lmhLnL+8vp5e+auNHqdvQSEuP+00sd08EVZvz0ZBwfaCdWt3ZloCgjkmMA
 aSyB1pQESUNjbZc02pLXMdG6IUFuHuk+qi2CXDssh8pOOFzuRU0oscJNwGTKzUAwTDuRYcFgIDs
 FSfF+lyYpWhi5TMEjV9Xkv54ZuUShEpWmEtn1sdVq3PrniKVy2abYnUdFWYJelBb9929dd35W++
 UqAcOrSZNCo3u7g==
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
index d5f358ec982050751a63039e73887bf6e7f684e7..977f32962cd0bc63528718e47a4bfae813676f01 100644
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
index d4c56da98a6aac1b90dca475fc49fb1f0ce5dd5e..b284202bf480d22c4722f8ab5114ff7e7ecaf7b9 100644
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
index 166de524d22a78a93d2f8c995f62e8c93b145943..d46b14e87d836c9da190b5a27dde3fb85760080e 100644
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
index ce85f7610273e6d66d8a6350216feb64aeb55982..c767a47b2039accbac01a5f25fdbf5a5e94525f2 100644
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


