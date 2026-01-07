Return-Path: <linux-omap+bounces-5386-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FADCFE766
	for <lists+linux-omap@lfdr.de>; Wed, 07 Jan 2026 16:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6E373086248
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jan 2026 14:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BDAB35CBC0;
	Wed,  7 Jan 2026 14:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="SJME2cUK"
X-Original-To: linux-omap@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013063.outbound.protection.outlook.com [52.101.72.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C457934B69B;
	Wed,  7 Jan 2026 14:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767797979; cv=fail; b=n8W7jMApLe4qIHyV5VOnNGVdHwf+di003/gmI5Nxt/2iL2DXSHGb4wQpNJLCtg35LrEMjy67uJpquEN6XuZasOlflQ8F82YJOD6ZySOxYGbXyF2y2gR/UJWt3kjf1NSpL3sp2c9mJbaFuLt/YGVkPkOXvJWr7BcFKmF3a5I+gO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767797979; c=relaxed/simple;
	bh=alS1/0hjqp6LxTpH/QEB5UyDrlF/27MsCyoybHnQNAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gziXGcDIBzSJMFg0it7/3tisUIi6tDnfKlVrJ9av3EEHowtYJS0yMcZ78YYSlzu5tYLjDRDXdkaRox0OA5R8D4a8RZPbFppjVGoCJXYPnVOO7s3t/15WnQPzYMex5imlCQ89Y2Mc0/7fA8HR8/CedYLBB2a0giGAinGok6Ok08k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=SJME2cUK; arc=fail smtp.client-ip=52.101.72.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZF8Urh1gKLuKO9DqubU/cJmpieD0psRYPPJg1z5IYXvuXqcQYpNeOY8DmuUd8/jl8A0NbLJHlRNS8WPk/KbSjrQ7kIsvK+vfQ8dJ8C6ycnnBe8Kzh+tlGHx4+YTCQ9+VhdXYAgjR7QSAECQpQwAnGzcWXPRXWhqvYDJp8q2F1wwzc/T3EDJSWxmTIc4gFXuKOvWj9jMOVLHb6RTMFlqLzR4Jrr0oXr3H+DFdBu+73uv8uvIXH3So9gJs3z+6++GZm0lcxwQXUhfcQ3vMJBL8ds+dMIu5pArVj333amqcQj+SYbVpA7lyTUInC9R4e7ACRRHQz8RdQ39U6/Aq+K8yxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTcBCZNL23l+jM8tngrYTeGYe5XimJEMlEmIRary7tY=;
 b=Mgpputn6hOi+4xGcieFbTrLwQe/96eNiyQRzQEJndIAHmghYSovB6JFU2OjGOO3HIspWuZCnQ51hjZzbIJgrllSCTv/4th6KxH0xqvDQyyGfRl/yiTlmqKCo2yZR1raIkUH3xUfv38nxINElx772F0DCgpCrSMp2WY1cdPd/otc2qMsPigEedp8AiSmhyFPyYjfGwKi0h3D+FOAywpkvDeb1fkEabdNc55DJEPoMd0h/DxSJgrrVEU8zNLZXwVisedXNQCpmayGZXYRkHDTIdOnF1OCoAlwiPDNLkyrJech+J0gd1O8r4tkeLq9EvdMmY0Jp0vIPY/leM5QRu6//5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.30) smtp.rcpttodomain=davemloft.net smtp.mailfrom=nokia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTcBCZNL23l+jM8tngrYTeGYe5XimJEMlEmIRary7tY=;
 b=SJME2cUKNL7b9lmlfpv2VSnbu+QlavEA9pySKmKKVVjtUoDgQsIU5GJA0fxun0a5PFT+HioeVLKVBUgCMDXlmcxQiuVim171SuiaK3XT6RdjGgRBSXc39dNAkMBdcepyKEi+Q3FSjkofHU/5x45l+9UdS7WePFP/CwL730zyZBMBvJ9HKYgypk5jaOV2gTbZVxf22C7+SeiTibMEb/0xhfWRlOFXYwnRiA6u2J48nIBSrh3t3Cnhkj4MbQJ3p4B+u2I+1qO2/SO/RZIU8mzeia7QouOaIJ3d2hEXCXWdMvghCfxTpsq1seSjmKzq8Vy+hfbdvA0vb9ezvtHBgA//9w==
Received: from AM6P193CA0082.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::23)
 by VI2PR07MB10154.eurprd07.prod.outlook.com (2603:10a6:800:27b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Wed, 7 Jan
 2026 14:59:33 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:209:88:cafe::c4) by AM6P193CA0082.outlook.office365.com
 (2603:10a6:209:88::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 14:59:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.30)
 smtp.mailfrom=nokia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.30; helo=fihe01smtplvp01.emea.nsn-net.net; pr=C
