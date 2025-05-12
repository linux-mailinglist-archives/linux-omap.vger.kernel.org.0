Return-Path: <linux-omap+bounces-3693-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F728AB361D
	for <lists+linux-omap@lfdr.de>; Mon, 12 May 2025 13:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D5CC17BC50
	for <lists+linux-omap@lfdr.de>; Mon, 12 May 2025 11:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204E42920B3;
	Mon, 12 May 2025 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lwm2XWq+"
X-Original-To: linux-omap@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D88E1CAA66;
	Mon, 12 May 2025 11:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050284; cv=fail; b=M0eiYZaahCMxkyRK8ox9rWaXUzJtn/McUgCtNyTR4xKb24N2ENtqT2fTD+Bqz01RR2rYlAQHoshFxtKBJucTb7PaOlS9rvs33Q+NzlHkOvhgjFKNx/esqI6+B/LbZob/n2auJgBdskeOrvjsv1nWEL7Iw9BXrEyGD4cnUX81ZQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050284; c=relaxed/simple;
	bh=/X2nafmFQQ6vGuo+LsEGLoT0bQ6cpi1adKMKvAC4h/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ebIZFD1bf7mvEtNT/cvC4fD8qjY8LN5xi/LqcPnbzVaMel1lXFpmIBGLD4921c+p6vYawjs81L9rUgXFmCQuUqhqWbxWq5UeAi2VrJW3/t/jPlKt87LFYCXr7xtSs54Px2l1ivjsTffu4jlabG8GyWj3tUvpqd4HZsrsKyx7CZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lwm2XWq+; arc=fail smtp.client-ip=40.107.21.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRx6TJyVlx01rvZA0PMFe6p8e7Sdkkfd5FSsRujfIgebbNHyNRV4BMjcMfwmx4Ge18hROOgVEWLdAlFGDwFy2tQmeaWk87v8FvmE34eSBT/s/AaXGhLgv/9uOrG6CR0WZLIJWUteggqE7qFG+n0MFY5hAYI+OGwZJqiJA/+xWIuJt51tFX97jT+ljxI32jL6/i40UuUWdJICEDJHzIR53njywXicPilsXZMZQwa0zOKJA5Ndb8pyr1V1aNN4byh8EIbgyPji0mvj2FhqISfzZLytc0T25g9zzQuX307CIbMDbQHFkHyMpwM8SBU6piQih581kyUqX53Fzx7o28EuzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBq9uR8V7vGK0Sj6LLxrY8xZj5AvWdymkOZwbUMUBVI=;
 b=S0Y5vXUMuGKwdmnp6O7VGwq61qQsUxD9JXpwGpnVwGR0wrjLWWH139bFjKde75/jAB18FrEHG5MIztpUyenIt5ZhoBaaYICiiEj+zCok62QyVyLbvb3s6TBoS2HNrAAgtkSHgfn6+KyaWrNGWYzXS86v5tiSax6q+mKbCjfK4JqY6fnp2pyR4ttblb9G0XYFHLW+hSIvPeUT8E3xdnDh5wJgbxoF2cy7aXUhXv3kyc8ResmdV88l7iWJPsA+EJtAUKtMfsQhvVO5gLtulh1boAKEmW+gNJLugC4iLcIAEcn5pINa4DXltIOoot3aRMHu2R2AyQgbP/fJhlxbDRrouQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBq9uR8V7vGK0Sj6LLxrY8xZj5AvWdymkOZwbUMUBVI=;
 b=lwm2XWq+d5zIPX+hJevi6Ixg7BtY8n/neGZOcg00+xaT2cl5qhS8fxTK1mj9/Aow7Sr7dsJvh3DbBw6vkP97oW5R8AQVyvlXBOXReGRcjYIrZmqiWcYw9IcZBSF2nSogGLrrolq4kLTQVhevdro0ysONFAGg5bDmq5VLiZLMHwjasYQ/rRYDN9Ax0sApRxAYuJnMxsUdn5dLCQHXH/8TkeJT9cD2ypWB8qbUpS83zsCmSKLJ3V7gZsU1NYtBj3PooA5zWATzd0Z+6EAzc5UZ2ADG2eLHUB4CMAySdmqnn45EqRlNuNvqoa0uUDvy7PVHtn0KdH+LmueLi3hErORenw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AS8PR04MB8214.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.27; Mon, 12 May
 2025 11:44:38 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 11:44:38 +0000
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
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v2 net-next 1/2] net: cpsw: convert to ndo_hwtstamp_get() and ndo_hwtstamp_set()
Date: Mon, 12 May 2025 14:44:21 +0300
Message-ID: <20250512114422.4176010-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0152.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::36) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AS8PR04MB8214:EE_
X-MS-Office365-Filtering-Correlation-Id: fdc293a3-94e7-46a7-610f-08dd914a5fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tusr4YKqHfXDBrjItW3D271Rj9W+euUWZava2bJ0vkY7ip7YjLRrVnR/xiIz?=
 =?us-ascii?Q?cwPJuLFmGPoVr1VR3NgqsYamdrPTPNPEuVLLKlfB1Q2YtieerQjKMlkTrVTt?=
 =?us-ascii?Q?A36EnqJdqCuiNwUU9+VEJMg1SuDFjqQCC7FQHqmiX37KkNOSO/nnKCd5U+LM?=
 =?us-ascii?Q?flw6sk4389NepftZKFWEMTf5yPRQpOL/OPNKM8k0q8LkxU28kReGbPGx4imh?=
 =?us-ascii?Q?k28r7Z+u2I4fwAIQAVexA9odrb3MRuQF3KnjBa+mx8Xps2A/oC++FFGM3rC6?=
 =?us-ascii?Q?xiGxRiLNy7tf3uJUmHWOWWhOTb8prcP+6ag/JIkf+Dukhi7KXsbM8Zywoy45?=
 =?us-ascii?Q?h3nYq/AV3NqCIVx5MeRAh7+JB3sE7vRBM6vD7KhND1348R2xQoTgOY211hXp?=
 =?us-ascii?Q?0Swc1arxIYFFBdYdAcyWuaMb/UIgfAKkLix6EM2rgDeBH4Mf4npjVJy6Y7nW?=
 =?us-ascii?Q?6bIQENWMj+J3iyIfucl77cNWMCIluctUIIV5zw8naTc7pArSqjvXGVdi+dzi?=
 =?us-ascii?Q?ICpfrZXuBfXfGuFEerV5KB1Rh8ZSFFK7Fjo0errESckKmkiN+MWCbD2GYPsE?=
 =?us-ascii?Q?Wa61AiKOX/Nn2UCcyud3Jqq4bUsako0KoBMwzkizUkP4mZu1x8IOnIhGOGOm?=
 =?us-ascii?Q?7CDKzRF7gUd5P6vSb3wMaK8nkQXPvKKGdyyo0FmRcU4AtQyTHQ6r4ojni3wA?=
 =?us-ascii?Q?EVoR4r7oPZOmNITykyoqYB1WHPaflbBajVMycsc8fyMdGSBDP6+WpZhPf38/?=
 =?us-ascii?Q?V/WMKlqPfVwhlkVhrWA6LHOuuCYXKXwno7BR++DRs8dmcmeRnMGOIKk6fjtM?=
 =?us-ascii?Q?NB0uIeSJstTBP5pj6R6Xmtziz9mZb74VRlaaDkVA1d/P1xrU9gAKTUNGjPWi?=
 =?us-ascii?Q?fehyftlK0FfDxE5u8jIcMvb+4iS2c6A4nzxp8bqsikk3Xo0xvDqq3onQY5fE?=
 =?us-ascii?Q?Y+WOzJZ8bIevG+RcMhNIk8P7ApunERRO27QgRdDmTeQwqOSqpq3EKZeWypMj?=
 =?us-ascii?Q?fmBZdUv5hRKyVZrzZrZMBGPiTzm7oeZi5i6wVxvXwYy8aLgsgtOxUycYtSnB?=
 =?us-ascii?Q?hBXCm85J0QB1UxbDsvvpwgsmoblYb6Obu7SIa14RLz7Nz1lfWWB88TX3YrRD?=
 =?us-ascii?Q?mGZ2QBSRWF5zz6rmO+LIXV98I30wfX/Fc/GvCadTifd33CxyrgijWLi0UIUv?=
 =?us-ascii?Q?XPftfl7pj1T1PJ6vNQq5Uz26WgHf32j6LFR240GJ+HTZWLdtZ4qBe15IYCVN?=
 =?us-ascii?Q?84inzzccpchFJaZhaIdOAsLNXvdpxSQx2wqXNI3e0OYfcJ/s8orSu3qqHvUD?=
 =?us-ascii?Q?Pjtzi8o7VdKOMOp7eQuidhnNlPfNg9peRp/UMfbyd8q02X5mfzU9r0d8oBhD?=
 =?us-ascii?Q?xlmZrD9MMDy6jh2rITf/SBccFYfL+1NM7SeaIeeQJytxmZr7KBKHVpyCXD8h?=
 =?us-ascii?Q?lYMFNfyKCbWnibP+BPZZmqC7VaeuUoj8XoLXYzmpmoidcHQscxvA6Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dKREWVPRJqgULnyKTV+rsHgUOnOzhFogU+tndLgjoZ50aJpUTGMNcHBNAoON?=
 =?us-ascii?Q?izSOvvm5V90djJK56eJdozreiokZKn9X7+lXULISbxlmuPv2hkrrF8A8uqsI?=
 =?us-ascii?Q?03OrUCWKEuihXEne2Ni1BUyshSCYOdF5P2LCrHLLHLjfaup1sAYJdyRpVFY7?=
 =?us-ascii?Q?90rWkoPVg4QN7g7Cao/prgHP8vS96NlE/yZcV0fJjuVPMrW1kiuluOscaS2b?=
 =?us-ascii?Q?x456ebUs1tNjefmvezuPPJ56eP8q93u0zGS1Ym4+i/QElFzO5cs0+G4NV+xi?=
 =?us-ascii?Q?dwmPkohw2OV56Y07qv3QJyPEXrN6PzmMeJMsvgL3GtVgdFVrGmYcUKxlVFDY?=
 =?us-ascii?Q?GKLy0LyPSeam+wBxVseDiSw3Yp7iDgkDa0V7DfkVSjAQujlFdoUpxGv7wo43?=
 =?us-ascii?Q?uRtiPeSLaw+pp9Ztzn1U1rgkLKxnEL7EK0TcQ9yvPyoU364q+6h2b1fnctBG?=
 =?us-ascii?Q?/2xapNBRQNbdy9NHi0KKj5iEDenatP9L4UcXcBthtGPu9osEonM7kSXW+e7k?=
 =?us-ascii?Q?vFgRLMTt1aWNukDZWDXJ3mN5z5Nll5AnFntBVUhBGhHWuHwXqXLpt//epYyy?=
 =?us-ascii?Q?HYAwU0CvXOSALs/Ph14SH3+OiDp0FqHiLW2zzgCVx0Di5BRVWZ4ctzVupDxu?=
 =?us-ascii?Q?BDH4ucovJDcYJCdzbnROk69iMSdkRLXyswcDrd2Q3VSqY19YZd+4n+v6bzL0?=
 =?us-ascii?Q?QlI3Euk9Wug7e9+RoabkskYSaLp2DsulgQX2XTlPqbAMSc9BTxz+ogQ1W1Hj?=
 =?us-ascii?Q?kb6kti+5BH4KlUzGXHuIAYbLCIXChT2hGcsFC2933kO0zI8jXeMFxScEt6xs?=
 =?us-ascii?Q?tjSLSo408dhaliI03yzO2Z96Ys9TDCGCQAlJm1mb/2C2CUItH1PXGNnujvIt?=
 =?us-ascii?Q?u3wNSslIAwmKVUjEiZAnHlTGkLby4VsUoUngn/xcpnZd5eaacqCU7JuJl368?=
 =?us-ascii?Q?4EBg3FSrhhticVrQ295/xhTPAy0vsYuUvLWibMbrqR2M/HGEqdNud34HM3or?=
 =?us-ascii?Q?EChx1olu5LNcUnNN943VhGyLxv+IEO13tLZ+3+BI7QH3znlGGRoyhmhII+m2?=
 =?us-ascii?Q?kmfc5tPIzLiFroaNB80aqoj8jPx7/vpn9m5959Qnmv6KVtvVRnltG5Ns9vQu?=
 =?us-ascii?Q?FZbmB6OZHyGj7Ov0YCAA31AcuCLIdlFgno+RhczovXF86Ryb3VH1BHDIs9is?=
 =?us-ascii?Q?blGxTdnY4vR1d99ZhHCGeiubX9TcdbgXlQgWjdFUFshA5Q8eI8ZGpdgTac5/?=
 =?us-ascii?Q?QjBjk0F1DPpGnp9ipxr/rvqXShnn0SICtNkiJBTAHGkQ/64QsSKFoRPHwJMW?=
 =?us-ascii?Q?FLyRzcXFtpegwIeWkwkeBYL9wp5Cq+ZDxBzWTJ1vqF+IIKlUs+IajWMf9cll?=
 =?us-ascii?Q?oOxZPn0oFrH3AEe/2wziGEoZ92Gc0Y7pSXcePmWzjc6pRQNJEI+IrIZvUlVy?=
 =?us-ascii?Q?/Mx7sZKRfx8YklCO5vg0fIk0JNCxNZbbWfOK9dARMotCDMAtoD7C9Y8OHceZ?=
 =?us-ascii?Q?z11B4vgI5o7Kuoz1VLAGGFYegpFxA+/4DKIxZkBVOInwFhZBuoLXzj04d8Fw?=
 =?us-ascii?Q?ljGTY+Xmol6YigQ5C2mxzZd9B93KzF6O64M64AYD2+d8DSCM0qxozjNYQ6c9?=
 =?us-ascii?Q?GQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdc293a3-94e7-46a7-610f-08dd914a5fe5
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 11:44:38.2273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhm2v6GtwwrAOK75uZaZ8CFsV0F8H1Dd39e6YHeh7RWYtPxRIeqFr8YQr+LeFW3RsY+w/xmSftstxIz7ybAnsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8214

