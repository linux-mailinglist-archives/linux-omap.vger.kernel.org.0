Return-Path: <linux-omap+bounces-3681-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE017AB03F3
	for <lists+linux-omap@lfdr.de>; Thu,  8 May 2025 21:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4395D526471
	for <lists+linux-omap@lfdr.de>; Thu,  8 May 2025 19:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4D228A71D;
	Thu,  8 May 2025 19:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lEh848Rk"
X-Original-To: linux-omap@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DED04B1E7C;
	Thu,  8 May 2025 19:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746733729; cv=fail; b=TlTnTxoIQLkcHpOHK55iijQP3moFFbfC1PNBbVoTGbfZlDzgESFSCnEmpsyWnsWmAEiqTVTxlAHYnbS9ez5bie92tjcFbeHnVaCk04iEKZOo/UE7CouQsD2Ggj9pxcymAoUfD+lYkc8UJdpK0gSoOQ/ltcti25Ch7v59WtrAWBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746733729; c=relaxed/simple;
	bh=o2mrepm1/V+10awebHHGyo1wb6gMsEFEyAUt8+dUjYg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=McmQPH42UKrgHz3T1od2nVyc0UmmBWf0ChkdpTkS3U56AhknPFnsqZkupRqWp5bCdLR3FyJM79dav7XiDT5/2KRQdrCIqbXzLGm9Biyp4FOcWjmRMT1VBEKAaFXqhqghkm9FbNOZTW0bReZUDo4AxYKY+/6obFUDXOKq6xlBP5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lEh848Rk; arc=fail smtp.client-ip=40.107.22.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=toHIJiWa8kthliN4C1i0Ld53Gp277nhYXO/oawDStKQl/XSb1/aoQPg9PkgXTa7n1lqIJ5XSwHTxkmglfwTkjD6Qp817bbCKpiJee7gZN63uczV0t8F07xK83xxVsEAmjtbAozQxrO7CLuZFG4w4AxzQ2A8czDu5DJGReipeJJ+vRa8t0b/VnSqGC9RHasbi2ld2m8zgBwHzGQXeNhhZWltCWPKY42B524bIzmyjthvJtu7wea/M4I/3722e6ubFoFQHddvLC4yJuD13EDXVpXSFm/rcfaeO/m/VLfJ3jIO5awZNIOhaINOVdsaprX74w3/ObKkEiDY4lvPnBNa3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDYOK8bcatHVt1YG5+2Z9BAQjyUM63G7Oww9tLMYYtw=;
 b=wN83Dy37zhrsmT/wT9vVXQwdYCBtn6TT+6vx/Ot2mLbCWx3OQ+YHjC1NvNeD1MSBGn91cBLl4QPJeW4WXF/D2OwvzZ4hDCa2WbcaKKM0rU/6FGoPo4SpIvHVWvjrnRi+/XTGY7Pbv91ipkZpihAJ0hfnTscZd/9UVFE8VDMDN9u7sT6IWnbrW/ksztRsvH+sJ33xHTaIhbhXFodQQDLDzGCb9lTWrmCBhLQzWMdEuGz2R5bZmN7Dn5pcFSg/PTtnTZQMqObIROmYA0dmbFwvSTywP7Nh+N1f2zn0ybHXYw4ccYTR1hNf7pRwCvEAueOa7qskTxWO0o6193YzVl5gRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDYOK8bcatHVt1YG5+2Z9BAQjyUM63G7Oww9tLMYYtw=;
 b=lEh848Rk/hHEKMGQdbOiHRwvnF+dAVgAmIlcUec8l20nlzVsdw/dNgMEonvW52WitH9x/nOjuIaSbbgh0pEz3HKfz9zVO/5074w03GHnQOJlfe2vL2L7/KeA1FgTaDrycdMEOWbUED4Ac9F4/o9OCcPXZ9SDeh1JIC5WCYPwczbMzg8PlfItIz9LawT29AHqDTwd24A77o1LfJ8KECQrgh/eltWRTwdka40BKQ3wlKsVd07GYnSZ2gLA7lsbvd+MVtX/PvEXEZJUuwtnQ2r5UQomXDbxlPWGVt2+q6Rj283152eXep2EBZWsR1NdTOPyXcUFy3OYHNz5MJdie0RMEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DB9PR04MB8395.eurprd04.prod.outlook.com (2603:10a6:10:247::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Thu, 8 May
 2025 19:48:41 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%4]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 19:48:41 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH net-next 0/3] Convert cpsw and cpsw_new to ndo_hwtstamp_get() and ndo_hwtstamp_set()
