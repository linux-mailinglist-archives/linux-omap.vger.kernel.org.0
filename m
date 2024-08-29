Return-Path: <linux-omap+bounces-2060-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0798E96535B
	for <lists+linux-omap@lfdr.de>; Fri, 30 Aug 2024 01:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2E58283880
	for <lists+linux-omap@lfdr.de>; Thu, 29 Aug 2024 23:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EC318EFE4;
	Thu, 29 Aug 2024 23:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dj2kFcUd"
X-Original-To: linux-omap@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794432C18C;
	Thu, 29 Aug 2024 23:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724973450; cv=fail; b=KZ5rR2uzZQ622s/G8CCS37eedOCJ/8abOy49dZw2+LxuKZyZCYmAjejYEDzVws/gvAz9xWfx192WURyGg01uTa+m1ONHjbRdLd8Nkuvu2L9TUKODO+A82NK6yCgxbf1kkyBL7qUi1hXefvUk5GjnTpis2V9v14clXeer2pjM/Ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724973450; c=relaxed/simple;
	bh=fcTlrKysDWOQQZSw2Z9ZzpziAXMBbAYHIkzhh7+7Ur4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HlupyNngRyJT6492bLmUE8/sc+2/SaeapNeesmKUBFeGIDwygn45GBKN12ceHzOREcT/Q7/3DrKo3tiltXejj/QWQo7mSpZIZDXqMkVSi1xyGW0l+ZR3Byd5r2iBJcMfU5xGhfX3blbg0t2v0DrkvAJxRouDv36WyJkCdyScZK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dj2kFcUd; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+uY7QQyNK7l6d7xl5+EYn6l1lN8PrVKngB+6mPoG/plfeREhICf8kdFk8tV5Uq/MkWa2TVbg1hknOEgKIxHZ1NwGBr+gLRl5/9pHwTDm2Yt+IwVaBRRHankH9SpZ1xFTz7rc+PpKI+Tki8dNRPYsUgdSwlGoO5LatKFPjx9g89wAni8vf7kFKQx+DvZIzN5CKGVQSe7QDw1ps40PBfV99j/dU2PnaZaqUGp9HIZHL44RKB2qo1G+p9Xy+zaaclt6e0A3yhJlGKCO2htVq89Wt5CHz+XIoRscXKp1AxZQNi9FAQ7Fk8SgoJXVd71tj0XFKmk56M5gTfRuKRG1UT5Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPEkfBNBRvkNg2rn0+tYl4uJGwkKUBv9QtcaM84RYeY=;
 b=shj4FyouOgG0yL7+CErFBjgugwg1BQwVbHMdTWFS4dipsBf+DihBgtK+YyBP7dG1habwMoVySusldRxPi81Q5DApPXFV2aoo251ORCVRCjKADuy16aLNotItaJ11/WBaQuK+Antou1WjzlnR75zAHkcEmyvNPP22xcXN/98do6C+YWCjIOamJoLduvKDHrm2/bbyM8wtVIKXlc0TEbofy5gBib/GWycJRas54/JEn7etjb3XHg63+cleuM/kr+m55n5kjJUnEk4o8tIpvr1opsv96AvlQRPQh1eJ+I8ehjpdoEzaYDFxGApvh7bvWVtrt3QFfGTJfFUG0A5Q4QM3qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPEkfBNBRvkNg2rn0+tYl4uJGwkKUBv9QtcaM84RYeY=;
 b=dj2kFcUdeDKbFo/sWlKAbxOuARx7HGXBltF/ciGukrhaaV4+HmEzNm263LP319REyDJINQD4UmGYGberkn1LAfKCI1N2wVBZ6Kime0mNAAcR2z+ljA22mm4PcDfTJ7oG4vvvU2sWlUaDj97/cHRE/C+dFeBMRM5G4WidzNzIUII=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10159.jpnprd01.prod.outlook.com
 (2603:1096:400:1d8::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 23:17:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 23:17:26 +0000
Message-ID: <87plpqncl6.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH v4 8/9] fbdev: omapfb: use new of_graph functions
In-Reply-To: <20240829154316.GC465065-robh@kernel.org>
References: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
	<87zfox1b9m.wl-kuninori.morimoto.gx@renesas.com>
	<20240829154316.GC465065-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 29 Aug 2024 23:17:25 +0000
