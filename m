Return-Path: <linux-omap+bounces-2005-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAB995E6DB
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2024 04:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFAB71C20D47
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2024 02:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C059A11187;
	Mon, 26 Aug 2024 02:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ebAkgDCs"
X-Original-To: linux-omap@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B75DF60;
	Mon, 26 Aug 2024 02:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724640228; cv=fail; b=OouUkhAjUpgIOaP0AOmTAP0ZKjQq9OkKZMrnX9Iyvorn74aG3Jft/R0+lRTWplhy0RpAnF2lY3M6fTikIDi8Y3qsgRMH2AQmZbGKKvzigsoU3dq6t7l6wLhi8E3l2dNjiWFNG/YpCY/NV/Fl5VNfvwXUdWc9hegseda372bsz0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724640228; c=relaxed/simple;
	bh=iU1wdiQeBSx4Z0vGv7Re3ypeSRxpZgx+qqU7cU0qNUw=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LotcQ5YpTi68mLRcEKzmdtEwmjMx1b5+Muhq2ZKn+NODpefFwjwZM9ABO8HyCUuyfMa6cseal5LFJW9G6xuYimz11dCVF7PGyufUlPQD7vnR80Uzg1ROjIctd+WzaF19kKu7/cLTa/I2oA/gl0scZBVffiYqFhzPeIr+tpT3O8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ebAkgDCs; arc=fail smtp.client-ip=52.101.125.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COzAb0W66vftGgO67F+W/dV4u2wyzvAtPuLOHcq9+zMyU/9A3aITr+KUeBKvacMrDMVM1sDhKwYagx7eOkg30H4nMREytGMz0SFNrTh/jZSAOiCP8cRw4jHXmpYCnC4aa6mrtt5kAlpu+D6JKChC46O0X6gXNIGZmHB4bf5DHxYojXcVOV2kO7TkRyf9pRL5Ro2TduTDe10u555cCidQCEIvJk6jBUdUIV6w2qgcenxmVsWoL0NpPWiFdQ5H3Ej5/8uOag7AuEl44t1mNLlZI82QHf+Pi46/AL94p20i9z5TEkbaiuoD7bfKF230tLRCb/xEUYJKq3FBSrOTalPlIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1GAp4QgqoFns9AbOFF32TGzFGMNvnIU4szsG2JXDso=;
 b=m84kR+43goxBtHXbeG8niq+/cT+MjyrNv7mp/jD2+l6S8eEHGGAbG2hgT9lrr6JqJIdP53dVRAKmS6MRayTCfvg+uFfEBOMhmLD2GMLD0JuhCi1qzJa1IBRGFg7GNduwpg74Nod87qPMMmcbxVR1qv8wVglIEMeZvgFU3PZtYZX6RdxuDWeQDAUelHrhi8IBiXWdgSvPBNQ21pl1BjhXotIZK6T6dRVfKKujwN6ePfyq34t8c73FK201GXGB4ldEHdeJZTU07C/ZdJaMgbldOax6Cgx3XwrD2t7afsRc031+EO9k3DssCpvdxadOxtul6FZdC0qaBftd11AKCIk+2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1GAp4QgqoFns9AbOFF32TGzFGMNvnIU4szsG2JXDso=;
 b=ebAkgDCs9l1EbtClxvCQXXGWz/Nfe3skYWHmrzHcuLyNlQSoOlK82hVuE86DjpyqyUu/kRkWbBzn8i+4AQtVE0AjWTzAMOR15QB7KbsWMYhh4chFJTMc18wbgc/253h0nLxdMy6Fa2+fWVEDijHWDRaXBJIokBIIV4JcU5iOAmM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10616.jpnprd01.prod.outlook.com
 (2603:1096:400:290::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 02:43:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 02:43:41 +0000
Message-ID: <877cc4qa02.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 4/9] ASoC: rcar_snd: use new of_graph functions
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
Date: Mon, 26 Aug 2024 02:43:41 +0000
X-ClientProxiedBy: TYCP286CA0341.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10616:EE_
X-MS-Office365-Filtering-Correlation-Id: 84913690-1bf1-4de4-f6b7-08dcc578e593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OCfzSt0SvrJ7OvTKGFBhNTSu+VDnYH3wMhA7Go2rLvpuJk7Q1BSnOfBj/E1F?=
 =?us-ascii?Q?I6uNqpMZmnKTLEWKiZ99ULyhfSm3a9wj72pBGrp3l74MHLEh/zvi4JOD4iCv?=
 =?us-ascii?Q?9AjnLTBsvF8ar+HYGjYRcFYrM9eUk9FSBjyfnITPqKV3wa7YTIe49rNJUCa0?=
 =?us-ascii?Q?VPEzlrsGobDHimNzKgiF04yETL5FcY5CbDUfNm5TKW87SyRIbtIc7dzG4Zbi?=
 =?us-ascii?Q?3Occ4mez9zNT+YK5Y+BtPs0cpKe93A+D4OKpUWvVi91eE5KqfKf6fuSY8VdS?=
 =?us-ascii?Q?sEg740uWa20KtEKrASfjVOgfFelqRB1CpA4TvySWE/wFwMTN0HrHN6PiFFAA?=
 =?us-ascii?Q?BzZxz3KjcQoUy9DfXzwX0q9soa7NuD2x38r8MvwDED1Xs7ya5tzuO7pez79F?=
 =?us-ascii?Q?rw+AmWwZmvPQVCa+bpLApStih1qvROCBhbSh5b6seColtqVjo6icu5P6sHOd?=
 =?us-ascii?Q?0zHJi4QrfXlAYaToumOtkDXH1HAvxfU84jgCF8BlB7zOJgsvtIdYyeCyYZcP?=
 =?us-ascii?Q?xhi9+C8Fm7OicU029mpT2vp9wuly492HcKvIpNjapPQ7/ZvtPOcJIqqoN8+4?=
 =?us-ascii?Q?4Qiwyk4zFEPe+hQLYyT7aeG4lkahZ8h3HqUgd3mfR0Ogm9066daP29JtHeKe?=
 =?us-ascii?Q?wBwxTQsX+K8o+3io7YMGSSXN3Qw8KW6FBa2KH2QwIwNTRrpwC25oWWzMGsrh?=
 =?us-ascii?Q?EBuIM7cyQZDXs9dab5/0RP3C3zwsfR/skYN3gycG1Gyf9b2xaU06grw2yieX?=
 =?us-ascii?Q?eF5uIy8Rcy6Qj4kNo7MitPTK4Fi+/PgKwc3SrrcPbqgm9xzXlPdPxMn13ZkF?=
 =?us-ascii?Q?tPBOWLhqD1LGtYj/DlHCaQTbqit/oZC4wwaTkW3eaXO/fmFEn57e545SH++X?=
 =?us-ascii?Q?Nav/3FhbhrwHRZRBQW9B1kjf63H//QI0pYrmENN5J3j06CiEsxLQozm7O9Fr?=
 =?us-ascii?Q?ZfVoqTzTP9hLNbQJHnx/4E+tDPPWcIfzt7HSe9vYZd97Qt7klzVRG1DzA8e0?=
 =?us-ascii?Q?vtFxJgac+IkY6bQH4hHVkSe/U4Gcoqk+FLHeAiE5SAPwPCtD9zDQ3JE1tJjq?=
 =?us-ascii?Q?NwGeIHUP3qcmvWtTp62/dsd2kgU8UER6FPDK94McEHL6FT1C7SlOkR+mgFdA?=
 =?us-ascii?Q?02bM7lfv23HIk89P1fO2zSMzwJZi5JE5IgR9fOxINUDICdB2agmIXMORr2wA?=
 =?us-ascii?Q?Y/YoQG3oyewe7xHsHKKq5eq7iXw6fHDEjzA9dCjW/31iUCWP9nG+08YONwVz?=
 =?us-ascii?Q?YpS/Ujpj1aoJUF2gIoeXu4mTyCIVWvTTBxlq96Pn+LHBvsd/Ev4hkWdVrJfy?=
 =?us-ascii?Q?Vs0fGbY0eq9WvkNHeHlpR44F2AL8DA0LU45MEgbfEk/0R9TG7625tFn/zEDA?=
 =?us-ascii?Q?3H8or2KpAwEODLE0IV0M2yNiTjMWR3U/aonKYwXGSfWVLQYAkA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eMPacOAWhqdI1HnJcoje8IxTd+2rdSwJjhAp2dHXPqU8ZUziA+4Sc1xxqWIr?=
 =?us-ascii?Q?Db0UQu3QpmHVaPrRCCdY27BnyVg6N/K8koAtH7zRtScXSybUc0VzNN9m5zMk?=
 =?us-ascii?Q?rOH/3kfDlNOSM5MEoiH9humusmojfumQ3S6X6yXBC6BOoQB659ZJdVv1Ok4P?=
 =?us-ascii?Q?PG5UJetuhCG45BTYhPNJeMp1b8+6MxzWBGwlrlJ48p6gHvi5YqF5HmzKB/7k?=
 =?us-ascii?Q?HkO45i1aLHZbyWMkCJd53CIwfHtJwE4wW1u93DDa2blNPUoNTftvnP6kIbZv?=
 =?us-ascii?Q?Prg+/Zc+b7tU6MlJc3RNC99XduZ/1K3h8pa7oAZ+4IUp9061xZCqMsKy1S2u?=
 =?us-ascii?Q?8MCNzZD1wL0tOwpQ9MAIFKPMAUlbUsqteHQ9CZ3ktuJOUB6cox3j3re9LoMq?=
 =?us-ascii?Q?Dk9KshAbF+lxZ6bY6HKFt9zvuv70t0pAnEU8WdVSrgv3hmVjX1DaQx5c/Rag?=
 =?us-ascii?Q?U6PihB6e8hvYXncASTQA8FO3vjgkAkuRE+DdNK9CXkswmJZ9iEPINwnI062S?=
 =?us-ascii?Q?AYFsQRnRqtUc+lYPm9Iex8uZyvOQp2K1fU3vGKgUYU19BCY5QrD35NA/MeKH?=
 =?us-ascii?Q?231+IAhOeAFAbgrDa5pW0ZPQyqc2xWAALAPVF8VbkF5R0uUMg6Yqz3qOLdZc?=
 =?us-ascii?Q?+iSyYU5DpGrf3SRSUYxJEov3uKP04m0VWFfc66a3xHiMnzNVHQ1f7uhKg5ix?=
 =?us-ascii?Q?bURkMjgsChk88a4gHDVudyb9o8GpZ6yHwVhYyffwQ9hIIxV0JLt4RXaR8Xh/?=
 =?us-ascii?Q?nu5ez912BNMLiyIPijX5vyXOEvvxKV4qHZpporwVumvP0xgtgyQzgMnQGCeQ?=
 =?us-ascii?Q?RKuNWE56MlCj3Z04FtNfs1u7lJa3LSPU9mG+S1BBQ7nsWe44e5Yck25dGZQb?=
 =?us-ascii?Q?97AmsCVe51Tj/v8g73muRDqav2Axzrlgn58HvxlSVGCeQI+jBneg5ryMgM9Z?=
 =?us-ascii?Q?1WeTFdI1Ygue3Gkp4bmj8JN6kaFzo/ee7FcyQhLMm2eGG71u5zs/Kw93aYXU?=
 =?us-ascii?Q?02ioOScEJXHcISkoDPGZso82I2EnvdGa1vVOfYXBtQWWdnZB79azjLw2Lw4i?=
 =?us-ascii?Q?K/kU6ZG1WZBegrVJPx5uvQzu25QDqcUE2tPR8j8D9/vPFGtL1e5v95ahkJQ5?=
 =?us-ascii?Q?scXP+wUGxSCvIUI4wiCERG26Kgoo/o0ThgUGECq4jy41DkA+5zW9dI8+M3Td?=
 =?us-ascii?Q?bmAE9KBbyviNt5lfyhf/CG0dW+Blyt5hfOKoBDSdNi5+cB+spj6hxc+aJH2N?=
 =?us-ascii?Q?82c4j16nh76yhrj1OCi5BtAxHy/bLSpLFZxrF7kbjC9bFuebnVD/088nxnrx?=
 =?us-ascii?Q?LSgMhe+qCHu9x2FcV2ynXM1AZohJdV6ZObbArjvcVWNroaPZ3YR91u4PmAmW?=
 =?us-ascii?Q?Pk/i0bAnviNZVZX3tcdDclE4yBOyCB6EdE2+xVD+B+XWfCABso9e+GEmWcwF?=
 =?us-ascii?Q?kYbYVfInJD6+nu7xUabnFdxBWhufwm9ayjfx9TahQJ1Oyxywv0qe+v+d9g0k?=
 =?us-ascii?Q?4eI8lbxVg02m1qRxAkBHiMPuhGB3g8uCc2aVJTU/annf+fkC44av0gRTyaTH?=
 =?us-ascii?Q?kDco8djoorYl/SDUHR7ESwF35v/PkYoHx1zDXGHN3Wqkl4Lj9oGV0I8aN6xL?=
 =?us-ascii?Q?5corxqcRTlKN0PqLtMXuuMk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84913690-1bf1-4de4-f6b7-08dcc578e593
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 02:43:41.8934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPnZTnVGB0iTcXG/1iMAobkCFXvAzoBe+JJI502OmWOWhT8E7aTH/oqrVAHOSJ7tJEuAbgNxoUqjfbhu9RFWO5HhXHyjSr5gRAZ/XqRMDuwiD/C9Xtwprhjtj1NLYWk8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10616

