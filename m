Return-Path: <linux-omap+bounces-5471-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E4DD1F86B
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jan 2026 15:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97E773042FCE
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jan 2026 14:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C957538A703;
	Wed, 14 Jan 2026 14:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="lv72PYOa"
X-Original-To: linux-omap@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012050.outbound.protection.outlook.com [52.101.66.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0C2D7DE1;
	Wed, 14 Jan 2026 14:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768401915; cv=fail; b=V3UO11PtYcEnP1uhodmpZVeCX4H6N2pcq9Q1DU6o24d/ByOqKLH4FUgDSTjsATtq1EFqZDoOJQ8uk5ffHin5LRlHZiOclfZ8Pm+w8KaqGG7lt1pIYcp/HrMfyFYMr2mu/WMOx+AoG0wnL6Y8byArlZWn0qvuhYz2u/z3zLvj47c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768401915; c=relaxed/simple;
	bh=rp8m7wsamJyawFgFfVoDFViFEJkUCOyHHbU43FwR9nc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ywy0mi0+X9IEAYCURsN53x75kxnq3VEESOh3WRwwHPuih5bJ3mDqYqFobmBH0sA7UOKZNKLKiaWs3VTl5p/pTPzKosGPbb0zMQJ35/NQqZWx7GIIOekgnnMLwJ2anlCKv5q8Gy/iQTq6BBF1V9GC/O9kIVlLCP/ydRtCUDBvpXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=lv72PYOa; arc=fail smtp.client-ip=52.101.66.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=no2oHuOFVrrGXAJKXwROAOupWUvKS10Qc4krnse+AiJpXxBhQp/6IB4mh/ptuVJCoVTdp6tY5vk8GZ56zVO1whN1ISzdZCQ3TUob8VJgl60Yj46PaycH+iXHwVg1gEO+IAlZ5fD4HEMYYOBSMCoX83/QE2RoJ0/RvIWisGS63b/vqGfYih+FcCALqMnRe4oeX6oM3V8DFH/2FBccvH/cZyYTLZS7UrFn1KQxl843NNfJIQnFwA2ocUWS/Pr7jP/jiYedBXugk5tmWhTabY7XBBnMXSrLBw0LAadtMFAwQ13+C78MC9kC78PgqZZ+K6QAXE2yLNjybAwuTDSYPerNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoXUjwP6gkQ3GMjOsro9z7pCZqUaOFIbr301O7oUY90=;
 b=NbMGqOtS9ZbZQwzJvvGjocnpKA2vX6rGvKU4FmRO7qBEdIqDk7zBWBweRlv0DjhHKVITtzPC9tZ9luRYFti/EDqotdOf6t4hbb3zd4+GmgPee8+G6sR96IkvhzUvJEJyz+X1rt+ivjdGxqdL8ncqZ9Pm9Hhh3q8fy4NDAvlBNcS/d739xnEGzNTB8CfL1qEycqIkElIirycujR3ofR9fODJ0CknLEjj3sx4oQZD4oITfbPv0O53E5GFSLSuHFNHcl8xcaNlMmnjvmJW/ZV7LOJ1uyyoC/R8kyiMwKMTEHTlD8mSAeHFKduBzNvclcIitx1smPa1u4tqaEk3oNqpJuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.6.100) smtp.rcpttodomain=davemloft.net smtp.mailfrom=nokia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoXUjwP6gkQ3GMjOsro9z7pCZqUaOFIbr301O7oUY90=;
 b=lv72PYOaPVfXjoeAWUy8gYFFFhhHFUDaCsTnHEdXrgFkrQguO2lHGmEnJrDQxKIlqPd1C9UGxJUQ39KYUKaIg1Z9ow95+BW/NJv34OSOgmQnH/+ehoQ07PfLXn54ahjNjdxvwT0HbWwPObY6/IZ0J4BC5YlxfJjyN7vDQ4qJ8Yxh23QzQicOh6vqqLIYg5sBzydJ04wkZqjRlC1aHkn/UtkKihs91muZrGBCPRq7BZ/V8jxH/CoVSzWJteJFnylBL1/kmyzqbkd1fibr0dmkIQqj5xxjAmgRVZmLjoU8gYWC//XH9rG3maKgYsBcUd1YS/Ddm99McxovW05Q9KQBaw==
