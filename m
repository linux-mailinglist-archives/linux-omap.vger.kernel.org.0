Return-Path: <linux-omap+bounces-1685-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2899F926245
	for <lists+linux-omap@lfdr.de>; Wed,  3 Jul 2024 15:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D41552823AB
	for <lists+linux-omap@lfdr.de>; Wed,  3 Jul 2024 13:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC8A17CA1D;
	Wed,  3 Jul 2024 13:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNBaVU8D"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6422617CA1B;
	Wed,  3 Jul 2024 13:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720014710; cv=none; b=p4X23ix6dhCeMq7Jk3k1QGsZssSxOBusdhcdrIRNt3h83DflBakF/U4ZO+lHTjD5UjNWOB+3xoSdtEH/3jyEbywt1Ga4fQ7WZ6PVPYkykwtnPDxnPcJ2/DpZwbcRrYua9UhyBGmN2TOgzvVf1KfgSrSU9D38Hbb60BRhxSgdCNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720014710; c=relaxed/simple;
	bh=JeOJtLTbcGj6xPCF5ZeTJIWS2mvZBY3kd+RN0BWRcHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jqs3VOPeqNmMfJbDZWMKbgrUo+dXQ8hfj2cQBOWIISVQpLS6yE7qMxXxVFtq3m5clt66vI5gOOYBWsXoiW7HWDVnWYeE6llvqhrRB+k0yUeT0Hw4c09mKAki31uAIay8tlpQ099bKSrlul8VpztesTFwigexpqSX4Cj7GHKGdCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNBaVU8D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6238C3277B;
	Wed,  3 Jul 2024 13:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720014710;
	bh=JeOJtLTbcGj6xPCF5ZeTJIWS2mvZBY3kd+RN0BWRcHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gNBaVU8D0mDvFt6w8npig95oTJ2jxtngLd2KOuK7E0kGliU3wQdS0XSI9TvBT2+p1
	 JruK6CkjAhxfEBK1eV9VJ4Sq4DxIUjenab0EgQK3PGK0A31G+5tRRth8GdWthWLElx
	 1vo457SGZScAa0TFpOCWmHC4B4eSj/XcLA7XOChbUERDNQ5bDAULabsWK535aZoZng
	 LrMjN62Z1sTC3ba2oIvQR1oxlPpqs9nEqyoLbaT6Epp65xrsyLzWYrBksqpm8FGQoD
	 hd3xMVuh0/j+Cwnnvosr8/enB7TN+f2A0JRhLT3NyV2rGEXAMe3d2DDA1P1WNwyKQ0
	 oYxPsEfDGRDwQ==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 03 Jul 2024 16:51:34 +0300
Subject: [PATCH net-next v3 3/6] net: ethernet: ti: cpsw_ale: use regfields
 for number of Entries and Policers
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-am65-cpsw-multi-rx-v3-3-f11cd860fd72@kernel.org>
References: <20240703-am65-cpsw-multi-rx-v3-0-f11cd860fd72@kernel.org>
In-Reply-To: <20240703-am65-cpsw-multi-rx-v3-0-f11cd860fd72@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Julien Panis <jpanis@baylibre.com>
Cc: Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 srk@ti.com, vigneshr@ti.com, danishanwar@ti.com, 
 pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3806; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=JeOJtLTbcGj6xPCF5ZeTJIWS2mvZBY3kd+RN0BWRcHw=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmhVdmHFzbCImmd3YtgVwaLH7A3aNwQHJAzOSMN
 iwFvozW3cmJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZoVXZgAKCRDSWmvTvnYw
 k9FAD/9+N/+nHYj61/piisJP0F6f0fS28Ou1ha5bVV7Fw823mdKTn9DgBtEsXykRxWF1qPplDXr
 XibWml1N3NxnVGdAzcPQs34A8X+nCqwebHCc6knzBbH+RySxS4XcDq8Rnt6XWACZRx6koFJMbAz
 +/ymcqXNar7EudTPp2cYjv3EKXCOvWjGY3k/Pqch671LlhOr7UlOascyyivlycfHvR8TyXTWvoR
 AnbLKLIVlvYgLhMs/+3ZV1V+njOBCh3SzZgHqsomWDh3W09Hxru4ZTAyVeo4MgiS117MGYwf067
 QTuvfJf1zHDyQUXhmkjX2usFcvHUL70SgiDbNZXYH1cIcIzaDjDysnHslmGldnyPaoyEDW4F62k
 dbWCKpVL3mM+HkDHKgcVNO0VT2ZoUoN7XZdEFRUY6fGG9o5KPaWYgcJyclMiq2C1m/vjSoz+t7D
 iEOmFTgNXDV7qrORFjBIyLWMnXHKKZdwAH42GSfDtO/17WKuIcyPcjWQ9vsau6IBiI3NcWjO2tI
 f8f0JC6GeIKzv5SR9ho0mh6vw34i0daqoloJR9wQ3hOXeBE+De5Ch284I+Cn0hflpGj2Qz8Oife
 E9f/7PHcXM/oRj/RzHOqQFDvnAqYPogtEkbXYS1ZsxJjb0g7CEmCzlY5JDj3XhTIX1nCKscBvBD
 bx+zKwX9PqAPMpA==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Use regfields for number of ALE Entries and Policers.

The variants that support Policers/Classifiers have the number
of policers encoded in the ALE_STATUS register.

Use that and show the number of Policers in the ALE info message.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
Reviewed-by: Simon Horman <horms@kernel.org>
---
Changelog:
v3:
- added Reviewed-by Simon Horman
---
 drivers/net/ethernet/ti/cpsw_ale.c | 25 +++++++++++++++++++------
 drivers/net/ethernet/ti/cpsw_ale.h |  3 +++
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index f638aa63edee..c11326e8fbd4 100644
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
+	[ALE_ENTRIES]	= REG_FIELD(ALE_STATUS, 0, 7),
+	[ALE_POLICERS]	= REG_FIELD(ALE_STATUS, 8, 15),
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
@@ -1447,9 +1450,7 @@ struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params)
 
 	if (ale->features & CPSW_ALE_F_STATUS_REG &&
 	    !ale->params.ale_entries) {
-		ale_entries =
-			readl_relaxed(ale->params.ale_regs + ALE_STATUS) &
-			ALE_STATUS_SIZE_MASK;
+		regmap_field_read(ale->fields[ALE_ENTRIES], &ale_entries);
 		/* ALE available on newer NetCP switches has introduced
 		 * a register, ALE_STATUS, to indicate the size of ALE
 		 * table which shows the size as a multiple of 1024 entries.
@@ -1463,8 +1464,20 @@ struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params)
 		ale_entries *= ALE_TABLE_SIZE_MULTIPLIER;
 		ale->params.ale_entries = ale_entries;
 	}
+
+	if (ale->features & CPSW_ALE_F_STATUS_REG &&
+	    !ale->params.num_policers) {
+		regmap_field_read(ale->fields[ALE_POLICERS], &policers);
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
index 58d377dd7496..e12bb2caf016 100644
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
+	ALE_ENTRIES,
+	ALE_POLICERS,
 	/* terminator */
 	ALE_FIELDS_MAX,
 };

-- 
2.34.1