Now we can use new port related functions for port parsing. Use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/rcar/core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 15cb5e7008f9f..dd8e9bfee6c0c 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1277,11 +1277,8 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
 	/*
 	 * Audio-Graph-Card
 	 */
-	for_each_child_of_node(np, ports) {
-		if (!of_node_name_eq(ports, "ports") &&
-		    !of_node_name_eq(ports, "port"))
-			continue;
-		priv->component_dais[i] = of_graph_get_endpoint_count(ports);
+	for_each_of_graph_ports(np, ports) {
+		priv->component_dais[i] = of_graph_get_port_count(ports);
 		nr += priv->component_dais[i];
 		i++;
 		if (i >= RSND_MAX_COMPONENT) {
@@ -1489,10 +1486,7 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 		struct device_node *ports;
 		struct device_node *dai_np;
 
-		for_each_child_of_node(np, ports) {
-			if (!of_node_name_eq(ports, "ports") &&
-			    !of_node_name_eq(ports, "port"))
-				continue;
+		for_each_of_graph_ports(np, ports) {
 			for_each_endpoint_of_node(ports, dai_np) {
 				__rsnd_dai_probe(priv, dai_np, dai_np, 0, dai_i);
 				if (!rsnd_is_gen1(priv) && !rsnd_is_gen2(priv)) {
-- 
2.43.0


