Return-Path: <linux-omap+bounces-2476-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5A69AD9BD
	for <lists+linux-omap@lfdr.de>; Thu, 24 Oct 2024 04:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F3AA1C21720
	for <lists+linux-omap@lfdr.de>; Thu, 24 Oct 2024 02:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889BD1552E0;
	Thu, 24 Oct 2024 02:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nvRHlvDZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011016.outbound.protection.outlook.com [52.101.125.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E980113D520;
	Thu, 24 Oct 2024 02:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729736421; cv=fail; b=CNH5ZUF878sYPykEjTxHtJIKoyZQZJfwYExvzve4SzGOBAFeTMgNh1/PzVpsjIQfbnm8Nt3LcJGNWDmcZ4UxYwGGV0UgZYp1hqWe689ToslAgi2DktapoS3Rlj8MN/nqFe844CNFpIrTaWUCE8HjKgezoAb2fKuw0kF289+ySbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729736421; c=relaxed/simple;
	bh=gu5iHGO7ZAyTHmeUiaL3zEupXXpLc6wae5Ou26Oi4fk=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YAJQ88J6TQMXjcL29RuRDGrSEiOVHc3nj1H8NwmxCqqV1GkhsoNhdtAjFYTSGDrQuv8Q5rvtDG9ndyNYo3lKEn8WL/LzP1uydebhBt9P8A/DW8Bg4CeUf6wlx7z6QrUTxeRT07JTjoFfu4sYTXOwqq7vXhSpNngXzxsAtK15rJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nvRHlvDZ; arc=fail smtp.client-ip=52.101.125.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCjCdHJv2aZ4RGVjPd4G/rSnx4ZAB4UsHbX2cVhFNrUegIILwB9mT2AZgqFwvn32kilZY7k/eKG6Ril1zTUTzOte+5jowgOOu++/OZo1iMvweGPD0gLOU8m/d6nxtw9ijk1Oizchffl3Cmy3QXOOK75CgoItJ8jQz7ljlKaJTuESkGetx0amvEbhrw6hlye8E8k/EWVAu94yL9ZdeQrMcfrkt10lhDXWg+3bbEVkMfP4o9CDkbnVdzjCIhMRS32Hgu+ACmRR1seq8NjQIECFQduEI0c9DGGj/AqJBihvYndeZewFtuQ45oO/GP0Z7A/SoAlu1e7IqWhrMNCeeCUgNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpSOSQwE6xBjXGtk1rjvHMS/ZUIDZaLCckkMWn2G0zs=;
 b=okkY5N5Fb5E5GEssJXo5oZEkUSib2a0XNdfu4fchLwjGVzlwUyLvtPWUrH09xN7+nts9H/qi1NcBuu9ayrIkdl2CNyUCHvSWlkomzfI8UxBFtVlBpOxI0veTb0h7eU2dEWTNtYfWWfvASrgzLxwG3ulQ+UTnFNEtcF2q9oJOR3tiicvpL6UOSTsa8RKxu+eUIa9GNsmWioTya0Ira21eloRCe7egvgI18hYQcD7ZI+nVDAqpdCqKZJY+mt3ndSNbGOY7znh8Ag5E+ZortSb/l+brBCmgTcWAph6EC3u/Mvu8wy7iCcPk8dUH3/w9z15t1kkU4+uyzqOo+ZUGyZCwOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpSOSQwE6xBjXGtk1rjvHMS/ZUIDZaLCckkMWn2G0zs=;
 b=nvRHlvDZapu6KyORcXGAlv4X/z5yJzXVxhWE+Jj3KmzYdkJQxNM06AYaVpCaYEzLEgG0HRHUOzhuYwW8iF82f74dZ49I56IR5+j/YBMzhOoO7Xavb9PjfmCGno2oJmfEXYZgtlmJOGrfIzcNUz2sWN+9XMq7s4JTjf+1BPsTxm0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8629.jpnprd01.prod.outlook.com
 (2603:1096:604:187::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 02:20:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 02:20:16 +0000
Message-ID: <87h692b5sw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v8 4/9] ASoC: test-component: use new of_graph functions
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
In-Reply-To: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
References: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 24 Oct 2024 02:20:15 +0000
X-ClientProxiedBy: TYCP286CA0252.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8629:EE_
X-MS-Office365-Filtering-Correlation-Id: da1b45ec-33e2-4bb9-6757-08dcf3d2661e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?n5Q7eUZHUPAvlYrnk2ZkPuFNFun8pg5mnm0m0Cx7e5ty9HSM3aiJQyx5lNZm?=
 =?us-ascii?Q?p6ekDohxdDElyoFFYAwnTTxEbssSNSiIcAKUEBj0CxV2jjU3damsm2cXERXi?=
 =?us-ascii?Q?qahMhaZifKr85OPcUQ5FIjo+NIX2zXg/HLOVv5MVukSPbAuzA+6hNRgDTKA2?=
 =?us-ascii?Q?bXfQrBW7KS9fBjMoWAzPdT1lk/c+K5zF+i9zPyREFWCPgHvQESTj1FvPRc+9?=
 =?us-ascii?Q?CAgdIZc5F8GkFx+KjWZr0NV9EHiZIH4H8kC7XaXt61DXxmFpWJaQjM/jPFjw?=
 =?us-ascii?Q?I1bpHEyJDXOEBcp0UeIJlKmlYLJMamvy88gkva2I0oia3cR+q1PEUjfqZ7Be?=
 =?us-ascii?Q?O+ok7fB2tXsOKr3/TQLeZCsCZaUyCVvYaNPjssqlSgj112JX6Lv36YnQ0pBv?=
 =?us-ascii?Q?unqrvIqF+cyenCWgzJHHoiDi6fUs3WqPFjZ6AInZs647Tj1t2jkOzXjUA5Xs?=
 =?us-ascii?Q?n8J/yob+z7KjswjilRGsUCHV+uHNxWzalHVf1E8Jh4+H0Nl+XzyJBZgaUr9b?=
 =?us-ascii?Q?4hazn4/vmTlMxLYK7+pnpcn//SSC3vUlMcvexFlu7EMegsBREKVvYLiJhItr?=
 =?us-ascii?Q?xq+z47YMfzYzJ9HRLgQtTqF1KNNr4/HNV9xcUynjWGdQ/Kp890MrNKqOGtvj?=
 =?us-ascii?Q?m3nuYWag7vAA+U25UNcZaqd7dLGJl3QeE8AJJiFSPTCY5ZKResH0nXwQeDdu?=
 =?us-ascii?Q?mN3urlErG/DRGgVIsjxzXlWpq3RxxVpLItv8EvvAgrHvPLUpw8DGzloRNbes?=
 =?us-ascii?Q?MxIstV90A5nelBYORZ+zUUXE28ZgMnvakNlk9uUyTAjn/Ru6LGhOhW0IhiYl?=
 =?us-ascii?Q?znTEyAjM/8lUbz6u+IstwME74FdvqqGshrjEtMkNOLfTHTk68ecSVtlGTbgF?=
 =?us-ascii?Q?uzzHmGdT9bGJs9wn9SyXNReH/704wQ+etDgK3Lx321q/Lxbq4Gnz2R4a1MwC?=
 =?us-ascii?Q?ftGDd0Vfh9yJy28VwBaECzDH8WyawLaVUW8JVF4bOa7N4AYTGWqXithjA6A4?=
 =?us-ascii?Q?72zxYfBzmQXbRUtHcrdsHfhZrckdfSyrkF5uvAK4FTpcxDElG9G1tW+ecCgY?=
 =?us-ascii?Q?9JgdD+012m+6XtXtSlxlgGGAxYRcvzb/vocc+Pe0wvWdncR/azC5vWW/Z3Yt?=
 =?us-ascii?Q?eSvuapkSQSM5bWZ8UKisBj2Ixs8aAytCviakUCgm2+xKZFokIdxsuITAPfUl?=
 =?us-ascii?Q?pRBOdrJqwg5O7yYC3ongAXyDbHhCWaZ3nETzYcc7F33w4IHfoInYnpTLm4nI?=
 =?us-ascii?Q?wNmbnP5OBnKOErQOyCRLmFARObSOkZIF/klEiFMgLSR7xF/uQliOIpkIglc0?=
 =?us-ascii?Q?vLc3YZtAdrynLJijrjJHbKPqwzMH0xKAD1HwR+UrGOo0R3lz1HKayx+nFIiw?=
 =?us-ascii?Q?21xdksj0hf3xAG2u22Z8uqiMcBQg?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?lpMzYvJD4W1O2bTsw7GkJyKfQTa00gu5YgKGEl4IqGjjf3mQogqzKKfH+YkQ?=
 =?us-ascii?Q?9I5ZeIbTXZiFQxwJWIY2sO8emnUeg41h47lNoWMbUf839Y4r/+lCfTPQZOLC?=
 =?us-ascii?Q?i4p2Oq0cmllepDPqPKIONqc/d/uJaGDkkhkd8/2CSA7vvyzRudIRHJH3nw9e?=
 =?us-ascii?Q?ewoFE43OVK3Mfw5vdtfpefvNTgaAsqQYA+MBOpasgWhsxXhB8a7R72IkxcGX?=
 =?us-ascii?Q?kZvStx5Cq1sblir3aZR6fuxaAyoOT7Rfvw8tmMloCscyz3bo1eWPN3WGhx0U?=
 =?us-ascii?Q?1NXhQVTEef58GUwZqOJTZRlVwSYnvN1XNk+gptAEgmP+Xj9w9Y2P4grE+v5u?=
 =?us-ascii?Q?ZqdnJOMoiG8F4klIFsH0Tg9VEzxZzk76mJ1/R+1M61LF89S9oMAZr5v39Qt0?=
 =?us-ascii?Q?hP+b9/Jm3/H28IktM227ZVde3PhMKyFHWn5FjE1NiZRYsxnGHwacr9nSXQDC?=
 =?us-ascii?Q?qb1ZY2Bf4T9QW1cw+RDH0ZNJeij3b/fIuV0XnKg3WLPvxxIa/36jZDFyb6RN?=
 =?us-ascii?Q?ZvcMCkYOd2FyJHPt5lSy9UcFb8OxYqSCX9dGPEVDbome0q4quTX+gsta9X0y?=
 =?us-ascii?Q?kejWDnFEHYT7b+aS+85wzwgw8MPl3HVhxFI/qZ4de6HRgdp42HqAQ/fun9W/?=
 =?us-ascii?Q?oSzRmCoNnz5oQoO8qIjG2T5j6B9VC6YqheSmQjjrpHtqpDVZG+MUsk5XGKNz?=
 =?us-ascii?Q?urw2URjG3B2FZv9HuokcySrHhUUHAXgc53e8kRmekIu+93x3TMRsc55fIB6M?=
 =?us-ascii?Q?EEt1d6qMRDEAFUg9mED9y2rPehXn70p4g2IGAhpVpEVXmM6gdrRewA6XfGBT?=
 =?us-ascii?Q?9TOv/zn1gfFctP9PjafTkkjp1G+J906zAqfBYLa0I+w05iAfgVhUVljHMqJG?=
 =?us-ascii?Q?VuoClsfxVZe1qAYXpvINvCpZIjkSFc40nwefNpbfU/z/FCyJdQAHdXzc/nG5?=
 =?us-ascii?Q?ntQwxCUYfGoslwq4SfPyNIQAparMYa8FiIJFPLhmbhXNsPMu6nAn4uIITi15?=
 =?us-ascii?Q?Oza94JfGoKE0x//xvRAPyOX0O8ykqJIEPIKsBof0082AdpnB0FKJE+FGRJRq?=
 =?us-ascii?Q?OX4B3xGAgYiKuMMliNxCTFmDRm9lBCdjYXzMBoLZ2OKgE8+QNnss5NLi8MOF?=
 =?us-ascii?Q?LoqyKFOxLQTSBjRyFCVtfHKRcf/uHqpATGK6tgq72UMYzK4+ticM3deMT/C5?=
 =?us-ascii?Q?9m8lbLQ+y7KA5+3j16uacWTwoj4tG7FHn72b3BOqMSwLsrFAYQ8wdYzoYkRS?=
 =?us-ascii?Q?XwroGsiQZofBPTmxGBqdPHbh9U+D7lY3WGv9x2Z/FxMLVOdKMUl8CcoNNSiy?=
 =?us-ascii?Q?4hetzYQYBdwCYvFy7X9ARAr+cBjfQ67TLiUY6+RgpyOTImoqDy3qVxRthBO6?=
 =?us-ascii?Q?/cftVa9SoX1LkWGnj0CvsKmn4a61y9y5zGP/pUdQ0dsJQ5LNv4u5FMA56UVT?=
 =?us-ascii?Q?GyLpZv7VwsF3BuGrgZJVdLvPANZHM3aTFEiZML/2w7y0Shv7JawvrFsktsLV?=
 =?us-ascii?Q?n0GHrzOJ2omzwZd+aFwQQ36Ra8C5hMmtgc+qKw81CgLwzk9Hc8csTp3/AZnP?=
 =?us-ascii?Q?uk4gfTgr//KQfnY3CWsXPhA4DKUSwYfUYwMDltJbVOTvSo4urBqcm18mO6OO?=
 =?us-ascii?Q?PcaL1zfXjsLC3SMZ5mIo6gE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da1b45ec-33e2-4bb9-6757-08dcf3d2661e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 02:20:16.2721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Wj9WOi3Qbtv1GnHttSpJ2Faro7I9CsRJ16iROr11m6nK3q7N+8gp2ifW/lKAqIW2O8Tj8FA9zwligdk9MN1ECVbT/jYTlodOanrAbq5XsQQAQHHTLGLbzdtLgC2QpVV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8629

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
index 407288055741a..85ce3ebeec056 100644
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


