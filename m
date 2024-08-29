Return-Path: <linux-omap+bounces-2059-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28880965355
	for <lists+linux-omap@lfdr.de>; Fri, 30 Aug 2024 01:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5316283A26
	for <lists+linux-omap@lfdr.de>; Thu, 29 Aug 2024 23:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C05118EFE4;
	Thu, 29 Aug 2024 23:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jEM6YMNq"
X-Original-To: linux-omap@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010034.outbound.protection.outlook.com [52.101.228.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BED2C18C;
	Thu, 29 Aug 2024 23:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724973314; cv=fail; b=DBquGO8O7zk6tpeMvNFcsrJR2NN3XsEQzbryU46PGU9I2LxpjLlPYXKcFe5t/nclHgezMNc1lR/v00cT5qpUfAwBoxtkyftu5gJBingjjkVN7ygQG7/q72YxYYmdde941Ax83As8BoUzMJOGKVEp3Br8RBUTl2zb6gMhMB5r8G0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724973314; c=relaxed/simple;
	bh=ZEdWae2RbjI4sBiHfQlPv5AMLcj1hzR8MOeI1CPZMlc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SfbmIP3tm9SBnEFn5Qu1W7SRwIYv5lI1Fc7Lthw57fftRQvKvOqoCrBPNCDtIQSsynJ3tQPxjlHBEMUmgtxxFcYBZG88DuZTsJlbiHtBsZgsijmpfBeg+VzWvdJ3n0YoYAr8TRMB2xQym+h1eI3WQHify/P1IfxWDTgeSJakdBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jEM6YMNq; arc=fail smtp.client-ip=52.101.228.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/yVtxox9bRnc/4cwpJehD9JUkegF5UC1/+dJQDYoliQnx1yT8JmC7zDIa3cW7SWBjlvbMXH3TYy0PFIliss5EamnsrEw/SCByCoQmwlV2iA38+XjTHimToFOTk4QFrDpftbO3Xw0QdmmH1IbQoCA0soYp/71SXz2XyJvyJURank0ZWIAAvWQVwWCIL74lDC27+DPM75XhOpICAlcuOfmhpMbq2AG/YlifH9fLw2ngykWo+ceaqZ0t75TcoJ37e0MZjr/DLKUWBvcd+Pmtm9zWNTJ68Zo09+N3/9KhI+jDkglQfa74idg2aEhpj8O3aRgPOgjYjBALoFj/i+JqNo7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCvpf4rldOZbpgg6TUWDUmvR/L6uV6jb9lFi9JVl3Bg=;
 b=bZx9euSXcZ9tKnGC/DN1Txech9U3zzHh8xj+/lcwAqZUxhC4jTzjwF6KW71/ig4lqZLe4N0yB3VJVT9gLp5xZ9GqPsThayS/gbxJoYKVPOG+QbUkg1r/wLTyQwX5jZxQWlm7cyIMUGi4j8aO92k7A2GbsJqCBp3L8wUmb1iBsb+9WAan4Fb7If61LgUw4BHuwVkoqSedM6nJBPvETXWYjlczGBzCDr3QbtFtcZfvjJqBwuohc+pSe7/J1aPiMNzQAfosnMVwYNFyHzaW/egOVP9/OV/upleEZuI83qW6e++feyfLvknaEZvuxlH/bpBUnwZDWW41VS55kwsiM3yCLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCvpf4rldOZbpgg6TUWDUmvR/L6uV6jb9lFi9JVl3Bg=;
 b=jEM6YMNqGcfnhbqT/sWJTHtlHx8ZFPVvnAfi1QL4n7gMY1OyzgmPcsYRDt4G2HF6Q9FW96a4YHkJ0RZQFZygukKT0ThDX7BsckTTYFM9kWLXLiiGlu93ig+/Z1t89U/d3fUB0D7M+0qTGQ789xvcicKp8W9WmgKllr1SVEFrYzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10159.jpnprd01.prod.outlook.com
 (2603:1096:400:1d8::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 23:15:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 23:15:07 +0000
Message-ID: <87r0a6ncp1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>,
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
Subject: Re: [PATCH v4 4/9] ASoC: rcar_snd: use new of_graph functions
In-Reply-To: <20240829154102.GB465065-robh@kernel.org>
References: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
	<875xrl2pur.wl-kuninori.morimoto.gx@renesas.com>
	<20240829154102.GB465065-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 29 Aug 2024 23:15:07 +0000
X-ClientProxiedBy: TYCP286CA0339.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10159:EE_
X-MS-Office365-Filtering-Correlation-Id: 726fed7c-5849-4553-ecfe-08dcc8806be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D9E9WD0BgI8ZlwTagPjqNaVNrONJHoFKk7gSuInc5JLcFPi//qOyBGp7KnQ2?=
 =?us-ascii?Q?YSD8JtBuSue9T+DBjlesQcKm3jJ8FiuqNwjmwWx5aOvpE7v0/LSMVuAt210g?=
 =?us-ascii?Q?0sTJujLp88elC47jiYGZpSmkscDO+U6j5t+tvJqDVPhatP2mgNB/jv8fg7GW?=
 =?us-ascii?Q?fCiJmSKTPqiFggYjGKcXtXDCt2vpgd7wcSH3bPcTpS6WwN5nNz3u+N6ReVWM?=
 =?us-ascii?Q?n6vXQJuKUvUswVfCwB0lDyrVEQA41Wr1G2kKimQW9RrAcs4YrioIUEJ5lXDp?=
 =?us-ascii?Q?9jIoGdHZTtPypxbpSSauFPSRbZ8L9Aw7W4zUZPL5qFbnuUYw5uqSWEaEsa/z?=
 =?us-ascii?Q?dhUNxYEa+T6o/1NRNNtpT0fzX6LB9Th5NL9mJdQdxADeje+jZcMC75wg8HHH?=
 =?us-ascii?Q?0U+Z6hpYCikfBZr/eOnREwKMUAImoW7z8P6WL1VisgbOpNKhHvYr1twPJaUt?=
 =?us-ascii?Q?mlAXHyWfJ18C4DIKqjY99CBQciZksakhSBXG1Q7Hpgfx7RpUbah0NN5xhtp7?=
 =?us-ascii?Q?+sKe/YLpRbVpFWg0+LzdP6kmsgNqvsnx3hDowMAfoaecdENBqb6/NDg3qQ0Y?=
 =?us-ascii?Q?wtVJJ2+pcgQSpExqFNXeLApgmQqN9VXE5AWDHMjU2CjIMDtvBpSvnHg5K4hT?=
 =?us-ascii?Q?TDmSx+cyotfir0paQX42KetH72sZzfXr+oz0nOJOuysip4LekYuZmdQKjz5C?=
 =?us-ascii?Q?Zgnzgar7smRjlUnRRSnGW1IT4YcwP3Vip2jBGyrWsn9TE4TQCzrOesenF6P4?=
 =?us-ascii?Q?T2/iyjQ9WKdj3AjByVKBIFYnRbJN3yAPXXodT06tweQeLh83HZ5ZOezoR7th?=
 =?us-ascii?Q?FzoYle9e/rn53V8igiq36KqOHUYc2iASdWrED/l0fQeh+nZhloP0QdIHyF9x?=
 =?us-ascii?Q?dUVeuAcgDOgOebU2Eb1p8hGwVt/QjwGXqvUzXz45QgsGxWugNLN8rr7yfixd?=
 =?us-ascii?Q?WD5zULKRSO0Y50IT84cFr0TFLRa3fb0XCS2gm5O5CpetDkGJTs11Aj+ihGli?=
 =?us-ascii?Q?O8EVNNgbxFtsCiRbcSWZWM4ErYTO6Z3C0JlS6vvGFk18jzsmcnuvKHwdVXFH?=
 =?us-ascii?Q?Y9stAeYUpaRt593Yf8rNRG23lK4UmaWGzLw16WZwEUgMBPs1OO46acixFqDl?=
 =?us-ascii?Q?88KDACTvNtPv+zzge69myypuR/vl4Jkyfp0M01+NXUJ4i7jR5qPTQ5Q9kQPF?=
 =?us-ascii?Q?NxkIi6Z/3ezhlg2jS7n5GYXwj8yaLNOnjxJqIRKNkjiqXkqmZiKKB8AaZQHg?=
 =?us-ascii?Q?kv3nwylSpgCdq038P/crxGyrLVHdYyTCMxil2eVB8IEpMic0Phxnww+KHaD2?=
 =?us-ascii?Q?LROkiU0hZ90XW1DuGTYhv9l2rkWO1Bz6slr+/0poXSGx/aEKBB46wxStPuTP?=
 =?us-ascii?Q?182sNGZ9yM8M2htqjFZzOWSt1I4hRWT2DSDr214+LGzHdS3Xqg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?scHyyF++zR55o3DhJTPIbLw1m3fVW2/qLoIPm1QV1eqE8jd9eekKx4H5HmxS?=
 =?us-ascii?Q?HQ4sLwjsEV86ZYub/n/II9fo03zgJAyYOdV9TfRgmoC5Z65W8dI6kzEbAu99?=
 =?us-ascii?Q?ckJH7tD7aCuKa4o5974bIP3VGFAEEOlDpWN+M18ig4Sf7kWQkez66beuLwuw?=
 =?us-ascii?Q?JqBjWd+h/7klUjAk6EkL3oM5+460KcTsqCafzFesG0LOJJNP/UEEr5bWd5j7?=
 =?us-ascii?Q?AswZ2nz7SUIZsGxesFbSA29JTcqA8vZxLQDI34WMG3ZpUhad414LEvsptBUI?=
 =?us-ascii?Q?idJlfldh0hl3yG8EUr73/xdy0/WkK7fUqV+5jvOlOJNEAJ+nGBCt5jNt4gG0?=
 =?us-ascii?Q?8g/uwCJnpHMqKGn+ivL+kmCSxEv1FXc1nkQc+x1xyKHJ15P+uWjdYh3AJOQg?=
 =?us-ascii?Q?daj+sYvhLKZ3Ar/jzaWB1YRgYrlPAV2cDCdUKtd4wMiEW2RHmSj7hjHQgAju?=
 =?us-ascii?Q?gsGslPstSWpQVXCuPpSKp45Vh1MTRuiOOdyMfUWam/cnwkEXDMe3d0beBuXY?=
 =?us-ascii?Q?FBkN25rr2XAA/2dvl0hQldqkHX52ZYKhAwjsCzBeTjGpm3hQ7FLtvDz2PBV8?=
 =?us-ascii?Q?g2A5JAYrg2cS5JmSBXdCF5bXHM8nttGmk2yR1JONkcHMj3bdJsOvW4cIKHSe?=
 =?us-ascii?Q?0QwKITDxWVocoK/ro3J6NGOzMSLsdKG56IoLJVZ8qh2DU3dEZc/HdQgy7CuK?=
 =?us-ascii?Q?1atF6+pHjAS8kzWHTwIRBc35W3DvQfUKeNR6/Riixl8uo1qjBrgxtsUybyfg?=
 =?us-ascii?Q?NJQGNi9cHVfXmCFH+mSNhDs1w+cAY0FHXfvjLaOEmFZbN6poby3xo2Avnn6L?=
 =?us-ascii?Q?2muo5jPjKhfIXEfjQqKbsV+O6URKvRq/6vnalBQcj3HuSny0WaQRLkFl0FTs?=
 =?us-ascii?Q?+eFHgrHI83HUJj+KeD/bW7UI8YMogGeYtG9/gVGPQmCPFieNCBOSWjwLO067?=
 =?us-ascii?Q?mk5EYMXVVW8V5RyxQk7ARzp8SF8F8anhXBHvJTeceUedMbu2poiCsjHSOM2z?=
 =?us-ascii?Q?LxWTqL5WUWeMuysoPn1yZSQOZ6JcFnFMPnGTcbq5AmNvHk/agdJSdcXG3+OP?=
 =?us-ascii?Q?8Uz9AbaH+9wgF/eycq+37IwNRiI2G1oY9eGsoFdfpas6QaHcwDkkI3qxO8p8?=
 =?us-ascii?Q?aU6Em1SyFpQyZkm3uMBKVfAxoF+dkrIl+QcHfTOmQkZZJ4OJM4HV6PXYzwva?=
 =?us-ascii?Q?M4tACW47T1ca85WvCJU2Oqi8lCaUekYMEwBPQSVJdTyFuKaA9vpDIyaORJFr?=
 =?us-ascii?Q?KYlWb5MMQ8V+v2O8IgaoCO3iADHpXDNc1FmOhYz9afz9jlulyamx3NaI6K2O?=
 =?us-ascii?Q?XMvoQ8VUfQkEY0Aj+gXO4VClegFtvMmQFq1dawVEZZMpgCbIr/PqFzVQgoC+?=
 =?us-ascii?Q?tUDrWPk4AWWUHcCp9pTo6qGK05yc8G6B98qYW2q0gv5yBZV6g7+ttlHs+ish?=
 =?us-ascii?Q?ylqa2UwTreRtS/xtCdg1fP7dnQIrUi+oQyZr+Let4dud0all86JqzcDIYZes?=
 =?us-ascii?Q?ZZZ0RRDxXn2EAq8aeiy11XMkylDRwz2aZSxvHboGoB20OmeKl9n6rieBjCk/?=
 =?us-ascii?Q?i4ZRphQLP6FlsPak7sa7/+3iPQRl7UchrvOICl4BkDXZuRR5O/jY1pNXU0bM?=
 =?us-ascii?Q?HzvI2su/h643B00aZq9CxWg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 726fed7c-5849-4553-ecfe-08dcc8806be8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 23:15:07.2506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUbfJS5MG01BT8H6GEwNBytmtrEnpqMKsjby8ElKstdHaBZ2FFtRAOhIkg9xBzITtpA7Lqrj5VoFBi1Q9Skekl4UDZki6womm0T7OlbZMlSk1iXOMrNS6I/1UzNa2kMd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10159


Hi Rob

Thank you for your review

> > @@ -1277,16 +1277,12 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
> >  	/*
> >  	 * Audio-Graph-Card
> >  	 */
> > -	for_each_child_of_node(np, ports) {
> > -		if (!of_node_name_eq(ports, "ports") &&
> > -		    !of_node_name_eq(ports, "port"))
> > -			continue;
> > -		priv->component_dais[i] = of_graph_get_endpoint_count(ports);
> > +	for_each_of_graph_ports(np, ports) {
> > +		priv->component_dais[i] = of_graph_get_port_count(ports);
> 
> These are not equivalent. Besides now working with multiple 'ports' 
> nodes, it's possible to have a port node without an endpoint populated 
> for example.

This is the driver I maintain.
This code checks how many "port" node exists, because it needs to
manage data connection based on each "port".
The code was a little bit changed, but becomes more readable,
and was tested on my board.


Thank you for your help !!

Best regards
---
Kuninori Morimoto

