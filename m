Return-Path: <linux-omap+bounces-3459-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C21A68DFA
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 14:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CF6E164279
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 13:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242A3257455;
	Wed, 19 Mar 2025 13:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eacp5hOg"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6A025743E;
	Wed, 19 Mar 2025 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742391673; cv=none; b=HXFQfgeM70ZbseKDPlo3X8vzDtTP3NfDgvwHxRFLJZtHBUHwbMUI9GJ9tMbzJbs5VEScyNP7Hf8YU0974wTtdMDrVCQ7ECYtk6O7WsEiT46WvypJZMWHEEODHRYX3PlwGvXUAX7dc8b0CbhhNp2yzMGzk9ZgVvsORwG7nC2xt78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742391673; c=relaxed/simple;
	bh=F51YbMImwQc7/NCLq/dSVZAxpr1K59NO8/ge5HY3tOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PXbP/WVPq/3xeggZblVUjIEULtJ3bhQQGUkIGlg3UiHXJQEG+Tq8+lSmHesCl8cyhinGBNb9djf8W0xxLDbf10AGHE2WWZCP+dSfMzOMA8rKIipoSPGlLy2Uh17sLfCJOnAbrvQUWSU0z5t/AFno3JaJHTQQMOrnA95LBIfAN0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eacp5hOg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB56FC4CEEA;
	Wed, 19 Mar 2025 13:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742391673;
	bh=F51YbMImwQc7/NCLq/dSVZAxpr1K59NO8/ge5HY3tOY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Eacp5hOgup242qt9qrrXAa0GjkyDVR5tp0rON15rp6LNDGAnpGnwNR+1jVI4byW25
	 sa83E25/xPvLvJLwuE46QELy68kRu7p150k974fzJSMtW/hIysP7qDfNTHuwxkpFee
	 egt9JCkz8iMZHpTFs210rUzehjxd8W0PH/HT7AZO3Cr+NJHLshk063HGCcR/NQzHJe
	 gO4a9PE2pxqC0jvcPCPr2D0lkOoqmIYJIdoAxAjWkU7ifEDkwrXHGqGNCsYVLrIZvY
	 KGSWlA903eAyVWDRY/giQByHTRZUotp64eyy9zLMjrxUsMPhbk90NjKC9BoAD9+tOz
	 j4ruZb1KtEQGA==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 19 Mar 2025 15:38:27 +0200
Subject: [PATCH net-next 1/9] net: ethernet: ti: cpsw_ale: Update Policer
 fields for more ALE size/ports
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-am65-cpsw-rx-class-v1-1-2bfded07490e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2711; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=F51YbMImwQc7/NCLq/dSVZAxpr1K59NO8/ge5HY3tOY=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBn2slw74Pzm5LOGkI0F8t1zYRZAamQfJRPuzzXT
 JtURNh6q2yJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZ9rJcAAKCRDSWmvTvnYw
 k6BED/9f80Nd1f5yCO3qR5SgWPWTyWhvLVh3gj70YYk50WbDuRTpzFJkdXz/cZrNimmN1Nbn8ST
 jyG2xdtZNH9zTUc+V8SR4K8oP9M+b69cv36PA/s4Mrb622mgYrnmw8SgiZsuEJTm2wSz25r3uRK
 28/DYQlOnSuiQmIPqjv4tAPjU0BU3B4vd5Yb1LaCFQR76pNASycxtPfTmXDXHh/LqxAU5v6o1fT
 6oKQgnbHY+M92Mr2bZY/fPaDVfWFORSSyaEDCti7eXyfS2OJt1E7UeNTDGd7fAiIyKB6V7BFrPj
 WJqTvr8qbBUTmsGioo6ChVTfBc3RBSLMFlRVWGI1/EgT1blmge7eRWE0opDMa0nASntrBWf5db1
 eqkrjpOuCj6twY9vKAxQjOLGEgQ91JLsbm3X3RTKVWi/yX6xmR3WD7ALhGnwpnd2BmONVq/2Sl1
 KOKsKbfQCjwPlxFuxSaqIR66CA30W+cp8jpCTsFjPvTWyvpgnFAI+FY1xP81ZYBTFcUYQ3k/Muk
 vUssm602tRJkCyOajGaEL9fKUcjWDcH4ig0+d2EVDO9JRIslwi1rb40WkOiWTEk8Nj+gUdZvCrj
 Dcb0L/zQY++1FAxzCinNaM/553Hx/6P1+OjmUOuhKBPSW3fNJZNBIUHREu4vRKDokJLw8qgizyw
 TAPQxEH02AawrYw==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Different SoCs have different sized ALE table and number of ports.
Expand the Policer fields to support 16 ports and 1024 ALE entries.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 5cc72a91f220..50d0340f83dd 100644
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


