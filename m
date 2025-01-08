Return-Path: <linux-omap+bounces-3034-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCC6A06307
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 18:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2986F3A29BE
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 17:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164C11FFC5C;
	Wed,  8 Jan 2025 17:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="k0utPqPF"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AD71FCFE7;
	Wed,  8 Jan 2025 17:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736356100; cv=none; b=NuWKKHBNsddfLwe+bD6G6m3t1MjZtjpGUdGuAoPUSfJp/NE/hYwQf74z9q1qvlP6jchsJ9Clh9y0LUylSKajsrrPIVICiYm0IiNIiTiq1qiSuIdvAmyDeKzYs3DIuZxoQH1vkcAzW5HDzEmbkHbtVSMHJU+4QHJ8+0RdIl42Tl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736356100; c=relaxed/simple;
	bh=5z3Tiw4v8P4zzxedTNT3Lb+3Ro41te0JOX3VXptfFhA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MShxOQr1qZ/pvTZ9f0zInw2KBQvxeILO3kGCrYgr5mS6QY93NOq1DOpcB92Jsm/06FBFxbE9A6dmGEG5TGwVbw8bJzPfE4MgdX5VoZ0kyPLTtqMy76eOfQbNPRHmjGAbbEtT20M7QVT5IlDbyz1OQr9VRjOMo27ahEeuqLDNYL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=k0utPqPF; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 508H87Ov031212;
	Wed, 8 Jan 2025 11:08:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736356087;
	bh=Ntpcvj41f+Yw383BOIT1gjhwHUv71FWbAyEyF+gWZkY=;
	h=From:To:CC:Subject:Date;
	b=k0utPqPF6gpxeKL31B+ttlsrq1XWIEKgqZrtLla+TvEpqUCbNHAX/g63JvnC7sjDY
	 mV6Cpl+SE2CJSYkus7lgeOHQkvqUzdsaFnF7g1fXv59sWm0Xdxpq9YETlVGRAwGC1b
	 DNueQfGuRpp9GLY3U9oM3Zk6lBxcK0e+GBIAllMQ=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508H87L2063527
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 11:08:07 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 11:08:06 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 11:08:07 -0600
Received: from sudheertest-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (sudheertest-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508H829c043915;
	Wed, 8 Jan 2025 11:08:03 -0600
From: Sudheer Kumar Doredla <s-doredla@ti.com>
To: <s-vadapalli@ti.com>, <rogerq@kernel.org>, <andrew+netdev@lunn.ch>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <horms@kernel.org>, <gnault@redhat.com>,
        <linux-omap@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <s-doredla@ti.com>, <t-patil@ti.com>, <j-keerthy@ti.com>
Subject: [PATCH v2 net] net: ethernet: ti: cpsw_ale: Fix cpsw_ale_get_field()
Date: Wed, 8 Jan 2025 22:54:33 +0530
Message-ID: <20250108172433.311694-1-s-doredla@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

CPSW ALE has 75-bit ALE entries stored across three 32-bit words.
The cpsw_ale_get_field() and cpsw_ale_set_field() functions support
ALE field entries spanning up to two words at the most.

The cpsw_ale_get_field() and cpsw_ale_set_field() functions work as
expected when ALE field spanned across word1 and word2, but fails when
ALE field spanned across word2 and word3.

For example, while reading the ALE field spanned across word2 and word3
(i.e. bits 62 to 64), the word3 data shifted to an incorrect position
due to the index becoming zero while flipping.
The same issue occurred when setting an ALE entry.

This issue has not been seen in practice but will be an issue in the future
if the driver supports accessing ALE fields spanning word2 and word3

Fix the methods to handle getting/setting fields spanning up to two words.

Fixes: b685f1a58956 ("net: ethernet: ti: cpsw_ale: Fix cpsw_ale_get_field()/cpsw_ale_set_field()")
Signed-off-by: Sudheer Kumar Doredla <s-doredla@ti.com>
Reviewed-by: Simon Horman <horms@kernel.org> 
---
v2: 
1. Updated the subject and commit message
2. Added Fixes tag and reviewed suggested by Simon Horman
---
 drivers/net/ethernet/ti/cpsw_ale.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 64bf22cd860c..9eccc7064c2b 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -106,15 +106,15 @@ struct cpsw_ale_dev_id {
 
 static inline int cpsw_ale_get_field(u32 *ale_entry, u32 start, u32 bits)
 {
-	int idx, idx2;
+	int idx, idx2, index;
 	u32 hi_val = 0;
 
 	idx    = start / 32;
 	idx2 = (start + bits - 1) / 32;
 	/* Check if bits to be fetched exceed a word */
 	if (idx != idx2) {
-		idx2 = 2 - idx2; /* flip */
-		hi_val = ale_entry[idx2] << ((idx2 * 32) - start);
+		index = 2 - idx2; /* flip */
+		hi_val = ale_entry[index] << ((idx2 * 32) - start);
 	}
 	start -= idx * 32;
 	idx    = 2 - idx; /* flip */
@@ -124,16 +124,16 @@ static inline int cpsw_ale_get_field(u32 *ale_entry, u32 start, u32 bits)
 static inline void cpsw_ale_set_field(u32 *ale_entry, u32 start, u32 bits,
 				      u32 value)
 {
-	int idx, idx2;
+	int idx, idx2, index;
 
 	value &= BITMASK(bits);
 	idx = start / 32;
 	idx2 = (start + bits - 1) / 32;
 	/* Check if bits to be set exceed a word */
 	if (idx != idx2) {
-		idx2 = 2 - idx2; /* flip */
-		ale_entry[idx2] &= ~(BITMASK(bits + start - (idx2 * 32)));
-		ale_entry[idx2] |= (value >> ((idx2 * 32) - start));
+		index = 2 - idx2; /* flip */
+		ale_entry[index] &= ~(BITMASK(bits + start - (idx2 * 32)));
+		ale_entry[index] |= (value >> ((idx2 * 32) - start));
 	}
 	start -= idx * 32;
 	idx = 2 - idx; /* flip */
-- 
2.34.1


