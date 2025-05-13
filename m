Return-Path: <linux-omap+bounces-3701-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82646AB5464
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 14:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EC48862A89
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 12:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A197B28DF05;
	Tue, 13 May 2025 12:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFwdRmsT"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3981628DEF8;
	Tue, 13 May 2025 12:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747138396; cv=none; b=XhWBNnNad9tC8Vbemt1o1zEm9TnRr0JFVY9Fmt1LxLrjJLKNAq6C3g+sWvSvGInGwQ+Vt8bvgMY7UjIXHUIS6AnbUkgfuSqmWLOglId9ntO6Ezfza9bb7rqmgW0ShpyDcLEB/frWJCU4/acp8B71hSO9E9pQsnNjXRzQMWYaMAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747138396; c=relaxed/simple;
	bh=u7HKkwOPvItFSrEFnYEsRbbOURBbm71UWURQboRepAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gwOKfSWf+O2vNEVMylmhHG/mDk+B7EWyBkxjoOEyRoAIwnDIGg16OOyY0836kA6Aikxf9Ol594mlYUFknXojjAOvNs8n0/uQ4W40RVXGedmD1d2lsY/UPkcb17A2W93ozLT2qwTdzPrK374XR/1QI1Rg3dF++03eXRZ4B+g9qCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFwdRmsT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8E0C4CEED;
	Tue, 13 May 2025 12:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747138395;
	bh=u7HKkwOPvItFSrEFnYEsRbbOURBbm71UWURQboRepAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oFwdRmsTk59telRd4vOlMPzOoHRXcsasW/1519kdpJ1Sgt4gX/Fhfu1Wd3i3cqkG3
	 oG4McyS7lgfsMdE73SwprYNcX7O21JaanHGD/xK0wCUphlGlAYl3JkvVHkv614tZTy
	 RORFEwNdx+b9jcB+V933ZXDFq5DxG2iUGGsC483yA02utICrG1LHwSA0piofxb1WXt
	 RTYokheVr9QNNPmRXLfRhsUBC2gdAa7ahRjIWSPkfsX3g4SZe7/3sxdOL/uERGhwsS
	 qiqXZ3/OnkPa61tB1en8VcdLDiakXgZYLjVj7sCJpG0g6YpwsctHIKq+VhUHeJMBD8
	 uaD1g0NGEufjQ==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 13 May 2025 15:13:05 +0300
Subject: [PATCH net-next v3 1/9] net: ethernet: ti: cpsw_ale: Update
 Policer fields for more ALE size/ports
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-am65-cpsw-rx-class-v3-1-492d9a2586b6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2711; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=u7HKkwOPvItFSrEFnYEsRbbOURBbm71UWURQboRepAs=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoIzdUrejDKmyFzZDNiEiWH2Lu+YrxfqLH0wfrp
 tVyjxgAYxSJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCM3VAAKCRDSWmvTvnYw
 k7pWD/9p40o5Lby9MErhnnoM8PcPwHyPz+CezZ3c1FKHMt8LQZ7L8WpWJRUZbeHN2X+s0aRyyca
 QtcK5sHt6RFxSp+zeQIVMNyxnTFaSeJJA7Bid1LzqQ8VLSEnGKDsWzEPVz56pj5Mo5+tf+1bGc1
 O09RJ+JA6lJwdi+roTQ7GUdLH9kGvYIN0YdSqAabRbbxBxMEyl+MwsPq+6SEHeJs93viQ2Pddax
 TGmX1YBWG7Eh5VrpC+ASrp0wCjZgJ8jm2h2+Aa7188PbVsV1ifCkJalvvobajE3cTV1NQfk+SMl
 da85UKmoQKXiR58KH+M4/y5HZ0BXsnl+lxEVQpDoCPDiFO4br86uqgpJO0gE8/Zy5jXhIRy99Pg
 ypwUqHso41Zqdg1LRH8JsH+2t3b9822hiuY9JlVydlL8U7j+zUeBMfxhchfLwAE10GnMM48lFF/
 QxdG1nnSsYpCB0hCJVLMvJuTleffe6FNWjTqRG5gdRPgVSiKbvsmiZ97whgMOyM1Dm2Kl10kMyA
 hWnkcbdXv5yA5g1sA30l84TiWkIp2VdKLSWP5K6T2q0gb0cUzmZ2y1/Z7XIHdjAFMiPUbY5uZaZ
 YRregP+S0X0P4q6RBgM/Gm56q+9NTEq1BlCYoTj7+Eu9au2awmc+Pn2ue7ch47XapgtszgRooep
 F3a51JqBkxIRvzQ==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Different SoCs have different sized ALE table and number of ports.
