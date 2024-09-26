Return-Path: <linux-omap+bounces-2258-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43382986A21
	for <lists+linux-omap@lfdr.de>; Thu, 26 Sep 2024 02:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 631F81C246A5
	for <lists+linux-omap@lfdr.de>; Thu, 26 Sep 2024 00:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E3315B10E;
	Thu, 26 Sep 2024 00:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PRlzijjp"
X-Original-To: linux-omap@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010069.outbound.protection.outlook.com [52.101.228.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F546F510;
	Thu, 26 Sep 2024 00:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727308854; cv=fail; b=LTCwCrO5luPtdKvOB/2FCHlPSh0APsEYSCk76KrWynoRzU8kEeaJ/ZBjhSjBzrzRoPdbKemCmczomg+qmdyBj2uiqEGxtIFSna5Ri48H7tyvQoFuQT1kZDEKOhlyk0oEj4EMPb5wCdKGyXsKPu5Gd3RXzqTTRRRg9cpq7eDW9DY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727308854; c=relaxed/simple;
	bh=3avDV9IBpt7NeNj+xyVBG7meX+2U6B8EHCuw439A6pE=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sTjz5gz+MU8ar4lyyuPplhsKOBdBX8MZQDNYckTbS5YWQi7PrJxzka+2SB/OuTrmbB0A6NP7aQWZYh6fk08DyVW1pOVsPpe8VaYiX13I0kcAgqGBrwtyEfvqYhsSHWnRTw18EScKAloN5vP7udfYfUUuIbxYfiwPc4itm9L/8mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PRlzijjp; arc=fail smtp.client-ip=52.101.228.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAJSUYIfmhIfjNgP1xaFjUng7WY4Ng4t6FO85ncHMHQ0krvFOkaczp1aW5H9n58XW+HZ7NNXWHCP5w6fFckQ5I469y3cBs2ibGYBGKVGoJD5ioP6H+eAGeMsMB3c80rF+aPJdbKWgZFpaRz34YX92/paKZ+zUkLG9Ji91RsXmnoQjXvWnoqN9IFnwY/L8INtDB4GwHvN8FtlNMRsnVZMsD1QdciSTekjh52ZHKoS4o+XiroTooXMBHsOSnAioJINT/1j9Zefms2sMGkILpZO4a0oghVBOOFpWh9yanhsoXrP4jV6hdyHpVHCHO/B3AleMfhcqQfk9qGiwWGfsNupmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UeslM4FQH6N1O2L6SqbvVyNONUE0o4X2TQYeq8tCfA=;
 b=CakL4hMJuKqjel33KfEcSE9Z6/IwVNnhHvA0umaLDXsbmrtOZHfnhRgWhO8A0KBsM4b9M7S5ikrLAHNLQ661fTE4XcLqYjlWjb6a68Wq2w9J6rWThCtxGYR2leBGwkcoXXRVJaplGOGUiGmem1xYlcgJK5/tJy25BsjF4gSKFzUhmo2ig0gUjjPQKWvtBWsmUmnSgXtTyejTzehcFks0w8PDnkxU31v6VFtj+9f3PoWQ6A7eqZI9j74/oEugwc8fwemQZaQ7KU6OZHTeqC/RjeMIMthZWEz26hP6utSSSoh2/XxxmO+maBI7xB6puMDHc1V8uVY/y3gm563yWhmc5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UeslM4FQH6N1O2L6SqbvVyNONUE0o4X2TQYeq8tCfA=;
 b=PRlzijjptb1esJ/NgsbnDtsJYwlbIhssOuGM7d56iUAlAZe6rwrk5qVoyzMqed9MJ1j61IaZJf0sgmcWM6HlytFGQFOa4MIWnYQsAMjqkLYSHEoQ2dUxmQAoVoOCckbfKQgpyatOBK/OPZ0p57q4pzx2B6yMy3cPMCtL8bP14i8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB7353.jpnprd01.prod.outlook.com
 (2603:1096:400:c6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Thu, 26 Sep
 2024 00:00:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Thu, 26 Sep 2024
 00:00:50 +0000
Message-ID: <87wmiz8ery.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 7/9] gpu: drm: omapdrm: use new of_graph functions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>
In-Reply-To: <877caz9tdw.wl-kuninori.morimoto.gx@renesas.com>
References: <877caz9tdw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Sep 2024 00:00:49 +0000
X-ClientProxiedBy: TYCP286CA0168.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d40018-6afd-46b3-c967-08dcddbe47cf
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?HYFTxsEoLKr9LV1wd5ypHKkJFQdWFiADguWj/ibDr+eG5ncrQbExrhxZYSbJ?=
 =?us-ascii?Q?nwgHCJcUKvlEiWtIiHCKwT82I9ntxGhFmqSEUkp14FrKbFTkANpWPROlxa7t?=
 =?us-ascii?Q?YuoAV0QT/+4AxLRk/24Yn+EXtIAxvUm7wDjxv7Ib14jVyL9W6qAuNOpZroR4?=
 =?us-ascii?Q?Zgy1WtN3H563LDjhnl78/a/MKsKZymlxM/v/B1Rdu3yssW6u/ddWvRSfUE+v?=
 =?us-ascii?Q?dks9VHVkYCpaq+CeLhOk/xwBiJPcsdMeqmZngxSGHqTeniadtDC81QoeHw6Z?=
 =?us-ascii?Q?1IRS99aMPvhrm/j+dn5VntN+reSC2mn4eEd0WdLNHoGXV+Dx58R+jOOI/uSY?=
 =?us-ascii?Q?bxK+gCmsN9Q+BviLptp6LE1t/bjbVVdUHAa6rfL0QxW4hDabMvAnU2lMRSZd?=
 =?us-ascii?Q?99BjGIOS0tg9bSD2wDUy7et9wzRKr+48a6YaighPH64vo+q6S3GsbKE8x44Z?=
 =?us-ascii?Q?KHpoLFVXwHxRCkLSK41afOJC3PJmfq+PX2AcQLHuDHxNiOffegH7RYzOTDEz?=
 =?us-ascii?Q?9GfxMtbElI7UPY2q59v2+f1hv7m1Itoe1KCwKmYHyytkYstYxMcOW0+2fwiB?=
 =?us-ascii?Q?hinzomep7AsyqqxrmqOFmsfQeiFUb+JLLfWwwDjvcZYe1IlwAd55wT/dehBj?=
 =?us-ascii?Q?AZnVnds8D3i4hx2avimUFium43PuXNXAi6KjQoFzYjbBgszhYBXm14wUtKNj?=
 =?us-ascii?Q?mb7C7OTBiucy4lz6yMGun89iHtKguiSSFmCfaOSs367X/twb5SjZrFTs/vgi?=
 =?us-ascii?Q?b7Z63EDmaUPX5cC4g9KdoNthUEV0iTU2m8OqyOwno05HYswntt5MKK83C9Bh?=
 =?us-ascii?Q?KbvCjGfDlFKqaWZPBVqZWGOOSB34dB1TNtSpOBlcy9HVPdSx002p89e9gHEC?=
 =?us-ascii?Q?TZpAjqnQoAghcdnW48rfeolmU8RMbp1xUIWGodMgOIfunfBZQhs2De9i0tjw?=
 =?us-ascii?Q?1cOcexA9EgcB3GdDUVjnk3/16iWksaQqoRWV3zrfFwGR93etcnfm2r1MZT+O?=
 =?us-ascii?Q?L0x868ZRFoSDwyOcJWOfXsHjxuJhFiSSlWCbYSKmuxK+5ThQ1GC8KTZBA3Tw?=
 =?us-ascii?Q?qNTClnVQVpZ+qoWOJBXEY9EgB4GI6Q0g+Z4GsfuJ3dfnYeqKSaSvW3F5WnIK?=
 =?us-ascii?Q?285auU/2egxA9Q+u+nhq/AePsuzk8vjwtgYzjzSTanTOgx9pfbK/cuR62Hqg?=
 =?us-ascii?Q?p/+0iBbB2GhPAviywjyWqT79oVvYBetK5f89HuzEU/wCCWnIYYoUC6X0QlFn?=
 =?us-ascii?Q?OHbfoPGI3u0ht8tWB0pIRjCLLBHfKHXth3jkheIzhW0HpDQNPVi5z1UBngQC?=
 =?us-ascii?Q?Bs6xH37pRDpJE9CEjY+hOCnirt9yTHYDDbnIxqTxcpPRmz02894rvP7gKvHe?=
 =?us-ascii?Q?3NHpe54UbyOAScxVc7S0lo+nn/++yW1X9E3P1c9/TbxN+ohrXpqD8aTbIdaz?=
 =?us-ascii?Q?+X+55LSpzsg=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?0SGIQ4Kw6jSapcfSvwx8Y7eF3tSnbD5DgQ/5ImMFovsmSo4mljeQAilcaztH?=
 =?us-ascii?Q?EjkrSkBeUmnQCvLFV0MJVDdawDPCNppE0HxOSS1GarstKb42ZAXcTJ9A6p5Z?=
 =?us-ascii?Q?ujFlcVtM02axd8Go8UdJMpdSX2qjVhRLf5ofAQ53cZq8Whi9GyvPMzGi6vBY?=
 =?us-ascii?Q?DqzZqyZlOk7AzYt78HNTn489+WQtelmj/0SSbX7kUwubN8CBPEjQiIzfF+Gq?=
 =?us-ascii?Q?KKoDjpnbLDtO0YEUZrQvIo4u2NT7cOCl+L7Kc56RrnNB/KTLvO0kppTNHRyQ?=
 =?us-ascii?Q?hVYJjobtCksBZHcxwmf+FN8/EaeK2Mv97QzfJqlkxdms64MHVVkAxG5saaT4?=
 =?us-ascii?Q?f9m/8cy9AB0WJSlxUfLysfyMQ94vOODMer0IBtkDkpTxNZcaOceoY1nRsJv+?=
 =?us-ascii?Q?6EQQ+k26Vk6+1D4iPga5CMaK8scLX9pKniHqe4tHQTRIIudhttc60nHn0HXk?=
 =?us-ascii?Q?1n9mJuWaAq0LRggOjFEo5QgTdjo4QssqQygLZuL02If3JbnWFf2Lsi/ipbg3?=
 =?us-ascii?Q?1kVJ+QLBwTYoih2mN7c5DH0YBl9xlhCC7+FALeBibseTY2Pow0DNRzaHvxcG?=
 =?us-ascii?Q?wQHkzto/+ZaPH6vZxn6NUGGXVdpNoLkn98t3AdTILI3hh5xhB0oAEoeR0Pn/?=
 =?us-ascii?Q?dO+2wi/xxr8BVyvAGGWRRQJ3S9n3iID4cjpteIjizmbsuPSuqFoIDd7PL+jB?=
 =?us-ascii?Q?9jtnmXQJU7C2SvwRSmYXBZ6Qiq4025RrNxGcPm+FaQR1o2V8g2Z9JdD8KJCG?=
 =?us-ascii?Q?axkgFJw1X8afIbx+EIyvqN3OGi8cqY2IBemZdmxbt3mF9EMWv5dHCIRau3Vz?=
 =?us-ascii?Q?TIxvOX+ublKl67mPcvdlFep+dpIHYwt4v1OoUs3abXEjkNIeHqbh9737swKR?=
 =?us-ascii?Q?x+ujczUn/iWIZc6HN6aOvROUG1SL44mu4yrzcI4SCGPJtszlr9Z8AwoJYGLO?=
 =?us-ascii?Q?zqyYfQ4AEGgwitX+ousnnfOL2QSx8+YnDFooQdE7U9LKY62n/vrSSD89+BM3?=
 =?us-ascii?Q?pepQr3gM1TGShDA4IaCAUNQFhAa+s2GBPqUBfR96TVqDIAmdelttAUGro81U?=
 =?us-ascii?Q?1JGpvdvlmC9h9yZaT7PMVP9cMa07YSa5ay3H8EnGVQmfr43ffkjtVhTspPGp?=
 =?us-ascii?Q?6mrWoCuotjOZBu96m22hDHcinbNirqAK7rmplpbDEF1Di4Zydbp1eHaLbWqa?=
 =?us-ascii?Q?qtJkBt5pDCd6icgxf41TLodTm+RHDz0ge+By4X8Mmp04zPBvrp0lmuAihKRU?=
 =?us-ascii?Q?VKTOiFMm1jrvyLWP9UUqoGx9bWZPUodFajwY06dkU6n5sR+WnDwtR/NG/RqC?=
 =?us-ascii?Q?cmvwUPXyB58y5DAk8eaW4S4lK4iQc0McsXsfTxWt8WZP/XV2Dm3xziALPWnB?=
 =?us-ascii?Q?E9ugbhTCu/k7KwB9T+TLBOktUeQapmGILh+nT6Q2HTfz9lSrrdJ4zuqWecJJ?=
 =?us-ascii?Q?+PnQQCPQqIK49JIa5L8iYJRQjDNsTCpoSLeI0plT8W8bvyYJRVxKPm7L2uuI?=
 =?us-ascii?Q?g5FGW48Zm+zJ+1Csja2uPksJUNAgENvlLY8iglgz03STXZyAWalpRvriHRtt?=
 =?us-ascii?Q?a+MIQUnVz5e5Hdtpv4Q9SOPb4EKe1b9gTmiU/0s8H9KgHTqA6O9YEqILgtT5?=
 =?us-ascii?Q?POhmJnK9PMV431iGRXFOi2A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d40018-6afd-46b3-c967-08dcddbe47cf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 00:00:49.9719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHpLAz2bG0YDbzPP/MhdovWHBGFjqsZ5yotp1o5HKYEXQbpWZxINVvBeVF0oGVNcyaq9ddy5jcLVjLODUnD3BcoDq/PPoaFGM4h0RfGZehcEUHldD3/HqzYAGSNj6Gdo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7353

Now we can use new port related functions for port parsing. Use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dpi.c | 3 ++-
 drivers/gpu/drm/omapdrm/dss/sdi.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index 030f997eccd00..b17e77f700ddd 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -16,6 +16,7 @@
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/string.h>
@@ -709,7 +710,7 @@ int dpi_init_port(struct dss_device *dss, struct platform_device *pdev,
 	if (!dpi)
 		return -ENOMEM;
 
-	ep = of_get_next_child(port, NULL);
+	ep = of_graph_get_next_port_endpoint(port, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index 91eaae3b94812..f9ae358e8e521 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -11,6 +11,7 @@
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/string.h>
@@ -346,7 +347,7 @@ int sdi_init_port(struct dss_device *dss, struct platform_device *pdev,
 	if (!sdi)
 		return -ENOMEM;
 
-	ep = of_get_next_child(port, NULL);
+	ep = of_graph_get_next_port_endpoint(port, NULL);
 	if (!ep) {
 		r = 0;
 		goto err_free;
-- 
2.43.0


