Return-Path: <linux-omap+bounces-465-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D23A18435CB
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jan 2024 06:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B81EB23769
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jan 2024 05:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FBD405FD;
	Wed, 31 Jan 2024 05:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="deLkzdZl"
X-Original-To: linux-omap@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E7D405DF;
	Wed, 31 Jan 2024 05:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706677661; cv=fail; b=fGvmN0PpCIJ48L3BwAgsqAT4yUkGvozb70oQRmYVcgZdyYIvo+e8ed/w0Li6D4BinQwFFuGhrDD00nkTs1yYOZTDwwTS4+BnOL41S0R5cQpmaoiLsrDD4BPkPdgF/pP11nBAFO7NgVnNSMtOTJ7DxXSPUAj+GWHm0WaUd4RJaZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706677661; c=relaxed/simple;
	bh=5VAs1KQTNTzCnb3g7QL1QAT/oL29+yJC87qcISM0iWg=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=C0oN415OLtd+k6s485DO9VuYS8vGTasiaEmWipsSs/FTs19Pr5CylGsThoULlH/m0WdyKYPrCrYrvpz9sgypi9/DKD/lSPVjlucXbljwAsIIQiGhyTFZVB8/b7M0eYxTRu/cqPGEygXSKxHLGlXpT8Ze7aW+4V2k9lrjdJoQroo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=deLkzdZl; arc=fail smtp.client-ip=40.107.114.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTwORU4PyfsvTYc6pKQE1c5VPLShX2mSZdQvEzYufy57Wu/4ucLBEBMLGE4Ttudyd6mYRqRxg+GsP+3lq5GLMJ9MGCt9a5CT27Z5rd2fNx6CNkYH9A8OhQx5XyDJty/2rY5gGabXOe8Ua3wmCKf8WDPc7SiibqYS+i2WjgN0pgPy3EoT3JK2yJ7x8FrHl2og0D+304rCeEIFvGSuk4huMWUu6bD97xbVIWPlPaVfuF3X0yqhQ0LqNMMk6tO421AVCF//TuasBlC/95y2wpHmijuZ6Q3TDsmv0wVMX7LwC7Sm3gQvNN4Djv/Wy3hhs/577n3AKyGhh+D0aDZn331Smg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkQMqMHNzGBNFV13iuUeVRTw/iMGfmTezXaXKaO5b0M=;
 b=lvl8axl/47jFTzyFzdCExPfKkb9p86cqwH4KSx15FOMELXurdZnzCT5scVstjqQEkSw+uGqk0env6EGZOZ1MT5N8m1cYHTsZ7mVsBabP5i9hcWruRh6Eh5D3OlJOZeroAcGWOtinotT+5lqzWTongIYDO3PrdSeUDQZtDoEf3Lfd+3oCHZXz5FS1zL/lmrDP/4hB0yVi7lajwIuo3BIoWum47pqRAENmOwPEmHUofO2P9SZgEfxZKm2fi3HCwHcfbj51LEaq1eFpyGiGKmyD3Lc64+pbmVUQUw0N5CySoofiiox/UgGmF+MVul1LaUGJ8U2Y8Y3TgmgXXs2cU5Dq5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkQMqMHNzGBNFV13iuUeVRTw/iMGfmTezXaXKaO5b0M=;
 b=deLkzdZlxIDqN1cld+awIMzVjJki6ZTsNZKoDljX8FQfK79aPqdvMMZoiKYqFHX72SjhQ6v4bpw8yH4pR3lUjrfz7umZj6kUzDpGvvAFAhwyE7swDGXgltf9t5hZpr3bbuSJgUyuSySmqixK0rK7JLsEUGs1OT9dj7j3oQQWzkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9898.jpnprd01.prod.outlook.com
 (2603:1096:604:1ee::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:07:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:07:36 +0000
Message-ID: <87sf2e5bvs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,	"Lad,  Prabhakar"
 <prabhakar.csengg@gmail.com>,	=?ISO-8859-1?Q?=22Niklas_S=C3=B6derlund=22?=
 <niklas.soderlund+renesas@ragnatech.se>,	=?ISO-8859-1?Q?=22Uwe_Kleine-K?=
 =?ISO-8859-1?Q?=C3=B6nig=22?= <u.kleine-koenig@pengutronix.de>,	Abhinav
 Kumar <quic_abhinavk@quicinc.com>,	Alexander Shishkin
 <alexander.shishkin@linux.intel.com>,	Alexander Stein
 <alexander.stein@ew.tq-group.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alexandre Torgue
 <alexandre.torgue@foss.st.com>,	Alexey Brodkin <abrodkin@synopsys.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,	Andy Gross <agross@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,	Bjorn Andersson
 <andersson@kernel.org>,	Claudiu Beznea <claudiu.beznea@tuxon.dev>,	Daniel
 Vetter <daniel@ffwll.ch>,	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Airlie <airlied@gmail.com>,	Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Emma Anholt <emma@anholt.net>,	Eugen Hristev
 <eugen.hristev@collabora.com>,	Florian Fainelli
 <florian.fainelli@broadcom.com>,	Frank Rowand <frowand.list@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,	Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,	Helge Deller <deller@gmx.de>,	Hugues Fruchet
 <hugues.fruchet@foss.st.com>,	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Jacopo Mondi <jacopo@jmondi.org>,	James Clark <james.clark@arm.com>,
	Jaroslav Kysela <perex@perex.cz>,	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Hilman <khilman@baylibre.com>,	Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>,	Kieran Bingham
 <kieran.bingham@ideasonboard.com>,	Konrad Dybcio
 <konrad.dybcio@linaro.org>,	Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,	Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>,	Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Liu Ying <victor.liu@nxp.com>,	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,	Marek Vasut
 <marex@denx.de>,	Mark Brown <broonie@kernel.org>,	Mauro Carvalho Chehab
 <mchehab@kernel.org>,	Maxime Coquelin <mcoquelin.stm32@gmail.com>,	Maxime
 Ripard <mripard@kernel.org>,	Michael Tretter <m.tretter@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>,	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,	Philipp Zabel
 <p.zabel@pengutronix.de>,	Philippe Cornu <philippe.cornu@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,	Rob Clark
 <robdclark@gmail.com>,	Rob Herring <robh+dt@kernel.org>,	Robert Foss
 <rfoss@kernel.org>,	Russell King <linux@armlinux.org.uk>,	Sakari Ailus
 <sakari.ailus@linux.intel.com>,	Saravana Kannan <saravanak@google.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,	Shawn Guo <shawnguo@kernel.org>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,	Stefan Agner
 <stefan@agner.ch>,	Suzuki K Poulose <suzuki.poulose@arm.com>,	Sylwester
 Nawrocki <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Thierry
 Reding <thierry.reding@gmail.com>,	Thomas Zimmermann <tzimmermann@suse.de>,
	Tim Harvey <tharvey@gateworks.com>,	Todor Tomov <todor.too@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,	Yannick Fertre
 <yannick.fertre@foss.st.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Leo Yan <leo.yan@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mike Leach <mike.leach@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Sean Paul <sean@poorly.run>,
	Tom Rix <trix@redhat.com>,
	coresight@lists.linaro.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org,
	llvm@lists.linux.dev
In-Reply-To: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 22/24] fbdev: omapfb: use of_graph_get_next_port()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:07:35 +0000
X-ClientProxiedBy: TYCP286CA0296.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 876d630a-0860-46ab-7388-08dc221a8a15
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BJMYeMNXQ0nBGLjuT5tIgleq+YMGZrkQowDrcNT1p/c9sHFMXjjnvUPloGaw7OfCV4tUHxdPbTjGsygOwW9OJpfDHO0d2TJeBOcvIALSGMFq1aJFjCjJRAP9Zrt1idRccIMbag2tE36puIL0YZc/8543EWAVE/rmIoxxJMYwFdySV8PjBIlQBfhyRV/l3CRkmH7ZEUVZVHFtN8arMzOR1yD6mRjydOhkLEItFSQNrh+haIBKrOCQFVifDHOyf0xc9l14ZMW+rnnNEttBwIeFakdIWfajhSN6deb0yEhD35e5yjGWi5PTPi1O+OrxP5fSfDewlycRbU8POHySxjmCbgBaVL9MuciyOgfr2N4vqzNqNlMJebTsb1VzWkRadT8CNZjOQBqw1s0JqJNq+n3E/B67NUtz4Fnv3WmCViJ79uPDFuHxf60DjJgRlQfRbdRtt8mnmCfPuZPw0w+ZBzUecF+evfmwF3Lk3JSEHwKSQgKc7PKU2CJF5v29K6TEwRZnmVrowTcZJGExRDJR99wCaKkMjNy9g5/n56WyppFMcDOJk4vRGqB+iAHmza99M3u+Ey9Zdl4Lc0KD3RED5Ivn66PwOG4k2I39LiNYuSP0eAOhwh5LT9bnS6JZXmr9S1I3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(346002)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(1191002)(6486002)(38100700002)(2906002)(86362001)(41300700001)(36756003)(7276002)(7336002)(7366002)(7406005)(316002)(66946007)(6506007)(6512007)(66556008)(66476007)(54906003)(52116002)(110136005)(478600001)(7416002)(83380400001)(5660300002)(8936002)(26005)(8676002)(4326008)(2616005)(38350700005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ecu1GgNgKzdD+2h48ZLLfGBT5GXCx8/VetvzxrSMCXtSHAwWX49WvCO2myd1?=
 =?us-ascii?Q?dwXeAeMnhOZiWxtlBDOXp4g4ebhcrkwuoONLMOdxJIELlwfMhyTB7o+P12+F?=
 =?us-ascii?Q?ZIoQeJr55A1kV1Pukzu4lqRKCfy6YbKrBivki4LICO/j28ZjZTyT+fn8oqiJ?=
 =?us-ascii?Q?+aCk5lLLG1I+cSXAii2r+KmOm5PNAHnvnogBqQQIaLJUm3PARf6saf05bsm5?=
 =?us-ascii?Q?Bt49B+m+i1Q5w3e66Zp4YVQ0wjpr3lMl8ajnqW19ioBJ8Gh0crDSnYYUdsTo?=
 =?us-ascii?Q?G3iPZ1Gls/kpfFK0ccqKkUV4yDdra3XxcM0R06G1iiIox0+iPtPxaT0R+y+n?=
 =?us-ascii?Q?uL/9Tn1RDcOsRRdZ5z8qIotTmAFR2FtTRlxQLY2uLsWSSvjtXJhr0krT2wMl?=
 =?us-ascii?Q?mOpburWTf+IvhuPVlgzCyTOVD4swvCK6svtm1I6VNkaNcssZ09yRUSz8Q+v9?=
 =?us-ascii?Q?3L/5ifg7mr7Pg/Nl+3uerq7eUq8AmHZqbCg4mflEQ2rhBL69vVM8wIg+LqdP?=
 =?us-ascii?Q?29f0Rps6ZIyWLQFCFlTik9BN+XaECZegbsnilBTrovBaErO9Lkoj7FH5+H8s?=
 =?us-ascii?Q?qiD5AWCFuj1MuVYoHZqpx/bz+KOaRrn+eW3pk/a1DMIFi7pW85IsAThFvWBq?=
 =?us-ascii?Q?Q6/npcHjpmoY4b1cbHuXhH8SP7ep5yAIuQ6dOW1c5QapvYhyZlXK1x2Y7kH0?=
 =?us-ascii?Q?bczBlFNeo+4Fy3MgLS5zU8p+896AhzgQarMCvtkaBfXuVYDcAGSh/bhg8Vdf?=
 =?us-ascii?Q?Tbs3+OtfrVkjdgWAiitxA25kJUuLc+ZtounIxIx7MgsmGrpwWiCMQ6RhS+JC?=
 =?us-ascii?Q?JeyvhS4NlzU/sdDfFaeJNPJDnGN5y839RuJu0Aj7u38oao4ghjU8S7yIaLII?=
 =?us-ascii?Q?vvtX42ifMm/JLtlNwSKDh/61Cwm1Hlrq3W91Fbp2TmmZHx28bK3ylQAAYThi?=
 =?us-ascii?Q?lvfYhUDcMrMieWYMVwgUyBQ8vZ/xsnp8K2ektUvDIyRxirhX/4wz3xy30xj4?=
 =?us-ascii?Q?3oeHc+uyZplgSH4lTgGdVVrviUKsCRH7zjaqmxrDYjwHEnBiRKORVVg+l+PN?=
 =?us-ascii?Q?FtsPGhB6XM00TKpGhE5uDsqtbtxefWLxAAMGVroz6bCQPgPrBF78T28RAtC8?=
 =?us-ascii?Q?Tdh0SFb2mRe0tZudZqINLKd7YYuwMp11lwPvlKUIssJ1VQaodIz043J0RF4n?=
 =?us-ascii?Q?KmD5PgHZVg5X1moBD5xItT4HXxHLHrBhu5JbJWMDvHIwfPlT+deANSszsoF7?=
 =?us-ascii?Q?qEPEIAKuTJ64lL1Zj3xNvj+O33/oJ3jiAZ3xCkIwbIOYcB/H+QOZJuoPJJbs?=
 =?us-ascii?Q?Dl9Xh3ULApWo82R4ev+ngSJlWMXjeL/IL34joQP9+qlVG+udbPoWPNIgnh0A?=
 =?us-ascii?Q?c4SUhI9tbenffP4LN8WBqDNoR4VIquQh3Uw8DFW3UEZzxDV6fulIouT1RzeV?=
 =?us-ascii?Q?paxgoU5piefuLT/rUFqLF0yOAfV6YqSsno9UYKhkJbGYO09SK4O0mT6+GEBq?=
 =?us-ascii?Q?oQHDv+miOwOeddqOSUbRskAUsvxhGztCFUNVwzfLowL2D/sGStz2JFBPwYxf?=
 =?us-ascii?Q?VnNB0oT556YZ6db1s9rbVQldcq91/WPOqWxiZIlRZw1Q+XNjpdljvToAh4AF?=
 =?us-ascii?Q?MfNPx/+U5Cb5EZHwuVwRfyQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 876d630a-0860-46ab-7388-08dc221a8a15
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:07:36.2155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2eCxHTgLvwPffqKEP4Wq6NiQ3zkiEhd3RxENPSweaJ2O53gdoDDrLvwaz2UtziL7enzyNRMJIbecYShHdjCI4cn473p5bHZ+12W5BA2Q/Zy4UOydtQSG9XiuhBB+Shbt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9898

Now we can use of_graph_get_next_port() for port parsing.
Use it on omapfb.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 48 +------------------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  9 ++--
 include/video/omapfb_dss.h                    |  4 --
 3 files changed, 6 insertions(+), 55 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index fe6c72d03216..321ae18f2747 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -15,52 +15,6 @@
 
 #include "dss.h"
 
-struct device_node *
-omapdss_of_get_next_port(const struct device_node *parent,
-			 struct device_node *prev)
-{
-	struct device_node *port = NULL;
-
-	if (!parent)
-		return NULL;
-
-	if (!prev) {
-		struct device_node *ports;
-		/*
-		 * It's the first call, we have to find a port subnode
-		 * within this node or within an optional 'ports' node.
-		 */
-		ports = of_get_child_by_name(parent, "ports");
-		if (ports)
-			parent = ports;
-
-		port = of_get_child_by_name(parent, "port");
-
-		/* release the 'ports' node */
-		of_node_put(ports);
-	} else {
-		struct device_node *ports;
-
-		ports = of_get_parent(prev);
-		if (!ports)
-			return NULL;
-
-		do {
-			port = of_get_next_child(ports, prev);
-			if (!port) {
-				of_node_put(ports);
-				return NULL;
-			}
-			prev = port;
-		} while (!of_node_name_eq(port, "port"));
-
-		of_node_put(ports);
-	}
-
-	return port;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_next_port);
-
 struct device_node *
 omapdss_of_get_next_endpoint(const struct device_node *parent,
 			     struct device_node *prev)
@@ -122,7 +76,7 @@ omapdss_of_get_first_endpoint(const struct device_node *parent)
 {
 	struct device_node *port, *ep;
 
-	port = omapdss_of_get_next_port(parent, NULL);
+	port = of_graph_get_next_port(parent, NULL);
 
 	if (!port)
 		return NULL;
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
index d814e4baa4b3..5cab317011ee 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
@@ -26,6 +26,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/suspend.h>
 #include <linux/component.h>
@@ -922,7 +923,7 @@ static int dss_init_ports(struct platform_device *pdev)
 	if (parent == NULL)
 		return 0;
 
-	port = omapdss_of_get_next_port(parent, NULL);
+	port = of_graph_get_next_port(parent, NULL);
 	if (!port)
 		return 0;
 
@@ -953,7 +954,7 @@ static int dss_init_ports(struct platform_device *pdev)
 			break;
 		}
 	} while (!ret &&
-		 (port = omapdss_of_get_next_port(parent, port)) != NULL);
+		 (port = of_graph_get_next_port(parent, port)) != NULL);
 
 	if (ret)
 		dss_uninit_ports(pdev);
