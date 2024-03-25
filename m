Return-Path: <linux-omap+bounces-959-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A858088B543
	for <lists+linux-omap@lfdr.de>; Tue, 26 Mar 2024 00:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D3672C6178
	for <lists+linux-omap@lfdr.de>; Mon, 25 Mar 2024 23:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC1D839EB;
	Mon, 25 Mar 2024 23:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Vzqd2iT5"
X-Original-To: linux-omap@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11021010.outbound.protection.outlook.com [52.101.229.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03DF6FE05;
	Mon, 25 Mar 2024 23:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711409150; cv=fail; b=rQCygwxqAHe8+Lw1uJCmiAcWJiPbEHUe73oaDMSP1adnF+gLpDAADhjttTgXsv7ljbN3Kej1ezo1cpEfdqmRZOSKwloEWYeIVqoBTsya3yU5utfz54fBHmr+UZJS3NciL92pMeuSu5D+e8OAjSH6IgFl0qiWS6MYQ1WylkeTwkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711409150; c=relaxed/simple;
	bh=AGm2er46V38KSgvE6SRsSPHU4aSIZa0SXoz8JA9Qjaw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aMdjw/QA6vUdDg4Iuy5yEEdiBY7apY9dZppFv2/J2bblk5hY16VCaQOH+W1Z16UG0+XqbKlNwY7hf+z/CgMeOXCKAJHNaYEjFu6FWoF3nQDZkwD4UA02MWbA37nV72KNYSokgBb8HWcKIz5c65BHynKulI1wrumxzZUaxGgDGDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Vzqd2iT5; arc=fail smtp.client-ip=52.101.229.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2pYoS+RREiWgZXodXH2ueV7SMwnJ7sj6LmQ0pEX30IKPoqUpoM65uaNZ/uz8omzwWcJ0e7jn6Hi+w2zNye6sWUqTum+4QZKvQc3/K4jk8L+hoS2fwezG0ZCPpt+1ILFUEW1aWAF39NIIVnPr9/vL424Ea8ZkB3whCoC8FBFq0NzE95oUwiUB9OUkjBlfMrKy6Jc+hJEzaYIYYFik9S9RhVxPM/0dmwyWpV2gYWS/N7eD7Ih/+EuNcCCVdtPKxoMdxjmGhHsWvci6ngigNSpDOwAzlhTweYja3su0VOkpcXvuK0NQTBb+k7mmSABCP372FbvWVw/raVQgIlmWGl0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsjYRh1e2PvT3Ikd6gKoLvaqQjO3bDx4chU8GUoSNao=;
 b=h7eNe1EAx9V0ahntrPmqWbRRTR9HaQ+sBbRrvIiwA0NhU3tCGZgyTODFFAgWY14r5T/XfwZXuq6xagoWPlh+8At9npWjRSg4ylinGOkkbgo1IlVouBlULntJFGmS0F9qpfHQXg47Ut5TaY1CajUbx8/xz9rfkC8cj14nqZxZyhdvTDIXT7e3rOY6TzWuovO1ztFgRrbx2mKKs9tEdKtF8kxufxVS8r8JSqo5djOqbUUqq2MAMycL1o1quQU0rclWoj1p4u3WY777cK/eQhBwdyANp1B/FvtVojNS5WzD61NquiJjI4kRYIfi5vyE8WTf8jZCokEOWX0BgCToHB5Owg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsjYRh1e2PvT3Ikd6gKoLvaqQjO3bDx4chU8GUoSNao=;
 b=Vzqd2iT5XXe4Qtm88p883wRy0Yak5oY+1hfD3UwsvBeTr4jkGaL93vtEirjoxDNgkSBFhd4G3kTK160gEL+2xwjBU6bRy79iNIT38JaHeTbWzs6aBiXOJNB47d8CapLzStPKRq+x9VuZaWSGEEezQKGv2wmuKqTmTNPHKQ2zSyA=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11363.jpnprd01.prod.outlook.com
 (2603:1096:400:3f0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.30; Mon, 25 Mar
 2024 23:25:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 23:25:44 +0000
Message-ID: <87v8593nd3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
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
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 4/8] media: platform: ti: use for_each_endpoint_of_node()
In-Reply-To: <02d6efba-6d1c-465f-a06d-cf7c02656e21@moroto.mountain>
References: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
	<87wmpr57uw.wl-kuninori.morimoto.gx@renesas.com>
	<02d6efba-6d1c-465f-a06d-cf7c02656e21@moroto.mountain>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 23:25:44 +0000
X-ClientProxiedBy: TYCP286CA0105.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11363:EE_
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f0VsXBepvzga8PJVN2SkLP6piSc8n6uXcTRKB7UXR4wl2cGH6+m4DIRsnt53M4EmRLU+u0PUxotAaHt7hw1a9uHFoprUN+Yr3NDXz6sZ2/hK08DJdBMCKIVo7dgi+RI2XnO5yzKKsKUNxlPGkyZ735ZIs2Zo+lH+uGoTTx2JdCD33TWiTBTswewWFyh9I1RrCyWCzDPAD6jQ3ZEssEt+Jj1odmqz3Un04xXt1aArgQ/HTiLa+c9ZsRJGFOr0mdj50s2+QtWo6sU0c03q+TvTZvYG3xgMVEOeTg0vq4+5u/QHKXhBcCjDFtzd5210vajYJff3NtTt3UH6emhYOYaFptpUDyv8DT8dYO5JlhoIewzgyJBg1of3NU/btd3gAbGYTGfkSi++9yLMR+5rp2+RUTdqFVE4BwQA0MmUpFlCaZmNdJq0hbELzeUNxzNQFIDfKTRgnNJBI/Lzfz8Ez5po7Rn43Pz3Ow7Ron5WHRw8yLmAYitmaFLnynOvesCW6reMMOlmLFpCwArJo4DE/6IZZK3LZc33aIsDf5Y8HRX6tMTI+Vt8J7lywXSljURB/v7xL7XSC5wrPeBMla62oR8zuWeyt3q45Hp/TiU6FyqoBGg/TBzbR9vPVnzVY/oRaW6NTKIpuW190UMA1w6//07PYPTnRaWX678aTJ2C7RC7tqD6KNjsbDwyLR3nM37LFIlYqJ7lyeAdrPJ5EADxd+Edg/L5NNfPc0FCPA032U+SLWw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(52116005)(7416005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Otdj7hCBrakarc3Qlkg+INuMJBDm/reNCaJweXMrwxXNAxGELKZWGFQ6s8U/?=
 =?us-ascii?Q?12AZEwHLrlChDvgkHyIfgrJ1C+gnzxYYMaUDnVndfyeIbNk0HpRWXiwOK2Gv?=
 =?us-ascii?Q?vzjqA1kUmndyQCHGFWgHlqTaGBAtm1bM+s4bm6uD7JLS3TGmQkjtDMRFsjBl?=
 =?us-ascii?Q?kWmY/oEHnSP+QUNoUycuqODqLaKX04xqlAsnwr8GItjQ319Qe0TIUs51000Z?=
 =?us-ascii?Q?3QIR7D4OEhMZ3fmzkgF+7wnE8lL1YhCIwZt2hs1sxndLKQngnyUH1xYO8H56?=
 =?us-ascii?Q?VbdDh8YPskDn04lScTqNmRWyQrVc/YbRXaPhRrX3YwV668wiQDrCf2o86cEN?=
 =?us-ascii?Q?lY3k9NpoF7GAKTlmVlDfqsXhZL8GzpRGlQpvu/04ByomeFfsG2777OAt5RW6?=
 =?us-ascii?Q?8uVTHMPR/kJQrdaRq3oT4eXEn6BvA+YV353zAhpf8m6XPraDYz553uEcawrM?=
 =?us-ascii?Q?JwsNPzP10phWoRQfFlqVaIrFgkNZBaD1ojBG/lo5sN3UIFPBnBTfhwF9J0fG?=
 =?us-ascii?Q?sNfC6k8+7U01kElBf+qcDgTyaPhncUn8jkYuFIXPXUdRWJe1ptXpqZE5C9hJ?=
 =?us-ascii?Q?RTACb9G2BE8pYrhb0SnB+x4C73pfQTB2vERy4qqp0b1/6ElRh5eWbXJXGyS1?=
 =?us-ascii?Q?Im8DLHGbHotInhD4sXwRp2weyIjpqu0z8k2mtLHDW4g8nOjwcekE5qOQE/Ab?=
 =?us-ascii?Q?La2wRZfAB9RRz7LQiBlfXOlK9OGwbpgI0bsSpvWG8Wv2lcLcCrzEXHa0BtSo?=
 =?us-ascii?Q?TtspvCLzd+SBW3cpDyKq4SE6Hj8oYshMjVNtzJpzLvYp3QBrepNHb0i//tIL?=
 =?us-ascii?Q?j6Vq74V3P2P36p8bCqFMF/it5caO2Dh/w9xvEVHA/iVkGym36weP7l/4Zys7?=
 =?us-ascii?Q?JJPBXDm961TDoD+XEGLy4PMCoDPiHimYxBH6TvlnfNJx7J6U02PYFtAg1NkH?=
 =?us-ascii?Q?XV9uRhzaqad1RYu/d7EDXU2CYrRjQFJSqZc18mOXaplGyhi7dpZXpKrUwcY+?=
 =?us-ascii?Q?hYHMgAx1oGjFxeqvxRElYHvCMCSfqFwDKrz80tAJzWnnjFaWfKmtDoVGijXm?=
 =?us-ascii?Q?o9XXxwt7apHE0vJ881DFPZg8axCoKG4aNHfAhZoeVpg5pZ9QJtX0uHQuvsGW?=
 =?us-ascii?Q?16YCJSrqS5f4LefCYviZslBw6nf55I9pib60j2tdMlveHuP/BCnVosp+rBa7?=
 =?us-ascii?Q?P4xQjAlOdSQ7GNTICWDIFhnA7AH5pyTfzDnZGjQ0EaSnscYa1eTNHcQpsDn3?=
 =?us-ascii?Q?dMGgOsoCWJ9qamnccIL67tlvnN8pV2xZslAcL8ggxu7j3aostjhhHLOibm0J?=
 =?us-ascii?Q?nxyPit/rH9xqHhwoiwdWWorEtPBRZqhpfgTpEXiGNIfezsmQFB1d1dPBmksF?=
 =?us-ascii?Q?ye8osyk53BfRxX7HT+HBZUKapEcBnA/XRVjMh0ZfJffuUMCR69jyU/PtFKKF?=
 =?us-ascii?Q?XxK3Bph/s7fgieC8Y1syxLehMcQUOUPyjLmCDENMftdsbHVgeRF9bxBuSJqU?=
 =?us-ascii?Q?gfzoA881AKFJNVSVrpyBb0rAhb+I1xoetPJuyMPuGVaxEiOClERDnpWWPRFf?=
 =?us-ascii?Q?nmoMe4gvPXACoWC6YdSRFDlmme9GybkuhFRNrlmePhbCyksAwihrxPRyrhi0?=
 =?us-ascii?Q?rPqiCvI3zwDTHla1JUZilXM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7b97c3-4530-42af-079b-08dc4d22e51d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 23:25:44.8872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aHQzJyttKIj86TtmFM7NaeiTJsD8LjERlZD2p3ni5GaPw0mQnrEl4EoXjSU9IWdT7bqcanwwFaiKaVpenlNKqO7yF68ozqc0gl7AK9AHoETx9r3lTTnEgC5ubBRfN8d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11363


Hi Dan

> > We already have for_each_endpoint_of_node(), don't use
> > of_graph_get_next_endpoint() directly. Replace it.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
(snip)
> > -	for (i = 0; ; i++) {
> > +	for_each_endpoint_of_node(dev->of_node, endpoint) {
> >  		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
> >  		struct device_node *rem;
> >  
> > -		endpoint = of_graph_get_next_endpoint(dev->of_node, endpoint);
> > -		if (!endpoint)
> > -			break;
> > -
> >  		sdinfo = &pdata->sub_devs[i];
>                                           ^
> "i" is uninitialized now.
> 
> Also in the initializer it has "struct device_node *endpoint = NULL;"
> which is unnecessary now.  And at the end it has:
> 
> 	of_node_put(endpoint);
> 	return pdata;
> 
> Since endpoint is NULL this was always a pointless no-op but now it's
> more obvious, so lets delete that.

Thank you for pointing it.
I will wait other feedback, and post v2 patch in next week.

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

