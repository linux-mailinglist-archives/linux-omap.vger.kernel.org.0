Return-Path: <linux-omap+bounces-3715-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC8EAB6AF1
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 14:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 615BC16D78D
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 12:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E1327602C;
	Wed, 14 May 2025 12:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vrg7oL+b"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24347224AED;
	Wed, 14 May 2025 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747224279; cv=none; b=GN920ypcLd6m2gmuEZdln/U72AvNsK7aVTrZiXRAhOo/CeAm76d4pLkKl6lcy5hcmZxnruhp9UyK8fZVTvh4sCpnJGxTfVMTyxZ04OTtY1Fg4ff2QtQAAKhodsmoLEmIhVS/hB0Phqiqx4gm0GhnBiHJHUb2rdv1r6yxOHbO2pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747224279; c=relaxed/simple;
	bh=XODr01mBk67NGT5K13Cytm++Hq/blxxRyGOdquDJpL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RXEVzeJh1f04yVow/9r9KVYKkKZUCZCtKRXa6S8itxVY9b3rWFWRJz3uz1D95L/cxM8RQPNz4qXwr5EtRRPpwItgEPmpkE0UITuIudl5NtdlOjNsCaYjqCWOgFcypkQuM7dKqC4tWTyeyMuufte/zSolx2brRKEOo4KjVhsBZvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vrg7oL+b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92CAC4CEF0;
	Wed, 14 May 2025 12:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747224278;
	bh=XODr01mBk67NGT5K13Cytm++Hq/blxxRyGOdquDJpL4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Vrg7oL+b1r8Q0LtWcuAX8Bdr1U6UX22Pjz52IFukyFnbGap+5/w4mKOwaicRlNvDp
	 rufZ4ljZYaKQCWNJftWJnSxEREkjqO8cmyzbiFzViilHiTMJEGOrWGFD/jm8j83pOt
	 WXWxauBHCKO1v81MCDfsKuei7UELBUf28L38P6tJ43t+uo2qARFj/p2R5HFSPYEegy
	 D3kJCp34BWVwZS4yyWkanwKSTGb+sOAT5TpYENzdnRszyLASZ/I2ENO76nl8tq3muN
	 DKKaoYfVPry37TPTkA2U7lG2cixLZ+b7cbs0kX6IoEfFWGPF21Pah/IkjpaVCucGsf
	 na4lGsWgP7uvA==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 14 May 2025 15:04:23 +0300
Subject: [PATCH net-next v4 3/9] net: ethernet: ti: cpsw_ale: return ALE
 index in cpsw_ale_vlan_add_modify()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-am65-cpsw-rx-class-v4-3-5202d8119241@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4563; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=XODr01mBk67NGT5K13Cytm++Hq/blxxRyGOdquDJpL4=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoJIbIEdcqUzng3YyDN8h6Ltli50M7ZkBv7qvJp
 et+Impj1uKJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCSGyAAKCRDSWmvTvnYw
 kyBQEACJtfByXUOzebtRPEs7q5nP6y5PRWk7sjd3Zx9Lx9pGpw1aOPAWqAN3mENE/X65LlaWoA+
 3SPw+I+lT3+lAA54ILn4NOWE9kCESUGJ1HJ+0r9eRU99w6ZkGSGRpbsaMp0dxIVm3PTx7xP8sfj
 VdM5EjRVIdfnViSCcRHExxF9cDHWoaqrl//Je4ZfImT6wvzBdBNG2B5+uYFj3dqNdLPpAZZtQF7
 z82QPnZMOFSkESkKQglUBxE2xTY8nRL6Om9NNQLxlw9tppHGC5G4vlepH7S8soP49TWZ0ijehae
 Q7kyrFgPHdUkuxUPkCUmQMhOux1hx6NWkeVmJgEX4H9rP2Hf25bfHUYH9wsHAaIBm2S2E6UEPY2
 ldVbaNSDL12h7HmVeY3vi/AGFPeT/Ir4zJyq0MRB2M1iJN2whJvOU4xw9NjMHbxwMSYWin+nhlz
 fBm3zeMIBpkefk313SM0pe6S+0PWP60+GmDPqSomCTazplF+XX8GOhvCvKM8T0NaBb9gOY3c0+o
 B88fJGBkk4Z1+XjYfX0fc5MIlnttZAbUjCTMAYCwrZ4O+yqC0FoHl36aLGU0rjyASvIHsc+CnH/
 JbO7uqcFVEdP3uR0T3n/qnSCVy1bpn2PwAUscTBHS4XQn/bx0cAhYPk6qXSNssVQRYW9WV3ep48
 kFPXTx/HtNW9BGA==
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


