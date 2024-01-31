Return-Path: <linux-omap+bounces-464-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B17A8435C2
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jan 2024 06:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4ACA1F21E77
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jan 2024 05:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15464405D8;
	Wed, 31 Jan 2024 05:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Dh+RtsuR"
X-Original-To: linux-omap@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55F33FE3D;
	Wed, 31 Jan 2024 05:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706677654; cv=fail; b=ufPHocJ4KJWin+Ay+24POWbXKjr7qgVa2XEIIXDrRGJsG9/s6dlzKpnfb6c4Z9oRr6vG3tB9/5Wqjq/Wm0/15rBgq1d677+HoJtTrF0GCl8zVE89ISsAEy6yoL4lplq34vn5B7jiCZAF5rFo4AIXvGEnoJfLCKDS7PZJEtWtOVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706677654; c=relaxed/simple;
	bh=LetAszaW4dFo7pIO2qLTEWoszjj1mQlZBYH1VKPluAI=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=d+7AP7LGowrlNyma+74R+h8MIa1ALBT5bv61utwYqPZ/Co/bP0m6j7nLqnVz4WmsOI8BK3PFAIOONCskY86SRqlH1nxMcc3O/LtF03u3aAc6To/mzFXx/Rol1tbyGVEc8aeRKOqtWM9BaJQCk/eCV3TzKEmcY6kTr8ocQnN7pTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Dh+RtsuR; arc=fail smtp.client-ip=40.107.114.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vib+J2Ze6PHBEknCGr7YV3rgLGTU88tPUS7g8fGUspAF0CeO761e3R8Es32L2ONApeflUD8ExWOHpJ1y09PaSTt9b86ANVtbK6F6J1iJUzeX1NeP3wjplejGh3jk39N0D7ggVGr+f6A4+CFbE5tmRZudEQPyvYyENkBE5Vx0Httirlufa7kz3ZAKnCzN5iR6ltJ107dNRVpVTeENxLRshuwrHbCwtqdJLd01tBmWgQ0GygyRb+DJjtqX/yU1vqnzZqWiEUcAnqDln47mCitAAXY9qx1UNS6LxuK1FCvzbDjPmKPe/BEZE8GsdTc+melIcAOc92lNtIOaUTeLfxNQiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8kkPI/MwcS8I3GYRXMHAPjRIL5uTgZdaY7byZyINHI=;
 b=S5VznpuF2TAm7Bn2alivN/wxGhkBRexzv8Az5tYaW665oBnCCv4MMltquoE1BcedfyICGH0p4ZMioiK0X1psau99kpOjvLeFlj/b7ZfhYQA1S0QJIyTw6WvWqi8LoaKLLmP4XPFWnvymV0hhAXxfmqBhP9fBf6m3i8ju9e5JRZzRwAfYM/dHo6gMWlNAH2S4MIaaUxMpsZaLQUCvTH66YmpG/fzc+of5k4Ud3meM+shiWe6lpI2TgcnCcUztJ63972Gcg2eisjEHB6hXdWYwGVAgV32YejllVHydbuAl7X0w3TnpiSSz4ZhVmQsej2V8KGdKXRxHBL6ZKBbfCyeeIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8kkPI/MwcS8I3GYRXMHAPjRIL5uTgZdaY7byZyINHI=;
 b=Dh+RtsuRSHtxmIzfRTAtNYkn5IcWoVcNR4Ep9vDjEADHAO/qOl6EDivq/7gjygUWtlZHZCgbWloN7FA25g1nFnS1bHF2F33ajAgpmVL8inxDfwwOVJ3Dxg8gFd9nu8Jw1BzIyGl8hVwQH/LnOMuzrHCbDySUpblMdyl7W4nsb6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9898.jpnprd01.prod.outlook.com
 (2603:1096:604:1ee::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:07:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:07:29 +0000
Message-ID: <87ttmu5bvz.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 21/24] fbdev: omapfb: use of_graph_get_remote_port()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:07:28 +0000
X-ClientProxiedBy: TYCP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ba30d0-9c60-44e4-e131-08dc221a85e0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	shWvHbELlze9LT5M854KK2KAC34j4LRMiQxOWX6h08TCwMOvJ2KtF9HgtE8/OoHwShtJCUCYUFeaYh/Uu3B0roux+dedevjrFvwIlrKeP2MEpXLJglQM8gxa57ipfownLj03fW5vry+5q+YKO7E5Gl8xKntokEi3NDEZM+k5H/qpW0RbouDKLr3igLdZwAq6DzGEPJuJcQK+cgeuzIUA6nHdUCtw9YeT8VUYuV7msRfK1jZGPQsMkJCNkkdPeS3WwDQtM1S5v+D5702NrbFjpu+JKMLnuzOExcTSkGLlbjRWa1D0KxEXD5qKA0Dv3lBCrtzVwYhKnqtB9YvYRShKCkN2bBkYi1qBmNFYMPYmZpJgv4Jjxg3mTtT0T4n28WeUd+9ZvMLpWqw7td60c5UwdQAL8QL3XG5a8AycAWLSbNZ9autR/RFQ1HR2clXFfmII1hJplaUHZCz1rHH8G6uWVm2+QD9pZpoVnSQ+ew2e8CG0rkLyDJ9IgyCh+PpK4sGUBA0M+PT8SSltVauGkh7DpLOoquL0q16wr1X2vgNFKI5JhtVMKgD1SQJWulj+NQua3igJ1iTcs/WymtPgyDrf6rlx7O7Zk1c3d8KI1AdD/0ydvd+gPWm8Bv7Aj9C5nyqF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(346002)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(1191002)(6486002)(38100700002)(2906002)(86362001)(41300700001)(36756003)(7276002)(7336002)(7366002)(7406005)(316002)(66946007)(6506007)(6512007)(66556008)(66476007)(54906003)(52116002)(110136005)(478600001)(7416002)(83380400001)(5660300002)(8936002)(26005)(8676002)(4326008)(2616005)(38350700005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?po43+jLuwoum+USsnpiLEQElS7LTliA9SH22RyPu472nQaiza/+9X4AVCPVn?=
 =?us-ascii?Q?wkJIOsGq0P1PZgfbIWN1dc1hmQ2zvzaYtBD2SY5QIsmxAa/2ORnieh4RG0r3?=
 =?us-ascii?Q?HFUsEAmFmk6ZDIc9M4ZzH7EzUs7PARkl70DH/SI7lqJmdA4+4435ffielbus?=
 =?us-ascii?Q?pSiZjg6QgcB0fnsVVP6fVQhiwuPH/0B/AXF0GqsEE2pp9BRzXddsTOxiV+z1?=
 =?us-ascii?Q?+g2OmyaoUUWwz+mvqWJHCjOp5fhJQso5M5qsGhBY6E6BmCF4lkQOWdTxlIkQ?=
 =?us-ascii?Q?57ELBSluTAvsgR7KddB5wocFNDoi5VEm4hrBc3VVJbJ+3HD4X8SD9kkjwszh?=
 =?us-ascii?Q?WI0JpbmOSR5+bkMhbc99hyvllcjT4DX/+0NSrnge6yn+XHB5IGABG6DsbvcM?=
 =?us-ascii?Q?QgoC9jPTDQZt+A7V2AyQWThBvKMlSup9rn3Yfusmlc8S2RsfQvcv7Qma9GtJ?=
 =?us-ascii?Q?tuFcJOTe5eQ/g8gihHtJNfWjDKQZDFk5WK3vAuW3Ip0QXkYMGOCuqk43aDbL?=
 =?us-ascii?Q?d3tO3e161Zmifk+JA9oeE+39+SEpizWed+X1dFgf5moVbbiEwInl8e3utTW7?=
 =?us-ascii?Q?2CLV8XxcTTV3qPESDxPekinE/Y/1HT9UzSE9NEo6ocomtc0p1sEbdNRELheY?=
 =?us-ascii?Q?loE7Yg04+lQijSIwYnOK4ZRTL9zTQM4TcCVa/4GN54oFO7bnSsZSyVP4quKr?=
 =?us-ascii?Q?wZc3AyjYHSxXwZXRjvEJywNzJTjNL3ga88d5NvCP7kdTuJZArlWdc3PUDKGN?=
 =?us-ascii?Q?GFJVJlsVLNiAf1i4nfy5OUClJXEPHHLWfaJHdbS8MTcTKOeFmMxGYZzMJe5Q?=
 =?us-ascii?Q?erdrTDtTDCCRwLWrhbF5mQuOtyx1CKUUKkLeNL2pNJ6fi6ELxKCerVBU160m?=
 =?us-ascii?Q?TEPeAiu4o9GZwmSIELd0T3rlXIM6AnGcH+Y7xcSGuCelkhH0scmFtJP2i1qR?=
 =?us-ascii?Q?62U6ix5p3n+5Xv5X4k3+hrHg3+BI29yrbEpXOqvtOmBE0WR0HWIYtyAtlfZf?=
 =?us-ascii?Q?JdOGuaa9e83q0qANiPr7Ko9ZPFBUrpLl1qO/D6FkSRSZq3/oRw4q3EJ1jZzV?=
 =?us-ascii?Q?zyVy5tMjebW4+Ae2jskT+h8ZDJgJhO4eKctMc0wBifO6U0vZ9pGQ+1alUQR7?=
 =?us-ascii?Q?+/z2p0XjPb2SGq5DaoAiIx22svWIU4UG85auSpnzSTj57EU3wlS5hGABMyvC?=
 =?us-ascii?Q?cbJeyczcrG4YHlUX1fnWVwYkBlwtdXsMfUNxgjCSLmXLESQpSIzAY7ODRuhy?=
 =?us-ascii?Q?caHosJ2Pr9BgqAqDTuDkQRFdzcuu286NVvM26hGlpWKpxtv1SNDKnceOxiSC?=
 =?us-ascii?Q?DfjSd1zsVhuSdk/97K5ASnO3w0dSCFikJzU0VzunufmlNJ0MKl3Zy6ho+iqa?=
 =?us-ascii?Q?KkfXNWLqdfvL/ltxy/kokb6gUYzYt+SK1ai3Ge3cIRIUHqqmiXFrkom3+gYq?=
 =?us-ascii?Q?7f7ovr5C3PNV59CCokQaG1OwZsq3WTAuwgCfUIKxcWG7AoNuTBZgHQOhXwui?=
 =?us-ascii?Q?KvjfKT8a+kkw7mfk6jlos/Q1jLMg6jYtNPsPFQnDuBlNiePNikp+jXVVP/ck?=
 =?us-ascii?Q?Qf9uth77yz37pGzWEk/z92l2w6xbnjIfowrU/vZTRQXMSYkir5t/5vPnf3M2?=
 =?us-ascii?Q?ovY6tJKMxau+A2GV8zLmML4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ba30d0-9c60-44e4-e131-08dc221a85e0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:07:29.1435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Um1lC7cbxWijKgCb7lXkXyyT9UsTtHcYojLNrK7RFhRgpWmmCbkOphCbd+w8pDfl+109HKsFnw2JPaGZz0IeMMNg/5E6/mVPAkLpLIt1iwxoCSrUhVCt258YM3qj5PuW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9898

We already have of_graph_get_remote_port(), Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index 0282d4eef139..fe6c72d03216 100644
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
 struct device_node *
 omapdss_of_get_first_endpoint(const struct device_node *parent)
 {
@@ -159,7 +146,7 @@ omapdss_of_find_source_for_first_ep(struct device_node *node)
 	if (!ep)
 		return ERR_PTR(-EINVAL);
 
-	src_port = omapdss_of_get_remote_port(ep);
+	src_port = of_graph_get_remote_port(ep);
 	if (!src_port) {
 		of_node_put(ep);
 		return ERR_PTR(-EINVAL);
-- 
2.25.1