X-ClientProxiedBy: TYCPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10159:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c6394b-71f1-48a8-412b-08dcc880bea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HpPT4qfx83lyS7/xpGNyeo60IuKg3PJOhNZDOhD9DriNelqZKKS27mm18GaT?=
 =?us-ascii?Q?7kD5SO7Q2OmI5k40/oeFj38QvlAJM6EbzBI65iNg/RE/8BSJJnKnZkWxya7c?=
 =?us-ascii?Q?Ry2pqN5ZDSlo0YbFqu/P1oqALCUJTVnUSYLLBoQy28X2Tr5IE0mqLJYx2Q2R?=
 =?us-ascii?Q?iouykD37xiQZ+8h2NlWKRhf7WBdSwIjBEbnSxffAGYG865Ibber+7eaOBS7K?=
 =?us-ascii?Q?oJ14fv8qvll8kYoHleLxACg8ViLe5Zt2gapcyBH6+YoLYv/wdIKtAN62B2zO?=
 =?us-ascii?Q?V2LHTOK65eQp1WZuNPLAcdbvDz4ng4o9vZLAK0HCJdDtbDI9egyVGXF5WFPK?=
 =?us-ascii?Q?Qwr6tJvymtsMv+sX/1Vz5ywcbq1jF6lFSH5+ld+dWTmfYpE0ZQdMPYhmN7f/?=
 =?us-ascii?Q?fQrxaNPHFgiEZXY3NAVbbMGKYiplTlIKBrjCiKQmMTyAxDfsia/YEixiYpBz?=
 =?us-ascii?Q?BtrvIuVSoaXTHuorkRgZHO/np0Ko82RwTempFRJDWl0wLaovVbF78nsGi3/0?=
 =?us-ascii?Q?Gm1nIaY09FcoGpDtiu3weW8Ra4Wf92fAj6hZVzoJVyPhTNKnLYPRMhQxT9sk?=
 =?us-ascii?Q?dbbbCgXwLXlHrLH0D06egWn1TEqhjUaH0OEuY9kmFwsbTMJehI+e6QXLoA+i?=
 =?us-ascii?Q?fOrYnOhQi5kcv5J7yk6orOUU9CzzkxrKv/4GOSwOTvrHimc5hRRzVU8B5/RX?=
 =?us-ascii?Q?4I+vMpQSYoUUffnZ1QxzG+srqlNg5pMVCpATVxcilf0XODzXps2CAEkjKtbM?=
 =?us-ascii?Q?fR8XaYZTpduivU/ssJ3LL/geJbXk2vK2amZG2ttZGmmPjQaTY317CE3oIYB+?=
 =?us-ascii?Q?lJ5iCJu+lJCtkaroWRovJMqtqBpr49Mwk+fc6lUcx4VVCrEy9ph2bZyEIi9S?=
 =?us-ascii?Q?Ri5EAokxlzvWIFhShl7/5PVfmdwdQFCF8m5rasLPyybajDkI2cTlZQdpw/x6?=
 =?us-ascii?Q?/AN6mbSlnAGXrq/HfS1Wf9r2kYXIXpgBP++PPk9E5BzEg9N/uXQFKaB/CDO4?=
 =?us-ascii?Q?xDsCANduReCzfNlRWvKEcMSzzq3qItc4yBzq8uhril/KdBT22P7NCg9PumAG?=
 =?us-ascii?Q?u7N+8XFCDwn+u4jJ3YqL5XJfWMMljGOGsNV2zjlLCoG1fX8oKYXtumFXlv6j?=
 =?us-ascii?Q?rURIqhuBqZC6Pf/cmPUy33JcNAMMRICaPtXGa1K4A5pEE8iRI+bkCCY1T76s?=
 =?us-ascii?Q?YPLfJwUwLFPAEsT+Dty/TdZElBUomjkIg1Su7Ye2cZusfHIt//rQKij9cR2j?=
 =?us-ascii?Q?a7n6XulDH9RD0ipU4GpBJOkidyoP1FHlKMOXuE6Lgt7l6g2xZnDNpxBq6QEl?=
 =?us-ascii?Q?HmW97T1qg7ynEJJNtq0VGoh/AJRub7nvyH39RAed8P1v7LRXu4z0/8x5OzJ7?=
 =?us-ascii?Q?pfcQpbrAyVJeR6AWRvslzqL1vhgkx8GfpgKF5LsP6mTkKkQdAw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XtYW8C5VosFxZUeW/e2iIS867nRSu9tflme4NSwaMZ7wa2RmpekSn7/dWnBz?=
 =?us-ascii?Q?wkc8Dwg3sQaznkdJz5cNyLtoB7tRboeNFog5FC3kDPoounM0WoaJvVxnw/ie?=
 =?us-ascii?Q?ppx340/Bjg/IfSIG/OxKD7eeqE7CnQful5EXhTg3lQuGVjcmeFyG1liJmiJ1?=
 =?us-ascii?Q?p8M7wRK/WJ7JXWTmWGSzQt045ukNhgtUUljXQeq6/agPFFG9h5FAfP6t4blV?=
 =?us-ascii?Q?D5qHeH+Fz51zP22AbjjosOPdLFMYhkbnC7hZon4AAYK6uyfHlwtQg7L5ChR/?=
 =?us-ascii?Q?VtI8i+ppo7aXWAyneBgLgFPQTETgWpJea0B21U39ZjIPbaRAXMrtsn0GIxEX?=
 =?us-ascii?Q?1WdMHgzJLlsv9r311MPQfZZy/1jzC9HUZpZofLtNnQNiUdn67KLCF5/cttHd?=
 =?us-ascii?Q?7dtCsJNgh1YH/36mwuOiCy+gCnLZeMh1kMBh+k3nG6hTpDWw1KsVnpGQX04u?=
 =?us-ascii?Q?5XBo+pA5lbi2Fxwa9zi4Ts/W8IUlqxukxXv2uUF+IjzXI6TFb7ZGKxA83Z5z?=
 =?us-ascii?Q?vh4CUZlP4ETKPLxpr2YpHbSzBj7lv4A0LjcDHm2lblohQXib7uRW7a5xWa4t?=
 =?us-ascii?Q?AfUyU0mMAhmoWbvtgYNnh9PT/Gc0xvomIb5Dtz/NkucdC+SpQqaVWDqD5nrl?=
 =?us-ascii?Q?cyt7xibomJsdKjxvmYknpTFDEMxxFDQtH7wm8eG9w05O1cQPWb3TyB6TihvA?=
 =?us-ascii?Q?YWhnzDeApHElvrl+dcW21ZtpYbnSdiuUpBbT9EbX1bGpYgFuLLUWsNUZstsC?=
 =?us-ascii?Q?X9OE6BR9WDuaHQEB0HxONw7u/+CBB98Q503ZRbMQMe3Lakk1cyZUuutKv43g?=
 =?us-ascii?Q?R9spCaxGoTPkqdA803IBWxnwfI44yIj4VonSeV0n5DHxtL8zTPnxKH0DW8Fz?=
 =?us-ascii?Q?MKzFCivP8uv2RGER16WLLF4hN0V4SOKKLhJjAppCH3qTQw5Nu5rVCCdXRTa4?=
 =?us-ascii?Q?p/lpRPFX4+swGn7BnrR6tl8ONKr2YjkKUXVyPHK4AJC7LG/BxtMXIy4IoA7N?=
 =?us-ascii?Q?+P8uMCuwS5SA+t85rkIzK37/ull1tLsdNqGFeKHwtFaOh+K6oSMa0rFjTYIG?=
 =?us-ascii?Q?qppJvRentIlHKvzytIMbJ0tMbcK5g7q9OxrcMciUS0eitfU+Xw7lDucnCWEN?=
 =?us-ascii?Q?OYdDlU2SomIRHADV56aLQp8l9E1wghICgiqIJSLW0Rb3/q0dQLGC7zd6GFqP?=
 =?us-ascii?Q?7nPXA/Lvj+Eig6OINElXCKigRKR3Y9wp5SPkC2KrKPvuZoAgmQHYEx9oBmsT?=
 =?us-ascii?Q?rziaEAQMgsYojOClx/p+6W7tKJ/IrAgu9A3a3YLSDTpuumWwrhh7K/KGTzyo?=
 =?us-ascii?Q?X/Bhl7F/yXh0TSaVcVvQktJSOBRdS4PskqjaE3CPreXQNX/fhjTNtwFGEGYt?=
 =?us-ascii?Q?ez2nPRFJe5SL7ejzGUQ9CEfzWjHUguASmtksANa0gyps3JjAKPoL7cy0BX2A?=
 =?us-ascii?Q?fbV0p2zPu9HJsN8HAvhC7JCjgsL30UfN6zUzu3Xs7XtmtYgbLI8/v4QY3TLe?=
 =?us-ascii?Q?pKJWzR3MwIYHqEkq6xap0GRx+bjiVQO5g5MjuzaB7B3ceAjmYGRop77qLY1C?=
 =?us-ascii?Q?RZ5BMoPM36Qb4NygiBNFcv5gcuZyojVg3v8KfT/P3dxBbyhqJBR9j0FJ6BBm?=
 =?us-ascii?Q?XaZ18GErYhbrj+RiiO8Ek4Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c6394b-71f1-48a8-412b-08dcc880bea7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 23:17:26.0608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5piOL1NsTJ6JWp/+1vA1l+GdmDm5JPHBbxg0hckiYzPuF1ao/MkA7arI4+1dS85PYuq7WlQJDYP50n1FPyoiBKjYLysXbDGYz6lg2f1lVp9uBdGO/tlelUGnlQcdlLh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10159


Hi Rob

Thank you for your review

> > @@ -922,7 +923,7 @@ static int dss_init_ports(struct platform_device *pdev)
> >  	if (parent == NULL)
> >  		return 0;
> 
> of_graph_get_next_port() handles parent==NULL, so you can drop this 
> check. And the other cases.

Yes, indeed.
will update in v5


Thank you for your help !!

Best regards
---
Kuninori Morimoto

