Return-Path: <linux-omap+bounces-4754-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F660C0819D
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 22:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9705D3A466A
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 20:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D112FABE6;
	Fri, 24 Oct 2025 20:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTUvz56d"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE5E13A258;
	Fri, 24 Oct 2025 20:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761338773; cv=none; b=orpVwh4oA62PPM6POd8TqT3c2GhIoU8skApyrCVuWu56r6FZA7ffDxtS6zXchs9oiorLiykF9Cl2XyqGpa0FoI4uU5sZijWFo69VVj8u9DLwx2BwbXQYObWnfdKm7LWzzE+EJXz0q1A/gXLHRyReNP7A77fWksXsPJq0QEc6WIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761338773; c=relaxed/simple;
	bh=/IC480uC6uDL2r9MYvnZlp9d29TYaLU7QOMq0cRry6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K9Xo9yaZq3/xxu4HuAYvVErev6hhlvTOpSuvH0Ovq9x4e9krIQLNFUA4xHC3PI1U1KXJdMpP0U5H0EvoPdD666b5JFoBwoVZvevYz0brxzAGi0r2g4pivcOvhbRnAUzDNzt2M4x/QcIHDDmaqjj29KtRt4QT8NehOLr+YjbR/sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTUvz56d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95AD5C4CEFF;
	Fri, 24 Oct 2025 20:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761338773;
	bh=/IC480uC6uDL2r9MYvnZlp9d29TYaLU7QOMq0cRry6s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WTUvz56dtSYKWH42ek+gz6bm3zxmKOdlXEb2hzz0W4NoI1+8cbzOSrejda0c2ydpV
	 AJgQGY5r6L1BsXuJXRETbZ94e41xqPe90Ab1lg79toAgxsNPFHEqiFRM29lI6q65FC
	 WE9xmHNpwq0V6ML5rTQiwa6Vx1ys+8gPVRDllLyFpbZ4oaTP/46qFTyYjzJvnBMtV9
	 mKugCvfpbmv0eH9EVgvHzCR/SahAZZppQqJZ3Zcu5pYaeUUFpnZT6KZ4VX9JiwFMP2
	 CSH4+xM8LrARH2/SM9ZRrim/6GLNGzk2L2MLih+fZNzSKIF20JDr54dUYhTG2xyvSc
	 8rSa2zlW3B4fA==
From: Roger Quadros <rogerq@kernel.org>
Date: Fri, 24 Oct 2025 23:46:00 +0300
Subject: [PATCH net-next v5 1/9] net: ethernet: ti: cpsw_ale: Update
 Policer fields for more ALE size/ports
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-am65-cpsw-rx-class-v5-1-c7c2950a2d25@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2767; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=/IC480uC6uDL2r9MYvnZlp9d29TYaLU7QOMq0cRry6s=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBo++WOJAC2fE2AWAyMjhX9qeweLimVhebf1sS2K
 1OM3NJQV6WJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaPvljgAKCRDSWmvTvnYw
 k8k+EAC24iQOn0euf4pZbWOdKgIifMSpYA7NobOIibave903H6h2Kx7KBXxHSMx5eppBcKx5Rus
 vluz5v7UCwQXoipcOpRn+Lfruti2Hlfo9sWgEQ1Kko/Xu4BVVfrp6Ow8T64xLjRu1jR/4sPcGpF
 hJkI7oWZQLw42p7aoQakTBKk6CTUBvWteFwK+svCdvjqB517Wb+JxdpKuhE7gf71myDf8eXfI3c
 Q73smKAmQKikywtz48rB9cIfLZGEZEoj7Knonz24CEdKTPzWPGUSV3XUCIaCp4GeVEle9pJMszG
 XFueYcNxBrbILx0OXoxjKWgMYl3koIJt9JEsf59B+BB7XVK41+nTWQH/3XP5egL/Pr7AS9epVB0
 ljSDtSUbFC8MF9Q6KeP4rWH67cZG9LcRhFnrAL1Q5P0dFVPTx6iQNQ9oWyNjSx31fkda0+6Yjs4
 H60q5toQOFm0xSpbI4BYPRx4PiUBKGC4RveRvi6j22vhexKbn5cFpWbJdQDWNjFttcBXD5tJ50r
 U0CiVp1eEJMepA1qneMYivyFK1OiqG0m8oCwJF1ElTd+NPpP+yEUCvfsHdrrFwoSSXHqD02dBy1
 GOEUGxevptGlPrSjXe+YEtIfstfiQaFnSS2J5ppvKSrd0r5A74B46zUXk0DAxDkT7/1l/AVQAlb
 /sjGpg37DHiCKaA==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Different SoCs have different sized ALE table and number of ports.
Expand the Policer fields to support 16 ports and 1024 ALE entries.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index fbe35af615a6f05861683032873fb6c30b2e057c..2e294fea999f3ba9545a68f6884c313feb35c587 100644
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


