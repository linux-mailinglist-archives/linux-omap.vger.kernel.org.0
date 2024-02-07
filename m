Return-Path: <linux-omap+bounces-518-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D4384C1A7
	for <lists+linux-omap@lfdr.de>; Wed,  7 Feb 2024 02:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD9771C22BB9
	for <lists+linux-omap@lfdr.de>; Wed,  7 Feb 2024 01:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6554563CF;
	Wed,  7 Feb 2024 01:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZfJE2BJ8"
X-Original-To: linux-omap@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2086.outbound.protection.outlook.com [40.107.113.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27F39457;
	Wed,  7 Feb 2024 01:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707267971; cv=fail; b=HHEdqcy6je8yh8CcoAMFOTmxuThLXKbmmdUxTJy0aHP5lpQJnfan66UCAJCX4hPqH7ABnz/iR9AynP87rlpU9s8s6n6C+yCNA4gHiPpF/uXC4qANLv4qtF+FS1Gj7woPto/y/3gDdGtNmfOZLqFBvjokcOaYLRTNAZbiR9cRS34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707267971; c=relaxed/simple;
	bh=JUr9nAMarWnz6gPTVMxgqdduXwq8cA8kA/9mt5+8pmM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qZ0vbvrpGSNu97m5lLYwHO10zsURsGY4eWuQDigXE5JfhyAH78/6DMwCgJJBYycb4vt06gOkzI31rcpzC6FsXCX+kMblrJ/qnRumtjIfwIwg77bGNcJaFRZBOc48az5xeR5RQMawHFNJjn0qY0dBHArP5xc3ccDm1xrCfUUxDas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZfJE2BJ8; arc=fail smtp.client-ip=40.107.113.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZ/rsSRMOUu01BIicgbErpNuk3znpKRBYoK0BASM5HBs9fb7ls2b6VuO62WWSkcBqKO/cIa/0PKBi7raRnQIMKJe4gWE41WJLWXttMsqG5qzI7aMtzRGHmZCW5gx/Ft+lnI7tg7y5XkaM6UysJS/brnEV1cabelWK8NC56wblZJ6y/EXXjGKHpvgnfaM1QtQzgnnv0UEUOSmvUXloyNSwsd620Q48MpUAsTX0tQb3JWBe9wD7LtiMCmUZFd3PNeey5M9oXz4KLcf7xHrL9IZeDN9psLKCRewpFMPhFwROgjzotnjWiF9xWfaFGXN3kGgUyR9GAUZIy4kDsSmpRNKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuYXGK4RFsD1Cdml4BDT6X+uhZDHYMfB1RCjmEJUYIg=;
 b=SV99r1xbgLgJ7bHF/B4DJztlH99PXhbFSSMZt2sROYAQOn4X5UkZlZ9cEZGs4vprt2ptMlpQSryU4j0etAQHZRZgagID+rn9bjb05foe/t0UMKrDuEVb+pxoghivRPQZddIg3tV9gKHk+ne2HUKAbjndkkXPR7NIJMIyS+AoXNe87qQOzub+iyBoz30SHzrJeMts6lEPOuFJfkI6jLWFg/+wmH9+VKuolfG5ipddWM+12Vshx/BxhMpIQ1FwF/MGthqviTDvGiC8bpc6gS6s2ijqpJQfDw8AdqusUDt5ekdqqO5umoEYuPh4gpPBKFZFgRyQNxhHa6XqU8heFNEffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuYXGK4RFsD1Cdml4BDT6X+uhZDHYMfB1RCjmEJUYIg=;
 b=ZfJE2BJ8IirqZ0iRl8rddFvUe0lXLr+6/j85UoK7TQh6/amVy4VaoeH6351/KmlD2a7t96AC+9AwOcwcFJr+SN+rlrGGnwqf+uIXJVfoI7rlZqX4yHubSltlWxc0NdUuLNEYB6qm4s5JUVUmbpy7xDFVpHLv5je+aDRJuCIIqyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8599.jpnprd01.prod.outlook.com
 (2603:1096:400:13a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 01:06:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 01:06:03 +0000
Message-ID: <87zfwdrslh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,	Krzysztof
 =?ISO-8859-2?Q?Ha=B3asa?= <khalasa@piap.pl>,	"Lad, Prabhakar"
 <prabhakar.csengg@gmail.com>,	Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alexandre Torgue
 <alexandre.torgue@foss.st.com>,	Alexey Brodkin <abrodkin@synopsys.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,	Andrzej Hajda
 <andrzej.hajda@intel.com>,	Biju Das <biju.das.jz@bp.renesas.com>,	Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,	Daniel Vetter <daniel@ffwll.ch>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,	David Airlie
 <airlied@gmail.com>,	Eugen Hristev <eugen.hristev@collabora.com>,	Florian
 Fainelli <florian.fainelli@broadcom.com>,	Helge Deller <deller@gmx.de>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,	Jacopo Mondi
 <jacopo@jmondi.org>,	Jessica Zhang <quic_jesszhan@quicinc.com>,	Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>,	Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,	Mauro Carvalho Chehab
 <mchehab@kernel.org>,	Maxime Coquelin <mcoquelin.stm32@gmail.com>,	Maxime
 Ripard <mripard@kernel.org>,	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,	Russell King
 <linux@armlinux.org.uk>,	Sakari Ailus <sakari.ailus@linux.intel.com>,	Sam
 Ravnborg <sam@ravnborg.org>,	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,	Tim Harvey
 <tharvey@gateworks.com>,	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,	linux-omap@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/4] media: i2c: replace of_graph_get_next_endpoint()
In-Reply-To: <9d1e99b0-892d-4a72-a9b3-886b8ed094b0@xs4all.nl>
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
	<87r0hqnvxc.wl-kuninori.morimoto.gx@renesas.com>
	<20240206134155.GB2827@pendragon.ideasonboard.com>
	<9d1e99b0-892d-4a72-a9b3-886b8ed094b0@xs4all.nl>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 7 Feb 2024 01:06:03 +0000
X-ClientProxiedBy: TYCP286CA0137.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: f8621c84-0905-4d73-28c6-08dc2778f4b2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mghTxU+JPOY0W+ulZi8cY0fVmGQWbzkc6ek4kfsoImANvWvwIk99ARne3KFtFMsKIE8CUdqSaifiy2qmYh5MGaeWzP7MUcok2c98onzWErTsxtON1oIJDcTDOWtAt+xzvJeSAqsYN9aYhyHXeKIR+AF/Ankj43fMEWq82NdoNygE+TBvrfgBsu6uoq5A/aB+3OisluOEPzcNPZSzaB5FIk9Pj859nVL6baJAZs7ir8BwlJNviUJerjlegfai3QDWn+1Qkt4xwmE9S//TbAHQJV8/OGVtlahu4l/l7ZRzSoom6b5j+9jbY3Eym7CdOnxbCqJzjOSmdcLwdVyWphsX+3KbZRn32/ifmGc5BOint7Q50gEDThlxcB2D+L4sPu5aCbDeryb9jR7hFBaz9FEkRtL5xZgftdEq1tR115OEeKpuEYKBhUsyO3AqCMjVhT5sTy166n2PwZ8rFIlUi0SXOfw8kLOgY5BDv80fgU9bEraPMJ445pLan8KgXYa2nJSROUrlzakK5u8Yqu3zN8PfWsbRwx2DDGXODJCrHRe3aU5gxn/ZoTf/ON4IBC0Rj/NZxO1j/IvUuQt6y2jSZ4HhcUkEi78bDGiLicAlfiJVnbqVAJ2rioM0BnuSCrNKLfgP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(346002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(41300700001)(2616005)(26005)(86362001)(7416002)(2906002)(6486002)(5660300002)(478600001)(38350700005)(66476007)(316002)(66556008)(6916009)(54906003)(66946007)(7406005)(4326008)(36756003)(8936002)(6512007)(8676002)(52116002)(6506007)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DxaBEPkivV1neeAzeePzq1IJJr/1pfel0Er3oyBGgTz/0rRZIji51O6c3r/y?=
 =?us-ascii?Q?WxUkXOYl6ci8oLBblY1FrihvY1ZENCRhTqPgzB9TB5s3M4XvrGg/v0EueST5?=
 =?us-ascii?Q?ySPpNyn0qFWpEHT066rXvYcWCbL+DP3MyP8UGF/C25EE2pgH8HahNvoWNh2B?=
 =?us-ascii?Q?x8UuYBz8Vrb7g6ENGvOo/60k2gE8Oe0eGuxICB+UIW+3d6Tm+h//puU7nET/?=
 =?us-ascii?Q?SPNz+vgV46cEM/aXTKQPdcFjqtQBk0o31+C4Peinwb1ZXSC9aOoUTwVpxx2L?=
 =?us-ascii?Q?x8Z7Y8LYm74QTYoiQSbmxT9YMznoQP+MgQReTV2Q/v0O5qcbMEG7/kEdfsx5?=
 =?us-ascii?Q?rFMnkBtjnV9vUrRaf8KbFCwUoUy66TynXvszo4Ub/CNeRpGZlesIT163njdt?=
 =?us-ascii?Q?oixUObg+0SL1EUPFiLh9ZkibdUzvKjrA5oIZkiRd4pccvHzQ3du63lTHEPAf?=
 =?us-ascii?Q?39eJCLYYB+dTzVv2nI1pUPNnd0sig/MqaQZAF6N5FwMzezxnscNZJzxjtmsH?=
 =?us-ascii?Q?o8yrENiztVTn1wNzjZ0ZAlaxs4kHlbSGijn80YS+eXKxY1RxH8Pd9CCdUj3w?=
 =?us-ascii?Q?crITOe96dbRbGtZUjhpz5OsxMgRFEwQSRD6oTKC275jH7fwH0JFphTMP7jVO?=
 =?us-ascii?Q?EPPcNg7mJaW+VEq+vaFWT1wgTztgrZrttRQLb6JZyXEde6bIcVqkLTJtEPQv?=
 =?us-ascii?Q?FlFzHhmTbId5eyTjXV209JbSjByKDE9EuDWdDKLyItWLOmPNRNOwjPynh1MH?=
 =?us-ascii?Q?7U0BO0ItHvaRs+zC1D8wa+SZf7mUF42iFq+fWZ3E9NSgShhtV82OVjAlfhY/?=
 =?us-ascii?Q?JRnQGsMB6n14Xn+3c2wb9v1lQ8JhIGVAp4HPk67jnEuxHGEVvCtvQ1zItZf0?=
 =?us-ascii?Q?/TyLQEkswgx0J/3Y+0vCR9rw+KloPB9Xppc5RLFF1ooM2lMfRy2Ju4TDrKO8?=
 =?us-ascii?Q?2wgdTzaKbatrSNihKpjUyAu96CtbJmKwT64erBFhJIyXSeSFoANjHO35U/a2?=
 =?us-ascii?Q?i0bG9sl2imQNHkEB6hw5h46MuyxrGhgqw0PV3GTrB8Lnf3EhlPYAnplpqwE1?=
 =?us-ascii?Q?xugcU9VH4bHg0dqg+HyKw+TMRWYL9PM82qsiPhdR8rG0nIlOjC55zDbRMbcB?=
 =?us-ascii?Q?M62enZplpZJJi6FeLVzBCga+qEbMOV9g2C0QEWe0m+qrTV6T42oLJUsXDrvl?=
 =?us-ascii?Q?7LjpbVQ08prcpkCWtLqcBjV5w1b5nogB1hhGpquc9aY0U5UW0GT19ZY3Yfvr?=
 =?us-ascii?Q?yK4zAA4yWaGdz4vAtBvon2ugKlPIPTyHNYmBnrW0oxtsVy8SlixSt7iSK8FC?=
 =?us-ascii?Q?CrfcQbjvM9WfdDCg4OCLMCZ2NtC58y7dTDIe3Q3i3t3cHdJfkADl6wMTI5uE?=
 =?us-ascii?Q?SnxjYsTX1EB3K2op1qY4l417/jB2JM5CqHbKbq4bVQzGQH8uwZgTXcaNhZrd?=
 =?us-ascii?Q?TIYKwg/HP65I2V7bB2vccFgUQ+3GtU+pqiWa2IVFmEDyHwkwxVCh7QBWQ0UC?=
 =?us-ascii?Q?LKryp+cB/+OyJfek+/A9NyXlQsQkR02f2se3Z4rtp0nO6gDE41OVox6NQi4Q?=
 =?us-ascii?Q?dwrFBYbg152X0533K6ZbwuvqlPvAsP8yV7iIdHvZgjFM6NrCDGlNi9cQd2r0?=
 =?us-ascii?Q?hYbsiMpSJMNrV6BZxLosmCY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8621c84-0905-4d73-28c6-08dc2778f4b2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 01:06:03.5722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3O4G9g/8Vv2ALrbe5DDm6DOwbPzgq1VPa+W26R1QkqNaoJRju5gjzKl9hCcoIl/BCayEw5EYtenX1asgCscu1LGWsTkGYhAUkfdnmJqtea72XQhhWaHWiF41V3MS00Ze
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8599


Hi Laurent, Hans

> >> From DT point of view, in general, drivers should be asking for a
> >> specific port number because their function is fixed in the binding.
> >>
> >> of_graph_get_next_endpoint() doesn't match to this concept.
> >>
> >> Simply replace
> >>
> >> 	- of_graph_get_next_endpoint(xxx, NULL);
> >> 	+ of_graph_get_endpoint_by_regs(xxx, 0, -1);
(snip)
> >>  	/* Parse the endpoint. */
> >> -	endpoint = of_graph_get_next_endpoint(np, NULL);
> >> +	endpoint = of_graph_get_endpoint_by_regs(np, 0, -1);
> > 
> > I think this should be port 1 for the adv7611 and port2 for the adv7612.
> > The adv7610 may need to use port 1 too, but the bindings likely need to
> > be updated.
> > 
> > Hans, Krzysztof, any opinion ?
> 
> It looks like it. But I suspect the code never worked. The endpoint parsing
> is only needed if a specific mbus type is used (i.e., not 'UNKNOWN'), and
> I don't think that is used in the device trees in the kernel. So everything
> silently falls back to UNKNOWN and some default bus config that 'just works' (tm).
> 
> I'm pretty sure this code is wrong, but nobody ever noticed. Changing it
> to the new code just makes it bug-compatible :-)

Nice ;)
So, let's add /* FIXME */ here in v2

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

