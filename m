Return-Path: <linux-omap+bounces-3713-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EC3AB6AEB
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 14:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48B811B6339A
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 12:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BDD027780C;
	Wed, 14 May 2025 12:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPHG7/DC"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C0D2777F7;
	Wed, 14 May 2025 12:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747224272; cv=none; b=Fnuc5uTjJi6rarYSjfSFV7aiJSwGGH6rVz/jZ32qQUBx4NRt7UA5ZsFZSLqMLCjyCZAvSd/128RzCHglxlPlhl2owatqYxckZi7J8X/+FUQcCtB7yKbqN6unYDqAr8Q2+GPcCUD8wS7J42YEfFQ1YTfcP1s2QInT7KDkFCpMBKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747224272; c=relaxed/simple;
	bh=u7HKkwOPvItFSrEFnYEsRbbOURBbm71UWURQboRepAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e+V5FwbBMUW3cHFhSQTdgJ7+c/G7zs8o62X4P9ifobv3xMmHVykKHEwDb2zDxNHhBQUXJI36Zo/ofZKHlM2/ljFIcF9XA/1FeIePnmC4Xn33Spk8ThJYOv1VUJngqdX41ltrUDbWKCPlSMs5xzdiHSwsvukHT3vcyB10d20JrR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPHG7/DC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51349C4CEF0;
	Wed, 14 May 2025 12:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747224272;
	bh=u7HKkwOPvItFSrEFnYEsRbbOURBbm71UWURQboRepAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gPHG7/DCHX1h8gFG5EYXrFjlpr/l1kozPHkN9pUmBR5ohlqBgR2j7At/KfVozB7Ar
	 jeS1bh9BJMWDpLfLUI/n8IS/kbNy1Q/2wR+UNk9O7tHmbCWFuB9KunBhc978j+3Ojr
	 y8hOYPwmB7rXe91kRBWwut+3xxFDB9tMav0uq8K7kcAwuh1kUwfoQdRIGc6f/2Lz6X
	 tOI/kChZMDzpphQ4pNqR1Kf77k4Y1GQhubx1iibkJZmFAqJYZJg0vFLb0zDMB8wBSD
	 Cw7L81u9gKpGqaebNzeuj4jVfs3pKMAYcGzSuIV/Ambo65DMH4KELpaECXhbGa2/Sf
	 4BrHLXfHqAb/w==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 14 May 2025 15:04:21 +0300
Subject: [PATCH net-next v4 1/9] net: ethernet: ti: cpsw_ale: Update
 Policer fields for more ALE size/ports
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-am65-cpsw-rx-class-v4-1-5202d8119241@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2711; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=u7HKkwOPvItFSrEFnYEsRbbOURBbm71UWURQboRepAs=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoJIbIpROQlrtzAJ6LCXSweeT1UMEKe+j2f76X8
 j6s9Gw8OGKJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCSGyAAKCRDSWmvTvnYw
 k9piD/0YdjczdJPzsS/mWM5plqjv31ncM/wayJu1FW9Azb8IJ8IoON6JUGFJOlmZcYFObdzhYk1
 JvUjWX6cmoxHTYr7yK9OdsGX51nezKMayfpYnYKaZlegBHG4qy7BkRSRRI6CLZBkrmxEwg9MWKb
 Lx7/Lmn6HmgrO9vFzmXVltKIGursfQzMaXv/cact6KfcZjfyHbfQxGJYMVhhaUKQ0HMfEEZG/ya
 HlaOSwniMILFwBAZ7IYTkWxKaXDX8L9t0SQF0qkczy6WKZAiz9ekQO8w60ci8uabKayDI/CwMpj
 6A5Nv/DRuFxOHJoPwv1gsxAb1v/SESFd4omr531CGYza2Y64FQWnOJr3G0zYQ2haIysAGfpJpsH
 Cuf/Vg2CmAPPjrS5YKV6WVU67CmjzWDz6ed98NJcxKpEdtnppszCPtKEe9xbpRLu7mDmho6zGsR
 BlVrXDtCF2g9fVn87iYB6HmjODdJM1KRZ//VcIOAvu0C3eURV731Q8kJ4HqfdjTiMbrD/tIJk10
 jTQEBSTP7d5wc6/KUQOjmEKn5dzCrPwPWKi48h2k7FiYTc4y2VutJOvqm0TaO3Eten2YVnvqBJS
 3FZY5nLeynXarQX8CeFMeNM+UuCfVgAryK64/HA0Y82v377Zku3i7UDXgEgEbGDGZ2IuZo+wyEh
 Nux7JbBnycuXfnw==
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


