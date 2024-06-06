Return-Path: <linux-omap+bounces-1486-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 258878FE626
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 14:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17B7C1C248AE
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 12:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FB4195FFE;
	Thu,  6 Jun 2024 12:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIf/KnQE"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27BC195FCF;
	Thu,  6 Jun 2024 12:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717675800; cv=none; b=K+3VcUk+qzAH7L1PcKROJST3D0l35nQ9VyEjcuGxNEgllILNMArfJMq1D3NmSWR9WUAeYiOyVUKXGqL4i//QkwD4sJgXWkjpRoeP5WxVFc9liAxPlVN5U7nwOPRoi8El2YjozH3bGnSvsOrJrxFmS6uWO3RIGxSvbXq+g+VjdVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717675800; c=relaxed/simple;
	bh=E3unqPthK3jtIV9iITSd5L7XKv4kRv1ZvHzNZ1sC+Ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rb9ldp/TKmVfbP0fZZTJGNnILKuQtALNxoSdn6oiM5kw+xn6VtFSum1Umq+fdvHQHxUUedx36D7S8qEIojjFwYO1xWR47ApO/Rkh15yFmks/Rg0DSm/I7xmucs+rUmHZCS3XZeMsnYdJ8gc7s54DY7VKNjNLTblVTIQsHGPquNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIf/KnQE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EB5C4AF16;
	Thu,  6 Jun 2024 12:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717675799;
	bh=E3unqPthK3jtIV9iITSd5L7XKv4kRv1ZvHzNZ1sC+Ng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SIf/KnQEJcVlVL1FRG8paql8m5y2cME5Uv5oU+Lik4enoe0pmuzL3/pBE6ajRavG+
	 M6T7h9mzZ3Ku4sM0dhthKgfMVCiKkDNMJdqvhsgrw5Fcfr8c7OBI8hx4heajcgiL5a
	 g5Omg1FNXfO1yp/C3gNq1jjquUooBiIBL2MuCHGZSjo/8juUWHa6Uf9a9IDpYa5SRy
	 mrsCvIfIPJjnUTKTRaWxX7e4L5VRMd5/Qj1lZP/VS+Uo1BSSSpYkDRbgF2o6JLwfF9
	 48rSyJFG6EXogPzyVYWiIGOBEg/3HLG8ocJZerAxvjDEO/QnkkucyMhe78Dub0ZArX
	 EnEwOGvdW6sIg==
From: Roger Quadros <rogerq@kernel.org>
Date: Thu, 06 Jun 2024 15:09:19 +0300
Subject: [PATCH RFC net-next 3/7] net: ethernet: ti: cpsw_ale: use
 regfields for number of Entries and Policers
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-am65-cpsw-multi-rx-v1-3-0704b0cb6fdc@kernel.org>
References: <20240606-am65-cpsw-multi-rx-v1-0-0704b0cb6fdc@kernel.org>
In-Reply-To: <20240606-am65-cpsw-multi-rx-v1-0-0704b0cb6fdc@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Andrew Lunn <andrew@lunn.ch>, srk@ti.com, vigneshr@ti.com, 
 danishanwar@ti.com, pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3680; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=E3unqPthK3jtIV9iITSd5L7XKv4kRv1ZvHzNZ1sC+Ng=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmYacDyh2d1fZPYMIVc3TmIklqBw/bT/XR4IBrJ
 56U7ijKBWCJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZmGnAwAKCRDSWmvTvnYw
 k8XND/9edNzIVwICrDZttSUphRRyNSk8wG/iQNa6tSR30nOQJAbpKRS0xne9aaH/HBFPdRSA8UC
 h6CE03w7cr9RE2jCEgGUAq4pi3gTWm54GAlvl4zrcxHihCR2Qym61I3mwJ90eJAn9PvB+rfPXBh
 4XjLQrr57z2saTuNZlvTqJ+pwM7DoZ09qRf0w34fojpdi5y6llVXszuR4yddjj/AO0NhSVJXUj2
 /CmakUcqwwx8phgAG3xfBbPWMvgrxu5wt92MS+ncFUy3hBXOq+ayUftIffwp29JRmQIt43tg3qo
 n27wDYsprWWQfNbmByLU59gpGeHcYY4DU35tg7JPBdzT/q2UHvzmunG9xS5KO32+QRB0G7RRbyd
 9fsOjHBuwq+Yt/+BimBewRQOos2zDDjnAmEsgQbe9uOL2DJv++xiSvONsTr8+CxYtEHze+fWqnt
 SImqXBN5ZgmO62IA/YyzJCQ5XrqTnxcYYtr1xiIdm5jbeFAnbxXpQLiU9D3ypd7o6tkiNDXRmCO
 kGg53X60Zm8TiS46DXodpvwzxAhQI57ER66gJeAbM0gLpBQyvKCzUxfUvML7/L2Jy1LzWio3jMc
 IgfHQt0VgDLM7iObx6hMsGAdI9VAX8agCa1MF2r1falhbXDcP0iFsXE7o8ZyI4/ZDWeRHpq/YaX
 wDhzkB+wk3qngPQ==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Use regfields for number of ALE Entries and Policers.

