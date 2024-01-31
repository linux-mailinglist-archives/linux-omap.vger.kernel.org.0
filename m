Return-Path: <linux-omap+bounces-460-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA478435A0
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jan 2024 06:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 644701C21345
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jan 2024 05:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59363FB2D;
	Wed, 31 Jan 2024 05:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gaJGDs4y"
X-Original-To: linux-omap@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2135.outbound.protection.outlook.com [40.107.114.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715D93E47E;
	Wed, 31 Jan 2024 05:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706677626; cv=fail; b=d87cS/6FcczKMf4YP6EmsP7PdZcXfOywS83hrdovQJZgdLRIFYU3dJ44pKTXHz/j87odWr4gQre339OT5ZzZsYCWrA3gfmlnxUsBg2eDiov0KurnESBwtb909iZAFl0U4I+n1YVCO06julwkiTKeWyP8vlHTjiiAOTG5tnBa6Ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706677626; c=relaxed/simple;
	bh=H2k9bXyNfr+D3UTNJxNWkwkGlW9maraZYQZu6DBuOKs=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=oxC01qo0CrUe+DprhEzHyINXxg7g65EqFcC1D6a6hdAQRW4s1v+7ARCV6Q0ddCRemQej1w8rIq0wImYPPueUAb5tkJTfLFhchs7kQA/UzKDtXy0A2CNpdAv5ZwNk/C97jsHr7I4qpClkJoBLKn3RYCanrrwtdr8aUsmUSUv/pV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gaJGDs4y; arc=fail smtp.client-ip=40.107.114.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gygUOHIGPd3I7Cj4a9TuMtNm8SLzM65J2LELzPU1g1Fc1dR6C9W/K2D4+2lFFLFfOoa9ypjxemtnF0K+urbkNJ88TGKuhtE/B6oSO3Jhos43B7NyU4PhMcW7hGcVsAA9zev/iuIKr5Lmzl/ICV1wGm6N2dOmXmtUegYI7boAUbo0sjFEP0cc4iW8Sp48Mz5lffIvp4Kqr7no98IyPUwrKb+Yntse60z3CgOy3pDvugtX0b7MDU/9ZxtZETySmL3sKTFVDKc7QGyjLQKr6FehqahTNyA/o2qIvhjv4W7WfCjg1Itf1xXmWMHqPU89fCbrhrtjHqUwVox+v8VuGc+ZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOJl8+F3j6M47670ZahcEbK9yZdl+sxxsDESlOZMZ7M=;
 b=YAZQlso8UFjcRM2+KqlaM65OCiGjL++eXxW/buWfgFlO8x0LTsVcGR4dAA0PLhOBumLPnJCjCk91ixNEBF0WK+J0nvo6TLI6aWY+hJk7xpHp7f9RESanQJXvAV0VU7zUI7QZuLFXFYcy9vqz8uHjZI9ezZLo0JRbsVeIzZPOmrbOoDYgJRNZxf1cev4zsqkAi0a7BZtb2h41OgRkjcsOztJPaB5z3NPAiYWit8N4XevlFkyAxWCoWPAelceTTxhb5zt1wYID4dcjx+DrLqdhBc/8qjBCPzKIX/MUilRz2gurSJ94jJgVbGqoC5pzWsnmA8xkfWedLxLGurqXLDe7+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOJl8+F3j6M47670ZahcEbK9yZdl+sxxsDESlOZMZ7M=;
 b=gaJGDs4yRJ4BODgnprWVeY4NoEvV7CSK+Cuy6bBgiemxIXaQ5g3X7JeGgHRxevOJFT0VmpZCaDG+AzQdYXAJkbv5zrvK4aylSPx3oJrA+7+MN9aZykffxeX8TfoL3+ukZPsL2Q7QxbTJJ+g1A1cIBV+BLc8FXU4sAzYThv8ecXg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8896.jpnprd01.prod.outlook.com
 (2603:1096:604:158::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:07:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:07:00 +0000
Message-ID: <87zfwm5bws.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 17/24] ASoC: audio-graph-card: use of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:06:59 +0000
X-ClientProxiedBy: TYAPR01CA0236.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: 3355e662-e794-4860-ebed-08dc221a74b7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t2H2+/DZdLknx0J9bZmfAVVhd3o96BIFb0kBK3bJeFvOKEKZ2pwaj2OUoeneWdvRgh4PPURaspgHpqxxiCGU7NfpQ0a4pbMpwdpHA4VH2Ws3V3bhJ2pFXpA9+uN7j+e9Skx1dPjQwZZRNUjRpeFMgp5jaFp+EDw6XzCT5UxoKWdslbHeU0g2NyDiqfWl4jOuwt9pFTHy3s9tEnWlVl6u29U1rDaVkG+Rc8RemJ31E2zlyM3xOj0+DWluTrswDAwRyUdYiVgEDZ6IULKLXpwG3AqE4IX7QfjJt7OVt/psOcGRCVQKNN2uEmOJvP8dI/NIydbMEuSCRZWYNXxABotyNoCw1OAfpWsp4M/OdrEqix4Sx/PFzI0v+lsys6YupU/Uhi7Z23VWXj232X+ZnR2WYuFEOREPsPV7T1Di2OdriittEVzwoE+osK2x5JixEKvG/08SHVuhJ96Rk38sKa9joHbZNzyjVTCFm6YHOJJ4UsHFyfjVGDHoyykvw8zS320uc4Kf52HtGhzbD47dB3OdqhApiUHk13CSrDT97+xXFmVWZc3ImSPZUtVUBY3XmmPSafKY7LKiNbAozpo5I5gaCS8mA9cvysowunvX3FQqcPqbkvy/g30b8lBMEeiI5ECj2rQWB9JJhfZ2+k9W4kTM3gZvAEbYd37WjSGHW2AKCb4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(36756003)(4744005)(7336002)(7366002)(7276002)(52116002)(7406005)(7416002)(6506007)(38100700002)(6512007)(5660300002)(86362001)(83380400001)(38350700005)(41300700001)(2906002)(2616005)(478600001)(6486002)(26005)(1191002)(921011)(2013699003)(66476007)(66946007)(66556008)(54906003)(110136005)(8936002)(8676002)(316002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7BGapNAPKPnNvgGvC8Kek2p9s9gbrE+JnwwqZKTELZ16o+/1+vCehh/l45RM?=
 =?us-ascii?Q?A8Q1Vnw0bwjwuqEezcIEmdmhhsLU41Jxs1VaYlrHZ1pt+1iheoACcYGlKu4H?=
 =?us-ascii?Q?c8NgazqLXl99VX513fFeoKz3+evlzQEj5ETjoy6eTZj/WH9iZG3hFg88/WrQ?=
 =?us-ascii?Q?RaipaA2LiesYPIDLj9VdJ7sKTRoRJ6W4c8hK9bUuWkhh0SrCkBtOiQw7p6TV?=
 =?us-ascii?Q?jTEhG+YjChFTSY1LmO3SjCLuKtatZL7Sl3kGgifN77bzP8eAvyBe5qmHrTAW?=
 =?us-ascii?Q?J0krKLNFJHRFrABnEmfgprROAF4CoZzVLvIIwkC9/2dcn5DtK822xiTTiB/s?=
 =?us-ascii?Q?ekK/I8JpKrORKmhAqwB4KvrIBu2k2aG3obHtabB8IV1QeGndJvXeb5jo+fdx?=
 =?us-ascii?Q?O4ul/BLh8o9Vh/V9PPMG0dNzzN3CnhdyMK7WJMo4fGGm8fjHGkv5XYYurkjt?=
 =?us-ascii?Q?INgMeWB2aTLIcwbgLBVIWCbnsamp0+av5BqFy1cJxdw8c+B8/f9SSHNxauDC?=
 =?us-ascii?Q?4d3URMO0kkDlurSgAVYT90zgQj47SRSrj7HE464R9ZxqplmO3A4aPo3kfht6?=
 =?us-ascii?Q?FROpY9Jh5+CAMouFJVzk69zBh3CN3Dll18aNUrbmu1AaDrYJnx6Fq2G1sdkS?=
 =?us-ascii?Q?7o2m2vjAUIWyxM18L+2yZGnekl6r5LcHVmvupMyk2CdvdzEIpl0MGknFhOVl?=
 =?us-ascii?Q?Ppe+wNICfc0csDhZuC4tU4RfEme28eeXqqlCZT6H5cmd4taXxTg133neZVzx?=
 =?us-ascii?Q?NtpSrx0OwR3thT3Hb5MehZNbo6odClkMxg3dkAsRSVGe2ixZqX3MSKfv+Ztc?=
 =?us-ascii?Q?qtOU9jUSQ5HM8c0jvTCuC9DbQFYEBZ+L9DH/fNn1rFpgfJSthhjly5pUpKyt?=
 =?us-ascii?Q?7xBpvl34z7JSEevfiFKgrmMLRxO+nTLaEA+249Jhva2hN7+fIP1FaCj1ziPE?=
 =?us-ascii?Q?ryDeTuiwNOVf4LIdQjA8pEzt/FYY+yDXe7aNPs63vFwGKfLTx7YZIaNCcn8v?=
 =?us-ascii?Q?OuD7baic5BeiW3eN0R4+jm2UpseBekBkGFpIe6Zk9uLnDBVTxhzBVxsH4ceR?=
 =?us-ascii?Q?7/wi7Ubj533xmdlJ68ZaxnWSRXIWMXiEwZC6OL1VtJUhVgv06XnQx5AnLipc?=
 =?us-ascii?Q?29TwTGItwVYzglf6y9k6ugy4arI0etu2sct38b77TPYajcBhfD+1ELea1OsR?=
 =?us-ascii?Q?DXfbAyTc9429rcnmsDi1/316q6Fld/D56+9MUNdcXUTq120W+fvgPD4a5QF5?=
 =?us-ascii?Q?8Fqd7ILYutyRJmQHo/Ey15E2apFnfIOyZJ2jqKvQHbK2YWFO4AvsWR4m0/0m?=
 =?us-ascii?Q?Vrgbzb+NkmBi16YMSDIuYEXYFb/F1n+YPWzUqyDKmGEzlZhf9OhIbL1kq9tD?=
 =?us-ascii?Q?caUZ2N+MYhRxgNHegg+VgAfRfrJAQuwZdmXuNxtQhpmxpXdvT4ALKWsQechW?=
 =?us-ascii?Q?kM86upoBguyk6tOK9aRYz+hEho/N9hi5yqHAJYI4zTi5mUd7RF3R2uTjNvda?=
 =?us-ascii?Q?GS+7CBT3qEPWHXi5B9BK0R0xOCaMxvIuxybsAmx1uBoabZ2+I04AVEq+ghqg?=
 =?us-ascii?Q?McepGcmbAElWSDGT4FTZcKSHVAU2T2HRH8gRoTnCF3e/C7HRWxq76xQDJmwL?=
 =?us-ascii?Q?2nKA5h30/dYmTLb7qlLw6Ew=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3355e662-e794-4860-ebed-08dc221a74b7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:07:00.3335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgrTY+/+3cgIQDr8WUmDIaOR/ijl+trMZp6bnkQNYQcWiGd6Nat2Q/kj+yAaLpVgmlbjiof6qtU1OFhxg6XeK2mL4owQ9SlHM8XpS86lcNtnTFHX0v8aWePYABBnqayX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8896

We can now use of_graph_get_next_endpoint(), let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 83e3ba773fbd..864f014a497c 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -344,7 +344,7 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 
 		/* loop for all CPU endpoint */
 		while (1) {
-			cpu_ep = of_get_next_child(cpu_port, cpu_ep);
+			cpu_ep = of_graph_get_next_endpoint(cpu_port, cpu_ep);
 			if (!cpu_ep)
 				break;
 
-- 
2.25.1


