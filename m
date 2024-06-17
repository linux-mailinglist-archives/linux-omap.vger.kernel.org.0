Return-Path: <linux-omap+bounces-1539-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF2590A116
	for <lists+linux-omap@lfdr.de>; Mon, 17 Jun 2024 02:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E80681C20E0A
	for <lists+linux-omap@lfdr.de>; Mon, 17 Jun 2024 00:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB72D8825;
	Mon, 17 Jun 2024 00:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="M7pH3Bk+"
X-Original-To: linux-omap@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2076.outbound.protection.outlook.com [40.107.113.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9230B4C6F;
	Mon, 17 Jun 2024 00:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718585953; cv=fail; b=UvZiApjd6IJ6ffookb++MCvD6EBnhB4c2EODWV0WtgdHgccrRD4jOPOtk3aBfCbzfMQs9KR9csoQMpeNCQjztpLRP6cm5i4do9L89Pfw16BOyLqoojXIBp5k6kF6UKjgHTdUaoIGa7EuSyjViISdcinBZYms1CApYK9ntZldYJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718585953; c=relaxed/simple;
	bh=wKjEPyL1kLmEa1RWUv0Xk7JzIG9DlELiQlr9OfVxw3c=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HCwgA+d6ujU+aUjOANRdYZQDMCSQFAsnwnpG1l8r+e8taK7wU1t/CgPfcZQkFSDI4lQJ5Fvj3m09XA1LOR56is/1pMyFBGMe2ihH08InIlC8uKCaTMrAIMr5j3M327LzdGkU8w6btyKQRHl+kORB5l86wcNZQEPbWox5pMnG+3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=M7pH3Bk+; arc=fail smtp.client-ip=40.107.113.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i99YgWDI7zf8jf+CcmEKLockPO/o9sMD2+eXddDNh0fWKVbStDvgNyC3GB+x9fr/1YcTjcuA0uABe9oAQdW5XhCI5iAo74lCtAS5Za1alkIywoVM1dhBlnI97mQ4BxC+lKGU0GmfAqZbTV8NSMLZsZNr6HXySXl6tMfqQgEPK76vuTReJoWej+QCrFG6zNv5w3E9xbXif//PftK3UYi9dim7FzUUGbPdTHGtQFeXZF0yd+G94aoN7l53TG0pwV+8ORJ/oJGm8i5VYkzNsVSwrHMuGHiQ5A0514fkWziIlMSaBZc2amjLkfiEt+3LtGoRVrLJj9kGpM/lBcQB+j8o3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rI+ZNkzrLrVhQsiJK5pQe/ZrYozduef8K4ZYQXjwTg=;
 b=S3Ce6HNfp9NFn8ghI5vAmg9M9XxZW/8ed87ijgB/0zUgPOAR/MNMipYkcwNCXUa7WhbhDNmiGcqZokEmJHNrFs8g8s2Jqyml90coBQS2mVrExdAwB9qL+ZHXM4E02rlEqJdhB02vZGpKWH0jeVxpl/v+YbWiPMSpS/T5cSwKWMy4ZBP9llHB6i0JEsa88iH+MJsJLyzQ6hQ3YBkSUTwADk2xFJjQD8QHMw3AyZmvSf8fqu8Jks4ljvVeZ+V3zaIWtyGF31n40drqAjG4kUU6yPRAKxWmKj7gSbkys9Z65zYbelytRZvMiV8cHwbXJDmu1lOptdw4/A/kYHxfia+LUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rI+ZNkzrLrVhQsiJK5pQe/ZrYozduef8K4ZYQXjwTg=;
 b=M7pH3Bk+EaFhy5dpe74UF7zX3TrJ/5BBMtEyGzJyvaIokR/C8rosdyzcsrR0pyp4sFRlLHChzTWYbF1b2eiA2oLbHG6hTcgWGV/ZK8WETHmVR4lxNkVDHlLbNamKf7JHgiNayy8f7VpoK/zzbJCd8t+ShGkPQkCZfOZfEHe5Ryg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8560.jpnprd01.prod.outlook.com
 (2603:1096:400:13f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 00:59:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 00:59:09 +0000
Message-ID: <87plsgs7tv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 resend 4/9] media: platform: microchip: use for_each_endpoint_of_node()
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
Date: Mon, 17 Jun 2024 00:59:08 +0000
X-ClientProxiedBy: TYAPR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: bed60a14-dba4-424b-ccb0-08dc8e68b1a3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|366013|52116011|7416011|376011|1800799021|38350700011|921017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JIY/taBUNQe8u5+H6K0260v6FscnJ9Ysf13UjzN8yjwOr9ebacTkE1OLp4De?=
 =?us-ascii?Q?Z69EK7SOw4/931zjnn1cbBqcKycXFJl8fEELSaGa2V/9S8+4iJ+bdxWi7MXJ?=
 =?us-ascii?Q?Peizy2cCigBqsVhii3nPqtMDcBpr0+MXe86AtrMiM73gX0N3VYkvhRRqccEF?=
 =?us-ascii?Q?e3IgS8za90rcdFJm+p2VO3qSbhqrg2cRa8GM8IYKfCP8CedIxxGBNNO8VmTl?=
 =?us-ascii?Q?3SLsHWUQPgtNZBZEkbphiiSd6teXqYf9Q/oD8jmz/HQUfzfQy4jYlTEHaLgK?=
 =?us-ascii?Q?vTeBiQDxzoEqTsRmuICMz/e+FL40hTszmzGyaa59NJI7dP321Rqy6YKnTGWQ?=
 =?us-ascii?Q?ZlNOJVt9oQk1BKKb8hNz6DGet47GsS7wAZ/RlF8WPp/Nvgdat5YOlB+x8/Px?=
 =?us-ascii?Q?3LNbAMnnAvZkaCvdZd5JaFtMet4C0YUTmHXJBKkprHHStmnVzPBuPePDe54L?=
 =?us-ascii?Q?0tF0XwL//rBOz/3okqUuBXEbN2UyJcfhEolL8afn94w5fNUHwGr5GIbb1pcX?=
 =?us-ascii?Q?zx06ZE65t5dJgqB9/KPJdDZ72hgwuR82fIjcNfkh99arD9FqIaphXyxDUP+e?=
 =?us-ascii?Q?CigC1/obkLR7bEnjtSPq7robYvUiwSEMiDwG1a8PvWHSPFPdplLFM0Ru0amZ?=
 =?us-ascii?Q?9IRSB+6BiYHk/KQasyQuYxL3mNFIKEpXsj1Qwq1a2hjfgbDdf3yVhMA3d59S?=
 =?us-ascii?Q?/O6+pMGX3p9AQA+/lOHN1MWw47nZwwmUNb/8hawZWdKVxJijp3/+2fuEF7Za?=
 =?us-ascii?Q?16uHOktSTY4+uz3WfhZJvUbweiZqTvOFu/SutvxeiVcmAaH4P29JzPTYlzd5?=
 =?us-ascii?Q?v7b68TUh4mQEd+fX2NjLDmUNh3EEGT25IARqj16/a2H22PxdTPJfYnnkx/Eh?=
 =?us-ascii?Q?pA5PORNVXlrHmXj9IjBdK+0FHzxUWVvlrVn1dgaYYM/XDCT2h1cng527/FgM?=
 =?us-ascii?Q?OID6BeK0nylaGx0wY3NMnbm/lRXB3UNrnJSAwyIb8i9DmywuDWtbqyf4/6wP?=
 =?us-ascii?Q?s1334RbkJ1oiGUOUic8r9iRHg8D/smm6GgTFe1UJfHBdGlHfEIFVffaftlwH?=
 =?us-ascii?Q?LbwYpwWdqJt/m4WnkS779LWu2tGJ//V8EJhe5oNlItmnOEgcg1mZrXQd4ANi?=
 =?us-ascii?Q?vUcz2tu8E857AUg4dT/YA4GPoPAjl7oygOe7lmGcOtGphdtGre7S/U8hbI70?=
 =?us-ascii?Q?fH/VqjS1kU1sRp1KYrm29HG/sFWRo2eDpsjHpsCvf/IvVJKUBIurmL8L3itd?=
 =?us-ascii?Q?8AeTgd6U39817zWd7gHnE88ZifUnHJbcVe7G3XWOFXTk7je5UzwtsfBX9XRK?=
 =?us-ascii?Q?3FHvhpWrE4QjB2E7qrTTi3/+woA2bwEMUttgJiliP5DiBEftSqjwk4l9FlK8?=
 =?us-ascii?Q?nIOOe0FoQTKBgQ85Sd/CDwBuuqo9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(52116011)(7416011)(376011)(1800799021)(38350700011)(921017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vjYk3bcPjoD+ILb17MYtaYSZgJAvb2r9K3f9Edn+8xgR9ilS+OrJQHev69ZP?=
 =?us-ascii?Q?5Jl43w2gmjxQOlpCP0o4aesjrUsVhwCrEoTOUB/9VgL2fLhB5FBuccuED1Bq?=
 =?us-ascii?Q?gnXrV8y4Kpaqp2NMgJ28zPKBk7pEpJEBjRxyx1FbM1kQy6Ltj05z/1HQCIZT?=
 =?us-ascii?Q?6VOdtTl5HgHdAy3jJDNi78PmjZyYmFKx+YhtUdimN4JYBt+Ekcuk5AIaP8Z8?=
 =?us-ascii?Q?TD6vFY2BxVriTADQW/kccaJJrc93kZhbVFgqrm5E0UOFWO2Z/1AqubPlTXCj?=
 =?us-ascii?Q?wpni7nKEARZ5c6n1jhXkU6KEuY7welCx2j1QvpCiqb3qFCq8Zf7oneZYbaN/?=
 =?us-ascii?Q?g8fRsLSLsnUcw/TiBWZkwJvfj0ETzUXq02YGMx5377yj4D0i1xAZBa78M6ng?=
 =?us-ascii?Q?QhxxMy2ET1Tlot2ZWYNN+AqPUlLoFyutUtEQiuTRecN9fD/EYVo1rucxJF79?=
 =?us-ascii?Q?1juZ997iJ2GptT7btyA5X9TNRAMkLoYh4E9B9cpLjFwgrYzJVXi25q3fk9Xu?=
 =?us-ascii?Q?PHZbmeyWo2I2VyRG3+cTe4V3OeVnNCIeRb2DYZxlZjjtT3T//yVKqiz5SrfH?=
 =?us-ascii?Q?OnWi9eCeEeriNouZXyhmHPq0na5ywk99Xh1gAKqgH3/QSZ4H1mZv4qQynGoa?=
 =?us-ascii?Q?81s54agJ6Iibp8d65r14rVitxkookq3I3+Il0+s/Ed7yPH/LftmLUpbk8lY3?=
 =?us-ascii?Q?1lv0rU6OuSgjBkr5p8GC0tDBqhdrtSowReWgDidawGFpqpUZ+VKBJTY7DPg9?=
 =?us-ascii?Q?M9XCospw7iDk/bIB/arkYHocJ5LIcU392DivM5M9twtYNjWLq6xx3yObCJyu?=
 =?us-ascii?Q?Aup6RYZqxHiEowE4gVywzk+xLFDtp+YnY27e+J9YENjs+pnMcoslruEANyvf?=
 =?us-ascii?Q?Jqu/vsSYRhgebLkPCKRsZJagd+/dEKMsv530OEEXPKAgBzs1WT313+fgOjRJ?=
 =?us-ascii?Q?7V0PCwS1dyqshDbyOUe6LaUK08NtpRuazHjRtWXhLarHVcSzoAwIlPVrd5kN?=
 =?us-ascii?Q?sXVHCXIow1H5Aoqp9SiihdgAJRKQLHXSMi6p2XEYhloW1LKm6JOrDy0AH4CS?=
 =?us-ascii?Q?jIei/uiKnqHoPQyRXOqQncxh4WFG9hgmZEIBWcsWRx7GFqsQ60xom4GVXmmG?=
 =?us-ascii?Q?SwxqUJDJXIoBHn1NCDk3et5v6xx5q42dxkW7c8hBgJCHN/9aCyINkpt/bddq?=
 =?us-ascii?Q?PrTprXVpFSZI3FR+C9IaRW2ODRXnzI/15IEli2mPSOYdx3urxvjwkrE/9srB?=
 =?us-ascii?Q?WeK2daKfVDXFd+dr7i/oVHj6XtE0m6zsKRG8iCODaOGYXIur7GL89eO2fmNR?=
 =?us-ascii?Q?Nm238hmF+QoR7vTOeOheVdl0T5gA9ahUpjQT8hPOT4cxZS0hTKzF6TMQUYJ8?=
 =?us-ascii?Q?7pz4rGcjpoLoHDZ9zp9ATOXeufcLwyEEOvoFJal9UvV54nsIXiKnE6hyBT5F?=
 =?us-ascii?Q?ojPQEkbsJ2jYxNmLOMK6rx4QTWaF4AjjvehzNV7gJm3rWZ1rVCzbmaJ7lFir?=
 =?us-ascii?Q?RpgGjxO2PVlNahn/iXYeSLNyCh9YuPh0kWdRI3Wak4jyo+9WQgth8g1jbjmw?=
 =?us-ascii?Q?+cToyps6/6vX/xpkTrODYFAeWh7QYoZg0q04MDFdqwkTAf+G9hq+HWUC9MPC?=
 =?us-ascii?Q?MngQxj9kR6fvy8u+10wsUgA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed60a14-dba4-424b-ccb0-08dc8e68b1a3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 00:59:08.9196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNb52TTNl8HocuCe6IYBsZP2QUggM1m4K9c5a5k6Kc/nQEiexa8yG0qHvpmWUyL+MEZuKtq6/H9tQ+AIEUq4lO47X+xe/nTGAo6dxCZUH5X7pimszGlwccEeOppJONJ2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8560

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../microchip/microchip-sama5d2-isc.c         | 21 +++++++------------
 .../microchip/microchip-sama7g5-isc.c         | 21 +++++++------------
 2 files changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index 5ac149cf3647f..60b6d922d764e 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -353,33 +353,29 @@ static const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
 static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *epn = NULL;
+	struct device_node *epn;
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
-	int ret;
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 
-	while (1) {
+	for_each_endpoint_of_node(np, epn) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
-
-		epn = of_graph_get_next_endpoint(np, epn);
-		if (!epn)
-			return 0;
+		int ret;
 
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
-			ret = -EINVAL;
+			of_node_put(epn);
 			dev_err(dev, "Could not parse the endpoint\n");
-			break;
+			return -EINVAL;
 		}
 
 		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
 					     GFP_KERNEL);
 		if (!subdev_entity) {
-			ret = -ENOMEM;
-			break;
+			of_node_put(epn);
+			return -ENOMEM;
 		}
 		subdev_entity->epn = epn;
 
@@ -400,9 +396,8 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 
 		list_add_tail(&subdev_entity->list, &isc->subdev_entities);
 	}