Date: Thu,  8 May 2025 22:48:22 +0300
Message-ID: <20250508194825.3058929-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0471.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::10) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DB9PR04MB8395:EE_
X-MS-Office365-Filtering-Correlation-Id: 9131dce7-fde3-4feb-98c6-08dd8e69552c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8q/UalrfEVmhe/GvtK4ybLcStkMEAhfQa7Uwk1aekMjT5pUMNuDz5JF7CB5j?=
 =?us-ascii?Q?RkepjOGIHmrznHS4omDtwLXGwh4DJQVrKvmWUPe3/CJK7qxxOTs1qcyoa7ee?=
 =?us-ascii?Q?fCMbiRESXAiiZ2jbsZ3W8a2LgbtksA9UIvhBMw51pvIkUmsynEA2ve5uqx84?=
 =?us-ascii?Q?6DfW/0r4KnLQ3LrCKG2XWK4atm68+BPSccKfwG5dwDejCEOpn+nwaJNQ3qbs?=
 =?us-ascii?Q?RnFZZQCcSfQA5/1A+p6aKmjW1oeTuIcR5KipAv/2hGZ5iKszJnVNOrVfKFx8?=
 =?us-ascii?Q?J68Pit7Dx1ayC8JK74wrdXm6IVN68nanmoWGY9JRrqfdY2d7G9n1KfvS6cOt?=
 =?us-ascii?Q?XbJfcUM8jatF0nK3OZJdFZ0F3cUTRglJ1GlxxyIAWONOoZOmve80zAjH9aYL?=
 =?us-ascii?Q?hkJhJ1yagwBxAvU/mnr5qsPA/Wa1ZquePkHe/tKiMyaEo5ikd80OE7gwO4vH?=
 =?us-ascii?Q?yFKTHOTI9kzEGqK/Chos85tN7e/ohpOZdV2/oliuUidgXXEIiP6xb58Pk7Jl?=
 =?us-ascii?Q?j7OCjSoKtzG2kS/J8tyd3hAvx+dNWisnllJDZiF1DlhMjeqziJ6jTqB3kREe?=
 =?us-ascii?Q?zxvju2wzrkSgg7PD5YV5od1A7r/IZCmNZpMUPMJ/HzNbc7EjPBhksC2SBcw7?=
 =?us-ascii?Q?lOdae9bZ5ZBFlU2eKBCVcylsKSbcPs+YSeBOcJ5rRgTmGHGBW40ABk4n+9H4?=
 =?us-ascii?Q?lXGmk8nUByopbVkgUwM5ZO2w1ndrPDP2VU31kxTtdvMWFJRGdul66+vxg64n?=
 =?us-ascii?Q?a2PU83QqSu61258StO3kfpUR3bysomeNQUbvHduJ6UfoFZxXDI8JSS4iljPC?=
 =?us-ascii?Q?iNweSd7k0SYK0uGgVwKq9AivuQZmCf2s6WIWME3ujiSRF841GBu1jS0fCtAP?=
 =?us-ascii?Q?weHLE4KIWSN3XJsZXArF3Jg7w2TdUJekNL1gPiePd6DUHsTsSWq2ubyBlOyz?=
 =?us-ascii?Q?RngYezveNX7vZxVdKyfZvB7dCC+9LT1akukJStcveLDNS6JCjL7oueBz5E9t?=
 =?us-ascii?Q?yaKQEaWU7t76enxhm1oWrFmnrTT1tw9U4WZLgXQj07Q4O5SOXzbR6EF7NvaB?=
 =?us-ascii?Q?B1oUAsse8E2JFC5dJAmBNSNDQraKNDXpdH3DX/6LEwKWDBggce4caQvFJb8s?=
 =?us-ascii?Q?5LnejNpG/iBlxEarBo6N8gGAiHWqztMgrhx5xLWg+mREhrFondfL1JqUgbfG?=
 =?us-ascii?Q?pUz3kfCA4NuViJcQW3iYeq6JnbPdSre3phpJFFKI4ndjOj6smM2MXS+AWh40?=
 =?us-ascii?Q?glP2bLQhfuls6/Ga6m6YVngQuhdrVN6ZR8YlTrZrQDZI7pASlR72myrJ/bBs?=
 =?us-ascii?Q?BR3tTtuUWToamI6QLU4PKWHEPPAlbZ/u0X7RFsqj64PZ6MGuuIdBUSARq9uk?=
 =?us-ascii?Q?VKFHKqFHp0KRxo855NP4zaG1ZaFBmuZm9j1T4IWUiR6tzY37zWdbIM/nKgpi?=
 =?us-ascii?Q?7anJ91nSGzMBkb2wJUWxI+WnycJTYW6mAqS2NVO5PX7QYcmDT5zzGQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5gxnfi8UKA+Z5F6U1rKApQULtQEd9haJXkb9dEzDuOgFEegNn9qXNrQi8OX1?=
 =?us-ascii?Q?maP0XcOsoh8WH+rcsm7RNW81L4OLf4I9GFIbTrCjoY/TMNqztj/o2QIhqs8h?=
 =?us-ascii?Q?9cRoLEFmIBKURW4unWjx3kOhm8PlAeaejlxtZe1/BoDaMKM2+vXQcYPt7SgI?=
 =?us-ascii?Q?jWGhOsPdU8H/f1AFRJNpHuxmyyzzb+OPnf75hN/9vlA9pi/EmOfjxUA90+jH?=
 =?us-ascii?Q?rGkZxu/LWjhDdpeUtasHB1NgzoATCgFIV6mWUXrqv27kHZtQGCt8FU6ab/+j?=
 =?us-ascii?Q?7Jrb08gOkIjdZDXyNoXCbF0cn1lhIw+gRWSOd6sL/EaBHJIhiknmyU0GAk0T?=
 =?us-ascii?Q?cM5shDG7g9kjvUtf9HWdd4Q9tlDtKlgGO4iuEWeAKrAT4JYyV4Qz6SSN5ZuG?=
 =?us-ascii?Q?VQXDtgNAiSX2Z1nldxndhzZTjQqsmvUW0JFHkGuL04SLqeFNF3ytGJs8t41g?=
 =?us-ascii?Q?tsuzGSHoHuccma5SNmYBwYChfVOhqX77Q54/OlUXbTo/OhnCgcyaAywqcjHj?=
 =?us-ascii?Q?WhLmqVronbF73pb0w3SE46d8WkEvw7IJK3WUK7YjkZWYldCGHfwg2/FO4Nr6?=
 =?us-ascii?Q?5MgxmVC/spxaWx/nTdn/GdqwR05RmOBH26iBtTClQ9IEvRobOwIFaNyJA7jY?=
 =?us-ascii?Q?XTg3q94W2Xp8GoufXjihnaVQLWDF0KhJn++aAOGuKmb6Pf+1hD5BkE7TZIzG?=
 =?us-ascii?Q?wvMPyVa3sZFR+zzHGq26jCd99JA3q6cbGrUKPbHTndhRvMkszVGSIebRzsJE?=
 =?us-ascii?Q?MjKA/+JM9uMSCRCZc1Dt3trMQN9OUAQqTpkuxlD1Oe3nLH6+3ERgUEPFGH5l?=
 =?us-ascii?Q?ws+bErVMySCVi0gAEmzMVOOHhTLBL+ETGlwgnXVQZBZME/g+TIWjv2ikG8pt?=
 =?us-ascii?Q?wWjDm0nvKZQepMYdXQFs7Gd4TR810b8nEvg/AnK9E4FLED0Jz5PxGDT89DLf?=
 =?us-ascii?Q?EkpQR93iYP75i16E+1oYwv+abAOqL81YXNg359LpCtMzNFE7vjrZ3kIBNauP?=
 =?us-ascii?Q?USPhv9NBuKKEV4B32Q5yILN8UPTz9nv7NyFjqn2uALBHgRatxFxXYdGyy4kc?=
 =?us-ascii?Q?IRmtpnhUrJ2XL7vgNvw7pVdAGwKlzy6FHq5rAMedCDafEBmxaD9GImrw4xCT?=
 =?us-ascii?Q?78uu0YjWkmh53YwDIQ81GCNGYYHd30dnWiWPIK7ItKvlh2xFknG8enpipz/j?=
 =?us-ascii?Q?fEf1isljL612oH3LFxWaJ//Bcc7K5FZts7t2LxOHntLHuWnFLgrjV9wpVtiW?=
 =?us-ascii?Q?guLNZYyVGMpQ/iq0sB17MIWPcCGCMUDm9dEGt3Z60ej8a2j5s9YtK2yqErPO?=
 =?us-ascii?Q?cXu/wFBzdUz0ziiDPxpo9MINsOiN/u+n4Yylx6gOJdTyHdWknkRi2pVT4KTb?=
 =?us-ascii?Q?MLfcT/VvW4lWGsELc/sT72d9osWjuo8lrliKRQAXz808u+cpRIBPgnELBJ6v?=
 =?us-ascii?Q?1RYCZKdbp+tmwH8bYBAETheA/OFk/gHSrWHJ6j0s0UCXNqKPpDDHsZ+k9dV1?=
 =?us-ascii?Q?7XC80j8I1rs9M4D1/ePxJH8QrtZ5o5pP/sQLgeR3Xhzv9kHwfLY+nTuWgukT?=
 =?us-ascii?Q?YcGW34lnPpgZuFEiYKEjiUZt6tVX2qW5Any2WvS71r9IsRmX5czCnHOgF9BU?=
 =?us-ascii?Q?QA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9131dce7-fde3-4feb-98c6-08dd8e69552c
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 19:48:41.0056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKRukjlZRzHqkw50zzQmbzQhc3dpU884FZwUaC1Wcy28XjjyGlLRX070Meckawkt9H4BZiU6jiW0cCk6fat2gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8395

