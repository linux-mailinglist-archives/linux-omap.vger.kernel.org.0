Return-Path: <linux-omap+bounces-5384-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44088CFE754
	for <lists+linux-omap@lfdr.de>; Wed, 07 Jan 2026 16:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AF7B30492BB
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jan 2026 14:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDFD35CBB4;
	Wed,  7 Jan 2026 14:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="JBxPytJw"
X-Original-To: linux-omap@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D8B329C56;
	Wed,  7 Jan 2026 14:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767797974; cv=fail; b=ipZ0cCPf2dLpaL8SmJ/LV+AHit00s62rEq/qYxWUWkMCgGt6pMXkW/MCYe1w+iyAkpQ2KSHlUNfnsoSMqWGzN0/+3r+YUskUaZy1pU/fgBedXF+IcQa9OqPuJF6+oxvXcHz26gf5iHAx73e1XmbcU5v28Nt6Kcen5AyKkjDo3ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767797974; c=relaxed/simple;
	bh=lqgd3Rb2llKu1G+STTCtZSeyoJSPG8QGxLGg2Wfvxw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K+pso9Mu3XiRN56nItF7MdC4LOO1g1OCGTVnlanq4x7/21nQsCCaaDytwytHG0Ojf95f8B6dQISLc0GqQ0nY1UwIfPNkpoDtaRvy0J1nmE2CW4KrBhz8uYtUzuUCGf2tdainiFBtm0j2MLipFVa1Id7rTACDRBk09gxsiUqm+PA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=JBxPytJw; arc=fail smtp.client-ip=52.101.66.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQC0vWNnFVKREFjxcMvmSFs+/exT+lC5WF/MXUNaPeFyZwmMuAutdKAQl0QlCIsstmZIW+GoljVr8j3rCaFswoSOdOvTC5/CBYriaoMRyJUI2U0fHJJjWHfByprCTqK58pG/hN42g+N2cqzZYjZuKHehT+4UwkwXaoISUE2+uIjzTbatHgxfwqUGS3ysejz++dHI+Rx3jAIP4SZrtotgt+e2cEaDd9ZSGTNAPqOM4PqnmLhgAvnkMR11J2IYaTdbQ6WzvqGoBOZaOppoywxBgJuqjgHamcp+dr8HMkIcr1aIChQ9zd4fldc9Gj0iDmLaz66FWVI05pf7EXvbsDW4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+6FY9bB0y+uLnvv2768TEK1rh75Sjdk4fzjcO5hzQA=;
 b=ADy/T9l7sYHxViQ3VmYkUiJLC4HbYt2eP1p8W5RhKQ2UpV6kYZkRemobj6iaTbNZg2DxudhwzdldKetmIxbo10/vbLRHJJzCFzeN2dv5D00MJFi0MXyFXhDnmFvbAAvbopt0cu3aeGsMysWXJfpeh4q8IEhZCJHCHmbzh00fla+2k16sJVO0eGlVBD2g/nYEJ0mZG8orqVrDCCIsqVz6DdHG+EQowVBrZcU81qPyR6Y1jnC4JQA8FKv8I9Cxqlvit9rHoSXEhQwk9mtkyQaSINW2Ja4IDaPcPo3zgX1hzBEf5l1vKSHCdS5L2NbKa6lxdWZfy3/M2XCPC6AVMYPPrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.30) smtp.rcpttodomain=davemloft.net smtp.mailfrom=nokia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+6FY9bB0y+uLnvv2768TEK1rh75Sjdk4fzjcO5hzQA=;
 b=JBxPytJw/yGZroFlIwCFVKeTTEz3pKduX/lLR2DqkacxGCRVIL2pAo0UpuEfyQ7/6gbWHAC3nozzGLiY5zo1blfhGVmLwv0R5SHOHN+Eex03RsjcT82WDSyKfbDEml+3VQRIhyDwyhcO9kd86hbUW4Dtq1bqtlMlXMWCV8Mnzu6rtVi0+WEmN+iuPZFcVkxXqGiZKEtq30HgLBQYm0CBdQOPNYnN7Uc14rFea6LbjM9VbC0wzVkXv5QB1gZdu2rcHP/KM39f/V8GHbEL7jMuCBKQel26p4QpbAjlRlHMcOYxdh6fdw5JapcxQq/uGVBpZeK1IXIuNh4rErmGwhmssw==
Received: from AS4P189CA0036.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::7)
 by FRWPR07MB10698.eurprd07.prod.outlook.com (2603:10a6:d10:184::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 14:59:28 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::32) by AS4P189CA0036.outlook.office365.com
 (2603:10a6:20b:5dd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 14:59:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.30)
 smtp.mailfrom=nokia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.30; helo=fihe01smtplvp01.emea.nsn-net.net; pr=C
