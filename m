Return-Path: <linux-omap+bounces-1544-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B95890A17B
	for <lists+linux-omap@lfdr.de>; Mon, 17 Jun 2024 03:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6055A1C20E75
	for <lists+linux-omap@lfdr.de>; Mon, 17 Jun 2024 01:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2914E13AA4F;
	Mon, 17 Jun 2024 00:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NLGHi3dZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2066.outbound.protection.outlook.com [40.107.113.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112ACC14F;
	Mon, 17 Jun 2024 00:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718585984; cv=fail; b=WAev367RONkJyDy9GELp0kVBcBRGRw0foQAAalqNQ6s7RdjxDUUD9Z8o6FzNnv90I+b+Cde4HmKUffuwoBKWktQystAiXkN60DC28G2QQPm3WdoWe3qW7yAlO5L3bt3ov0oUvh6Bn3KLk6PDrjKvbOXP5+qF88ix7qDDCh63TR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718585984; c=relaxed/simple;
	bh=RLm+i9/ScJYDLOHo+cV95VhB7eobV/GEZD0X1cPqbWM=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ipRAC8bU/5dMzUYzubkwMgGKP99qG1JKq0UaVEERJZ5t2hc29MzjgiM5MB/FxPRcyqmIvuvhqMRe5gWUxA2E8W01RS0mC3QHsjj64VQP9RU3MFKj1oOKKjVtHgAyyMEyQ5/NuwdGZm03yoOsmNawdHo5iFB9BsPcMPp5jEz12rY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NLGHi3dZ; arc=fail smtp.client-ip=40.107.113.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPOXMYQ0qeZmkn1ggF45SqVpfcIeQMHeT3cvh40jKP5++KLuk2uQrTof6TrjPjZudQoB+p4rq/gyFPfKUiGa8NoD5iOJGVbZVH/kBLFpo/4t6K0UBqc3jl745NsKyarn4lWWCOZvZUQ/f5VgmFvsUXZ50EKeWjZeRvGr4CFTDZBjDvKa0CiIITtUQuStL3r1ZeW0jYVan7Yyag3QWgwtOfAFi6C6o0Jsz3FwJWrr2eWrbQJIBF2065ZkFWeKYk2H5c5sb4BNP3vWzXHG5hM6p4m2BAawL2+MOJ+NIzsTHn8fyx9h5ONt/vCabyVIcssyR2Risqn5VJltb0mjXk0k4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsagpA/5pNrylws56rjc/fEA7kqQPMX4DxQt4ow3FTA=;
 b=G6/BDpVUrfYg4YPbpTcV2ytVdLmMkoZiL6Mk2+bAeYXMoitzxvaIVKFm3iZn+IkYmzysjp6atMjuwBE07dPK/xvPq7b6AShoh3Gj6WrXiJf5l/7GWbtLymObcLgzqyZTXwhK0PnuoJutqUrYqIKOyMg4yS36POHUBYNW4MLQ7daIr3VLpKJjPWzdnTnEu13aYv2GLHixjoIvc67oeggt+rIpnpog7NkIn/RoR0GE60xVPzQAbPq2hatzNTqwFIgkEknSHKH3b4aS/o8M9aO0DPA/rc/DFYTRvC3b7GJcr4RIRsFdsPCLXUAvLV2HYqi585q36v5yGxcYohMemRRcxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsagpA/5pNrylws56rjc/fEA7kqQPMX4DxQt4ow3FTA=;
 b=NLGHi3dZA9sgk2wxHvplccaA4XJIq1tANwlII8/HlqtFEkf7N25v3lWHMCy+q2WN4XuaZ5JCUAnFGX/3GlbuG680S7lsqxBJGe2TOs7f1oTyA0veRYKeu22UMayd7Ie4XCAC1ltCQdmQqDcvB6cyCB3o7HTnm8rttgvwO51kAXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8560.jpnprd01.prod.outlook.com
 (2603:1096:400:13f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 00:59:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 00:59:40 +0000
Message-ID: <87iky8s7t0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 resend 9/9] fbdev: omapfb: use of_graph_get_remote_port()
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	coresight@lists.linaro.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Jun 2024 00:59:39 +0000
X-ClientProxiedBy: TYCP286CA0128.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f8131bd-0582-41f1-84e2-08dc8e68c46a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|366013|52116011|7416011|376011|1800799021|38350700011|921017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/hW9wdeMyHNtWYV0fMb5EaGJXHmJiqAwTEKwSyvU1HU2bMG59gDcSNepQR3v?=
 =?us-ascii?Q?lNQiQc7Hq6l4dCc+vdOGedDeIrju+aN9cuXlGjtia2Ze2zOBO65modejj2kY?=
 =?us-ascii?Q?obcX6MeCgrMMbMP8ErxIIJ9xsIXpGOohvHZHdPhRuXpVjEQyq3/XF0Rjn1dw?=
 =?us-ascii?Q?Q358sOoGMeq1pUGx+5AO/ZHBazrYIYeDFGAXtefQ44fB3ow5GmJ+oYRCXq1y?=
 =?us-ascii?Q?9SypB9n6npy/vL62N+I23D834yY4JqJI5+qqwEHhXnWAXvgrNZQCNyZXXmis?=
 =?us-ascii?Q?yrqt2NV29jzCHtXwqKBkxMMs02fkmLEBI0+ZwElVEqSQOPRlll1TXWz9klxR?=
 =?us-ascii?Q?e02+ux8x3ddxfoqA/Vcpp678pSC8OA0XsDXRout3czAEb8Za8K2ioI8Vc544?=
 =?us-ascii?Q?cCWxzAn+zJFiE4sDKOVpvbMR4ialNcmks71CSN4Tu8KYVXY5g1uN0N4UB+gV?=
 =?us-ascii?Q?1xSMax6u44+ScAwg5IzDjiMMty7SvlEGD6JiMKiNLfOfIajyFGrni2wX2iQa?=
 =?us-ascii?Q?aOGrARusj4eG20muJxS1PWtbyL1bJB6lahvKps9r5Yr+47jkrSYS0bx+pu7Q?=
 =?us-ascii?Q?BKpeDL89apKtNB1198u5iWhty6bmsPzr9KMYXOlYBCAuJy1+57qQS54w4NFz?=
 =?us-ascii?Q?KwBzSDbfi2gUtAjhBKDcNLOS0XNuUwSeSCUBM40l7vSkt0RtTmRHUZ38Kaqz?=
 =?us-ascii?Q?z8O8e/UG3y0sB4X23LHtz3AwOnNLpJghVH6paVlAi5L7ABAsqHTRaTI40l4p?=
 =?us-ascii?Q?vvSZ86nzxt6/iKjS9mw3LizeoDMnGzaK7dji0PSgx6i8G/PnpoNMopOpJl1s?=
 =?us-ascii?Q?r41Wqyjk1UJ5sTVItwcHNWXwCZyXeZqeLrl+Ypwur/vIR6kbNHW6HuA+vO0F?=
 =?us-ascii?Q?Etv2+KYEwfvD9jMO6xgJqYW4rpkLGp9D+r0Ni8wa3uwdj0sKMI8Sw4B3o1cl?=
 =?us-ascii?Q?76lIWFXFfir6ZB3uhArHxxcXlpCdVQKOgWg0KmSsaOxJD1kRXNiPLlMNAD1l?=
 =?us-ascii?Q?poNJEzTru+PugYNyHDxAxSa5bWjKyo/hKtpcf/CDJWWU4gBP6yLQwaDPZJQj?=
 =?us-ascii?Q?8LwvAMxrS6wsq+tgPibCigd5gouzb37QdniayhZJNcnlyEkZmSNOlskk3I4a?=
 =?us-ascii?Q?i/3T20csyyxhUbkLhGaKuc16MLY4ggsjVXFwqhyvVjg2RWdFD3je2p847ZpD?=
 =?us-ascii?Q?rQHiDQ8l+B95Ko2/C4FwJr5z1yAvsSSdC2WzslGfIkqOUjinsYw5K76BrLNx?=
 =?us-ascii?Q?1fyDf4slR5Na3Vn2v5A+mp0TY3Ww5uUmXImmZcVeNLgA1f83xCdc+P/ZU31l?=
 =?us-ascii?Q?uuj9S///yYl6CNuRXfoKijbOxincBZHtMl0MJKMsSrJgQQaG6unNs7C0yEee?=
 =?us-ascii?Q?AKcfpj5BRCHgWTPk8leVIuh/Cplh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(52116011)(7416011)(376011)(1800799021)(38350700011)(921017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PaGwiKVYk24Wir5SmfxU1z2HThyo2Hg7sVShauRkTQXe3pNY8dSU0ZkPebWy?=
 =?us-ascii?Q?//cUAoxYJjUT98g+hicF43VVzpprXpOYuaKuk/Hx95aFj7Bohjb7aznVf9vh?=
 =?us-ascii?Q?WFvbzHFoiGrTbAm/mGbfq6/Nnne1jT6cemIUJHsgrHmB0Nf2h3Pn0ejKULcn?=
 =?us-ascii?Q?SZAldvPOCKYRISmDPGGAs+8NrlrI3DHTIdklPJc8Dz5Uk+v2MAeh8QM5/i5v?=
 =?us-ascii?Q?N1kiXpFJcefux+3Og7I6kT3f7obSut1uq//0VTQbKWqh7Sj2FmD0DiWfw/N4?=
 =?us-ascii?Q?iFVG2pSMBnjBvMm3XHIf/MQXWrLNoq7A2sO+nxOndjkGujTGMBhIZnYjWbva?=
 =?us-ascii?Q?1Mshpqb19ncCrwfQTW+Q5Z6tST30cv4T82LESC8NWL90GLSqzdTR7qOXAdb+?=
 =?us-ascii?Q?Qq1EXdNV8rwx5CAbmtj3BcJgcdTkyNG5AFmnyFbCbOp2jahUHyaAVc3Ze4wF?=
 =?us-ascii?Q?Wu1WSa8r8Z3aoR472mB8ZBfbeHBL2x58v5XSTLjj3DBw36R+TBYoAE4kClYz?=
 =?us-ascii?Q?sSb0b28Xea37lKEMDQpVImg+sdmI4mLStwxtFI9PY0Vt1+iq3uCqTeEAp3G0?=
 =?us-ascii?Q?ssuPgzjTIGqKgXEixPCgUeLaC2LpaLouKmgboQEyI7n7C/YX9RRH9RRXM5vQ?=
 =?us-ascii?Q?ISOGS+hm8irntszdHmK6UeWknqSavcPSrjSEWt0Pc8jKUvfEUqzBpXtmHqrn?=
 =?us-ascii?Q?2q87ZreilMFhTztmwf7aFzS1oQZsh/HgZry4wk5s8K2zU0VuctmmNaraLTIQ?=
 =?us-ascii?Q?KjyJa+LruqAuzWfJKt2oGs2Ame5YzXbV22GAjczQq7gna6Uf5JqS+oZchdlX?=
 =?us-ascii?Q?Cu8tMYF1tO1M9iyEGf/8YRGXreK3h1cc1sps4sWDnv62GQ8wK3h3KYwXC+hT?=
 =?us-ascii?Q?hiuQurBYXExwmThBa3rJbQ+7TDA/AOT87M6CpEfX7oQDob+ZbOpi3TGfy3Dq?=
 =?us-ascii?Q?S7Tc+Mocr+4S3fWQIyNghoWAJiYtzaDjqRbsHuaGep1I6mcZQCWEZf8kUzyG?=
 =?us-ascii?Q?8BxXDmK/fqNt/pnrKVl4/521Ig+UBmlM3gGecldQA3hZrPgXHHmdGkLCfCYV?=
 =?us-ascii?Q?VZIXtrcldv63YuFdGJz5I+fkhAJWD4ia+L1+NT8QF16QyClzBfMlddnrIdgI?=
 =?us-ascii?Q?v8INpsJ3WxDCxR07RWSxVsNtMYkTLp5bM16uR47SIsvWrT3fWKprJtHIOoQR?=
 =?us-ascii?Q?P/YnMcaruJiSlnGuZOgYqFh61EoA/WGXWhQQJdnkzvjBt+mrfArW0fUsvThk?=
 =?us-ascii?Q?AMy/UqE+LX86hf12WZqVzouw+J9H48gzsj+H5Oq0M2RdGxpcN81O1Z/C2jMP?=
 =?us-ascii?Q?J0NePu2wU2kktSISSuig5TzI9bfwTw9lfFZrbAd72k+JsrQ4U3EOXpfIr6qa?=
 =?us-ascii?Q?ag3XDyL4T7FaOLR96ESKQLoxJpPPhz7O0LKFnbdU1aZe53Uu88XXSIOnyra7?=
 =?us-ascii?Q?dxWLNHf5cvzoDKMTC6dKuFBdpId71ZYMm4DZQht+3F57DUnyjDHI9v2qdzem?=
 =?us-ascii?Q?WuR/Lq9rup/cMxZkMIertSdMF6QjvMO0JUChdGL//uHOlKjN2cv2FFJnVASy?=
 =?us-ascii?Q?KF547mus4KzjxEfA8t9bx6KMpwm/+EF7moVzTovA5hJTQatJLla7B4OkkAtt?=
 =?us-ascii?Q?Fxrc593001W8WtVgFcPUCWg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8131bd-0582-41f1-84e2-08dc8e68c46a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 00:59:40.3956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKA7JkBf5gTl1W66K2iCA9+m/ljvTVqD+a12bOj7lqKcNWx32ZKflXGFTXm2h4TLDh2OT5KoAvYKUPhFGekYiwCQ8gfPBnh2eJUv8EGUqmpOPEh+zF2AVp2zVo/4JpRT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8560

We already have of_graph_get_remote_port(), Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index 14965a3fd05b7..4040e247e026e 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -117,19 +117,6 @@ u32 dss_of_port_get_port_number(struct device_node *port)
 	return reg;
 }
 
-static struct device_node *omapdss_of_get_remote_port(const struct device_node *node)
-{
-	struct device_node *np;
-
-	np = of_graph_get_remote_endpoint(node);
-	if (!np)
-		return NULL;
-
-	np = of_get_next_parent(np);
-
-	return np;
-}
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node)
 {
@@ -141,7 +128,7 @@ omapdss_of_find_source_for_first_ep(struct device_node *node)
 	if (!ep)
 		return ERR_PTR(-EINVAL);
 
-	src_port = omapdss_of_get_remote_port(ep);
+	src_port = of_graph_get_remote_port(ep);
 	if (!src_port) {
 		of_node_put(ep);
 		return ERR_PTR(-EINVAL);
-- 
2.43.0