New timestamping API was introduced in commit 66f7223039c0 ("net: add
NDOs for configuring hardware timestamping") from kernel v6.6. It is
time to convert the two cpsw drivers to the new API, so that the
ndo_eth_ioctl() path can be removed completely.

The cpsw_hwtstamp_get() and cpsw_hwtstamp_set() methods (and their shim
definitions, for the case where CONFIG_TI_CPTS is not enabled) must have
their prototypes adjusted.

These methods are used by two drivers (cpsw and cpsw_new), with vastly
different configurations:
- cpsw has two operating modes:
  - "dual EMAC" - enabled through the "dual_emac" device tree property -
    creates one net_device per EMAC / slave interface (but there is no
    bridging offload)
  - "switch mode" - default - there is a single net_device, with two
    EMACs/slaves behind it (and switching between them happens
    unbeknownst to the network stack).
- cpsw_new always registers one net_device for each EMAC which doesn't
  have status = "disabled". In terms of switching, it has two modes:
  - "dual EMAC": default, no switching between ports, no switchdev
    offload.
  - "switch mode": enabled through the "switch_mode" devlink parameter,
    offloads the Linux bridge through switchdev

Essentially, in 3 out of 4 operating modes, there is a bijective
relation between the net_device and the slave. Timestamping can thus be
configured on individual slaves. But in the "switch mode" of the cpsw
driver, ndo_eth_ioctl() targets a single slave, designated using the
"active_slave" device tree property.

To deal with these different cases, the common portion of the drivers,
cpsw_priv.c, has the cpsw_slave_index() function pointer, set to
separate, identically named cpsw_slave_index_priv() by the 2 drivers.

This is all relevant because cpsw_ndo_ioctl() has the old-style
phy_has_hwtstamp() logic which lets the PHY handle the timestamping
ioctls. Normally, that logic should be obsoleted by the more complex
logic in the core, which permits dynamically selecting the timestamp
provider - see dev_set_hwtstamp_phylib().

But I have doubts as to how this works for the "switch mode" of the dual
EMAC driver, because the core logic only engages if the PHY is visible
through ndev->phydev (this is set by phy_attach_direct()).

In cpsw.c, we have:
cpsw_ndo_open()
-> for_each_slave(priv, cpsw_slave_open, priv); // continues on errors
   -> of_phy_connect()
      -> phy_connect_direct()
         -> phy_attach_direct()
   OR
   -> phy_connect()
      -> phy_connect_direct()
         -> phy_attach_direct()

The problem for "switch mode" is that the behavior of phy_attach_direct()
called twice in a row for the same net_device (once for each slave) is
probably undefined.

For sure it will overwrite dev->phydev. I don't see any explicit error
checks for this case, and even if there were, the for_each_slave() call
makes them non-fatal to cpsw_ndo_open() anyway.

I have no idea what is the extent to which this provides a usable
result, but the point is: only the last attached PHY will be visible
in dev->phydev, and this may well be a different PHY than
cpsw->slaves[slave_no].phy for the "active_slave".

In dual EMAC mode, as well as in cpsw_new, this should not be a problem.
I don't know whether PHY timestamping is a use case for the cpsw "switch
mode" as well, and I hope that there isn't, because for the sake of
simplicity, I've decided to deliberately break that functionality, by
refusing all PHY timestamping. Keeping it would mean blocking the old
API from ever being removed. In the new dev_set_hwtstamp_phylib() API,
it is not possible to operate on a phylib PHY other than dev->phydev,
and I would very much prefer not adding that much complexity for bizarre
driver decisions.

Final point about the cpsw_hwtstamp_get() conversion: we don't need to
propagate the unnecessary "config.flags = 0;", because dev_get_hwtstamp()
provides a zero-initialized struct kernel_hwtstamp_config.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v1->v2:
- preserve existing rx_ts_enabled logic after dropping previous patch,
  meaning this one:
  https://patchwork.kernel.org/project/netdevbpf/patch/20250508194825.3058929-2-vladimir.oltean@nxp.com/
- future-proof code by testing != HWTSTAMP_SOURCE_NETDEV rather than
  == HWTSTAMP_SOURCE_PHYLIB.
- improve error message from "PHY timestamping only possible in dual
  EMAC mode" to "Switch mode only supports MAC timestamping".

 drivers/net/ethernet/ti/cpsw.c      |  5 +++
 drivers/net/ethernet/ti/cpsw_new.c  |  2 ++
 drivers/net/ethernet/ti/cpsw_priv.c | 53 ++++++++++++++---------------
 drivers/net/ethernet/ti/cpsw_priv.h |  5 +++
 4 files changed, 37 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index a984b7d84e5e..b71352689768 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1174,6 +1174,8 @@ static const struct net_device_ops cpsw_netdev_ops = {
 	.ndo_setup_tc           = cpsw_ndo_setup_tc,
 	.ndo_bpf		= cpsw_ndo_bpf,
 	.ndo_xdp_xmit		= cpsw_ndo_xdp_xmit,
+	.ndo_hwtstamp_get	= cpsw_hwtstamp_get,
+	.ndo_hwtstamp_set	= cpsw_hwtstamp_set,
 };
 
 static void cpsw_get_drvinfo(struct net_device *ndev,
@@ -1646,6 +1648,9 @@ static int cpsw_probe(struct platform_device *pdev)
 	ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_HW_VLAN_CTAG_RX;
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			     NETDEV_XDP_ACT_NDO_XMIT;
+	/* Hijack PHY timestamping requests in order to block them */
+	if (!cpsw->data.dual_emac)
+		ndev->see_all_hwtstamp_requests = true;
 
 	ndev->netdev_ops = &cpsw_netdev_ops;
 	ndev->ethtool_ops = &cpsw_ethtool_ops;
diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti/cpsw_new.c
index 5b5b52e4e7a7..f5b74d066f0e 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -1147,6 +1147,8 @@ static const struct net_device_ops cpsw_netdev_ops = {
 	.ndo_bpf		= cpsw_ndo_bpf,
 	.ndo_xdp_xmit		= cpsw_ndo_xdp_xmit,
 	.ndo_get_port_parent_id	= cpsw_get_port_parent_id,
+	.ndo_hwtstamp_get	= cpsw_hwtstamp_get,
+	.ndo_hwtstamp_set	= cpsw_hwtstamp_set,
 };
 
 static void cpsw_get_drvinfo(struct net_device *ndev,
diff --git a/drivers/net/ethernet/ti/cpsw_priv.c b/drivers/net/ethernet/ti/cpsw_priv.c
index 6fe4edabba44..8e17da12d8f5 100644
--- a/drivers/net/ethernet/ti/cpsw_priv.c
+++ b/drivers/net/ethernet/ti/cpsw_priv.c
@@ -614,24 +614,29 @@ static void cpsw_hwtstamp_v2(struct cpsw_priv *priv)
 	writel_relaxed(ETH_P_8021Q, &cpsw->regs->vlan_ltype);
 }
 
-static int cpsw_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
+int cpsw_hwtstamp_set(struct net_device *dev,
+		      struct kernel_hwtstamp_config *cfg,
+		      struct netlink_ext_ack *extack)
 {
 	struct cpsw_priv *priv = netdev_priv(dev);
 	struct cpsw_common *cpsw = priv->cpsw;
-	struct hwtstamp_config cfg;
+
+	/* This will only execute if dev->see_all_hwtstamp_requests is set */
+	if (cfg->source != HWTSTAMP_SOURCE_NETDEV) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Switch mode only supports MAC timestamping");
+		return -EOPNOTSUPP;
+	}
 
 	if (cpsw->version != CPSW_VERSION_1 &&
 	    cpsw->version != CPSW_VERSION_2 &&
 	    cpsw->version != CPSW_VERSION_3)
 		return -EOPNOTSUPP;
 
-	if (copy_from_user(&cfg, ifr->ifr_data, sizeof(cfg)))
-		return -EFAULT;
-
-	if (cfg.tx_type != HWTSTAMP_TX_OFF && cfg.tx_type != HWTSTAMP_TX_ON)
+	if (cfg->tx_type != HWTSTAMP_TX_OFF && cfg->tx_type != HWTSTAMP_TX_ON)
 		return -ERANGE;
 
-	switch (cfg.rx_filter) {
+	switch (cfg->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		priv->rx_ts_enabled = 0;
 		break;
@@ -651,13 +656,13 @@ static int cpsw_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
 	case HWTSTAMP_FILTER_PTP_V2_SYNC:
 	case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
 		priv->rx_ts_enabled = HWTSTAMP_FILTER_PTP_V2_EVENT;
-		cfg.rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
+		cfg->rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
 		break;
 	default:
 		return -ERANGE;
 	}
 
-	priv->tx_ts_enabled = cfg.tx_type == HWTSTAMP_TX_ON;
+	priv->tx_ts_enabled = cfg->tx_type == HWTSTAMP_TX_ON;
 
 	switch (cpsw->version) {
 	case CPSW_VERSION_1:
@@ -671,33 +676,35 @@ static int cpsw_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
 		WARN_ON(1);
 	}
 
-	return copy_to_user(ifr->ifr_data, &cfg, sizeof(cfg)) ? -EFAULT : 0;
+	return 0;
 }
 
-static int cpsw_hwtstamp_get(struct net_device *dev, struct ifreq *ifr)
+int cpsw_hwtstamp_get(struct net_device *dev,
+		      struct kernel_hwtstamp_config *cfg)
 {
 	struct cpsw_common *cpsw = ndev_to_cpsw(dev);
 	struct cpsw_priv *priv = netdev_priv(dev);
-	struct hwtstamp_config cfg;
 
 	if (cpsw->version != CPSW_VERSION_1 &&
 	    cpsw->version != CPSW_VERSION_2 &&
 	    cpsw->version != CPSW_VERSION_3)
 		return -EOPNOTSUPP;
 
-	cfg.flags = 0;
-	cfg.tx_type = priv->tx_ts_enabled ? HWTSTAMP_TX_ON : HWTSTAMP_TX_OFF;
-	cfg.rx_filter = priv->rx_ts_enabled;
+	cfg->tx_type = priv->tx_ts_enabled ? HWTSTAMP_TX_ON : HWTSTAMP_TX_OFF;
+	cfg->rx_filter = priv->rx_ts_enabled;
 
-	return copy_to_user(ifr->ifr_data, &cfg, sizeof(cfg)) ? -EFAULT : 0;
+	return 0;
 }
 #else
-static int cpsw_hwtstamp_get(struct net_device *dev, struct ifreq *ifr)
+int cpsw_hwtstamp_get(struct net_device *dev,
+		      struct kernel_hwtstamp_config *cfg)
 {
 	return -EOPNOTSUPP;
 }
 
-static int cpsw_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
+int cpsw_hwtstamp_set(struct net_device *dev,
+		      struct kernel_hwtstamp_config *cfg,
+		      struct netlink_ext_ack *extack)
 {
 	return -EOPNOTSUPP;
 }
@@ -714,16 +721,6 @@ int cpsw_ndo_ioctl(struct net_device *dev, struct ifreq *req, int cmd)
 		return -EINVAL;
 
 	phy = cpsw->slaves[slave_no].phy;
-
-	if (!phy_has_hwtstamp(phy)) {
-		switch (cmd) {
-		case SIOCSHWTSTAMP:
-			return cpsw_hwtstamp_set(dev, req);
-		case SIOCGHWTSTAMP:
-			return cpsw_hwtstamp_get(dev, req);
-		}
-	}
-
 	if (phy)
 		return phy_mii_ioctl(phy, req, cmd);
 
diff --git a/drivers/net/ethernet/ti/cpsw_priv.h b/drivers/net/ethernet/ti/cpsw_priv.h
index f2fc55d9295d..b23f98032669 100644
--- a/drivers/net/ethernet/ti/cpsw_priv.h
+++ b/drivers/net/ethernet/ti/cpsw_priv.h
@@ -469,6 +469,11 @@ bool cpsw_shp_is_off(struct cpsw_priv *priv);
 void cpsw_cbs_resume(struct cpsw_slave *slave, struct cpsw_priv *priv);
 void cpsw_mqprio_resume(struct cpsw_slave *slave, struct cpsw_priv *priv);
 void cpsw_qos_clsflower_resume(struct cpsw_priv *priv);
+int cpsw_hwtstamp_get(struct net_device *dev,
+		      struct kernel_hwtstamp_config *cfg);
+int cpsw_hwtstamp_set(struct net_device *dev,
+		      struct kernel_hwtstamp_config *cfg,
+		      struct netlink_ext_ack *extack);
 
 /* ethtool */
 u32 cpsw_get_msglevel(struct net_device *ndev);
-- 
2.43.0


