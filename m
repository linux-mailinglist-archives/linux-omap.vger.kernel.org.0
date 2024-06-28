Return-Path: <linux-omap+bounces-1616-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCD391BE1B
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jun 2024 14:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56928B2220A
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jun 2024 12:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F8E15AAD7;
	Fri, 28 Jun 2024 12:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7di2ye6"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A21158869;
	Fri, 28 Jun 2024 12:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719576143; cv=none; b=cbSfOux2CSOqImsXfdQCj5Zjm7qPjPb0GqV3DQwN+y/bUQusWG1zdqZB/3ekzahzJEBCKkdqiMrKL5PDXwjHYGB3cFihEovdtAnqPnA52Amm5TpDDPBEz0N6ma7NXqG22qosSm8OHPW2BhTuHBnWf2XnbgawvF8CA+gbmx18tFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719576143; c=relaxed/simple;
	bh=/9Lt+Y2ipJumUvIw6ijMSebRDlayn4PCS0/cbKxgNnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=npK2vBI1XZeclDtEzOGkypQ6AluaNn1OdGaDQzyPLx03XhwalcpyOWpL/mVwVib7HR9M06z3Q19bVn06IFwW1LkJd8LrnkJrt5senl8rgSE21mT4bMfxxK1WwFW8a0/VkN7QbxgOVa3J/o4stvbjpUXdpKc/JZNVWc5vpJT5Tjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7di2ye6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C7FC116B1;
	Fri, 28 Jun 2024 12:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719576143;
	bh=/9Lt+Y2ipJumUvIw6ijMSebRDlayn4PCS0/cbKxgNnw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n7di2ye65waKaibL2G6UWSWXSiScNTPkwAZEVj4LfpGsyTyR5GLacziHqt1BwuWCG
	 8wp71b4roGuS0O3HBoIFp4MMy7mbmMObVT2BZr5ZyK+905fy7Y78w5Rz80SFdSA/i4
	 0XHAfOlN8ghvnjjnX7viEy0npFTE3zUfYNv9ADNHNY0OuoeoAfj5QoKAgzwbao5tTw
	 esCdfyPlTh9E4i47OnUygJBqE5UjlszM2nAk8WRgsRJP8yP6xm9fCrSpj2+H9LpoKx
	 4aJA/bXgbx8mgchIiJ53ocjUwKd9ikSXxr+BSY4c9kRx7ha9q5/jAjhVluxWyZl4ip
	 TnT+ncAqNuzmg==
From: Roger Quadros <rogerq@kernel.org>
Date: Fri, 28 Jun 2024 15:01:54 +0300
Subject: [PATCH net-next v2 5/7] net: ethernet: ti: cpsw_ale: add
 policer/classifier helpers
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-am65-cpsw-multi-rx-v2-5-c399cb77db56@kernel.org>
References: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
In-Reply-To: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Julien Panis <jpanis@baylibre.com>
Cc: Andrew Lunn <andrew@lunn.ch>, srk@ti.com, vigneshr@ti.com, 
 danishanwar@ti.com, pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2002; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=/9Lt+Y2ipJumUvIw6ijMSebRDlayn4PCS0/cbKxgNnw=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmfqY4jBg9K0RLrnJcWqwBGROzM3C6hO01BRDyf
 zMwZYyjAueJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZn6mOAAKCRDSWmvTvnYw
 kzgtEACsS+xeiFTY2VSuipIosA5mDCQKpHFvyPsPrX993Av8hkBAb75IxWZu7KU0O0FtsUhma9l
 FEnDz7bfXLmezu9fZhsQGL7lQk/Q2FMi16ikLV+KyXUyaGXyJqxZWq4V5qXYHIWYmQjjs651muI
 CQo6ktqNOs+SPsA8Y7xh5QT/7ZXyc/JXMkQ3UFUj/2Ath/JEtgQRplmcGrn8FRrn4YgGMlPFt9M
 FHn6yPZ/21QgP/dRe4e6wc8tvXl08wuZdMIr+kRLBGz2VpXbjAdbYmOgwSm68sAPtnsBQUKJcqI
 7WOn684jFRkv1g0vRnV7+EMANmnguQY7wVOrmYgrt+mq2BA2FuIcsLJgIlpV/kjZPGM8sViNbVV
 jX/RR4Cr1D9CWS9NXAe+H2iYLiyHaiv+OBX+mCyTdq11/5hlsGbUKxjThcVSeRbIy04Mv/5JLFo
 5F+Y1r45IzEl+Izhv8BldAN65b1MwqjyY6Lw4cBrj5+5Xkv1DWvtxQ/80ITzGZp3DP6pRgych3H
 g0B6oJvewdx2uV+/w6LVfr0xXTrZ74lwaZsjyASHHM6ts6SCQjdEl+OH8WgphuS/bMx4JHFqgOb
 neTSBgGDEVmGwIehzNkoFEP/mpuH7GvGCiSeJTXhWZMp0UxyCGRCXztGkOmf4uhK0Cq4PrVakOy
 X/DzE8Rm6e8fU+g==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

The Policer registers in the ALE register space are just shadow registers
and use an index field in the policer table control register to read/write
to the actual Polier registers.
Add helper functions to Read and Write to Policer registers.

Also add a helper function to set the thread value to classifier/policer
mapping. Any packet that first matches the classifier will be sent to the
thread (flow) that is set in the classifer to thread mapping table.
If not set then it goes to the default flow.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 7bd0dc20f894..75a17184d34c 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -1626,3 +1626,27 @@ u32 cpsw_ale_get_num_entries(struct cpsw_ale *ale)
 {
 	return ale ? ale->params.ale_entries : 0;
 }
+
+/* Reads the specified policer index into ALE POLICER registers */
+static void cpsw_ale_policer_read_idx(struct cpsw_ale *ale, u32 idx)
+{
+	idx &= ALE_POLICER_TBL_INDEX_MASK;
+	writel_relaxed(idx, ale->params.ale_regs + ALE_POLICER_TBL_CTL);
+}
+
+/* Writes the ALE POLICER registers into the specified policer index */
+static void cpsw_ale_policer_write_idx(struct cpsw_ale *ale, u32 idx)
+{
+	idx &= ALE_POLICER_TBL_INDEX_MASK;
+	idx |= ALE_POLICER_TBL_WRITE_ENABLE;
+	writel_relaxed(idx, ale->params.ale_regs + ALE_POLICER_TBL_CTL);
+}
+
+/* enables/disables the custom thread value for the specified policer index */
+static void cpsw_ale_policer_thread_idx_enable(struct cpsw_ale *ale, u32 idx,
+					       u32 thread_id, bool enable)
+{
+	regmap_field_write(ale->fields[ALE_THREAD_CLASS_INDEX], idx);
+	regmap_field_write(ale->fields[ALE_THREAD_VALUE], thread_id);
+	regmap_field_write(ale->fields[ALE_THREAD_ENABLE], enable ? 1 : 0);
+}

-- 
2.34.1


