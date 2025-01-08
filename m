Return-Path: <linux-omap+bounces-3028-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E08C1A054DB
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 08:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 424083A2955
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 07:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EFA1B0420;
	Wed,  8 Jan 2025 07:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XIWzUywA"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9DB1A83F9;
	Wed,  8 Jan 2025 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736323015; cv=none; b=B5ZVPjYgpIyb6Y4LXifdpHAPAz5Ao3xYhPHfFl7+k67g6qiBbF54pvWdiUMmbbWtjNUPnDGyKvB1fPMuwdNnKYSqlc7L1amtgzFhKkMEidBugwW6Z5Wvi8oYX5tOnr7yrLGulJPBIK71nQPWC8oI7KOlvFymuRoaShRoHbBCYTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736323015; c=relaxed/simple;
	bh=e+ZlfikMJCRvQ+FiB+A8F4gr5P1SbR6gcxHqXQ60rFU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VCg4FH6L28wxI6i5qiAIeQUUks7VqHuDM18VDK+RwWVBJbUR4OAIcP7D+RUd5MGSePPasgW+NOkRr1zQluBR6Jr6ynI+j37ZSb8awmwxmrRdN9RS3XfPir6l+MjI6teVTNhZrXAKKC8RrJmCbg6YkzeHlOmBBIUvawhvAp/baYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XIWzUywA; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5087uZXD3072777
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 01:56:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736322996;
	bh=KOm+I1ztjs3NUKlqS45RCXVTmE0Fa8kZnCWTvoq5xP0=;
	h=From:To:CC:Subject:Date;
	b=XIWzUywAKrBu5ROPlQCGHGtOXXQbtpeHDUcEjNGdXM2xui/Lkpcf8kVTRUitlaeiL
	 ewARfmQ7m83vuiqZKGuKZRhnD+XvMLEfKZICqrWBiq5GUIt3UiQENc+tuvflt8T2A/
	 6THxL3TSfh5MzvQce6JfgxRRgWNyzlyxBrkM009g=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5087uZe8047240
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 01:56:35 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 01:56:35 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 01:56:35 -0600
Received: from sudheertest-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (sudheertest-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5087uV5M065620;
	Wed, 8 Jan 2025 01:56:31 -0600
From: Sudheer Kumar Doredla <s-doredla@ti.com>
To: <s-vadapalli@ti.com>, <rogerq@kernel.org>, <andrew+netdev@lunn.ch>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <horms@kernel.org>, <gnault@redhat.com>,
        <linux-omap@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <s-doredla@ti.com>, <t-patil@ti.com>, <j-keerthy@ti.com>
Subject: [PATCH net]
Date: Wed, 8 Jan 2025 13:43:03 +0530
Message-ID: <20250108081303.228653-1-s-doredla@ti.com>
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

cpsw_ale_get_field was returning incorrect data when requesting higher
word fields. Additionally, cpsw_ale_set_field was writing incorrect 
data into the ALE entry while updating.

For example, while reading word2, word3 fields (62 to 64 bits), the word3
data was shifted to an incorrect position after reading. The same issue
occurred when setting an ALE entry.

This patch fixes the shifting of the word3 data by aligning it with the
required fileds, ensuring the correct value is returned from
cpsw_ale_get_field, even for higher words.
It also ensures the correct vlaue is written into ALE entry using
cpsw_ale_set_field.

Signed-off-by: Sudheer Kumar Doredla <s-doredla@ti.com>
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