Expand the Policer fields to support 16 ports and 1024 ALE entries.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 7f77694ecfba..7bb63aad7724 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -1341,33 +1341,33 @@ static const struct reg_field ale_fields_cpsw_nu[] = {
 	/* CPSW_ALE_POLICER_PORT_OUI_REG */
 	[POL_PORT_MEN]	= REG_FIELD(ALE_POLICER_PORT_OUI, 31, 31),
 	[POL_TRUNK_ID]	= REG_FIELD(ALE_POLICER_PORT_OUI, 30, 30),
-	[POL_PORT_NUM]	= REG_FIELD(ALE_POLICER_PORT_OUI, 25, 25),
+	[POL_PORT_NUM]	= REG_FIELD(ALE_POLICER_PORT_OUI, 25, 28),
 	[POL_PRI_MEN]	= REG_FIELD(ALE_POLICER_PORT_OUI, 19, 19),
 	[POL_PRI_VAL]	= REG_FIELD(ALE_POLICER_PORT_OUI, 16, 18),
 	[POL_OUI_MEN]	= REG_FIELD(ALE_POLICER_PORT_OUI, 15, 15),
-	[POL_OUI_INDEX]	= REG_FIELD(ALE_POLICER_PORT_OUI, 0, 5),
+	[POL_OUI_INDEX]	= REG_FIELD(ALE_POLICER_PORT_OUI, 0, 9),
 
 	/* CPSW_ALE_POLICER_DA_SA_REG */
 	[POL_DST_MEN]	= REG_FIELD(ALE_POLICER_DA_SA, 31, 31),
-	[POL_DST_INDEX]	= REG_FIELD(ALE_POLICER_DA_SA, 16, 21),
+	[POL_DST_INDEX]	= REG_FIELD(ALE_POLICER_DA_SA, 16, 25),
 	[POL_SRC_MEN]	= REG_FIELD(ALE_POLICER_DA_SA, 15, 15),
-	[POL_SRC_INDEX]	= REG_FIELD(ALE_POLICER_DA_SA, 0, 5),
+	[POL_SRC_INDEX]	= REG_FIELD(ALE_POLICER_DA_SA, 0, 9),
 
 	/* CPSW_ALE_POLICER_VLAN_REG */
 	[POL_OVLAN_MEN]		= REG_FIELD(ALE_POLICER_VLAN, 31, 31),
-	[POL_OVLAN_INDEX]	= REG_FIELD(ALE_POLICER_VLAN, 16, 21),
+	[POL_OVLAN_INDEX]	= REG_FIELD(ALE_POLICER_VLAN, 16, 25),
 	[POL_IVLAN_MEN]		= REG_FIELD(ALE_POLICER_VLAN, 15, 15),
-	[POL_IVLAN_INDEX]	= REG_FIELD(ALE_POLICER_VLAN, 0, 5),
+	[POL_IVLAN_INDEX]	= REG_FIELD(ALE_POLICER_VLAN, 0, 9),
 
 	/* CPSW_ALE_POLICER_ETHERTYPE_IPSA_REG */
 	[POL_ETHERTYPE_MEN]	= REG_FIELD(ALE_POLICER_ETHERTYPE_IPSA, 31, 31),
-	[POL_ETHERTYPE_INDEX]	= REG_FIELD(ALE_POLICER_ETHERTYPE_IPSA, 16, 21),
+	[POL_ETHERTYPE_INDEX]	= REG_FIELD(ALE_POLICER_ETHERTYPE_IPSA, 16, 25),
 	[POL_IPSRC_MEN]		= REG_FIELD(ALE_POLICER_ETHERTYPE_IPSA, 15, 15),
-	[POL_IPSRC_INDEX]	= REG_FIELD(ALE_POLICER_ETHERTYPE_IPSA, 0, 5),
+	[POL_IPSRC_INDEX]	= REG_FIELD(ALE_POLICER_ETHERTYPE_IPSA, 0, 9),
 
 	/* CPSW_ALE_POLICER_IPDA_REG */
 	[POL_IPDST_MEN]		= REG_FIELD(ALE_POLICER_IPDA, 31, 31),
-	[POL_IPDST_INDEX]	= REG_FIELD(ALE_POLICER_IPDA, 16, 21),
+	[POL_IPDST_INDEX]	= REG_FIELD(ALE_POLICER_IPDA, 16, 25),
 
 	/* CPSW_ALE_POLICER_TBL_CTL_REG */
 	/**

-- 
2.34.1


