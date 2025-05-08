Return-Path: <linux-omap+bounces-3684-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B58D3AB0405
	for <lists+linux-omap@lfdr.de>; Thu,  8 May 2025 21:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46585B235E8
	for <lists+linux-omap@lfdr.de>; Thu,  8 May 2025 19:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41BF28C5CC;
	Thu,  8 May 2025 19:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MhOripCI"
X-Original-To: linux-omap@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACC628C2CE;
	Thu,  8 May 2025 19:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746733737; cv=fail; b=MUU43aXmWHvwT33Tz/qs9KKIYfRJ2PpSlOH0Q63xWXeN8BdnGozQyq07FYKphd8wAFFUGE3ICvENBQwEXY3kLByAK2I86D1KS9goB/CfT07Fh+R1tG+SE+qbFOtgeyhb1VD/D3uAl5JcLOtJC0bqxqj0R/O3l5afj3ttMDd5VpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746733737; c=relaxed/simple;
	bh=cw19VX1A9LWU5sXP2ukgme05I8N+4Z/IueYFd9n6HlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K37mu0nf1KmWYtYTKsigAoesSbnfcnwr0YUh3UEAXck4uQ2yChNu0nhaMritNcHuBOr7wsfkYl+7a+mqX/4l+U4DM7upXaWkMS3j2lufSklm9rTM0+UdphAc8e5AF2zzcS4IZFOjUu0m3jwJcgnW/URIloxoQM0eiOvWKxct5JE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MhOripCI; arc=fail smtp.client-ip=40.107.22.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YR03NVVpRs/lHyulnlijmbZHIuTFvPBcbIXALjteomxevO7lPNslG9QO+THPVxU6rkNDMSYkV6cu0yJhne69N+WEjJzgh3/DTll7hpkgyCZAiHc30FvvkkEOurtcws5AdY6uWzq/zJQ250/2fPxmmSQyF43KK62dlw9xl3C4S9o89X9xXoqqhtl4hEH8tt8BA5fMHAy45FXvlMnfRbgVSXa/M/Ur23vQDGYKx52S8PPeZbbDgKlOFRNqaWzVxeS14iTOkCNXRnUNCoewBFt0vTxRaYz5MqxXUIYLti2MlXqvxGU62Fd0EplYNZZVK7f4dg4eIN3CbqHKMgrTeoh3/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uswb5IvXwS/R3Q3uP+Xx5CX4aMzrpODsiXq7E2+bOaU=;
 b=Vqd7UXuhwR8rMPiZnCTZO5ffhTWpwyjYfVgoEdbslqsyeQpiQe5TCKqFkuktVgi3PHY1tuv2eR35+NkmxxJuUbDJs1oK8QzXMiY6ZGjB6yaJxh1IvVhCV+x51sNKaHiO3jRmHQiwnaFLVIGhkVWrGeXyvp58t5KkmyvLGEQnGjhgmIi6F0kubzpHAESWWIVhBAx00rTNyWx5wnE7R+II5VotDyA1ySCbRylJnNJKJ6uGfWEHX7b4iB9MsrcZBs+zY//TVSQt7bVEKSThyoGcdEPHlCRJZtQB7xeOID+FZkqo38SixGLCXHbDtOdTmrS2luSUcBcoVvWznyu2SCc7BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uswb5IvXwS/R3Q3uP+Xx5CX4aMzrpODsiXq7E2+bOaU=;
 b=MhOripCI0XQE8UrWwsoLa90YrrbuFZ6eKai7mLte9FLsFY2Lgz6kloukI2Qnn8i27H0YKfyHRiBig2V/AZK8v+V6HmZktnjbgZypqSr5z+JwypPKlMyDyeHenn3N7z0IZBDBkgF8cM4UmCcPWI3kbD6bPkM7y95xSNqe+kRyol3kBJQIJpq/qOLvZaKFlm7hEnVUH/9nJS9P2We+Qb/FwuqL7rmcwYL7LO7wxDMT15eL4RLZ6hm+Boa02PgMtOVUUs5E1JBKdpmnkHWMvvglEwidexW82PlZWy5fy8YFXmLL4/E2YdohWG749qaDXj9qJ0NmTYpm4qMD0MhbuI+ynQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DB9PR04MB8395.eurprd04.prod.outlook.com (2603:10a6:10:247::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Thu, 8 May
 2025 19:48:44 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%4]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 19:48:44 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH net-next 3/3] net: cpsw: isolate cpsw_ndo_ioctl() to just the old driver