Received: from AS4P195CA0047.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::24)
 by PA4PR07MB7517.eurprd07.prod.outlook.com (2603:10a6:102:c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 14:45:10 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::c3) by AS4P195CA0047.outlook.office365.com
 (2603:10a6:20b:65a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 14:45:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.6.100)
 smtp.mailfrom=nokia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.6.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.6.100; helo=fr711usmtp2.zeu.alcatel-lucent.com; pr=C
Received: from fr711usmtp2.zeu.alcatel-lucent.com (131.228.6.100) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Wed, 14 Jan 2026 14:45:09 +0000
Received: from uleclfsdev02.linsee.dyn.nesc.nokia.net.net (uleclfsdev02.linsee.dyn.nesc.nokia.net [10.47.240.2])
	by fr711usmtp2.zeu.alcatel-lucent.com (Postfix) with ESMTP id BFB81680045;
	Wed, 14 Jan 2026 16:45:08 +0200 (EET)
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
Subject: [PATCH net-next] net: ethernet: ti: cpsw_ale: Remove obsolete macros
Date: Wed, 14 Jan 2026 15:44:25 +0100
Message-ID: <20260114144425.3973272-1-stefan.wiehler@nokia.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B2:EE_|PA4PR07MB7517:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cfe1f2d5-92b8-4eb2-cdec-08de537b8433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/KOq5ShvaydVEYdxBGzCN/2KqIQ2uFx5/2w6ElF5VeF2qlxDhDx4QuNhQW6u?=
 =?us-ascii?Q?DPNHIgZyubvnvOq5gB2xTaTNit80Xkdzx/B71aeMyO5Pf2+YB16BHDht34/I?=
 =?us-ascii?Q?63y1JIFsbRhAcbOE4Z23h549c6R7g4R2RNH+4bgnlCCRUi6ZVKURCdBOtxd8?=
 =?us-ascii?Q?To4rNmp3kjuzZ0Wp436wF9nLRMdtKnRkrrEsskb8mb61P3uusKCXyjn4xKNH?=
 =?us-ascii?Q?4WprM0cZQj9eCnSVbYcnOhncUphLWY2ZXMchv/zlAaxWTKxW+pMGIEMzdmGW?=
 =?us-ascii?Q?IcOcGusW7yta4iF9bHR8CLxmgIN/D/JdYV9/eRbPH/5STKanm7wLTnTF8Tet?=
 =?us-ascii?Q?fO/kqj5h+cgyU+S4ZZi57hNAbh/ciaWTwtDA/M9lTSi6XsGoBsFpK9oQ5Dfs?=
 =?us-ascii?Q?PBXYAN1wOJEMiUL8tqr/TGTbrXPjq34amHyI0D0zMoRDeyZkGNatD42pK+P5?=
 =?us-ascii?Q?L02RScS9DjL/gOWr8bDnZjGiqMkIK72GzxVau9saEd8C4vtKifmtF6isqD0M?=
 =?us-ascii?Q?rOn7zLsYs5iBbkVohvrIEcO5VbBCLx9xjpLbFxM8l38oikQl8KF4KnhSCkGR?=
 =?us-ascii?Q?VVLFrQULzgRpF8JxUBq8daPBdiFBSkEdWhnFM8bCfEGTxZdO8jwAsKpCDsU0?=
 =?us-ascii?Q?UzR4MN2eC90hVXQKa7lIXdaCh0lDoAWjOKL+L7MXsj8Hu8tESU1/8xb1suaf?=
 =?us-ascii?Q?V7AKKT1xG0zdUiOuBJ+LVzC1Prk1hTXajHFyZ/eNXVRKP+z+mlKlacZAZFMD?=
 =?us-ascii?Q?q/kb+QpwhVBAfFC2WbqYc3U+8rxa9CPYL1TTXBJNBHl/kZQqZ/nTDm8iGlwE?=
 =?us-ascii?Q?KiyJ7qOJo83+ulVadxTJbhUnGrPeQ3pBay+86YOTLLcKbmhU55h1pBthSPHB?=
 =?us-ascii?Q?jkHEp3aM/Nd+8k3pTP0KtjvNbos+LUXlfKTFCaYZwQwej4ZV/jalaUbTm5TN?=
 =?us-ascii?Q?Vf6+A1HcpuvZ11ae7S3Bvrh2hFtHsUSv+GqLtmWoHBtg4ez2ES/Ei9xageoE?=
 =?us-ascii?Q?G4paST4DqsE269iAEeheOfx2Jy2FEOdtmmJOlOWW4ep6SdkI6laZY37OGO3q?=
 =?us-ascii?Q?ZQnB+vQzpq2ZZ5wVkb3qZsxCh0+XwRcDkvnWdDJyRofAlKAaf2IRC3Hq3CYc?=
 =?us-ascii?Q?gILnBcyeinyptTOawcyx/VKAn0VAN3M5vaJR6roQbHHkFfZsPLKW201/V8+I?=
 =?us-ascii?Q?PXm6xxdy1X1Ctr2R5hIqg0/6J1WoWe5fUtNVS9HgTzYa82ADcH5CV0gkKOwU?=
 =?us-ascii?Q?WxtmnNGIaNVV9U+pwVjx+DWJtAptLCDZ1KmQZ7AGXlDtDRUncLWDrxNe9urJ?=
 =?us-ascii?Q?b5MEDKbsVdDhbcQZud6b5/+EVkjdaWKRyxm9r5/ZfwDphNOMWYNqU0+PBrD/?=
 =?us-ascii?Q?fNMqcOAV1ZUbRBKFX1f0oeAjtUrZCgDYYTMu273CE4apxZHKqaskvtGOkMWU?=
 =?us-ascii?Q?2r3yBZVrWlLFBN57N4S/ZOuFAjG+uBGuxE1fBv9c0K8oY+8+1EpkJE/wIs/G?=
 =?us-ascii?Q?JDFWEFPOziuBkbXmBWxPlymwrRb9YRtLE2jojO97fP6byIyyc6CmUGAJ5lDg?=
 =?us-ascii?Q?MypyFiq0Xct3x4F9ginPlG/NvTKcII+D3p0ySSJWwfkJqkMGIbSrtk6MinPC?=
 =?us-ascii?Q?rDmUS8m/3N0OZ98URHrtLlHM/aSYpCkXDN4mxEcPgpOTl19fq5cwLp/snWX/?=
 =?us-ascii?Q?/O5+Dw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:131.228.6.100;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr711usmtp2.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 14:45:09.6309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe1f2d5-92b8-4eb2-cdec-08de537b8433
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.100];Helo=[fr711usmtp2.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7517

- ALE_VERSION_MAJOR/MINOR are no longer used following the transition to
  regmaps in commit bbfc7e2b9ebe ("net: ethernet: ti: cpsw_ale: use
  regfields for ALE registers")
- ALE_VERSION_IR3 is unused since entry mask bits are no longer
  hardcoded with commit b5d31f294027 ("net: ethernet: ti: ale: optimize
  ale entry mask bits configuartion")
- ALE_VERSION_IR4 has never been used since its introduction in commit
  ca47130a744b ("net: netcp: ale: update to support unknown vlan
  controls for NU switch")

Signed-off-by: Stefan Wiehler <stefan.wiehler@nokia.com>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index fbe35af615a6..bb969dd435b4 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -23,11 +23,6 @@
 
 #define BITMASK(bits)		(BIT(bits) - 1)
 
-#define ALE_VERSION_MAJOR(rev, mask) (((rev) >> 8) & (mask))
-#define ALE_VERSION_MINOR(rev)	(rev & 0xff)
-#define ALE_VERSION_1R3		0x0103
-#define ALE_VERSION_1R4		0x0104
-
 /* ALE Registers */
 #define ALE_IDVER		0x00
 #define ALE_STATUS		0x04
-- 
2.42.0


