Return-Path: <linux-omap+bounces-3463-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF114A68E05
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 14:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB91D175281
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 13:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE4C259C85;
	Wed, 19 Mar 2025 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYTzua+B"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6990925742E;
	Wed, 19 Mar 2025 13:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742391687; cv=none; b=N4r9OXTY9ojiR0RygeGWvKPCItNtnmRRG4rLeKfgh/mvhq9kgkG2vzlug15Gmc0DxD7nqiGit2jyUn+A0InHB9P3MWHxv4ErTw45z15C4cn1MfmDYb5k/pVEG3dKTVEsddDRUBqo3U0OQp7/Xmh5TtN3sIKuAJ17Il7+8Vwm7s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742391687; c=relaxed/simple;
	bh=gIWNou9NhHWdm2Cuup1OIaQwdRqja35AVHtc6DQS4+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fTSF4ZX/x0377sUD0Knm1VtsSi7gu/nepE29+1J6YNelm356ku2vJSGdFLEr3zXBTLw5iggnwerz8uzuFS65nX0krmEPsYZOkKE+smf7IsIgnk07PTNdnZI+2AmNtPf1iTqG2b0vNKU3T9zVaosH+vJD69/iEmUQHSaZY37AE1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYTzua+B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B31CC4CEEC;
	Wed, 19 Mar 2025 13:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742391686;
	bh=gIWNou9NhHWdm2Cuup1OIaQwdRqja35AVHtc6DQS4+o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jYTzua+BFyhZr4g/48BxXsk/03bb4uQHnHC6UqMzePAHHXOFg3UrDMAWwrVquMuIh
	 nYlfsOMepZfCn1U8wSZHkPpYXN+ZdZeFJoy0w07KC9QZY28xYBZrJ/7I0AQwYBJaSH
	 EoARH/Y6CBEzTfg6Tbk6WSmg4kLGnLwbJjzhbs0PvLIvYwhHlsYqe10wuJgvYBoxe7
	 kotzTrsFai7sIZ92Iw8uUAtJe5n5aOzLXOsweym0LLO3glgo+D3WmjUhTFpWE1hJSV
	 MOPYPaM1PKKJ6Ln6Km5/1TJDGlKX1lmf99ZL3JwP0J6GWQVqH0yIG5/AgBfQvxdKIR
	 1aOJ2+cssPwWA==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 19 Mar 2025 15:38:31 +0200
Subject: [PATCH net-next 5/9] net: ethernet: ti: cpsw_ale: add
 cpsw_ale_policer_reset_entry()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-am65-cpsw-rx-class-v1-5-2bfded07490e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3404; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=gIWNou9NhHWdm2Cuup1OIaQwdRqja35AVHtc6DQS4+o=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBn2slxvQWNGB+pQCm4LVGa0wN5hgqfhDWBW25ba
 ltMYjQeyYmJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZ9rJcQAKCRDSWmvTvnYw
 k+yTD/9h6sob7boaNBYokpj8QWpAusKnaPrv8ptXsJ+JBsmroW33OBzAVkz0iiSm4v89AwznhmB
 +10KqqFOdp0XoAORTKzw8Am6TSCZYzQ9MKh06R9D/v1Fb6rNn4KYb2qF3ApMGbT1dSpHxgp1gbA
 msfkTbnZr+3zNKKuopt7Cv1RnWF+PJ91yiitfedNNeAn8bPFgSQJA8QK8oY93tyteCXGSZ/r5YA
 OhMhUSf5xJTHG2SRxpR36DZXlLfrIb6Bq1Q3YYSa7GpgTKn8GsxfGNHPz7PLwLM6kBgP3+tVlsH
 k8/HgHz7PWvdhnzMCR0BNeiYEdQ+euuthUpHIrwHiWvFpB5U7e5Gcchch3/mZy2poFeS8rqqvSO
 CjLkC+utYQ1yAxyno8xMwTDqBz21G3+37ZWjF8+eH4xvk3tVRyVAg8T/ulv/x0FEFBjcZZOA+BK
 prscWzCDiptl5c7m0sAL2AKaDHCeK2gaIbkhNdCQlucGI3dPFqimHQaKY/cbmgaB4PLcQvtma/N
 GRVta7p6+aZQkA8hPtXsYJVGSGdU25VdTAiEQtaEmMJnH64KCkWC5pWqxACkJAXDhk4XqWiKJIl
 cZq+SiUDaUtQqXJZsYhPDduaYKEiR07TbTR9vfmrmBpL0wJbZQXBLq83Wf+8SCiQShmJ+B14Qe2
 KoWcyqZA5UrGcxg==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Add new helper cpsw_ale_policer_reset_entry() to reset a single