Date: Thu,  8 May 2025 22:48:25 +0300
Message-ID: <20250508194825.3058929-4-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508194825.3058929-1-vladimir.oltean@nxp.com>
References: <20250508194825.3058929-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0471.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::10) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DB9PR04MB8395:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf6446a-33e1-431c-5f6f-08dd8e695709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s5ty91peLUasjpfm8VzLkI974JZZ1FbZBvBAQi05vSQ1cMjX5HPFAq3QmoaE?=
 =?us-ascii?Q?TvvO6iHtHlZ8t1BkRobwRCFkFcxSvh21Q8C11PNSQ+AdVmuTraYA1ht9bIfL?=
 =?us-ascii?Q?83H2XrfhPktNgsrA/7b2sncVdLi6Y1PsrVPmI1HGP2Ncx0g1L+ImAq82GoPR?=
 =?us-ascii?Q?GlP30odhFJmwwrkN8KtR7SYndS2/BL2bRvcu+GOVHJy8nMqP2gTUvBwz2Bhn?=
 =?us-ascii?Q?rlBCgMFKV0bJlrup7nPTq5qQ3rSMCIKo/S3uCTcinca4nQJgGTMQ/ASvIaRq?=
 =?us-ascii?Q?1qYqIA5aGTK+9hdHvjJGPiWsrt5fXjEnTHIdW0OLD9a1Gy2sBXoff4PCu8IV?=
 =?us-ascii?Q?WWTOSvNE/5X+aPHM3cy3Tqb0jBYvhB4uNoxWjBZcRdGM51QqPWLPMRuPANJr?=
 =?us-ascii?Q?+VX6frk1lzZ5P+uEtf9HsZATlDYpW6KTEAA85jFfe3qY5nreGvfvdZq16vyZ?=
 =?us-ascii?Q?ggj9zs+/XdI16j9zEvKEZHKKhkVNaq9FRbz5H4RHmNWLAQ7olBN8e4Buq8B9?=
 =?us-ascii?Q?vLwxaVEcqQhqIVU44C6AlcUNeln/7CHIcgI6JV8gWyx/cU6WPCRL3zzAGUs+?=
 =?us-ascii?Q?/bvmFsMwHcucQH/YXdap1v5A9yg18JiBjAcU6L30qPRvEWX/qhp0NTIuWxRN?=
 =?us-ascii?Q?3MAdeMr4TzToI8ZA4n6Q83q7DiGJByXRCJRdJT1Gzfrp3BnlqVUMCvZd4Tv8?=
 =?us-ascii?Q?ZD/6VBYxHYbsd5alZU98xEEPTd6R15VOTC2jgV9ElqqEHIjPcq7sAMotSLJy?=
 =?us-ascii?Q?s8Ldn/hjiNxXAYVeWcFxQW2apBAyWsts3Y7880j27KyJp4AFmT+4KILBf2PU?=
 =?us-ascii?Q?teLsC5NM+bZmOUj+GWSiR1YwcxTF3VrO1ZrDwxczpL2KWWeZRZ3OIqAATGvd?=
 =?us-ascii?Q?+6J6roM1iTWVDAHbPIHQuQag4NUwwGCC2uhZl+5wRu6il/S1kRtTVxqr8AkJ?=
 =?us-ascii?Q?UJ5hzcPJ90x7bn1UTOSfBVNinwuv5AkjTEtmZTnkwJwjmpdAOFAiLZTO091B?=
 =?us-ascii?Q?u51/ooQsh118FK3ItWbl4szXCd2m7+x2BFOhSeD5RK8GJZAytFxCI+lEx885?=
 =?us-ascii?Q?VUGKwSygvLJ5QYGCJcCfa2PNMhP4lYNGUhx4B+DpyPx1k8YCb3CQQinZUfxE?=
 =?us-ascii?Q?Znim0Qu7LPcbZnlytw99bI6OqhxbHthjXHu2cEEmhK2SW0ZTvEm3y8om9vpF?=
 =?us-ascii?Q?5+aIauHxLb9V2pKXzBXmzS6Ls9f5xZb2wvbv9EBonCi48q9dnR46hRJUkV4T?=
 =?us-ascii?Q?xcTXBEMkeN+Y+928hEKO9eonLRo3goKHkd8oGK74blQ3oL37UcP1s5c/ZOG8?=
 =?us-ascii?Q?EWPeLYu5ZRODeca0050MZ87UM7+2ClKIKXh9z/eOQYXpnvUd1mtm/MSfUFG5?=
 =?us-ascii?Q?gMoBlUYxShEzIGlGEw8WzxKsTxNIEg9oTyDNDd2eCe/2hxCJv38SFbouLLZt?=
 =?us-ascii?Q?ctL/xXmU6IxKiNNMdMHbAlLQnVC3/YKkRCIILd+EwbrgF9Or+GWbFg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JG+veOtZrLU3dt3legJqc2f4bTVnlaWuODy/2lK/Wg9uOdkqzlQm02R6rF/j?=
 =?us-ascii?Q?pWScAdRaocbFoIt+et5xu6umQnyXkN0p9kvB5A+LnoePR9hAt917ue70Ychl?=
 =?us-ascii?Q?R1+CoQd4o/HBvsjPBnQJqR/7KpLbyI7Hewvh2s3HOCAeaGLWLjs56ahv/uzX?=
 =?us-ascii?Q?yW382VA5aEMHLOAMD4UTryUY/65fRedcS2UOr7LnMCVwBdBZ3m15zGv/rOy/?=
 =?us-ascii?Q?N6vbQUli3rKKRHAfJBToZQ1yPGYMLj1XQ8xk901OkWFwQSio0R0KplTAUnu6?=
 =?us-ascii?Q?HPe7bSVJce2zpzwElTiHYy/pPduiqc8Vc3Zd2LumjmGn5q5itlmvMhP4igY5?=
 =?us-ascii?Q?UKv0hAb2dr7TAUd8pgpNPcHpS7m9k1RwbR4oYktZLbHCgrS4DQBojkw+r2yr?=
 =?us-ascii?Q?DMlGWt8yfuBLz60RKv9DhbW1JpZlZkpGZSz9gMIEIj49d5HsrsH3e3n4VI4H?=
 =?us-ascii?Q?SCIZXoqXNGZD9BWEHmH+0v3G1N7+U9A+S4WPWYiYUC12gBEt8fPvStlsa/3g?=
 =?us-ascii?Q?ajOq+aRrHdpu+jrEifaupBDPw5c4NfNC1FAGT/5ulafhlAW1GvYDijPvhYae?=
 =?us-ascii?Q?fAFSQ3TB14ugz48sGFwhaL70HzRkwhEdZ73vFox0loXHL4mbqlRUeoAkVFSl?=
 =?us-ascii?Q?eaWjSpcLUfezcLchS7Hqr/1TLwMRXueHCvkvqbyv8xdl26d4mVtt9SOshl7W?=
 =?us-ascii?Q?RQB1SN6epSJvb7+SQk6zFUF/2dm/+6JP9cZN84CkGJI5Jl8nOZqZ1PaFxbbv?=
 =?us-ascii?Q?mavkazG86sTp5tnGrNnH7PBrFKCdERwZhcO0D3tXTwXJB3NUDjg/vBOa1p5R?=
 =?us-ascii?Q?+n2IiC91gMsOlHDtMcEfsu5FETPFEYkNZm1Hcr3Z4Yf/xsx9QVtGvOisZzu2?=
 =?us-ascii?Q?nvQVFSCzSLzC+z6YIujCtoEUKYuaxfOq8SJs8hcSBPMULGp/M/GCACsvc5CY?=
 =?us-ascii?Q?9Vf3Ry/Iz1ddKgG9OA58UMsINWem1FkMoCOieRcuapa+PS+tVdSd6h4hev2S?=
 =?us-ascii?Q?ikjUKnW+76QXRUt8MSp9nkarzToeknw3Rz/i6NOHKftbdA2oJsmh9vzktpsU?=
 =?us-ascii?Q?CAc273PhC8nltaeiT7GacJ9eHSj2t6BTipVXsYVG6Pz+mLbSt6STzeraU0UQ?=
 =?us-ascii?Q?fiDEv527esmT74aLDRaPxOa5tqyXsMIEd6Z0466QnWEYCSwCo72o9USS6vnR?=
 =?us-ascii?Q?HZRIYrstSeIh/r6BLgAm7C4D29w/E9Y4kPF58cJpgyLV9rcsakBP/b7eFvTM?=
 =?us-ascii?Q?s83J+ewoK1dS8qSL3UGr1fFJzw/ddl6zrckylOzTyPjEIq88cpKrMsRAOX+e?=
 =?us-ascii?Q?yBtinl30n14cZHsriACW61nqqsRiIhOqGlr/rTk3uG57zImz8zTYMr98AYOI?=
 =?us-ascii?Q?+r8SZSTgy//QAuOMCNH7GI3vBZaP5++XV0hGpqM/4kB7TzqPGgOkXqe9zxjS?=
 =?us-ascii?Q?yPEWj6HvWl2qP4U3KV8vXEqJE4kCYruuO/4YPhWr6e8G244O8FeoRYGydFWK?=
 =?us-ascii?Q?R8HGfclPQctFGQMXCZnpqBkq58bvfsm9A612PRb6ue7YPKCUFf5iGoxhnj5s?=
 =?us-ascii?Q?/1CHLxF5TOKXBE79MzZi8EKE21pQmyano8Q45evFVnFe3oisTr+qTX+C4QvZ?=
 =?us-ascii?Q?zw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf6446a-33e1-431c-5f6f-08dd8e695709
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 19:48:44.0739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkEn3n+D3Dn0hjxUoOyqGkPpIVgQIDWv6UXio2nkw+fOStP7sCuYEXhy4TTnsr6nqx70itRS99Af/oA7a3nBAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8395

