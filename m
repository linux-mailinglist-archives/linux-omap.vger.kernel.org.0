Return-Path: <linux-omap+bounces-2004-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FD695E6D8
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2024 04:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6684B21401
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2024 02:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7DB1C695;
	Mon, 26 Aug 2024 02:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Lw6Kziwb"
X-Original-To: linux-omap@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010029.outbound.protection.outlook.com [52.101.229.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1039C153;
	Mon, 26 Aug 2024 02:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724640218; cv=fail; b=mGASpcJFWFmt5u74EXvM+bUb1Dvuy9cm8nEx3CMEq4hfSV4WcuUT52xqDyv2aBShW2Qldss5z3/OVtpkXPQlpVbYyHJycFDl3YuVAleHi2nxj849Gi01M+9A3bXkv/mtU7J1jZpqODxbrsfC+9TPphZjJDQD+BkFSLJnIA2JWhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724640218; c=relaxed/simple;
	bh=aAwd//EGarJKeiyaWBp2ckG6h9b2atqVkQcaAmwOeTA=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=W1+cEf4YVk/FwkRe+J2H2j8Uxt+dQED7hD1eY02cbScO3GUtl+78r2ejOnlELdLLsIs21VH4FUj6DYChzIIWSMIwB5rtgZn+txavHZ0EMrJJL6rElPM14/ft77uLduSWPl0oAzWgj7W0a+u9ipLHigjiMO/xIC2O4zIAzkKoYo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Lw6Kziwb; arc=fail smtp.client-ip=52.101.229.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpoX/rm0mhWzYtepA42nH+pM5H+npbF49jTy0LicIhk9ul7PjlFgr4Gt7fojsXZQTWQNGGSF/f9PzzIICH3QXucGfySEBn1GftAWwV5QfG1jkxokmVvMxLC7dOPgi7eXIIZKR6zx80P7vcFEvFAKdB+eglfKWUaHsXkMW75a5UXBnl0wedv/MK8szIlj0/h/7cKEz0zCGg1IvUHsKKsrVQg9w7+3xxJJUuW6CaSkcosR8eDosk/ayYDqV1hB5B4foXbVJLi1u+CwdyD5XzWR1ySOJHXclyq+RW1a6J7SuK34g25EiOIN+TS2x24yrhPBPFDN9oQCfr38qG7sjrVEog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xK9PRpr8g92RSfeAYqS0rsU3uHRBqDoo+3h1U7ObAgs=;
 b=LuozuKqDgkHJIz5luKmlm9lPbT+TZC7yieutD5MIemJVIk8HeKwrBBvcjipP75naDY941mg4XoWLX/X3WkzhG2vPcT3QBqJKQkjbJJMgwB98CNL4RE62Ti5Y/LqgS+ue/Nn9Xbibw7lOs705EqPAJPj6MvcOLLZxoDaNlIvUvUJfHr6evDUcbMg+NfvdsM6yNAlxTGIMjco1DQKfAbFfbHJk3uT1x1ja47l2Jxd+px35QzVATjnsIiY851AQxTFBLLsZg/DtzLjMEJJjm4CJ0k7PkU1TYurm7gKyBDHef7x5Tg2lv+ZerEABVyTJjgNKo4+d4S2HADsd4clB6XjsEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xK9PRpr8g92RSfeAYqS0rsU3uHRBqDoo+3h1U7ObAgs=;
 b=Lw6KziwbVa8vC8hZa/G7afZ4ewBVHTkks3KBsK37Fb7huYi6q1Y+Xucr/Ttg5jRd4Q0k0WQmWAb7+pvYh2nNcCcE3t8Or+dCzMRq0DpOfzLreYwhBYuCXwhGcZyzr74fXuZ7VCWoFrRNPQH2ZKO//UX57H6GAiLVJzbV+yV8rXI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10616.jpnprd01.prod.outlook.com
 (2603:1096:400:290::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 02:43:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 02:43:34 +0000
Message-ID: <878qwkqa0a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 3/9] ASoC: test-component: use new of_graph functions
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
Date: Mon, 26 Aug 2024 02:43:33 +0000
X-ClientProxiedBy: TY2PR06CA0028.apcprd06.prod.outlook.com
 (2603:1096:404:2e::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10616:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7600f1-cb58-47b1-3aa8-08dcc578e0f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+AsNRX0qBUbqaHRFfdW6Q2ofxjyIkp+mSKd/qX5C1bnYorVBFV1KORS6ZdQl?=
 =?us-ascii?Q?zit7H6lZgCq50BQSRL24t8rEu2f6qK6O2eho8Vg9gUTqk7/e6l6vBIOPu04h?=
 =?us-ascii?Q?rzRDeZZlZ25VjBunEAbBbofK+ktxFpLaDXpWyV/WrQbQOQLvBHNwuV6elJzQ?=
 =?us-ascii?Q?7kM5JKm2EZd/eLJNtiN2VzL+dZbrqfCUmvuZn4VsdBXcI1b6LeWfr3fH5iTm?=
 =?us-ascii?Q?S1Ex3+jF4ZzYZOEGzvPYutPzsS8ohGyrWj2kzAm0QhUarChhlezDO3nmSmnl?=
 =?us-ascii?Q?B+5/h2kW1IIzQfEm6Yg6WJBX9JdjPMtDDV6qoiiIuUYTSkUmbt+SHoULWjNX?=
 =?us-ascii?Q?jtBP68mJ0p8SPrKWaKtM4LpNdTS3emE6dcXij0TDQqKzJqMyZIjY1v5s6D1s?=
 =?us-ascii?Q?gRMzXJFnXr9cGpmfyUz89kg5irLiZw/ugMcAMnfQmSZStYPE65pNDdSfcfBt?=
 =?us-ascii?Q?UjDAce2U0RPngmpuaVNDLoJQhHcFWUKtviyXHOkXw2TVTO57G0J54ePsFxJF?=
 =?us-ascii?Q?w7s5d2YBR+mjJhoiEqw2NleitrrJKFsCLab/F5uZMLy8DbihjWdjGASkKEMZ?=
 =?us-ascii?Q?jzCrRXE41CbuCWkRA7lvei0E0g4jEPVHW+fMfwlCIuR5yItLP5QUn+k2u/89?=
 =?us-ascii?Q?KRwmbC24z1hhw9VggsnTTbox3ty3FOgwIgGjNJzzqr/rIsJLaiODT28KW3tG?=
 =?us-ascii?Q?mMjpO4bH5UwiHef+Y8Dd9a1MX4rSNPwulNR+D2Ee4TFPqc6JqfReNJ3d6GcZ?=
 =?us-ascii?Q?+o94utak0wBtwa5g+gbtlQlM8AgVq4AOytJrmGw2RYDKVa2gh/mX4H6r9Oe/?=
 =?us-ascii?Q?eaX2Z3DseajN3yWIrEdtKfkIrFjY0GhUtHcXScPgmHIpyVG6d2KhQUowCcFI?=
 =?us-ascii?Q?A23gRs39EW8zg+VDDkASAGPG7PNJy6iRw2LkZsfxwTwNdpGaG0HasRmmOALz?=
 =?us-ascii?Q?WLLYAngXPQ6k8OBaFJLzHyQ5ttlonbszkGgnub7t6S8JpPpb9YF2R11Mzsu/?=
 =?us-ascii?Q?CoIpBYABxQSOxywq+f3KcNLJLKfZ2cXZ6KlSh6K3lZ5StKtT6zBTM1ljSCXf?=
 =?us-ascii?Q?5NNk8yYgPszK5ntd5RFOdokPY9GS2wBmzUtqy0FVfSe0ZwJEe+dca2bUT+Bs?=
 =?us-ascii?Q?5McpT51t46QJf03hORvZjSKIXcMqMHUTPZsj1YGpROVgoBIbMsoerzHfVmm5?=
 =?us-ascii?Q?IB54Dzwej4CJx6NSWwRSKXm9SRqbpk5WmluGPmH3VHCD72TOFretEwtQZL5v?=
 =?us-ascii?Q?ckPDX9RjBLd8ZbmWNNJ/hpBIrF0uvo9mpA6VdME0Jhjk+V3yISynu666In0b?=
 =?us-ascii?Q?A2lbngOdG5wBZoAa1SodQoVCVMcbpLjTOv0omibDKxGz6aZg1KaU48Xcm4oI?=
 =?us-ascii?Q?EIuAQIehQKBWA6MDAINgNRx/cJY+VWRQWgQhgisTDug0JSUydfukqYeZw3Bm?=
 =?us-ascii?Q?THswOuqedNQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?94o42hLFowFzvBBaK1NqVbEBYMQ+BD1705PPD1NWSsgm0ojjKKtzPKTqSMPh?=
 =?us-ascii?Q?gp3LjNydri8x/viZJxxKFSMQngMTPS4++3Yyji1SufYcAsU5Z9fUIJwM1ejO?=
 =?us-ascii?Q?7Zi3PijvlgMM7qTDwNQZa9KsrBo1EcEziilVSMbqb65Bsy5MfhnWkNQo4l7B?=
 =?us-ascii?Q?6aGXPR4B/TKAlL1m5kly2BCIFuLYtelM7z50qa//CjNVLu1p+q8Tvr6Dou3v?=
 =?us-ascii?Q?iSRw2CLgHvbzcaosEbDrAHz881ZHQp+G3TYVzVD4bAnzYwS7hyOXgDkfy1Lo?=
 =?us-ascii?Q?aPhyBcx9bTojxQLD8LhUCc3aBx7Rbk5+dajzL1xIt3fMjz95nY0ZzCgF4VxA?=
 =?us-ascii?Q?npqJHplNW8maUWprnFB/8UJh5TQrcwtHuSB1N9mly1RLD7y/pzigJSYYcER8?=
 =?us-ascii?Q?r57ddNeawE2OvNpWieSv9gIXs5FK4l2Wc0yEsvaV+2Vl9AI5IeAhG8oz4bIb?=
 =?us-ascii?Q?2Oms/HNUj0ssOzO0MiVRyK0LmrVz3+v17GGE7NsMEg9SE0y5iVAudLoRoGob?=
 =?us-ascii?Q?mNPkuAvdNdd1OlFa8rCUAAqoaMjDU1J3P9EWHt4ENr1+wJ1wiJo2Rtz2jpgZ?=
 =?us-ascii?Q?VRTah+GIiIrt/tW9wvt2D2UWNPXTIn34Zz9c21FwXSqbnv4fzLBZHLPQu1ji?=
 =?us-ascii?Q?WYkXN6CCHER4nnmHcuDvIz+gl1yR9xw7X3bdjPsqAU1gKwWw2yww1D8Zqo8V?=
 =?us-ascii?Q?K3vDIh/nMiGs/1CPU+h4id9/tmnPn/293EcJnwC2wzzhQ6F0JcofnDuNDYnG?=
 =?us-ascii?Q?KLxptYWlUJn/kn3wqIifedJQpPBm5WXxejumU4ToE0kTmQss9BkX+KyPu+GF?=
 =?us-ascii?Q?FIlX1MXfTmNjZ/y0Q5YGRZ4rFDJzQhK5vtb9YEBtS7tQBpluq+nGx8Zz2+SX?=
 =?us-ascii?Q?Nom7dsDakbkp/h9VfwlhktL9ayppWwpkEw2OPKDLeRGHyVSwgM/3qk+pjODD?=
 =?us-ascii?Q?vXhM6vvkIpr9KCIKQ0VSXqPWyPd3Vsv/3ONh1wZwiKEAKlDld2ZWUg0AqIyu?=
 =?us-ascii?Q?1iA2Goj3XVMxiIC4RP9ljAykupLCN9pQejhpnjRiq6m5biGG/aINj9HX7wxC?=
 =?us-ascii?Q?LPToebW4JtuCpczwV1r/eKh8Kt6vdKqgExEQp4qe0qFCEzo3UbuPlZT1NPGi?=
 =?us-ascii?Q?UoW0dAr6VsG4KgQT1uujPnK5qWv5Db9eQGhRhN2doAqPZgVBwM5OW3IeP7bb?=
 =?us-ascii?Q?luf6y5pSxK1NXbicYMeyn3SMeZatkimOzeo1fMweaiMeumfAb83XD0pVYojR?=
 =?us-ascii?Q?gRlWnq8qIqyetPchEG+72N5gcR+vvqDyH+/tVAOMAVCVyRORqhSIP+KP+4Am?=
 =?us-ascii?Q?/4tEXNMwz4/wluXBAF1HvfLZZErMcMiE8vL4p9X4FTMdHpXgTZSB0THfxUOr?=
 =?us-ascii?Q?E5YF6s7gRP6ZPtkR7b6l3M7t4K/oQEovl6eHGVwyZ93LuTym7wKBGiQekzPO?=
 =?us-ascii?Q?P6S6JtIB2oY68phgD/18k6WGw1E9DG6WFcvRwMofLBP9WM73lVaXKn0F1qQr?=
 =?us-ascii?Q?RiiL6naLRDwspXc9Ng/p71fM11Fwj/4zkMaFfZ7O67o5jBSKo3Zhz4r3J+tL?=
 =?us-ascii?Q?B06p69XvJl5w2AZpyZrglreR4x7VOPemHMQMkW2kd+ccfILlIVc9sZuw5Gw/?=
 =?us-ascii?Q?sIpgZqPJsAR8VwwXm1yTzq4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7600f1-cb58-47b1-3aa8-08dcc578e0f0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 02:43:34.1092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IqyBmu15slUaCazMWs6xtbqqqnOwGpfCl6Vn41safxeIoxZwlglaXDEOz4QSCbqC5nbtk7sRrAgmgcFuIKFrG5Nm4RSw0CkNOh/m5wID3Noj52QEDBTNCvahO0kXftY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10616

Current test-component.c is using for_each_endpoint_of_node()
for parsing "port", because there was no "port" base loop before.
It has been assuming 1 port has 1 endpoint here.

But now we can use "port" base loop (= for_each_of_graph_port()).
Let's replace for_each function from "endpoint" base to "port" base.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/test-component.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index df2487b700cca..93288f7fa3861 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -521,7 +521,7 @@ static int test_driver_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
-	struct device_node *ep;
+	struct device_node *port;
 	const struct test_adata *adata = of_device_get_match_data(&pdev->dev);
 	struct snd_soc_component_driver *cdriv;
 	struct snd_soc_dai_driver *ddriv;
@@ -591,7 +591,7 @@ static int test_driver_probe(struct platform_device *pdev)
 	}
 
 	i = 0;
-	for_each_endpoint_of_node(node, ep) {
+	for_each_of_graph_port(node, port) {
 		snprintf(dname[i].name, TEST_NAME_LEN, "%s.%d", node->name, i);
 		ddriv[i].name = dname[i].name;
 
-- 
2.43.0


