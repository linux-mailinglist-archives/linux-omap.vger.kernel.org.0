Return-Path: <linux-omap+bounces-2354-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 325F0995D4C
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2024 03:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55F6B1C23676
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2024 01:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E811B487AE;
	Wed,  9 Oct 2024 01:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QzODufmT"
X-Original-To: linux-omap@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011011.outbound.protection.outlook.com [52.101.125.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D70735894;
	Wed,  9 Oct 2024 01:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728438320; cv=fail; b=olre1ZQYr5TmuhweeiUBb49COR+g0oD20OUQLANmugpYmsaHIA1qLB7H4Vf4NsmGnuJFX2TlYgAd2dulPyJ1Cqaym0dVZy0+jnf90vNzT2FYywkHNxCOJ/7jZVubcZ1B03l7ZBVVtuMEM8C77Hou6OvLsI3bzlP6TBO+DfPserg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728438320; c=relaxed/simple;
	bh=kAlhBEm4a7e1tT/yktVwzRplpzEEMiDD5+yPnleyR80=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Xt0PhtF+zPHcYEv6y7nXPC7TR5xcb7S3/SPOBxvTZg3L/C4lKyZuU6/gyYtOT7j15yGiF4E5ytNMUBgfrA9sOdrITrpZ9+GZJZTYc26Zo7FT9v3rpBIK9YTa64EZDLQtwgkBCPkYPVPZTwNpoVz1FaScdnJUVS+v7ZLXrTttsJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QzODufmT; arc=fail smtp.client-ip=52.101.125.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwjnEU89cZA/kwUer2uU7okbZVfS/siorfx7t47ISAwAPpwTif5WQwowaxvVRAYL9zSNCRhM885PKArM3FdkdGZ8amoHt1aSeSpmTB5Q8s91B973p/jIKpsZm6GXYQQOXYZgCJqshQLQhOAwo5C5HIZacLU8VcSaLfJiBs/I4UCbCwIT73EzypapL2OQVefnIfifp0yyuieo7kwRrMjoePWM4aLTU5n/YwtE9FJEzjmiUzhwIkZXwiNVfsXaYWSynzWd4aAlOANsF+UE2INanYdTkzzSCFw+1duGC1Kn85jFUOUU87CwcIrQpEAg578pEr+cDAkCMO2XVJYuYjRIvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmn5y9sJGI4V5IdSH3mR/GkeQTbPcQThFcwGQDjqfvo=;
 b=OqSS3krcMY272nWMtz4FoXg3zf+CcVIq5CleZ0uZULGSQk11PZIjDZDSsp5tCO3RGClwleofNCoJdlA9MlaYG3Sa+BkHh+6kWG7I20ECQ+UEm4peGgaTDHUolE9y/kezaQ0zlmBIMCAHgOcXqufol8aSVA1sJYmPJywHbc7T+gkdKHAItSLncmevU/xg8vBBRHveLpwfQRgIGlIwLQchowf5+8r9XBWiOhdkMn1sLSxc1CeYJqDF/M3hu9Qqy19bbTV5lcDarxGG1vu+Y6V5PW4C5128Lf2m+H6s42Txn9XJQ7BLxDKV4l7XbyVtcGzHTXukySIWjHlU5/r4oZUOuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmn5y9sJGI4V5IdSH3mR/GkeQTbPcQThFcwGQDjqfvo=;
 b=QzODufmTl0m8TTvecBwvBYgNAGVNf11eHurfu7h3miscdfcxpGOXdjYA+F+R0tkpKqgrmH4kO7OB0bp+LtLo1Mrve0tIQSc91LHz5WckC3n0Sk9M9wdYdGqP0WNJzc82DihuxtqYqSFpOr8tdXwKAZFUa3FSEzAAIFYUmhlpTGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8765.jpnprd01.prod.outlook.com
 (2603:1096:604:15e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Wed, 9 Oct
 2024 01:45:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 01:45:13 +0000
Message-ID: <87r08qrqvr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 4/9] ASoC: test-component: use new of_graph functions
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
In-Reply-To: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 9 Oct 2024 01:45:13 +0000
X-ClientProxiedBy: TY2PR0101CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8765:EE_
X-MS-Office365-Filtering-Correlation-Id: bdfca982-2b6c-41db-5a82-08dce80404a0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?PyFcZ2++Otan0D1exyK+9tBik3A2mS3PIaKCEeOTyUCd2xkNU7uQkbhlnFtG?=
 =?us-ascii?Q?os/l6jewqCZi8pD1ysPSD2/lL5/aTVRWEbAXwu4jQQ1/yoPzwUgBwINibetI?=
 =?us-ascii?Q?CuvOuxLWrrbB0kVMzTneN9jP93DLPVvD1Ky1NfVPDukmE7JfWb1rJwYX6L/3?=
 =?us-ascii?Q?KEqMlglfccMfApxozRpI5qg6eDCDkHaD50azZn1VnLtI/T9t7jLwlM1zXptN?=
 =?us-ascii?Q?o7azSrZmV8+zhOTrluDfwN9huSYGWZrAd3g+JX7F/fobYPRJHa+n29V+NMMk?=
 =?us-ascii?Q?sivMY5vL0gpz8ZRn5LbFXJSRhl01uGtunKF6EwBSZ4wHAgJRdyW/7iJOzGIZ?=
 =?us-ascii?Q?90JKbAKANPybHTkL/ciGE4N1sBYBcEBW5a1V4w3FgWyzOSqReMijTpVUWl9D?=
 =?us-ascii?Q?Yi5f1e9WHPt42Ipbrl7hZ5zpf3k9Fvm3/AyAnvorZ4MEvcBMDXMkwwQaurJD?=
 =?us-ascii?Q?b9nuKz9qkRROl/2h64I8DTeONQ9bJkfjlcQDHchYYNmuyeal464eclheu4RY?=
 =?us-ascii?Q?JVtvlUVgo+BFOBIAMHHcQ5+yrRNavbIGagqGNLEpqQd0dRq6rHe7aJgrFjG1?=
 =?us-ascii?Q?8ZiBlBuChNklHYRc8+c+TO/ZCbp0AlamYLeEAmbP6IvxKzUGT4O956tmynOZ?=
 =?us-ascii?Q?7tw0NrR4AAU8vYo2DxoFypXTvAXL+np/JyiVBu368KYc+Hjih9m8NO7k7111?=
 =?us-ascii?Q?psUKH2vOfyVhpMjaD+qR1C6fiwXTO4Pi8q6QLN8L2g+MSstF5rIJD3GVq/v9?=
 =?us-ascii?Q?hdJkx4idv2ENaGUxtyzUGmOUzlaHdRKBTVLfOPbScTh1vyFiX/k7dRpLEY+8?=
 =?us-ascii?Q?SBtR/w1sHmQoHxNc23/aDtCWeip2zV+jE7ccmvwOZce7bcUfKcDaCwu2Pxfm?=
 =?us-ascii?Q?Yc8cHNjgU7mnNYREGCJE301yGl2Me8NriL6neFkRCMPDeB1+ZRaZYq2IHrGd?=
 =?us-ascii?Q?g9jrjUpvud4TI4TDxSWiZL1ymw4N4WEcTaurFzExMIADCB/smjStCyHNugPW?=
 =?us-ascii?Q?esPNX+g/Nsl0r2g0sL/ONuAjIjzpa/4px4x9I1+nmxbhQfokmY6c9nGYwcdA?=
 =?us-ascii?Q?MoL4kuLqnqHwvbCNEBdIu2hCt7bo/2toZ0MJxZButGVVR5gr2mMaDHR3d34k?=
 =?us-ascii?Q?2tHN0kmcrCHe/Aqr4J6xkoJK4SxteuLblfxs+P+Fkfgr3IEb4HtMnflc07oF?=
 =?us-ascii?Q?b0zRd6bgNAhejkIPmiYpRqI1pypEi1OTwmIZp3Jq5VJTwLtEdXtlocwTFM/R?=
 =?us-ascii?Q?aL362NplWvUlHUxwxECK5JdAX+bjplmuuosecL4S2f0U2L3iOiN8+YneZ29/?=
 =?us-ascii?Q?Z+bbOaqfnS8VOFZ3tG1IOd1Cq8a+NDKf4Di60pbVaUc66A=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ORXWYV92fJqbBGf15HXsbh2eAGho36WaZkUlx6e73XezIsNIUoxTJqJ63u5b?=
 =?us-ascii?Q?elN3a2YOVRQ2DcKeSpSakbr08uAbHFEiG6GJ0Ib5VMiOMreTJLePLLfVKAsg?=
 =?us-ascii?Q?e15zdahSbgCuDfV/sEqBQntTxXkhCEILnBfFJOpdONfbwsCHbvpdbpK41/a5?=
 =?us-ascii?Q?J6SwEJmpH5Y3rOXuznHJisWryq/ilrIn+Kg+eBnx2Y26FliSoh0UyaNLF9MW?=
 =?us-ascii?Q?Lh9WV1KBmLKCF5uL5YyVQmiJa2WpVDgQtM8/sAgMWNsMCgjq0ZlsZ3zkVFgi?=
 =?us-ascii?Q?0Bot/SHR5N5ZwJfmUqpb4p9fP9t4h4/7NZq1HFpOC5OQI/4A5QqFAa+84fy8?=
 =?us-ascii?Q?qP/u14T/h5GOitNu5IBni0ETTKI1XpbzDFf3IR38DKcdsmJCCph214fzTB9J?=
 =?us-ascii?Q?KAEqcZZDps/mEHPMZqwQxU0RuOOd1aeNyYOoZlN+XaqXoOySu/HQCn15TC/s?=
 =?us-ascii?Q?NTJ/UR5nrW+uJdzC6dHiVnXfqybpn0sk1eqeBv4pxl9/NwkAAwNratrTrfNr?=
 =?us-ascii?Q?MH7ho5tXwphtr2G1gYQmzDEH+1MJmIkVASUrvp6U/uzOapYauAaOfkJ2OmIa?=
 =?us-ascii?Q?joZB8EBYty1Iy9X2QjZmpkyHI28+wPMEmhjFeHcDlMkbDJ1NvrVUsaqFmmYp?=
 =?us-ascii?Q?hjQ4yOrxEtWfGjYAf4ii9pCgkJ82ie77SFO4TfMRe/i/AaJms3Qrgctx1CTk?=
 =?us-ascii?Q?vHws+q/luU7/xYmn6bXeWmdcRXcmoSK5Jqh/6/KW/id5siBUovBDLOkPTdgu?=
 =?us-ascii?Q?iTJ3h+7wtTB3/KhtrglhEWiULGrPgSB5s9uhzdeu6RKWj+NmDcNEDp9PfWJo?=
 =?us-ascii?Q?UPsIu50FTFT6cw7QhUJ1h3nBioKBekbReraS65f+UJqCKTDZJD96QcTDY4kB?=
 =?us-ascii?Q?97e24n8QaUS1CGfViZRjVg+d7UpLBx8zY21MXTK/pkk4sOpnYeLmIFzN+lzN?=
 =?us-ascii?Q?tTiJ1WHRaquW4aIyi+/sujBQ0M5OpE4hd2DqBoL4Vi+wFe0AG8QFiatfEdB3?=
 =?us-ascii?Q?gb1VGNSu7SBCMs3uK1wq0AGgAlXysO1TVMNORlY1+nbI3rTj5E4TI0rrVI62?=
 =?us-ascii?Q?aAjCK9pnbcSxzUtOrBzrW3PY3bWmQ5QZTbHJ8ZZVdrCZiC8DxSGNp2Vxs+eF?=
 =?us-ascii?Q?naXUE3FSLEAxDckAeW9ITsKP0UzA4KYPIRYekee1XdcQP5wThohF7JyY9RHh?=
 =?us-ascii?Q?sshctIC7CmhOMe1pAI3YHYOW/gxl0WPeTI74F7cWJ6eMj2DmLmLNRGt+V0n2?=
 =?us-ascii?Q?Y9sx1spAnaqQRzsQd52tRvpOCqHcMIv/5Mhfcmc3BdpX3cCrx+o9qUHMlHJ9?=
 =?us-ascii?Q?AqgQ0BD3pAYpbKg8ZiMuQZi/u4qCVeBJwPuuPzGNIdDpmzz9C8pmOZGrqMGj?=
 =?us-ascii?Q?qjTv5daO+JGkQrj63qpFlsKCJcG1j2w8VY0rDyOLXmo7pjqiF3T82SgxHc2r?=
 =?us-ascii?Q?xkmDe4exoI8riqjhDzw0XDfbbcL+um5k8ahdg9XSL5cuYpHhDVaGoGzrJ+/5?=
 =?us-ascii?Q?w12DzTNshwfiYUt6Wz9c+lXMHQaTiow7frmRtN4KqPE/UFzNvFsymaAotsjq?=
 =?us-ascii?Q?F2/7ecfpdztGPc1a/4Hr5it3ha8E3lbnnutbacQdWs5rnmPkoB4JGM831Jmk?=
 =?us-ascii?Q?CjChqiQgXK+5ms91PgX99JY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdfca982-2b6c-41db-5a82-08dce80404a0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 01:45:13.5761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYdDqbeefUxVj9W7YVuSXaIcUbVH7e2O9sittXS+85Sto9tSN9aYvIE08r/F1s9+URU5JJ248ISn6XfLlmRvNKv0nYr0/P7dsCnZFoiGg88o0g7dhc5qaj2I11DcwmAu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8765

Current test-component.c is using for_each_endpoint_of_node()
for parsing "port", because there was no "port" base loop before.
It has been assuming 1 port has 1 endpoint here.

But now we can use "port" base loop (= for_each_of_graph_port()).
Let's replace for_each function from "endpoint" base to "port" base.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/test-component.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index 407288055741..85ce3ebeec05 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -521,7 +521,6 @@ static int test_driver_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
-	struct device_node *ep;
 	const struct test_adata *adata = of_device_get_match_data(&pdev->dev);
 	struct snd_soc_component_driver *cdriv;
 	struct snd_soc_dai_driver *ddriv;
@@ -591,7 +590,7 @@ static int test_driver_probe(struct platform_device *pdev)
 	}
 
 	i = 0;
-	for_each_endpoint_of_node(node, ep) {
+	for_each_of_graph_port(node, port) {
 		snprintf(dname[i].name, TEST_NAME_LEN, "%s.%d", node->name, i);
 		ddriv[i].name = dname[i].name;
 
-- 
2.43.0