Received: from fihe01smtplvp01.emea.nsn-net.net (131.228.2.30) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Wed, 7 Jan 2026 14:59:27 +0000
Received: from uleclfsdev02.linsee.dyn.nesc.nokia.net.net (uleclfsdev02.linsee.dyn.nesc.nokia.net [10.47.240.2])
	by fihe01smtplvp01.emea.nsn-net.net (Postfix) with ESMTP id 726B5800009B;
	Wed,  7 Jan 2026 16:59:26 +0200 (EET)
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
Subject: [PATCH net 1/3] net: ethernet: ti: cpsw_ale: Remove obsolete ALE_VERSION_MAJOR/MINOR
Date: Wed,  7 Jan 2026 15:58:17 +0100
Message-ID: <20260107145846.3144585-2-stefan.wiehler@nokia.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000049:EE_|FRWPR07MB10698:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9b97f43e-e7b1-49b9-7ae4-08de4dfd5a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pCyWEJjUw/a6rumqJin8YgCkgD+nn2m5z3KPKh+QzkbCPVaa5ptxnLkjWk+H?=
 =?us-ascii?Q?jfu4HDrFnXPsX2HiTK0jQN1mb6TO5pIVzPNzmIg57pnDdmZ+gqbclXNbVcTd?=
 =?us-ascii?Q?7Ihn/mIxl1LR/qSQByStheC/DBMdJemPevng+2wDew+OT79iGnhMIqUuZ6pB?=
 =?us-ascii?Q?cJRVy0KC+4TB3RPzGVc5iUkfvr7RjMnof/hhsKQaH3f7Mg2zxO/Nb/pg0RO1?=
 =?us-ascii?Q?cOeSF5VByoWBO6jImiZlhxg2GYBwcEWKCA3oGLPHNGwWEmkhnjSoagJxMiSQ?=
 =?us-ascii?Q?YkoEdQVeP3g0JiSv+GL3MECDaC5JmxMyJF3gkxfdFqYgD3wjBRRqC5MjV5PJ?=
 =?us-ascii?Q?A1n/oUm7DdfF6MdtSpf3jxNvwWFs9cRFxyA1DYLYhUhJnurDNe14kmeF7RXl?=
 =?us-ascii?Q?qQ6D+fN7jQKp1x4LZ3Ac17hi6WQvAXt3mhjI03fUJF543b2kxVG5M/9kuIav?=
 =?us-ascii?Q?UzCufHAOY2bQmmaWCLU6umyJwpVLCvHbNE11udQ4h+c+n/7ZCae2BGUwzJKR?=
 =?us-ascii?Q?668v1BSUc7nxb/e9+MzgOvnGfwWGblcmS3pPMwR/yMM/uvyn/s23pCTWbB5H?=
 =?us-ascii?Q?UOrQH3QsP9ZuqrptcVo0qO7ccl1adXZYSN8lfAUxA2Jg2TEHICYDhQTa8YCc?=
 =?us-ascii?Q?heoOovIb6npzaaj8gVp6qGf1zakXT2Hmkf/CE09YmTgkEwM7WjZ6LftZC2ql?=
 =?us-ascii?Q?acJijGbZtlvGlzWdsKhvu8Hkn9vk8925blmozGGA1VCQ6pLWNjBnnBlwMbQM?=
 =?us-ascii?Q?APVHRN5B2nKydwD/G8eidGdsJVZHhnbOUsXDlSDferd7/EQ7Nfe0GsMkDFrN?=
 =?us-ascii?Q?0Whz+qJ2UW52oOB35cR3QSrXnZ9rtdGnyYET6UkAamOlRgKSMgfvGlWjA30H?=
 =?us-ascii?Q?dtqKF7aWzZbB71w7//Nt5/Sn6yHZ0WmpZfX8jHixOkt/Wpbfi6HhdRnn4reP?=
 =?us-ascii?Q?onk6wSkFC/rNq63tUkOJlNhcIdRkbK5Znt2czc5CT1w69WoMoDn6l+Y3uQWl?=
 =?us-ascii?Q?3wRAfjpfqnnDSYQy7tAULrZFFcnGMSYXCX8PiDzbs5DSDdPbKdRnQO36v93W?=
 =?us-ascii?Q?ZC4iSDnMRtJhqrsqnnB93e5/qRU20DAnH/wPvqGU07bF24gap6ivDgM2xaAG?=
 =?us-ascii?Q?Vbu693JeQAX1XeGaqw87o9AJFFabe5UvrDgPXVuTTBoa0DRzKVwYefQGblt5?=
 =?us-ascii?Q?J2BLVkqfT8naVOaHO+3xb5An4cFie+B8TmQxG+Ym+HW9QV54vL7smr63f9Il?=
 =?us-ascii?Q?e0lNxyGzr5VpAPw0WotcZZ45lPjjlrGUsihm+6VKzmecMKGkQn1edm4WFWU8?=
 =?us-ascii?Q?9aPlw7CVzaFiAVLfSKvWb3NpzxRG45NRcoF6GrhCIyroPb6Qb45fFEcYXE8l?=
 =?us-ascii?Q?rvoOtBIi4GBZSC8GLffNaLRnMG/Hr9HNwUUgrDRSGS6TQyYDflCNjUFScqiX?=
 =?us-ascii?Q?ObY/rstxZ5KjmhqdnL1RIZeul6SK4P/FBTDk9xl2cH87bKo1uALwmbu+dZ3g?=
 =?us-ascii?Q?ingXXFmce9pen38up5KreG9fclKuy2ud/ospRGloEhGnlvbETwbK+YvWlXq7?=
 =?us-ascii?Q?gUOvUU2PjX6skQL42yM=3D?=
X-Forefront-Antispam-Report:
	CIP:131.228.2.30;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe01smtplvp01.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:59:27.2282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b97f43e-e7b1-49b9-7ae4-08de4dfd5a7a
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.30];Helo=[fihe01smtplvp01.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR07MB10698

These macros are no longer used following the transition to regmaps.

Fixes: bbfc7e2b9ebe ("net: ethernet: ti: cpsw_ale: use regfields for ALE registers")
Signed-off-by: Stefan Wiehler <stefan.wiehler@nokia.com>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index fbe35af615a6..e13df62448f1 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -23,8 +23,6 @@
 
 #define BITMASK(bits)		(BIT(bits) - 1)
 
-#define ALE_VERSION_MAJOR(rev, mask) (((rev) >> 8) & (mask))
-#define ALE_VERSION_MINOR(rev)	(rev & 0xff)
 #define ALE_VERSION_1R3		0x0103
 #define ALE_VERSION_1R4		0x0104
 
-- 
2.42.0


