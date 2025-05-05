Return-Path: <linux-omap+bounces-3643-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FE3AA98D1
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 18:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 079B3189A4AF
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 16:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75AE026A09E;
	Mon,  5 May 2025 16:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SyYkNTZD"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA17269CE6;
	Mon,  5 May 2025 16:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462402; cv=none; b=U5gJ6JgR7bQHG8JHDlij/b7fx3g9CHlrWdoWk6TgTcGlD+hS0WPJNEpfZxSYuG2ODtxJaV8SRq1hkSPcVuMmLdh29tO+k44iyJOdtgukpiToE9IgaMEMiRHoq42W6XWTpOU2BYIceVBqmC1/3/1b0/QlUKkR2yc3nZONFeIhL8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462402; c=relaxed/simple;
	bh=u7HKkwOPvItFSrEFnYEsRbbOURBbm71UWURQboRepAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ADwUZeQIZ41ugshPbPluL8eqZsUcaeh6TgpaKfIcYpZ/cQhFTKyNtT3kP5d+ERycFErkyQlrxy9cGgfOoSxATXL9yxQaLriY4P86Vhua26Enk0PsKewdFClVVjKRVi7y9vwL0ZMpf8RB+/F5cpvOfljivh8OabU8jb9J2TsKvG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SyYkNTZD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D25C4CEEE;
	Mon,  5 May 2025 16:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746462401;
	bh=u7HKkwOPvItFSrEFnYEsRbbOURBbm71UWURQboRepAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SyYkNTZDG2/wL/ye+SB93kdqQHWQWGYZ8uT70cNjPeUig78gUDFhnokhvw+m2mroa
	 tD21CBWbth0iL3kRP73cRkO6TX/HfUTMTCLqKvjuNB8cbClMxk5xa20uyF4FYbsOf+
	 kB0k2YCpJJeh6eyq4CJkKRMurmV/kXjCxeV1ASLxFryvoTifjHt+VkhwV717y4SIl6
	 6UPLNgwJjFpgqrkXVCJGPnpM0I/C81AreJ2/E/8PiguvsHx3TxRjW8BcLWK1kYWrwe
	 tlMa7v0LcYsnIXEpWAK2MgZVoK88ygD2tVK/UL2BXL0HQN+kzhpT3ZgQ9rKX2hrHlP
	 RGds7vzvtEVmA==
From: Roger Quadros <rogerq@kernel.org>
Date: Mon, 05 May 2025 19:26:31 +0300
Subject: [PATCH net-next v2 1/9] net: ethernet: ti: cpsw_ale: Update
 Policer fields for more ALE size/ports
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-am65-cpsw-rx-class-v2-1-5359ea025144@kernel.org>
References: <20250505-am65-cpsw-rx-class-v2-0-5359ea025144@kernel.org>
In-Reply-To: <20250505-am65-cpsw-rx-class-v2-0-5359ea025144@kernel.org>
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
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoGOa6f11vlH1akMfGGi2ce9Q9UGvEtRj5pn5W/
 CYgx4P1Zp2JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaBjmugAKCRDSWmvTvnYw
 kyStD/9LH21q8ModEJVKq9rYaAq1MaMhKO33F4ioQ3seBTURZg4h7oQ74jhgbV/YArCOt854O42
 EzOd+IgoutZn8ODyZape1HVUFfoG1HRYgAyWyV6GYGnb47V7HAEPr0a475G6+N4mAS3AefyIC98
 lRWpdKoECtYwtUxgk/4YCxOXgUVARD44jQ3DiwDyAfXyTkdpO/ZLd2QiedWwQPE1XNoOR3GLjS8
 vkiDaQzYH1rHQyTGDPwMQLmCCaesDiucxmHYvND0JBx9KTpDdbh7Pt0wI+R7HGMY/egABbX9etJ
 qpNnbkLxfEIq5QhHu/FrnvMT4YTb2X3uacWh2hsLoQy5WU/zMUofZFEiYd2gJd3rLy3Akgu9Py9
 80xpiZJlbRCVKZxemKJVEf2Jl89gNbXUV00/Rxe32XPQgFARpbAy5O1tClDhUL19yE3Q3qw+yig
 Z5JFNAMNvQgYI96vQfoQ59620V6OoGaJum1vHpnyf7yUSJGNU/PcNLWblNv9XdWEI3M59uY7J1a
 4JPRVhUO08XneAuiWUQ1wWNHpFJ5Mo93CTsjQBbA/glHVjO+ea2zaqiuENjARyR0b1ZkVVzaybc
 pc86SSu31CvrfTy7FvBBX0jumB7U5aBvmjVCW9Cgukq0Kb9FbrkkyIwGovoB7nFlJMXSiCMyz8P
 xUFyNH8nQq1KfHQ==
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