-	of_node_put(epn);
 
-	return ret;
+	return 0;
 }
 
 static int microchip_isc_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index 73445f33d26ba..e97abe3e35af0 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -336,36 +336,32 @@ static const u32 isc_sama7g5_gamma_table[][GAMMA_ENTRIES] = {
 static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *epn = NULL;
+	struct device_node *epn;
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
-	int ret;
 	bool mipi_mode;
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 
 	mipi_mode = of_property_read_bool(np, "microchip,mipi-mode");
 
-	while (1) {
+	for_each_endpoint_of_node(np, epn) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
-
-		epn = of_graph_get_next_endpoint(np, epn);
-		if (!epn)
-			return 0;
+		int ret;
 
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
-			ret = -EINVAL;
+			of_node_put(epn);
 			dev_err(dev, "Could not parse the endpoint\n");
-			break;
+			return -EINVAL;
 		}
 
 		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
 					     GFP_KERNEL);
 		if (!subdev_entity) {
-			ret = -ENOMEM;
-			break;
+			of_node_put(epn);
+			return -ENOMEM;
 		}
 		subdev_entity->epn = epn;
 
@@ -389,9 +385,8 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 
 		list_add_tail(&subdev_entity->list, &isc->subdev_entities);
 	}
-	of_node_put(epn);
 
-	return ret;
+	return 0;
 }
 
 static int microchip_xisc_probe(struct platform_device *pdev)
-- 
2.43.0