Received: from fihe01smtplvp01.emea.nsn-net.net (131.228.2.30) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Wed, 7 Jan 2026 14:59:32 +0000
Received: from uleclfsdev02.linsee.dyn.nesc.nokia.net.net (uleclfsdev02.linsee.dyn.nesc.nokia.net [10.47.240.2])
	by fihe01smtplvp01.emea.nsn-net.net (Postfix) with ESMTP id B2EA3800009F;
	Wed,  7 Jan 2026 16:59:31 +0200 (EET)
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
Subject: [PATCH net 3/3] net: ethernet: ti: cpsw_ale: Remove obsolete ALE_VERSION_IR4
Date: Wed,  7 Jan 2026 15:58:19 +0100
Message-ID: <20260107145846.3144585-4-stefan.wiehler@nokia.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|VI2PR07MB10154:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d159b907-6a4c-43dc-9310-08de4dfd5da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KyFEPdqbOrRuGqj7+iO+LaWLjNmsjLyIIJJekJsw9lq0kn1wMCqVH5WjTJ9j?=
 =?us-ascii?Q?TB7IMALK/mUqKNuncb/RXCvhoAQSAilMOf18jj9hDoBHwYDBvqDWxS/Hm7nX?=
 =?us-ascii?Q?Exbw8b7DvSTfI8J//ZukcnIf9IApT1NCegb39rUTbltmtfuuq2mR6S6E0fDF?=
 =?us-ascii?Q?FfIT27Tvk6Q9ck95AHyp3bwVV4IXDYAZ2z9YVusttAkDcD09v92DJKzwwc+Z?=
 =?us-ascii?Q?hwQ0d8NENK1/An3jo0enb68gThOpqaTu4Om+T3/3+zNh9Pkm+kmLK0urooRv?=
 =?us-ascii?Q?Q+5yBJrf8MJ4lKjoKjucl6jVTJ29rmbDK0dPhsFcXg7ktQrPwfQW1X/dzEoY?=
 =?us-ascii?Q?jYo8idFzWVl+SmEOvZyYlYbWj/UuJ1FLLiYH3HBchG/o4ZwUw9Cue1iH8789?=
 =?us-ascii?Q?zWRpMlwuZxDytZXzBOGflnYGFkU2b5EalGYHdGLkGM9+G6pqTsSu9Rg8CwkH?=
 =?us-ascii?Q?EK8T9WwiWZVfzv/rruydiuh0J5FJqPmLVD+VvHj7C9i44wHPIBDaIInbeoM0?=
 =?us-ascii?Q?8CWs7atStRDl8fv2mgEPj12Of+mf+7yEuIqyBoZdyPfE4hjJYGCUO2ogAPOV?=
 =?us-ascii?Q?NALmkcjYsi0Eq4SHKAjmNgYw+u6SWU347X6bT2dXyp/FGv1DFkrH6XW7CQVd?=
 =?us-ascii?Q?1QqHmISuj+ZfjYW2lLZBNNig51df7nVScVuMNPBKRLsTWMogX++OIl/9D3M3?=
 =?us-ascii?Q?ICcHlpYIM9Q8LAqm0RM8Gh5SGnDJnuuYqDRIrZ5Hgx7MmKXKuLJT81PIAt4h?=
 =?us-ascii?Q?9oulMPjrMOQfUqK+cZK+stZ+00QhjkJD7GQSYo0wOMilOiF0s3M+eeKly38Z?=
 =?us-ascii?Q?Zg7KhFzDr4uFb7ix4Ooo7qHERbjr6oqEHLm3TY+ZyrL/qOvLxxPJ817v02Ns?=
 =?us-ascii?Q?b/VqdxMYpR7JNl3TmMgVL+4McL2vh+RBpyPsTJISC5gAVk0OEaTfh/GcjR6h?=
 =?us-ascii?Q?ktY8vbf2jaGIs7bXt8LqJJ+zshezMpxej1OaRHKw4G4z5rh9T235C3xxQERh?=
 =?us-ascii?Q?g8qnV03uR8gaUY0ocu4iAwfv5pGKzRUaptB+o1tQXOfywcNC1cQwIHkJUHEX?=
 =?us-ascii?Q?ogL+me2OKRnfU4eW+ujR8KOhCjJY1ZvHvXxMDG3Izn0rCVyIjTGJlNd5yTmI?=
 =?us-ascii?Q?xb2xC2WzYCDroeIZVF0iQiDDROd78Fkg5+bx/9cZy6LjLKeERgcJ0PClw270?=
 =?us-ascii?Q?6HVfkxOZBn/cBVqYhhxb2tKK5dv42S0xYUYUpd5aT97H7TD20Qtf1DIKNLja?=
 =?us-ascii?Q?NyjeML2epDAZfxknoO1hbFFSA2Hg8iIh7k83CEB7jysp0xyu2JCik5FLaM2k?=
 =?us-ascii?Q?ytoZ9s9FVFncVKequ3I7QGR4TwDRP+Rxzgk6uzRKP3iis8yXqwJ4ptMzDQm0?=
 =?us-ascii?Q?g7Z9YxQyIvwlTnHIdtGk154SuiXXSiELW2+twNoZSwpMbqGWssN63CW0q3dn?=
 =?us-ascii?Q?XMVtasWsGSdnuBjJ5CIq69MyTlTL3SbORoc5VU90eOnR+Az3tfjCU1FsQeYi?=
 =?us-ascii?Q?6ZwcFy9NlS+GD24lr5tIp2//B3F5FBZP0WbTrT8f9SBZ805Wl+dI8Of/eTM4?=
 =?us-ascii?Q?IiLx4GsfsmAeraqYnz4=3D?=
X-Forefront-Antispam-Report:
	CIP:131.228.2.30;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe01smtplvp01.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:59:32.5375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d159b907-6a4c-43dc-9310-08de4dfd5da4
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.30];Helo=[fihe01smtplvp01.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR07MB10154

This macro has never been used in the first place.

Fixes: ca47130a744b ("net: netcp: ale: update to support unknown vlan controls for NU switch")
Signed-off-by: Stefan Wiehler <stefan.wiehler@nokia.com>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index aac4db3f7656..bb969dd435b4 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -23,8 +23,6 @@
 
 #define BITMASK(bits)		(BIT(bits) - 1)
 
-#define ALE_VERSION_1R4		0x0104
-
 /* ALE Registers */
 #define ALE_IDVER		0x00
 #define ALE_STATUS		0x04
-- 
2.42.0