@@ -969,7 +970,7 @@ static void dss_uninit_ports(struct platform_device *pdev)
 	if (parent == NULL)
 		return;
 
-	port = omapdss_of_get_next_port(parent, NULL);
+	port = of_graph_get_next_port(parent, NULL);
 	if (!port)
 		return;
 
@@ -1000,7 +1001,7 @@ static void dss_uninit_ports(struct platform_device *pdev)
 		default:
 			break;
 		}
-	} while ((port = omapdss_of_get_next_port(parent, port)) != NULL);
+	} while ((port = of_graph_get_next_port(parent, port)) != NULL);
 }
 
 static int dss_video_pll_probe(struct platform_device *pdev)
diff --git a/include/video/omapfb_dss.h b/include/video/omapfb_dss.h
index e8eaac2cb7b8..426d12881132 100644
--- a/include/video/omapfb_dss.h
+++ b/include/video/omapfb_dss.h
@@ -811,10 +811,6 @@ static inline bool omapdss_device_is_enabled(struct omap_dss_device *dssdev)
 	return dssdev->state == OMAP_DSS_DISPLAY_ACTIVE;
 }
 
-struct device_node *
-omapdss_of_get_next_port(const struct device_node *parent,
-			 struct device_node *prev);
-
 struct device_node *
 omapdss_of_get_next_endpoint(const struct device_node *parent,
 			     struct device_node *prev);
-- 
2.25.1