cpsw->slaves[slave_no].phy should be equal to netdev->phydev, because it
is assigned from phy_attach_direct(). The latter is indirectly called
from the two identically named cpsw_slave_open() functions, one in
cpsw.c and another in cpsw_new.c.

Thus, the driver should not need custom logic to find the PHY, the core
can find it, and phy_do_ioctl_running() achieves exactly that.

However, that is only the case for cpsw_new and for the cpsw driver in
dual EMAC mode. This is explained in more detail in the previous commit.
Thus, allow the simpler core logic to execute for cpsw_new, and move
cpsw_ndo_ioctl() to cpsw.c.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/ethernet/ti/cpsw.c      | 20 ++++++++++++++++++++
 drivers/net/ethernet/ti/cpsw_new.c  |  2 +-
 drivers/net/ethernet/ti/cpsw_priv.c | 17 -----------------
 drivers/net/ethernet/ti/cpsw_priv.h |  1 -
 4 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index b71352689768..b52136db3621 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1156,6 +1156,26 @@ static void cpsw_ndo_poll_controller(struct net_device *ndev)
 }
 #endif
 
+/* We need a custom implementation because in switch mode, dev->phydev may
+ * be different than the phy of the active_slave.
+ */
+static int cpsw_ndo_ioctl(struct net_device *dev, struct ifreq *req, int cmd)
+{
+	struct cpsw_priv *priv = netdev_priv(dev);
+	struct cpsw_common *cpsw = priv->cpsw;
+	int slave_no = cpsw_slave_index(cpsw, priv);
+	struct phy_device *phy;
+
+	if (!netif_running(dev))
+		return -EINVAL;
+
+	phy = cpsw->slaves[slave_no].phy;
+	if (phy)
+		return phy_mii_ioctl(phy, req, cmd);
+
+	return -EOPNOTSUPP;
+}
+
 static const struct net_device_ops cpsw_netdev_ops = {
 	.ndo_open		= cpsw_ndo_open,
 	.ndo_stop		= cpsw_ndo_stop,
diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti/cpsw_new.c
index f5b74d066f0e..8b9e2078c602 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -1132,7 +1132,7 @@ static const struct net_device_ops cpsw_netdev_ops = {
 	.ndo_stop		= cpsw_ndo_stop,
 	.ndo_start_xmit		= cpsw_ndo_start_xmit,
 	.ndo_set_mac_address	= cpsw_ndo_set_mac_address,
-	.ndo_eth_ioctl		= cpsw_ndo_ioctl,
+	.ndo_eth_ioctl		= phy_do_ioctl_running,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_tx_timeout		= cpsw_ndo_tx_timeout,
 	.ndo_set_rx_mode	= cpsw_ndo_set_rx_mode,
diff --git a/drivers/net/ethernet/ti/cpsw_priv.c b/drivers/net/ethernet/ti/cpsw_priv.c
index 87e40f2dca45..4a3cdb9a139e 100644
--- a/drivers/net/ethernet/ti/cpsw_priv.c
+++ b/drivers/net/ethernet/ti/cpsw_priv.c
@@ -711,23 +711,6 @@ int cpsw_hwtstamp_set(struct net_device *dev,
 }
 #endif /*CONFIG_TI_CPTS*/
 
-int cpsw_ndo_ioctl(struct net_device *dev, struct ifreq *req, int cmd)
-{
-	struct cpsw_priv *priv = netdev_priv(dev);
-	struct cpsw_common *cpsw = priv->cpsw;
-	int slave_no = cpsw_slave_index(cpsw, priv);
-	struct phy_device *phy;
-
-	if (!netif_running(dev))
-		return -EINVAL;
-
-	phy = cpsw->slaves[slave_no].phy;
-	if (phy)
-		return phy_mii_ioctl(phy, req, cmd);
-
-	return -EOPNOTSUPP;
-}
-
 int cpsw_ndo_set_tx_maxrate(struct net_device *ndev, int queue, u32 rate)
 {
 	struct cpsw_priv *priv = netdev_priv(ndev);
diff --git a/drivers/net/ethernet/ti/cpsw_priv.h b/drivers/net/ethernet/ti/cpsw_priv.h
index b23f98032669..91add8925e23 100644
--- a/drivers/net/ethernet/ti/cpsw_priv.h
+++ b/drivers/net/ethernet/ti/cpsw_priv.h
@@ -461,7 +461,6 @@ void soft_reset(const char *module, void __iomem *reg);
 void cpsw_set_slave_mac(struct cpsw_slave *slave, struct cpsw_priv *priv);
 void cpsw_ndo_tx_timeout(struct net_device *ndev, unsigned int txqueue);
 int cpsw_need_resplit(struct cpsw_common *cpsw);
-int cpsw_ndo_ioctl(struct net_device *dev, struct ifreq *req, int cmd);
 int cpsw_ndo_set_tx_maxrate(struct net_device *ndev, int queue, u32 rate);
 int cpsw_ndo_setup_tc(struct net_device *ndev, enum tc_setup_type type,
 		      void *type_data);
-- 
2.43.0