This is probably the most difficult conversion to the new timestamping
API, because the cpsw driver makes some efforts to hide the existence of
two slave interfaces with two attached PHYs from the network stack, and
the whole point of the new timestamping API is to let the core stack
make more decisions. The cpsw_new driver doesn't do that.

Patch 2/3 is the main conversion.

Patch 3/3 is a subsequent cleanup/ simplification. It would have helped
my understanding if the code dealing with PHY ioctls wasn't common
between cpsw and cpsw_new, because there are important differences
between them.

Patch 1/3 is probably a minor fix, but in lack of a real-life report
I've targeted it to net-next (leaving the possibility for someone to
later request a backport). It would be very disruptive to my flow, at
this stage, to send this patch to 'net' and resend the rest after the
merge back into net-next.

I hope the changes are correct and reasonable, they are purely based on
static analysis and have only been compile-tested.

Vladimir Oltean (3):
  net: cpsw: return proper RX timestamping filter in cpsw_hwtstamp_get()
  net: cpsw: convert to ndo_hwtstamp_get() and ndo_hwtstamp_set()
  net: cpsw: isolate cpsw_ndo_ioctl() to just the old driver

 drivers/net/ethernet/ti/cpsw.c      | 25 ++++++++++
 drivers/net/ethernet/ti/cpsw_new.c  |  4 +-
 drivers/net/ethernet/ti/cpsw_priv.c | 71 +++++++++++------------------
 drivers/net/ethernet/ti/cpsw_priv.h |  6 ++-
 4 files changed, 59 insertions(+), 47 deletions(-)

-- 
2.43.0


