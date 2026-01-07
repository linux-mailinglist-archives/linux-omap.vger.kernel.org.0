Return-Path: <linux-omap+bounces-5385-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C070CFE75D
	for <lists+linux-omap@lfdr.de>; Wed, 07 Jan 2026 16:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBD5F30726B1
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jan 2026 14:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B42435CBC6;
	Wed,  7 Jan 2026 14:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="qedl6nPH"
X-Original-To: linux-omap@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011019.outbound.protection.outlook.com [40.107.130.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB3535CBAB;
	Wed,  7 Jan 2026 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767797978; cv=fail; b=bS0Kj8dcnKYMFmFlChy6S/QiRJPJzJcXNDh2yWLpmb0Psj5kIsA542rXs9zycoJn0MVvKY7CkQOUyHGevavrcehZxo+AcUnGFZ1ybq+L6aXeFXqlu6aNvT/yZFJgIhJB+OWnLGnm7sXkch0ZSCLa6/uloockUZZYvGl7b5/RHfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767797978; c=relaxed/simple;
	bh=s9nGbiueKdbQlqdVA8VKUBeEuoaJntOUrmnORvlNxQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=un6OYMMQ5aQFmDMFA8ZEwX3zuBa4ioOksqTDIwz2sXYxFRebTR3FshO4aYTNTGPt87R0LBPi6oHi4+nUPcTun8dPVV+oSg8mVXVGS2pat+sHisvFH/qL3cfMA21oHFVOb1Eb+XjZtp5/7PyjVw86eLSauFdro/kHCq7Hw/1e/7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=qedl6nPH; arc=fail smtp.client-ip=40.107.130.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUoCral6IkB6P9LwiUyu9m3DxW0GXBcXDNje++6wwmXMRiAKsRJucYsl/gzrrNWjjNJWGv6B8hpQmTZHY0dddGA15JXVsnp02zDmuI+cn0UYYvLGag16WtrR4hvyr3ZkNgODe90HQiYAjmrfnr4kJBi8vtVjow4YqYZgR1iPadb5uhuFaK6saMVjcT3O0Z2wufxdcsxe/XMYdehfvDUkvDkLw75ayYpybIiHQuuQCejTQmv/DW6GITsZobMSNEazomUM7R3LUuPxjkIJRM4rkQ07YLRAHF9SQZdH3EIHXDaFx8B0INj7i+5FJhqWqAd3cxJgWZilpcMKWjkdbT1AIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqwYydq8/zzjVTlPNgGpcb2TEO2P6Wq1HvdKiIyIrq4=;
 b=QD1+/LY1SzgoZQWGwDjFl15u1ACr6t2ie3IqP6vYELC9Bil4XUD3coqJ/sMLtUHPvrXA1iX1En0BScn2gXUibuHlOxxxM4Sfu+Gy1nzRP02aFHW9yLPue3794bymBnRk22FaKohBGDbB7g7VOpjwz/grOqxwHD4HJc635Exot9LTitFnWiUB+09XNZJHLX9w5yWnQq690bXgkIZndpAr2IMbYBg12aAiv78dlwt7yQYJfVdWOV2NmfTZkagRS4ALrrQmmN6YuCvthZ2QISre25TMygeKVWbrN/1GAWiNqyJiuMBVAJGY9DwcOuTb7lPTI5tsuVdot4N7F4fSA+eIJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.30) smtp.rcpttodomain=davemloft.net smtp.mailfrom=nokia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqwYydq8/zzjVTlPNgGpcb2TEO2P6Wq1HvdKiIyIrq4=;
 b=qedl6nPHgJnJbEBEjoKheyv0UT4T2/mOg/CIMdbYm71f5y+qQcZdI2u9WRtFxMr35a9C+DC4LrSS80KZTyI6UfqTOx4iL3u32NnZnp/Pmg0NBA1r1A6c6IB0HUIcoSI0m3l7UbbjKa2WVHu/rdYSWar/TVSgbanGmDaMqEHGxeJO47JJyXmbg7DGnLwcy+NVVOY1Bx0+qTyu7C2hPzdEGRUff3NGvvBd/ot5ki8k5PFMxF5bPuLTLMi9LQZSjE9++7oCgAtk/ggaH+9sMF2nP43cYONh1i7YwZx0VJo5XpKdh8B0A8jKOx3SeB/mL7t8wVro4fMnvgTQp+RuTr3PsA==