policer entry. Clear all fields instead of just clearing the enable bits.

Export cpsw_ale_policer_reset() as it will be required by cpsw
drivers using policer.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 35 +++++++++++++++--------------------
 drivers/net/ethernet/ti/cpsw_ale.h |  4 ++++
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 2c780efed402..630e3a555190 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -1674,30 +1674,25 @@ static void cpsw_ale_policer_thread_idx_enable(struct cpsw_ale *ale, u32 idx,
 	regmap_field_write(ale->fields[ALE_THREAD_ENABLE], enable ? 1 : 0);
 }
 
+static void cpsw_ale_policer_reset_entry(struct cpsw_ale *ale, u32 idx)
+{
+	int i;
+
+	cpsw_ale_policer_read_idx(ale, idx);
+	for (i = 0; i < CPSW_ALE_POLICER_ENTRY_WORDS; i++)
+		writel_relaxed(0, ale->params.ale_regs +
+			       ALE_POLICER_PORT_OUI + 4 * i);
+	cpsw_ale_policer_thread_idx_enable(ale, idx, 0, 0);
+	cpsw_ale_policer_write_idx(ale, idx);
+}
+
 /* Disable all policer entries and thread mappings */
-static void cpsw_ale_policer_reset(struct cpsw_ale *ale)
+void cpsw_ale_policer_reset(struct cpsw_ale *ale)
 {
 	int i;
 
-	for (i = 0; i < ale->params.num_policers ; i++) {
-		cpsw_ale_policer_read_idx(ale, i);
-		regmap_field_write(ale->fields[POL_PORT_MEN], 0);
-		regmap_field_write(ale->fields[POL_PRI_MEN], 0);
-		regmap_field_write(ale->fields[POL_OUI_MEN], 0);
-		regmap_field_write(ale->fields[POL_DST_MEN], 0);
-		regmap_field_write(ale->fields[POL_SRC_MEN], 0);
-		regmap_field_write(ale->fields[POL_OVLAN_MEN], 0);
-		regmap_field_write(ale->fields[POL_IVLAN_MEN], 0);
-		regmap_field_write(ale->fields[POL_ETHERTYPE_MEN], 0);
-		regmap_field_write(ale->fields[POL_IPSRC_MEN], 0);
-		regmap_field_write(ale->fields[POL_IPDST_MEN], 0);
-		regmap_field_write(ale->fields[POL_EN], 0);
-		regmap_field_write(ale->fields[POL_RED_DROP_EN], 0);
-		regmap_field_write(ale->fields[POL_YELLOW_DROP_EN], 0);
-		regmap_field_write(ale->fields[POL_PRIORITY_THREAD_EN], 0);
-
-		cpsw_ale_policer_thread_idx_enable(ale, i, 0, 0);
-	}
+	for (i = 0; i < ale->params.num_policers ; i++)
+		cpsw_ale_policer_reset_entry(ale, i);
 }
 
 /* Default classifier is to map 8 user priorities to N receive channels */
diff --git a/drivers/net/ethernet/ti/cpsw_ale.h b/drivers/net/ethernet/ti/cpsw_ale.h
index 87b7d1b3a34a..ce59fec75774 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.h
+++ b/drivers/net/ethernet/ti/cpsw_ale.h
@@ -156,6 +156,9 @@ enum cpsw_ale_port_state {
 #define ALE_ENTRY_BITS		68
 #define ALE_ENTRY_WORDS	DIV_ROUND_UP(ALE_ENTRY_BITS, 32)
 
+/* Policer */
+#define CPSW_ALE_POLICER_ENTRY_WORDS	8
+
 struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params);
 
 void cpsw_ale_start(struct cpsw_ale *ale);
@@ -195,5 +198,6 @@ int cpsw_ale_vlan_del_modify(struct cpsw_ale *ale, u16 vid, int port_mask);
 void cpsw_ale_set_unreg_mcast(struct cpsw_ale *ale, int unreg_mcast_mask,
 			      bool add);
 void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch);
+void cpsw_ale_policer_reset(struct cpsw_ale *ale);
 
 #endif

-- 
2.34.1


