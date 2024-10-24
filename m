Return-Path: <linux-omap+bounces-2472-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FC09AD9A2
	for <lists+linux-omap@lfdr.de>; Thu, 24 Oct 2024 04:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85E701F224A6
	for <lists+linux-omap@lfdr.de>; Thu, 24 Oct 2024 02:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395E513D520;
	Thu, 24 Oct 2024 02:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="I9+phIX4"
X-Original-To: linux-omap@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010052.outbound.protection.outlook.com [52.101.229.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908E03D69;
	Thu, 24 Oct 2024 02:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729736390; cv=fail; b=YwMTmSdiYkh1ekmYm8eb6dmWYiqDGfoQ2OA73TJsOmX9oyOPkApUcdwaWydI9AbbuJF7aX5pBnPaMW6+C9VCrWtxoXfLR8S5EIZvXq01eWU0sO8EwXwGtoy8ROGN1w8hcIqmZFqK2v8ckFPxAf79jy91HneIZxvLBu6AzaCoeks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729736390; c=relaxed/simple;
	bh=D7YRYjjauLoIHqeVhQSS6SC+ggl9kwpOX9Ctb2S2kqE=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=gvaikqxL7VpKUW2rVeTNp5RoQuX64QGN9mYtLlMrjuOU9qTnIN45G6Q0SjBtfGkVAPGSyDji8xPjkzD1xAPWdCc4x+iUCSygFK6I216zm+A/AXDC8duv987pjBiskjvO5GV3ceqgZaf0IsKkGOM9W3LMHjyf1hlBvhV6AO8MDnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=I9+phIX4; arc=fail smtp.client-ip=52.101.229.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDfvELyUGU8CXBKtnrCLDXNEizkPunNC/pzHONQPi8YUJ1vtbEN4fpSFvNdcSzWAM/hg5kJtJCNRazWZBBTdsqgyY1k3qphzwbzyvKjmGLI1FBCuy4cbw0zbn6OySf6qXIjdS5zf1xHEhXL7/33rxSppH1pEqQpvANXSWvSZdiK1IGwcD3zRze1hSIcVZrv1Pok+ok6xlIVUwqzSNwJuZx+xmVgOg7IcdZ7OUbVoVqcmskuCid92aVyy8T8URwJuyn/h54HApypc5POBOlpO1iwhVXbXOvBkDa9h5DKoGAKV3Cz7Es1NzTwpEel+gGzQ74vvwQ0y70p/sEKdG7722w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfApnmxAsVYAxq+o2AH3gwKlTJ85uBPhYzWsbgMJXy8=;
 b=ofkasFBEm2xyIxrH+1KB+VBlFiQbjIHMQa4fIS7cbMNBP4Fdz3nDUPW84+Ed+BPY2uiROoUQ3UOYuz0Hygm5+vuvhccAWxWeUpLi9lYo1gQx/p7l4ptcs0ayQsyLP1hbv3PQKS2V/oJnDEvMBXigKQm48+4uGT+NDZOtbUwozwpBa3c2zOCOTR6P0WriUk25457oiCz7yC5iiaZAX+KNGXmNeYrzcDmTfmr5hPHWcv7UlQeWzB5RaeV7fx1UsvH0NCPQn389rGJvsYzCN8Iquf4QzMdlEqKeDHKOr5dK0ShQYivhdzCyxWP3HAslJXq01pVGuckklIFNz94HC3xjgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfApnmxAsVYAxq+o2AH3gwKlTJ85uBPhYzWsbgMJXy8=;
 b=I9+phIX4TAYY28b7uYhugr96WCkf3/ClpEoAbSfjUhPYeDy9/qGX+GWlWL3dcfAUNhcD1MAj5r2K40vcHZnlrbEkuRnemAYzlahGVAVqrmUxSCQ72b7NHL8JktZiKFnN/VyJH60ImFsUkxL4uQiSVYO8fmlS/FTEP6CEF5t9TlI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8629.jpnprd01.prod.outlook.com
 (2603:1096:604:187::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 02:19:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 02:19:42 +0000
Message-ID: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org, linux-omap@vger.kernel.org, linux-sound@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH v8 0/9] of: property: add of_graph_get_next_port/port_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 24 Oct 2024 02:19:42 +0000
X-ClientProxiedBy: TYCP301CA0087.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8629:EE_
X-MS-Office365-Filtering-Correlation-Id: 479061f0-3af9-4a89-5b1d-08dcf3d2523c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?U8G15duhqzno1APZ3a4fZ/mixTo8u2Ks5R+4v0icQgC7qIEwvzhQG6OaehO4?=
 =?us-ascii?Q?/PMKzoX9i3XwQ1B9sEowbsrYMeyscLE3kTs/7EM1m1mFBRvRQHiDkYKwIDuF?=
 =?us-ascii?Q?JzSRkDxJ2B5mTcyUQY6mg3lvV5ieO42BYguVMNzkqRFG+p7DZj0HtC2sPHZQ?=
 =?us-ascii?Q?9YpDUPJy1Lse72eu9ZEf4iQgBM//yh9De/o50PRwSXyyx0hy5PqCbGqkG4N0?=
 =?us-ascii?Q?bURq3GI+rj0D+ZlQoPOmA/L7w7dY5O49Fb79NSiQehXj0d6wjmZBVkni5y/5?=
 =?us-ascii?Q?LmY/s3VpXKRbEJ9fI/A6bJNDyH4sQsYpNYsDvMacj7ZV9HCm8d8kveszEuep?=
 =?us-ascii?Q?+iuBYcitvm5M2S4nJ71I/QMgA7xZm5WXCUf3A9BbVWH4lc/Znhdc9v9UjMkz?=
 =?us-ascii?Q?Nf+v3Xw3KE2pAGjvTJGSVFWtnoSdQiYjLN3/o5I71fMgcS22gU6LJ53zTIIL?=
 =?us-ascii?Q?adrkwhN/BJq5xEHNxOIFBM/Cd79xM6cidlC25KouxDOvsIn6P6WIhvr5JRQ6?=
 =?us-ascii?Q?jEqSOocX3ojBIinJtB4Ymjd7OtJ1xD8RIF5RtqgjXyMgVNNPaPhyUwZILFEB?=
 =?us-ascii?Q?9i0sGYZKb9IdQ2b8YiG9fzVh0w2+RJYb+Qgj6s41duso0DaBH864DS6rHJpL?=
 =?us-ascii?Q?8dXx5d2iMMkASMLflTKVS6ge0JRgdrjVGWrInXvqHflDqQJ4MFKxdB33UaBT?=
 =?us-ascii?Q?XCJgMQZI02VLnNzu/q4ZROiAKNraHdXMOZh9r4pz4VYJdYahjQhoj/IaxMjh?=
 =?us-ascii?Q?owLhifvk32bk9GojKeM5Hr/Dm7jmx2VA1vcK0AKf50E2WYNRlp0hQ4JCB99H?=
 =?us-ascii?Q?+tuCmVqNuFnPm4/4dwcMI+H2qQ00kS15XB2Cl5hbMtAA6Kofg3umYDqZs9F5?=
 =?us-ascii?Q?tiaViyUYUNcnzJENwnZ9nAM3jkel29tSxTlr+KNXqYW18v3ckOrZJgoiapSM?=
 =?us-ascii?Q?MhQdLhqt1ciL2YFzvD4RtjRgsS0MpuXm4eoroxoC6Yy2Xm1Dgi7KAcMW2zso?=
 =?us-ascii?Q?s3SqE19JCgmeb7k9yvKl/aSCFr7aRUtIbLCjE8/xfgL2EoS4EuzNvGwRh7QC?=
 =?us-ascii?Q?tzHkIYkr33J2+U1LMDQtPAeBjuQzqkiqdAq3kaK1X8llWKrToyrMgkaabnvI?=
 =?us-ascii?Q?9T9NsmKGEUulRwmLdx6ul0gcePTZSnwY1U/+wuUMiY3sAXoTfzEj9Xd+/kJI?=
 =?us-ascii?Q?+12JRg8Hs7qymgMlQMDZW7h6w4rYVhWd01JzVzlCXb9krqPdaEIt/BBVfa3V?=
 =?us-ascii?Q?2AXnW2rRLYdsDv8rQUlsXC1IsqT9lwkK9bb9DyrKYd9vtDktfQre7d0bqDFn?=
 =?us-ascii?Q?o2ByThFt7qFmTVapUtUk3bEhzX3Mb2Cx3AgpXPOyz3q72jTRNXI/LeqQba86?=
 =?us-ascii?Q?jY/quQTshx5jGGvB1hVvVayX4dQ4?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?b5EnyDVz7okwVskDfCBuKvWNAUlnENPI3o1SsuJUJpcTByw+BauEnDuTMuqG?=
 =?us-ascii?Q?h6MJ8EK1b04EGMa/uB0yVbkwimi3gqFN+AnHD7gI9TTBWwPX860gL3mF0sDG?=
 =?us-ascii?Q?WzHHuGsPwcbVgd1sFGD3mZVkw7QPX8hpH9iyIhHwlQcuDNWDdz4Fy7pPktuM?=
 =?us-ascii?Q?e03OPDbYwK1cYNtyHh4NJeyPkk9D/UsIXSEn1iM77vDIwDlAE8LKBjQt3M/f?=
 =?us-ascii?Q?YjNdigdgA4HF6M6QrC23j0usVzqbURaa8y+irF98RnKZXKGKRVFXty7nKr2h?=
 =?us-ascii?Q?k+f6j8rjd1TaB3jllfMFwLeiatuMi4qbyd3SNGQ2SPpvrNyITXSxyufIxQYQ?=
 =?us-ascii?Q?C/f/jQyMfCqFAhQwec6Vc8cyi+MkqJFDOynTmJxbO+duR5TB79dHidu1AZ4m?=
 =?us-ascii?Q?SwZg4MyAReuluolAQFv/nnciV36EkK7dNJUMOVLiCnsIr9y/yNWLwI9P50n9?=
 =?us-ascii?Q?oFRlJIT8YAzK8bsF4lFfjYL0o9sf9A92OQHZzjKGr8wbimDq+tA5JXRGuQdY?=
 =?us-ascii?Q?ek+pVm03fb9kXA05tZ4xt4lNlBaNJcXnY7zdwRO1HnN5pyawVvfOembv+UsR?=
 =?us-ascii?Q?y3KHKWWihA/FULpI8FkpwtMtJ1sFPB6PX6VUASIkIceBmFwfzwF/EuorQyfu?=
 =?us-ascii?Q?+Dcb0QoHr8VayxNzeNfctm8ShtuRplWShEDNQnNqytDypx8T02dPJrbAVaB6?=
 =?us-ascii?Q?3W1mkW4qOqZ+n6jd5Aih/tpJJDXLs57wfjLCAIYAA3JMCBJNsW5vB8hStEEq?=
 =?us-ascii?Q?Uq83ybcr/3e1/iYZ5DEmgMNVGLD1aioApMwfmmNqqDX87cOTK+iDoWZWWzWK?=
 =?us-ascii?Q?059BMmW6LSTxxBUJbxr+WxUnA1sSYGZrKlEb+PLNn2KjsZzMz+XhxMolnBKY?=
 =?us-ascii?Q?aFEXxg0cGpGcZFrkOx/WkujYHO+1OZFXpVMXupskz1lnK1C9FY2vLpVjkWpq?=
 =?us-ascii?Q?u4P4vSO3NWVt82U8A8xZlJtnoBHT+BRNTjxjNV6wnsVP16m8v6Xy/JHNx11v?=
 =?us-ascii?Q?RiWPP0K/BefMrFKLhSDZSndtvgqHGJVv4P5zihxCVWdHEj0z9maS835b2u0y?=
 =?us-ascii?Q?NHx1lb6anFXbrQ+PefXG3QthLMEjIEqPFSbg+WckKcQQBtJiKrcTtJn/hMsw?=
 =?us-ascii?Q?ZnjMc4couzSbXgu3x12iMpesdVZ2NA8AuyF3YTeVUsDUrz8xgtZWw55oS+gd?=
 =?us-ascii?Q?FlrvICk/U9ZlxSuzf1CyhPRamLwOh6MZOuFBjYDXXA5DrHw1jx5huW7geUpv?=
 =?us-ascii?Q?ZvMM0vii961Y/r3OKl2JvDV2b9w2zwr6KwLGwHkwpaHxb/p4kC2RwHpxpNx6?=
 =?us-ascii?Q?UhTL/CYcyOvffJ0sBMSX1L7Si9B4VwQu32pEVEMaByEX15SuHYyBfakwFnnJ?=
 =?us-ascii?Q?mPXDh+DrSFZxhQIdxSnKfsnUIsf2Yz0BmgC38VlzQFpaPyOziqx00BiSvvqC?=
 =?us-ascii?Q?LXd09WROPalG0n6SAa1vgNq3eVajYvXfrd9QYsaSN79/TlfQb00pweJflEe8?=
 =?us-ascii?Q?Kk3eGywP09YMYta1qYWFLF6vDKfAPi0Jt/dJYjG8C5QHUf/yPkTUVN7GhSVM?=
 =?us-ascii?Q?R6X7BF9Q8AczHJgvS/sR+5lpzgtmNFsnuV3gR+JsurYLQd6moJb3pZvB9GPN?=
 =?us-ascii?Q?H5lOKfsDxD5EXHCGSfMAdAA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 479061f0-3af9-4a89-5b1d-08dcf3d2523c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 02:19:42.9049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RmcvLvvTiQtXb/RqFD1pFsh+3QhzkKdL4vEtPUmWsVubO2zLARrSPjKBqmJnJpUHZmMm2c0cCuYxoiyq6YGBZhpQ2mWrROwElSjoAbjwdBdt/TVV38giBPSAE9tHRjk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8629


Hi Rob, Saravana, Tomi, Laurent, Sakari, Mark

This is v8 patch-set

Current Of-graph has "endpoint base" for loop, but doesn't have
"port base" loop. "endpoint base" loop only is not enough.
This patch-set add new "port base" for loop, and use it.

v7 -> v8
	- add Acked-by from Sakari/Helge
	- tidyup comment line

v6 -> v7
	- based on latest linus/master branch
	- remove "ports" base functions
	- use "port" base function on "endpoint" function ([3/9])
	- tidyup [1/9] explanation

v5 -> v6
	- based on latest linus/master branch
	- [9/9]: fixed compile warrning

v4 -> v5
	- tidyup comments
	- [8/9]: parent NULL check was removed
	- [9/9]: use for_each_of_graph_port()

v3 -> v4
	- new for_each loop includes __free()
	 - comment indicates to use return_ptr() or no_free_ptr() if
	   it need to continue to use node
	 - each driver based on it
	- care "prev" leak on of_graph_get_next_ports()
	- of_graph_get_next_port_endpoint() indicates WARN() if port
	  has non-endpoint node
	- tidyup each git-log

v2 -> v3
	- return NULL if it it doesn't have ports / port
	- add visible comment on of_graph_get_next_ports()

v1 -> v2
	- add each Reviewed-by / Acked-by
	- tidyup/update Kernel Docs
	- use prev as parameter
	- update git-log explanation
	- remove extra changes

Kuninori Morimoto (9):
  of: property: add of_graph_get_next_port()
  of: property: add of_graph_get_next_port_endpoint()
  of: property: use new of_graph functions
  ASoC: test-component: use new of_graph functions
  ASoC: audio-graph-card: use new of_graph functions
  ASoC: audio-graph-card2: use new of_graph functions
  gpu: drm: omapdrm: use new of_graph functions
  fbdev: omapfb: use new of_graph functions
  media: xilinx-tpg: use new of_graph functions

 drivers/gpu/drm/omapdrm/dss/dpi.c             |   3 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c             |   3 +-
 drivers/media/platform/xilinx/xilinx-tpg.c    |  14 +--
 drivers/of/property.c                         |  99 ++++++++++++++---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |   3 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c |  66 -----------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  20 ++--
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |   3 +-
 include/linux/of_graph.h                      |  49 +++++++++
 include/video/omapfb_dss.h                    |   8 --
 sound/soc/generic/audio-graph-card.c          |   2 +-
 sound/soc/generic/audio-graph-card2.c         | 104 ++++++++----------
 sound/soc/generic/test-component.c            |   3 +-
 13 files changed, 205 insertions(+), 172 deletions(-)

-- 
2.43.0


