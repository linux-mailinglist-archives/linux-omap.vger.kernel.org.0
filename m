Return-Path: <linux-omap+bounces-2006-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC73895E6E1
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2024 04:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E9CD2819C3
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2024 02:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D593F29CE7;
	Mon, 26 Aug 2024 02:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ncy3+Bjb"
X-Original-To: linux-omap@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A062FFBF0;
	Mon, 26 Aug 2024 02:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724640230; cv=fail; b=CofA9nROJEmb5qphzq+DwAEUxUv5MOiV2hBxy33LQkzZYNl14B1dF41X0TBn8RGoSnU8JPhrqwtH6xutzwU1F5hHBJ14HUNxR80iNak1huYqOserS+f1ZtUIuaqkYgAge6Q20udMj0isNA4kUw3pufVEwXpr7QuURYNsIV+OESM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724640230; c=relaxed/simple;
	bh=uQjHKNaDFXAhjUR+jkfCwvX4linDGnUFFcndK+2+0cs=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VwpdmkvRKNM/0xh8LWA1/AIdk42FohZ4gegJrc7jGuM/ahtz8CMfrJ5f/KmOJljbk+PkQ70QNkPnNrNsonZW+2pdQsel/oPWjllamwn5ZotZOGPVoNZ2UgOM/sXAxI9W533vMzHnMMlc7dx2Eh+QkRmlDqyqAp3UNKghRSJmSjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ncy3+Bjb; arc=fail smtp.client-ip=52.101.125.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSqiH+Ib9Ord/uhLuNVVPhHAVRql9j+7wHxXbpkVPIfb8+EukH9i9YjsNHySV1JYm54N3yScqjQw0HUHXElEYmBMFJyteuNUyjaNYj1n8lo8/QuhYix9HZyA66K34ex3x0uNdkIRziiRYsdTSychQribdJ5CzWcxCVtdwSiIuK18MZEeeVLoXkdUMg8lI7h+49+OnLalLgwM2JDek6t1lxiRFV7pOM2vSBWadDrQE+mHRc9t51YT8sMrpuveg2M+SlGVvqHkKeg+Xg+VS5763ElIxPeKG/7GgoqJy3qxJZ1/rcYgvyTEqTdmoied5tsTf2TxxjFvm5PBKUlErmth0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhVHY4ekwsLyU2IblZvMiGZepwxCoZAB7m3si6qd9xI=;
 b=To3sahaLf23q4J85bEIxtb+7o/Aq9RplncPYKs+T/BvQ29RZCz80l1LoqZzVgq3pT1bvlXemagzyeyBoxJVTynZC8D0IVY1dVa25H3FUPGdUKW5Bg1L8SW2kaXnTPTptl3MNpi0Jl0cqyzt6Mw3B6Y9c98bbKTszQ/BSuFCUd+YHIiZ3L/dfAWhq6njVnmsPY6SOMawa/CT07AYzU7Z06RmNQn/hHAMSDkBM4Whc/FXowgX2/w0Z7bOFP5Br921kbKsuBMwLGaZBMG8e3zPHvK0NVR1W7ehycasUNFJwHccZ8VWTCDrzHoMSm56BNQ381qEgSdaDsAQa/a60AB+Lvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhVHY4ekwsLyU2IblZvMiGZepwxCoZAB7m3si6qd9xI=;
 b=Ncy3+Bjb8UpTWRzbhIA0InAyHOC+ExN8qnRRMiLPdf0uACraeNlrdRROLIhUo255xlxMuKbgTh9IwgwkOJnXHzt2y/9MacI4t0dZt/HiLdibCxIXy+l+iIPLHrOjW5XfshlKSI8FncpC9zA582qoQ3SIss0PUVqZJcC/NDkmpzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10616.jpnprd01.prod.outlook.com
 (2603:1096:400:290::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 02:43:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 02:43:47 +0000
Message-ID: <875xroq9zx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 5/9] ASoC: audio-graph-card: use new of_graph functions
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
In-Reply-To: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 26 Aug 2024 02:43:46 +0000
X-ClientProxiedBy: TYCPR01CA0139.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10616:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb7ce6b-0a08-4e6a-9b5a-08dcc578e896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BDU7MDeTGDrPtR08JXLMFlYA4SIKMEAV8sD0Fu4UrJa2SkZazbl9Q+3CPfNV?=
 =?us-ascii?Q?+eKAqOyYQX+Ud9TuF72+GZNgAKBk09votu4G8GwaIDe7TQRCj1Rxo0KA53M+?=
 =?us-ascii?Q?IvANH4zz94cJl1UGGeXYSWT6DG8x0laqEg9AmiG9VAa5SoSueb39lWFofQwf?=
 =?us-ascii?Q?3pHIi1YBg9EugUnz2b9ps9Wb0VyndmlCG7J7nxXKi5zudhmUe4UoAgrmneWu?=
 =?us-ascii?Q?qyWj3Hbw4JsT0BxCHRHYeDg9jp8ioJwEZ2bCdxEsNr62iTb78mxfjJ9bH+B9?=
 =?us-ascii?Q?PXQyKrqbKoDADvNMQ6PedXZi8rlCLUBCVUi9KRvNMbvGCryUIk3T99DpQwzr?=
 =?us-ascii?Q?+YzMBK6E6vFcYZUYHyOKrQplTfFfYYdrLnXNGW3jid22TVgs+cVC7ex2q3L1?=
 =?us-ascii?Q?fgrJk53mo77I2kQ/Nd+2560R2lvC2Vk6rKcEb8aJ3+LcAroGsiGKTz+PWOaL?=
 =?us-ascii?Q?a09cjEa4LlO5Bc8uVg2CCYPErs9RJIgsm//I8ylSaVob60cqqJBjh4geGmXh?=
 =?us-ascii?Q?q7KY3uxN85FuJIllnVrSjwtBcjvqQdPgxZ+6JTY7orlumOatGjmZ1rATPSez?=
 =?us-ascii?Q?QEkGXu8smAr0EgZ8wxbzdYGYB48mOFxkQCpujibYM/IvCfA6a6X0eg7PQ/TC?=
 =?us-ascii?Q?KT6aIEs/MY29Z8wTPsIYGRhDSZ3Qmcc/zhZI3UXjiC1Hp84hmEanJ+gWdN9Y?=
 =?us-ascii?Q?J+RsF4f60YCaiaaFQsyX0hIhJP73ONwrBUNt7e/fhD3XSRKRJj1cOrhNF0ia?=
 =?us-ascii?Q?sJ2edXVeHvdZX4jzFCCe0BnBM5FQAKSS4GFerNhI5m+AV6av+m5Z83vE6zoA?=
 =?us-ascii?Q?Sr0SCloSZCzjAbcEkxbRpIda/ZLCGmuJV4IhIIcI7VZ2tbRzXat9d3W1ea06?=
 =?us-ascii?Q?jZP4GSVAoYBRVke4U7BAxjZWqC/Q86l3K6VO65VVODYJBGyN1by0fzD03wv5?=
 =?us-ascii?Q?HyaZEvQMHtvMCk50CZYsXnturRLs6hl8g3yyBgPa0M0JyMUm5BqRHtVOr1DJ?=
 =?us-ascii?Q?trDxqKNDyESt1lfTL+LpN2ggIuJELmKERDMsa7PJv4mnjZCf8z8kOk1owCOQ?=
 =?us-ascii?Q?6rvUPQ5fN+qJOZER9ibzxw3tTjXtZzw58LLo+NY450mIf9MATHr2BwVyrWFY?=
 =?us-ascii?Q?MQF3qIH2rSzYw6vzBNJXWB1J28L80kynP/qVcP74uKF88RFXwYrlviOPXADe?=
 =?us-ascii?Q?67ztaSbJbmBe34spjghITDc+MHsm7KSuzlW6dLE1c4P05ORnt2/8HVNikY56?=
 =?us-ascii?Q?feAA5Wt/K9zKs9orWowjEc/20qklO4eQcyA1KFhA9M6GG8nJ8akCx591WBc/?=
 =?us-ascii?Q?g2EB8xRsnm9nqslb8HjYDxdGXhsB+6NSMvUzK34a3Q4WSEg7FfOA9DbQywHf?=
 =?us-ascii?Q?kZ1BAI9Ebs0qQsOZ3T35L2RB/caPBYvwkgdJBlvFUBnGruIH1M0wTq90ovyT?=
 =?us-ascii?Q?eVefNhXqczA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k3EDdWHHRrJTdwDMd9ckzL9KJagonfN6PfE0XIuGaJKKHInpcnmqXYKlE70j?=
 =?us-ascii?Q?bulvU3cvITJFnjI9bT8IbHKjeyjfI7vGlsK45/vZ68QNdega86TC/i0YWEms?=
 =?us-ascii?Q?sHKHSST029pVaFJEinQIRO3hAsNc7atcmWvwfdQzOrW3CBZXvAy4pF+fDeAQ?=
 =?us-ascii?Q?/u5/jLqT82h/xRwl8amMJwIUQVUId1eTzBsW1U2mHX3Bq/9cIy+HT48A+rUo?=
 =?us-ascii?Q?CMjJYsYtvqq6+kqImq6vf2Jk3njA1XprLAQrNHtkQalyHiJ4djT5WFUD4Z1w?=
 =?us-ascii?Q?nw7+2WPfGlwT2VzNvT59rxBPH9me2A1+Jt9lls44/3yDMBG68ygBlU25tKOE?=
 =?us-ascii?Q?rRnqHog7pEiyATy0RocX6XTUxbLk6wqJBdyyh237Vxa/VJwkymAselgCQxpl?=
 =?us-ascii?Q?VCMCnRqLxse2rKpGwd3L1ki+7xzPaa9uUceN8KAx2xQ72Tg07D5jeMH9SrlR?=
 =?us-ascii?Q?x2HB0jPBxlOk/CUUGcZ0GMlCmGTio08hmZ3F6O147ReYNsOwEOmDfjBmU9Vc?=
 =?us-ascii?Q?beeYMRpuA4WWVsEaELt/58N41eouQXn174+0LFcHigSnXC6y09KMIMfOZH0a?=
 =?us-ascii?Q?11A/23+ZgNU0vOi2Og2S1rikjnJDxYsXRQnKmFZljw9MlUoEBaFYRjODMuLd?=
 =?us-ascii?Q?YZKY7irhqqKzJQsafOkBTaKwFbDi8e3A8jaAnxFfQhedNMnJ8h+5nGLCgxOw?=
 =?us-ascii?Q?BgorqYKtkdwFngqFJ2uW75XovhIP+1a6H1VU8WtDbaiJrteBLa7UdLPYz27l?=
 =?us-ascii?Q?+Vv1OIfYLdmGxlvHdZDwvlPuh5SnIaKpR6lAzWvdLaofzU1tTygSoWBTm/VX?=
 =?us-ascii?Q?jON2wNhDEa37FhDOSmmunpqu4EDtnAsPHL0PlHIJAN5ELLWFVsZNX66EhrRH?=
 =?us-ascii?Q?sR8JOTXnsaaRKaGKnbcw/Zt/wU9oQHwO19/B/iAg0hD4TdCtm0BP1u+6/hIQ?=
 =?us-ascii?Q?CHW1BJd3pDsxZ9xF+VEaT5BVArYN9ou9OKx4gbHjbZXAojYDLdaj4s07D4Lv?=
 =?us-ascii?Q?r9Eqdlivexe7OLLCQuKGzR7b/H6RbfLeGGc8rHHWzSKt4EfkNEM9ejdl8XJ/?=
 =?us-ascii?Q?D04Huo661fD4NnfRYzIjWxadSWAcT1h3NORXg9pUl0XAVjNorkOFLr8FlnTe?=
 =?us-ascii?Q?Q3uwWEOqxdT3X7Bv2kNo9UKX7MaD/a+PMDs66Mwfch092FaU4aUFFJtXUt8M?=
 =?us-ascii?Q?JEJGJba3t1rq/ukl+/cyjFyMQMVQhzAm4/AIA+T53++Mkog+KGKvvRiZQMwr?=
 =?us-ascii?Q?e/lF4LZEG5sXzQCe9wt3Rsvkluqv7bLByhycgLkRktTn/dgmXfn3e4UbrL5L?=
 =?us-ascii?Q?4n8Zw7EpvSle5hJXWXvgwCe9BEiEuFEGUlv7gCjItOwrfGFpfyPEfPFs+qQj?=
 =?us-ascii?Q?GP6AY8UbNc29i9H0Pwqe7UxPEGqslbvbw55aSq6ynimnHFhVnYtBp9+euPa0?=
 =?us-ascii?Q?xxtAdoqMmcwtMBLkeOO0p4x1M9epbbGxI5dHEFGIAEGNtMTcfX+z6NIyfIZs?=
 =?us-ascii?Q?DtcIIhCiLIOcavUDjxX//C/4gAt+OQQmG9ynAmyPt/kHmMtJwpSMUQTaXLpw?=
 =?us-ascii?Q?0V5e7twTzA3BUyNiZZalexf4HD0k9z5ZeIrOrzI45QrotTu2MktUIx0Dwv0B?=
 =?us-ascii?Q?cZ95XK48JU2F9B/CWFrrWy0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb7ce6b-0a08-4e6a-9b5a-08dcc578e896
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 02:43:46.9524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJekt30sVGgx7IuMpYRQvkIe3gDc+KGrdeRa0CUEbiOa8ixeZ2QL0sPbaC6uaC6oRIl5PA8FW5buv0cdF4IK/BNMk20DdGZB/X7MZ5QILQQfvEGB0ErJOV9CN8JKtKlG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10616

Now we can use new port related functions for port parsing. Use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/audio-graph-card.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 1bdcfc4d4222e..efc5e86a914ca 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -374,10 +374,7 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 		cpu_ep	 = NULL;
 
 		/* loop for all CPU endpoint */
-		while (1) {
-			cpu_ep = of_get_next_child(cpu_port, cpu_ep);
-			if (!cpu_ep)
-				break;
+		for_each_of_graph_port_endpoint(cpu_port, cpu_ep) {
 
 			/* get codec */
 			codec_ep = of_graph_get_remote_endpoint(cpu_ep);
-- 
2.43.0