Received: from DU6P191CA0033.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::8) by
 DB9PR07MB7881.eurprd07.prod.outlook.com (2603:10a6:10:2a9::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Wed, 7 Jan 2026 14:59:32 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::c) by DU6P191CA0033.outlook.office365.com
 (2603:10a6:10:53f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 14:59:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.30)
 smtp.mailfrom=nokia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.30; helo=fihe01smtplvp01.emea.nsn-net.net; pr=C
Received: from fihe01smtplvp01.emea.nsn-net.net (131.228.2.30) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1 via
 Frontend Transport; Wed, 7 Jan 2026 14:59:31 +0000
Received: from uleclfsdev02.linsee.dyn.nesc.nokia.net.net (uleclfsdev02.linsee.dyn.nesc.nokia.net [10.47.240.2])
	by fihe01smtplvp01.emea.nsn-net.net (Postfix) with ESMTP id 3E7B8800009E;
	Wed,  7 Jan 2026 16:59:30 +0200 (EET)
From: Stefan Wiehler <stefan.wiehler@nokia.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-omap@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Wiehler <stefan.wiehler@nokia.com>
Subject: [PATCH net 2/3] net: ethernet: ti: cpsw_ale: Remove obsolete ALE_VERSION_IR3
Date: Wed,  7 Jan 2026 15:58:18 +0100
Message-ID: <20260107145846.3144585-3-stefan.wiehler@nokia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260107145846.3144585-1-stefan.wiehler@nokia.com>
References: <20260107145846.3144585-1-stefan.wiehler@nokia.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009524:EE_|DB9PR07MB7881:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 53acbe0d-215c-4f08-2151-08de4dfd5ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4LTBUjTlv2MbPq2RItZx6s+GP87xmcK9uMf2S3spEJMX4d0tFmjJ8dcNTMdz?=
 =?us-ascii?Q?jdXMZHyvGSDRU9LWgM8mYKbThtAjRQPQ4O2p5huNHG4K7WVgjtOyC7MKDcfV?=
 =?us-ascii?Q?JrG9DQYJbRXR9h4Jo99cq1Q0GNBvc3neSOlSn3qx7s2Yju3lNCw9FmOjFxKq?=
 =?us-ascii?Q?+6UH/mO/rDjFY9yg2qZrvZTp4OCF8sUnRHLN7Vhi5g7QXDl+ris8VBUhn7Fg?=
 =?us-ascii?Q?a3lKaTDL/1mpbDjp8I0GnT6A3jiFlTbxQBxIdB0NIx9LnkQYPll6n2umW4//?=
 =?us-ascii?Q?PkmGDoUp+SVXjpbHOeF9hQJzVrlT+62qDIECQFV5B5wnE0bvzYv0hbkteVie?=
 =?us-ascii?Q?mghffOM1I1i7PVOqU8dw7DyVti38qiJgZgHfnA/V4caE0LX/e6TVvrBlolWb?=
 =?us-ascii?Q?DnrtL3o4auw+kO5QyXyH8RxBROPgQFDHmMHHx8jS97gBGu/o4GKEZBXQQhAs?=
 =?us-ascii?Q?jlzPSEZKxuFPPRR5eDWYzt73q5FLoapg9OI/HspeHe6LCgE3p9TvDKFtq1Qk?=
 =?us-ascii?Q?DgGOwGU63rHMNLyHYExOa5ZNOFZJa0zMwa8Xpwz7YjiRpEgKdHMCJ6DumSVV?=
 =?us-ascii?Q?R82kbZHwW3UzDYitf02TJ+weCaf7EdT+Tx6VSNPMSgY8ieEHZpCgAF0/LFIr?=
 =?us-ascii?Q?wKNkQTW87dzW/M+mtc5lM0NmsFSbpLgmkxU1AU2IohwDTuVwYI7xDD7y6aqh?=
 =?us-ascii?Q?yTXPhesnGBZX/HJqMcimDBU5indTR8d/KOdWESb/uJ3ojqDYgxi9zY6e7J8s?=
 =?us-ascii?Q?rvyL8xKUWBVX7bGW9SwgBLsGlCyxNL4n2+jQZXFSU7oMIIgE6J3Ya0zny3JO?=
 =?us-ascii?Q?cDt8KcRTuBkio+0kdt8VUpKHCyjiSrpuXhi1Yf62MWH+/adgH046OxXtg01q?=
 =?us-ascii?Q?41uOdumQHpZiEi3z5f/HjYyF1VsxSdhW5j2LneM5MqxiJRG64jZJ+fJPY6JE?=
 =?us-ascii?Q?FFusy7sUpHJh2Ztr8L2B35ds1hkaY+0XSItKqAC2HL6TV9Gmq1jUcD8xMvcR?=
 =?us-ascii?Q?P0k6zuswzL9+4WRCaUjSSDndgYQKbp/5Zdon0Fdvk27NWtgTUmI77ose8V5H?=
 =?us-ascii?Q?qXhVdzoh1ixNDH9IjpaaXLmSmVVVzWU7s0PQHitEC6w7apzmPY2RNy/+H7Ox?=
 =?us-ascii?Q?QaTP8hn5yD1rp+MdgI28Q7av4fdXhxWpz+6DZoW084FduFYUNkd8ShGP4cdO?=
 =?us-ascii?Q?InomwQMi2V6+CyP/S5Z2V/cESBzR91vpml2WzfuE9FnGqmfDAxVwAD9h0cz0?=
 =?us-ascii?Q?ELxZLfTe/y2DdeYVZcECn+uuYIvoYdX8KXoSV2clue8uGDKwQu5GiUUzOX0b?=
 =?us-ascii?Q?GdjCUNpoanMD340iCtpdpDesmX6A6tub8YmULPlQ0dD4vf41VxvnNFFr/lgo?=
 =?us-ascii?Q?217zAr1cLmDwlCs96BmHJhhZBURHFVHBOM5+vM3UFxiq7QLVKUQFdHnEgtPn?=
 =?us-ascii?Q?kl+OxAFcI5lDw6E661kw8F5g8YwR91LpB77pK4nne/caIYXvaJuKxFLLXWm5?=
 =?us-ascii?Q?qgnlMngeZDItr10JdGADgfbJhyM++DVYp4mrWK0fdrCvntU8MWmnbEVTZXHb?=
 =?us-ascii?Q?ZyPjKmQMm7yiuwRnUhI=3D?=
X-Forefront-Antispam-Report:
	CIP:131.228.2.30;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe01smtplvp01.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:59:31.1243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53acbe0d-215c-4f08-2151-08de4dfd5ccf
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.30];Helo=[fihe01smtplvp01.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7881

Entry mask bits are no longer hardcoded, so this macro is unused.

Fixes: b5d31f294027 ("net: ethernet: ti: ale: optimize ale entry mask bits configuartion")
Signed-off-by: Stefan Wiehler <stefan.wiehler@nokia.com>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index e13df62448f1..aac4db3f7656 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -23,7 +23,6 @@
 
 #define BITMASK(bits)		(BIT(bits) - 1)
 
-#define ALE_VERSION_1R3		0x0103
 #define ALE_VERSION_1R4		0x0104
 
 /* ALE Registers */
-- 
2.42.0


