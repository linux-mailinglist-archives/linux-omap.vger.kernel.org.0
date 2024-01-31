Return-Path: <linux-omap+bounces-473-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 537A5844D75
	for <lists+linux-omap@lfdr.de>; Thu,  1 Feb 2024 00:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6FD7B254D9
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jan 2024 23:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE023A8DC;
	Wed, 31 Jan 2024 23:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YTlFHJUM"
X-Original-To: linux-omap@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2123.outbound.protection.outlook.com [40.107.114.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE3F3A8C6;
	Wed, 31 Jan 2024 23:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706743601; cv=fail; b=iwrJNfW+9zz8PQHbsBpJsPOo8QchyJxu1hKanPk4ie8m1vovwV1YD3uSgy7uepktNaIsfZYIITe1TJGyiA73HdcvJ7etBGXcms/mABRr5gwdSH4mVmlaBNpRVFkoKhMmqbT8Z16hn1+mZ5RDGY5nGTHIgLGD6CSiZLVC6wXU0r8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706743601; c=relaxed/simple;
	bh=OumOTKoLUBXMgWC4eNjpdNdvQydrzCqwYpZjalZfhU0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WavHJWnvq26yireiY0u1u9cGtZ0TR04Vn+Qyu2U7ZzjTQ8xz6cc/TpMEVvov0cIb3tOetRjWsZgjew58S7TaxFipv8Z6jLvUwn1GBO8v/HPRO94Ro2GnGFbZpC+HoS0FfqHy+KXBc2u/SzAzaZymkVwRlcOLh1sfcel37vFTVgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YTlFHJUM; arc=fail smtp.client-ip=40.107.114.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RD1X3hpetO3f5LbblzWNGaJGhqy50zwJaj+iyr272sqE8Ojuh1isZ1aOMyZOdTsyHknr+/Zb+/7FyhyigLgc28CrUs3h0Z/y7HRMFiNVcTG/2oGnfwmjd78lmmKg8kF0tBmgehHJ2/X7cYaYXQef8J7fc7hSjo53uswi20SQaRgYEsKef+fM/jeXcuTzM/slatTA7MpT15QhNeUJDfgW15gh/6Qx3jy9sMUsWZcn2BSSHfq7qNvUIdpKXChsRSP8vEyBnqaHGKUyQiJIIBlLzovLzA9GLbfq30/Wtt8kXPd3bDGFF2ru6brErDGrHwXYYXH/9+Nd1sKQDlBjdqSuzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3U5W/t5cScoCO0/ZKKyz6yrUvlmi6SSAuYCB3hqK46M=;
 b=daRKcDHgPKQtMmPEt0HhseYn2DENFjqM6m+fb1gn+GmrSoCuPh2EFjuLMxS3rMW+m7fGfkWA6Tu8iDzr565EDXrjbgbuxswcOhFUEn/Anv3BFdiFeC57eHTt0Dwx7QNb96cDb5IEl7iumJTdaFxVzB4dsUUoynJI9NlvKUkeVZ6pig0TTYMNqj1uy/60+44RjUwSCt8rWxo42/IBxSP5jtf/o6db6iGcfOyVDR19+Oogqimrg7tOtAUksu1jJ5w5eoSxzDYTTaIw68RzLCfjQOuevxeP+yR6wNSTCp1oo0azQizTujqP/h3DBR4+ygVBkcuwTFd1t/q9dASo4Ia0mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3U5W/t5cScoCO0/ZKKyz6yrUvlmi6SSAuYCB3hqK46M=;
 b=YTlFHJUM4zBamCnnWPaomLvq6EfjEkYvznFme59MGiXEvxFE7AjD98TQr5NuIPBUhtzvgGFSCKBJTIDrJ0iP9HYDNQChDY0xudP0ETzqUEH8mIR/HqgoU0xMUQZ4okXPoAOKxCuvOA9ey05NSvY8WblKN8BLLhcKc8nfSjdnR9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9394.jpnprd01.prod.outlook.com
 (2603:1096:604:1d8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 23:26:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 23:26:34 +0000
Message-ID: <87plxhnkye.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	"Lad,  Prabhakar"
 <prabhakar.csengg@gmail.com>,
	"Niklas =?UTF-8?Q?S=C3=83=C2=B6derlund?="
 <niklas.soderlund+renesas@ragnatech.se>,
	"Uwe =?UTF-8?Q?Kleine-K=C3=83?=\
 =?UTF-8?Q?=C2=B6nig?=" <u.kleine-koenig@pengutronix.de>,
	Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
	Alexander Shishkin
 <alexander.shishkin@linux.intel.com>,
	Alexander Stein
 <alexander.stein@ew.tq-group.com>,
	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,
	Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Andy Gross <agross@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Bjorn Andersson
 <andersson@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel
 Vetter <daniel@ffwll.ch>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Emma Anholt <emma@anholt.net>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Frank Rowand
 <frowand.list@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Helge Deller <deller@gmx.de>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Jacopo Mondi
 <jacopo+renesas@jmondi.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	James Clark
 <james.clark@arm.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jonathan Hunter
 <jonathanh@nvidia.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>,
	Kieran Bingham
 <kieran.bingham@ideasonboard.com>,
	Konrad Dybcio
 <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,
	Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>,
	Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
	Marek Vasut <marex@denx.de>,
	Mark
 Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Maxime Ripard
 <mripard@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Michal
 Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan
 Chancellor <nathan@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Ferre
 <nicolas.ferre@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>,
	Rob Clark <robdclark@gmail.com>,
	Rob
 Herring <robh+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Russell King
 <linux@armlinux.org.uk>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Saravana Kannan <saravanak@google.com>,
	Sascha Hauer
 <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sowjanya
 Komatineni <skomatineni@nvidia.com>,
	Stefan Agner <stefan@agner.ch>,
	Suzuki
 K Poulose <suzuki.poulose@arm.com>,
	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding
 <thierry.reding@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tim
 Harvey <tharvey@gateworks.com>,
	Todor Tomov <todor.too@gmail.com>,
	Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Yannick Fertre
 <yannick.fertre@foss.st.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Fabio
 Estevam <festevam@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet
 <jbrunet@baylibre.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Jonas
 Karlman <jonas@kwiboo.se>,
	Leo Yan <leo.yan@linaro.org>,
	Marijn Suijten
 <marijn.suijten@somainline.org>,
	Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,
	Mike Leach <mike.leach@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Sean Paul <sean@poorly.run>,
	Tom Rix
 <trix@redhat.com>,
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
Subject: Re: [PATCH v3 14/24] of: property: add of_graph_get_next_endpoint()
In-Reply-To: <20240131100701.754a95ee@booty>
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
	<874jeu6qhv.wl-kuninori.morimoto.gx@renesas.com>
	<20240131100701.754a95ee@booty>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 23:26:33 +0000
X-ClientProxiedBy: TYWPR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: b07d8272-db9f-41e4-403e-08dc22b41062
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CFsiGjU3gX3tELGpwA9sRHoyAaxtNmZq8yaJdMTwVFuKywkVPSUjC9Zp2zeVz/uxm3SbqIZnaJAdpwf5RbMvbzZ3D22pWYPUjwCqBbhGlVoLxRGOjtg3pz657ux6H+GhUksCJ8NWWvlcgpHK0CoFcJps6UNQVHoqoqmwTxCPq1AxFFG6w1YHnQkwB0ej9IDX7YDVYxT9RQONhyHc2FZJC9SU0ZCu08eOPDhmGRMTttjZPI9/dBcU6x+5zQBPbAiMHuMWqVm4pt5hFfrjut3Fy66OSlebRYbPq5+KvRR9ru6qkKWhgB4dzcucVHug0ysg6KpBpWgdKAEv5tXUNcpCW9X0Z/pFYbKlLkO9yGEJ1S7+h0PrO6QX0NdYQ1PK5dr3+8xq+BQ/Ohs5Wt8GAMXGMn60H6xLjTXhcPwOqB1iAkOeJYh+Hf/Kbk/xkiSESSgId1Jgnxcz0hPADhfOD80BzSp4ACQIRopx7Sr79F+v7rGKUyNyRnvXWJblSMbxGkZJsdD6g/fJW7t0DvH2qDEPkhduZDr6TQyFdqwh909GBVrz4Oe0xs3jSs383IbcMA5qhvNlG77GxCf06fZXFHqy0qR7+JgsQ4LxxE598inTnm6YAxdio1DtiJzj6gnQM+pN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(346002)(376002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2906002)(4326008)(38100700002)(41300700001)(86362001)(36756003)(316002)(7366002)(7336002)(6916009)(7406005)(7276002)(54906003)(66556008)(66476007)(6506007)(52116002)(478600001)(6486002)(6512007)(5660300002)(7416002)(83380400001)(26005)(66946007)(2616005)(8936002)(8676002)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cxhRDN3d9TC/PiTEqI44md3izWfAPDoI44Smso+Limiv1Dh90J4F3PsxaCuJ?=
 =?us-ascii?Q?06+XDbl8+YzUz4LGyO2jqLegZ+szuLp9H2Kw2MFbict8+W+QFEdoyOP9w+Js?=
 =?us-ascii?Q?khTitTueYljP8GjPu0yzz/DJ1YrCDWaBFQzJP355BK7BFRvNSxLj7FJSvoPN?=
 =?us-ascii?Q?q9KHVW5d8Mo5VozSJJ4rKF617SA869NdvHtFqc23LJRjfPdACfjQ3M/xynj7?=
 =?us-ascii?Q?uSBabG99Zxl8RRxbdSX7zJEDzaSj1gAUENRuvKM8HxnwSN2369DIEMrWT9Sr?=
 =?us-ascii?Q?f6PZZnzrMv7DdG+sLlhK2vfoIhfbM82pYPNi4wzJSoE8wSsxgJka2wcmqFpB?=
 =?us-ascii?Q?p7jWu5lULK0Q+CLVOySf+daTcBBTPytypPEjwgKQu6NmilMUl8SeZjUrAuSX?=
 =?us-ascii?Q?7/Saqh0Ju0u1A+dx2H5h1XXGVgQUAuHQW5W/95K5seZA/JxqaL/oaPJT2e3e?=
 =?us-ascii?Q?dWtzWXeFlNWHyPxaE4KBAgezn3IA8HcVzWNShdx3na87upmnqADu8y1GBsLg?=
 =?us-ascii?Q?thte3lrT5gVrgft/bHoV3cd1Zl+TFC2U8UVaAp/zeHJgRG09R0LPatUrumFD?=
 =?us-ascii?Q?1uu8ddSS8w4yy1mrOWlpQ0et5zn0Bl4oAEUmdkX8lOu+Kkc/DuKESCwV0Tff?=
 =?us-ascii?Q?SZDaht5kUf1mBO9To3LHaxJuox2xMPsJh1h6en33fvlF5W2svPMhfycJpGMI?=
 =?us-ascii?Q?B25itqHajSpuucMc36ZuZMDD5rG0XEPV8RjmQGbL2XTYbLOOmwD3Gz3FkrVf?=
 =?us-ascii?Q?oJKL++9gc19kJtnb3BfK4vPI7bsS0c91t5k/i3Rfk7VFcNl4g8vR8yDvLv3b?=
 =?us-ascii?Q?jCebYPdFnQ99WLvoKJXqTF3R2GttsBpe+M23uAnTX8Ujf/+CoLyTwRsVJzwL?=
 =?us-ascii?Q?EJbj8XLATxSTFX+hoHlPIFNlUIsD3fIHMoptm4lbWPeJ3W7gru7cXumBPX2p?=
 =?us-ascii?Q?iPdJt9EjuIogKDYkyPfOcLQuIeiNL24pbftgx6gUvGovisLvDDKbqAtnDM6T?=
 =?us-ascii?Q?+nAfxQ5ueJxEHQJorLW1fBLCQWGmEyLxptJUfsAdY7tjQ8O/NeWL8Ula6MtW?=
 =?us-ascii?Q?9MnzMv/BciFLHOq2VIWV1hX4Rxeip8pbMmvlz76WvqJIbOQIECzRQ/1JQw7o?=
 =?us-ascii?Q?yyJhQOwlFq7noE0OADArnao1UEIG9YAcHlYr3lPiTTuJQvsWquGySEeDN7i+?=
 =?us-ascii?Q?/1ht8d95KYtt38gj/scsxICGM1s8RTpUd9SJdoyCZ4qPib71MfTF2Rh9v+Ln?=
 =?us-ascii?Q?Tiv4ZRlZCjb0qY2cJ9uQzwkkmGaB4QpsRVR+R2nbPJSgamOxxwZl7e1ZaOeY?=
 =?us-ascii?Q?qZ8PmETGn50gAM6Z0Om+6V+WpxCGu9avwVKVd1qzT2ski+C2T/7PUFv7kIeR?=
 =?us-ascii?Q?tUY4t84AGUVsodz1qP7+CkQcCYq5fnbiPsJ8cPGQIBUfNGbboS0Pk3u2xaUW?=
 =?us-ascii?Q?JzXfv8Uzr/wUCJfERo+dAS0//f8iknKLy7qwNfLFc7SAKpQE0nye0+qC5x2v?=
 =?us-ascii?Q?gcQzY23OW2xjG7qFhsUCetd+2aK1oRhaV9tZpT0K/kpzVSApuoV64ZqPT10K?=
 =?us-ascii?Q?ntGH2EWHGGmknoqXnIThtwCJIXLjoxfRs7IUfMzDC57ARfsCOeh8eUnZuTIa?=
 =?us-ascii?Q?wM9pp4MXOPaI6Eqk5PSMe2k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07d8272-db9f-41e4-403e-08dc22b41062
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 23:26:34.5539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrd4FthjXc0fwUsnpkjJjqjvYa+TkNzCbjJma+tECQ/x2dH5nefOHPbJNAmhPoPW7Gn02biztcUprgOcyJdHWx4fXOrbuww1B9vzjoseluU929HNPmzEXvuN60b2R09Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9394


Hi Luca

Thank you for your review

> > To handle endpoint more intuitive, create of_graph_get_next_endpoint()
> > 
> > 	of_graph_get_next_endpoint(port1, NULL); // A1
> > 	of_graph_get_next_endpoint(port1, A1);   // A2
> > 	of_graph_get_next_endpoint(port1, A2);   // NULL
> 
> The idea looks good. My only concern is about reusing the
> of_graph_get_next_endpoint() name after having removed the old, different
> function having the same name. This can be confusing in the first
> place to who is used to the old function, and also to anybody rebasing
> their patches on top of a new kernel to find their code behaving
> differently.
> 
> Also, as now we'd have two similar variants of this function, it would
> be good if each of them were having a name that clearly identifies in
> which way they differ from the other.
> 
> So a better name for this function would probably be
> of_graph_get_next_port_endpoint() I guess, to clearly differentiate from
> of_graph_get_next_device_endpoint().

Yes, Indeed, Thank you for pointing it !
I will update it on v4


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