The variants that support Policers/Classifiers have the number
of policers encoded in the ALE_STATUS register.

Use that and show the number of Policers in the ALE info message.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 25 +++++++++++++++++++------
 drivers/net/ethernet/ti/cpsw_ale.h |  3 +++
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 5afe9fdd6402..07a60e9eafbd 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -103,7 +103,7 @@ struct cpsw_ale_dev_id {
 #define ALE_UCAST_TOUCHED		3
 
 #define ALE_TABLE_SIZE_MULTIPLIER	1024
-#define ALE_STATUS_SIZE_MASK		0x1f
+#define ALE_POLICER_SIZE_MULTIPLIER	8
 
 static inline int cpsw_ale_get_field(u32 *ale_entry, u32 start, u32 bits)
 {
@@ -1303,6 +1303,9 @@ static const struct reg_field ale_fields_cpsw_nu[] = {
 	/* CPSW_ALE_IDVER_REG */
 	[MINOR_VER]	= REG_FIELD(ALE_IDVER, 0, 7),
 	[MAJOR_VER]	= REG_FIELD(ALE_IDVER, 8, 10),
+	/* CPSW_ALE_STATUS_REG */
+	[ENTRIES]	= REG_FIELD(ALE_STATUS, 0, 7),
+	[POLICERS]	= REG_FIELD(ALE_STATUS, 8, 15),
 };
 
 static const struct cpsw_ale_dev_id cpsw_ale_id_match[] = {
@@ -1404,7 +1407,7 @@ struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params)
 {
 	const struct cpsw_ale_dev_id *ale_dev_id;
 	struct cpsw_ale *ale;
-	u32 ale_entries, rev_major, rev_minor;
+	u32 ale_entries, rev_major, rev_minor, policers;
 	int ret;
 
 	ale_dev_id = cpsw_ale_match_id(cpsw_ale_id_match, params->dev_id);
@@ -1446,9 +1449,7 @@ struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params)
 
 	if (ale->features & CPSW_ALE_F_STATUS_REG &&
 	    !ale->params.ale_entries) {
-		ale_entries =
-			readl_relaxed(ale->params.ale_regs + ALE_STATUS) &
-			ALE_STATUS_SIZE_MASK;
+		regmap_field_read(ale->fields[ENTRIES], &ale_entries);
 		/* ALE available on newer NetCP switches has introduced
 		 * a register, ALE_STATUS, to indicate the size of ALE
 		 * table which shows the size as a multiple of 1024 entries.
@@ -1462,8 +1463,20 @@ struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params)
 		ale_entries *= ALE_TABLE_SIZE_MULTIPLIER;
 		ale->params.ale_entries = ale_entries;
 	}
+
+	if (ale->features & CPSW_ALE_F_STATUS_REG &&
+	    !ale->params.num_policers) {
+		regmap_field_read(ale->fields[POLICERS], &policers);
+		if (!policers)
+			return ERR_PTR(-EINVAL);
+
+		policers *= ALE_POLICER_SIZE_MULTIPLIER;
+		ale->params.num_policers = policers;
+	}
+
 	dev_info(ale->params.dev,
-		 "ALE Table size %ld\n", ale->params.ale_entries);
+		 "ALE Table size %ld, Policers %ld\n", ale->params.ale_entries,
+		 ale->params.num_policers);
 
 	/* set default bits for existing h/w */
 	ale->port_mask_bits = ale->params.ale_ports;
diff --git a/drivers/net/ethernet/ti/cpsw_ale.h b/drivers/net/ethernet/ti/cpsw_ale.h
index 58d377dd7496..bcbaaa7a1bca 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.h
+++ b/drivers/net/ethernet/ti/cpsw_ale.h
@@ -15,6 +15,7 @@ struct cpsw_ale_params {
 	void __iomem		*ale_regs;
 	unsigned long		ale_ageout;	/* in secs */
 	unsigned long		ale_entries;
+	unsigned long		num_policers;
 	unsigned long		ale_ports;
 	/* NU Switch has specific handling as number of bits in ALE entries
 	 * are different than other versions of ALE. Also there are specific
@@ -33,6 +34,8 @@ struct regmap;
 enum ale_fields {
 	MINOR_VER,
 	MAJOR_VER,
+	ENTRIES,
+	POLICERS,
 	/* terminator */
 	ALE_FIELDS_MAX,
 };

-- 
2.34.1


