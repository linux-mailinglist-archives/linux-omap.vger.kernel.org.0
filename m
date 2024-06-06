Return-Path: <linux-omap+bounces-1488-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 182978FE62C
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 14:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC07E1C2491D
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 12:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273AB196C6B;
	Thu,  6 Jun 2024 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t7vgTnb9"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DA7196450;
	Thu,  6 Jun 2024 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717675806; cv=none; b=YkAEWusFarkzeHRna/wnepX6HS31XtV0pbxHYMcVDDRFtblicPCdYRVb7LKEJOrQwJ8GuNF8hzwVWPLNgKyvBdFUHl802Uyfjha5JDGCMYSAZ2cGZvvsFVgEbk05M+ClVbgFHpP7YkCFpNMSe7O9pnUgKf/wC5bOQbkf6YvcIMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717675806; c=relaxed/simple;
	bh=w895/2slqo6enBO8SZknnRcbpa1vLtMNWX/hte4CCD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KC/B0Kl7m4Swjupdcj/pdxQ824+W673OiRy9Oz3//inf2z0WxVcH72pmzrWbt+dYBnNkA5sj8R65lzxs7SBMLo7c2ujc1IQWEDCHgMPvRzpaTg34g2bPeYuPr0x/hO3qq2D/xtl4pVg+32SvxMt+Ipero1ZNPJB/sV7rH3zFl38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t7vgTnb9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CE3C4AF1D;
	Thu,  6 Jun 2024 12:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717675806;
	bh=w895/2slqo6enBO8SZknnRcbpa1vLtMNWX/hte4CCD8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t7vgTnb96JNzQIT4YC7RcRWB2xWs7Fk7CjSHpNB4pQ4OwMLgU9h0mjfs5LCFqt+z+
	 cCiY/w4gmSRHBd1TpYT72HTCPzW9nQhprOLQBnV3BJZw50n+0yz8kex4wauGWLT4re
	 mRusDznW9OleE5NvRHf/xTKVH9WEcV5bo/TnMqZaMyGODFQj9jt6dBREOPFp/PbFNc
	 0e6Qb+14OKB1MIjXykn8kbrLxbeNXg9UYaGrwCNgSl37m15atyGUczWypx9FK+c7DO
	 YSIc/ZZqN30AG2EQv70EbmZX6NDP2qjUkBWlNukne8RIj53lWT/waE8HppktJrjspf
	 vgfjmBESUpXKg==
From: Roger Quadros <rogerq@kernel.org>
Date: Thu, 06 Jun 2024 15:09:21 +0300
Subject: [PATCH RFC net-next 5/7] net: ethernet: ti: cpsw_ale: add
 policer/classifier helpers
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-am65-cpsw-multi-rx-v1-5-0704b0cb6fdc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2002; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=w895/2slqo6enBO8SZknnRcbpa1vLtMNWX/hte4CCD8=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmYacGZ3z57FrkpP6WF4Kraavar3qosuFeGB/lt
 fagy9mVOkGJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZmGnBgAKCRDSWmvTvnYw
 kxJTEACWyUyTbbG806GxItJyS1sMPcilZO0PnCMinaqP6zQl7T6GSaSHMD+mOqMETX5pFnp0i8q
 YuJqEgdv5mJASKncPKdbuzjXaaAs3Xa+1/4SE8QSDuncqTN4avMi4bQBlNlUCF68G6GqwMnFAQV
 TApmrGTlUEKV6UooQuicR8OlEB2pTF0UJCu5i28W2mDQv7cbRvkZYwqxQsk3CmluPUMAjyqd89Z
 fJnTBMwIRqJoHXc4lKRmUMRHvH7pG0kll5f3QJQCvZDH7s6BYYdFtwghrKHsT48Vi2zmz2dAk+U
 pNR7yY1NwxEA5I8qnZXyvBbxe+UEnoS+wRCTB6+gkSEvXeYvrdQgPe0VG6rxEjAnfFldJ94IcsC
 S/GyoYYQUZEM1K7mpvkZI5qxjDnFT7i74eSipjuE/gIDdYHECeWut+ssb9B1ImM02miFtKlgPMl
 pkIXpSsINODvdcLIb7AFaMFAL0H0DC5VGKh80rUXdBQTE/w6S42gFcm1XMTsKvYdcniSP56/4lR
 Udg35GiBPO4CJKYaOF2Je/jMXz02TJF2XK0r/vZnaJ5q9rqw+13fp6ophFbHpPlYzz/QfDJVFWM
 j2FAzkeENSIfgwmznrTXVB2i56ogccnsS95TQ7Fwd/L583VrzWeyKrH36CsBvAMxolLRVQG5ThB
 lS8qVSMqb3pReNw==
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
index cbcc6573d7f3..9f0a3b960f74 100644
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


