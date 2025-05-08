Return-Path: <linux-omap+bounces-3683-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7105AB03F8
	for <lists+linux-omap@lfdr.de>; Thu,  8 May 2025 21:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25DF418985D7
	for <lists+linux-omap@lfdr.de>; Thu,  8 May 2025 19:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D1928C2A2;
	Thu,  8 May 2025 19:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QWpMXuUK"
X-Original-To: linux-omap@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA54F28B51F;
	Thu,  8 May 2025 19:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746733734; cv=fail; b=huPvdK4boQ/Hb+9557fH5xoyFtGkVp0ez4ZdSRqFCvS5hG/I/VA2kHr5DMAiZTE72CbB1+1ziIi839tVF17DZWpEJOEOEJ6D9zm/nyCAo/rwxb4dB+Bd1LrYhacf5h/YauyAytjiQnEH/Qimfny14VD34EVopgDh5qrMMIF2B1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746733734; c=relaxed/simple;
	bh=4HiwZn8PczWXqYyciVT4KsmbWJlv0iWB+yOzTsVdl6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C9g44FuBsusGaaOb8rRTnyw6ywFieuAAsH1XxsWeUa+cHw5u2i5WWGMtishlv4gXA1IRa061IzhAmERkw/zAPG74t1EZmcbfxJztsoxUUpLiKJmLmc+VKTYyVmO4SEqcjo3WD0Kq0DbdhnEsgKcpQICa9M4YPcy+/cSNQ5CMdHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QWpMXuUK; arc=fail smtp.client-ip=40.107.22.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFUYqH3mBM+DcyEyoW+ZYtL0GynlPlrzGSeL/k8F8vk+OQcEjtOPyA2oxWcTkt/CbdF8bFBOWSSXbQO7b1NL6GUAFVKZqYpNJtjNcHQTGswDYdQiORiWqbkklW49YhyRVClrHLQt3yRZikVm+Un/25/t00bFTa47KCwzhk21TFjHqZlvkrc/0VhK5VLrOo9jO065n0KzzOeMpmJFNw9MUm9nTOZTqOwpEE5WIOASIgHPF409ZvTOg9DxrGcnFcOD4EasQsUfluB/5iGqPJO5rsQii//qukzrDQD/VXb15qlbTcfuGmzBn5HPa5NYh5fMS0wg1ryizbxTawSeqM+0dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHMyZf9+ayDIm4synsZigKkrfzfndHjFxYve1EM9LII=;
 b=VYJCIf5/I+HczGAbS5WbS5Hyf747YasrC1b7KVDosYK9ophN7G4JUFSt8xM8NYI2HdvcFMshs515RJsl39XQsTTsb5qcMPVTKB6iQgcNWZmIDTsbkkE97OOsulTKhDunTjIdF+AHnCDLYewaYooJPnu2viX1oTz3VA0JSqLEqCeDipGFbuk7HRcLpVaw/Cu9iARKMzn+oasyBrN/s/yfGWWmVKfumZ3MRbsAH8q25fB55Or+SplLxtQEWu9EXTVO81k9I0OvnZJcgmfCKdhznTpvkSfmCYcjb709tWHpYejQNB9Ixbm4RJW9Drs/smvGNAB4sV6o9uJ9WJh2XAdNvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHMyZf9+ayDIm4synsZigKkrfzfndHjFxYve1EM9LII=;
 b=QWpMXuUKixMgeDPQr/NZDULruoPJR+KrLB+XOlRWkLpSSbFvnvD2aiU9igM/8UlvPZA40XOqPP9I3JCqWt7AViVBIGi2tXoFG5kq8yWIlLDSG5EZggqik3i2GO0NSYYh4NbeG0VB3YSqUDLq5IXI4mzfE/oMveH4tl25us5v/TtxRT1Bj1IcZpWFDW38X/jAjGppmoMgXYgEHHpx29OK7Zfn93lEbBxNYxV3AVQ9SbsT3dVMh9y6lBbxh24AIoEw+Jjb1Q8vG5qTV2POpyrGBeQvu4bzeXL9DyuGLgB/zvsrX/d+lhb+z0YwAg3LuzSS+Nqscb8E9VEtallB90c69w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DB9PR04MB8395.eurprd04.prod.outlook.com (2603:10a6:10:247::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Thu, 8 May
 2025 19:48:43 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%4]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 19:48:43 +0000
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
Subject: [PATCH net-next 2/3] net: cpsw: convert to ndo_hwtstamp_get() and ndo_hwtstamp_set()
Date: Thu,  8 May 2025 22:48:24 +0300
Message-ID: <20250508194825.3058929-3-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508194825.3058929-1-vladimir.oltean@nxp.com>
References: <20250508194825.3058929-1-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 59518639-4e62-444b-abcb-08dd8e69566f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UO4pptSeC5VGPdjZtvefizVhyW+eEMosmKTEmWNFU2yNg594aE6tv+uduCsE?=
 =?us-ascii?Q?32t4S0nuy4eWnvLTRaX/f39PpRJLO94mmTgYGUxcjsw2QhlVPVHT/ZQai5iW?=
 =?us-ascii?Q?gwDjIIepCt7pN/kP2ycaYZLzk+ocrgJs+flwxYIrVxv9SXkG0/b2CLdNhmPM?=
 =?us-ascii?Q?+7c9QZS3n6G8tD/pC7HLXIIHCF/jh2szQew7HVWutWEMX6CuKXSAqEMsK0tf?=
 =?us-ascii?Q?PLj6xViqXa0k4MssVUxAZQDjQHLh/Aiuou8doGYWak5gBG6l+vVZvCtiWYfT?=
 =?us-ascii?Q?qLUy5SCMngBIurbdt0svkqwgNWLua1uf/5pFp/VJup57o9GXPcClswikT0Jh?=
 =?us-ascii?Q?VX0FW7wUg4rgFjhah3xVgrOQNEiPoPuuBGqnitvSpXFbLirjQeQZxYrqRRJE?=
 =?us-ascii?Q?PWJ4MkzO+IqHhasbdm72FiBNFpC8ok/SSm45qJYo9ZEjUOmkW/IxUVnJC4FH?=
 =?us-ascii?Q?Q3djUDa9PacnqFQAV/KVBqJX8S55gmUxTcLwzatlmMWRMYDDz+FCA3vkIX1k?=
 =?us-ascii?Q?Cn+L4oH9GfIOTq/463iqVbbLmeiKjMPLoxbX9Lu2op+WfMVdY1badl+oejo6?=
 =?us-ascii?Q?2ne7aFJNRHYqyvcZPOes2eBUSckUol+HI/VvP6DZ6x9mJz6f5VXUY+sRyD35?=
 =?us-ascii?Q?NoCe9SwaX0OeL80Q0z3UcpVUSuG2THKOCgQ4kt6sbhaCDCNa6ObYAaSW7uaC?=
 =?us-ascii?Q?YRW8LvMw0QZo1ink4oTwSd+qk8huv/Wn3udB2a7nQa9AeQsF76Ub3wXdV83G?=
 =?us-ascii?Q?Fbv3FYMKWzA/K4lt2ni6e2mhw5WoIMa4hAlUakbj+ZPu8AYFLzQLD0dKY84C?=
 =?us-ascii?Q?XUlGnn+HHEoqpu5jToi11Yvghbds3vtJMelil5iMF9j6lOUL/Uv1sjkX5VTj?=
 =?us-ascii?Q?chB1W13RZNKRZgIeZ87xX60+5b3iip4RTqcPel1XK7NXh2mruCMQVEaiHkUm?=
 =?us-ascii?Q?kcf1AmYwmoAaW2bqKiNWkq41eUgVfgNBdw9tr48TyHriip7oePwHXojqLdUm?=
 =?us-ascii?Q?45m1HbSYPXA7wiS6lpq743v2zIPVfzTuCUjn7GooboPC2j0e+y/mR21/S/13?=
 =?us-ascii?Q?Ltjo2k+0lS4JZfZSfSuY6ENt64XXmbYC64MOnUOy/YLDsMIM5bJHkrrUtbAT?=
 =?us-ascii?Q?K4o1nZKH1qETMEgxjS28mR6Jhq4Owyj6QfnfuatcUFQjh1ptFBP0cJIRqqoC?=
 =?us-ascii?Q?F+ASX8XHo4yuGAKuMIy/YG0wgr/mrVX8mbTGQuYU0HoxTfT1lpBouL1UtLS6?=
 =?us-ascii?Q?Wb2NMOlqM7a1poQSz+yAxs9EbPODX2O5QT/FgX7C980f5cyre6g/ICnapQKB?=
 =?us-ascii?Q?wVBSqLKjUvPILVr7pcCEMwZm2R8aFZshRGhlH7/6AU+m7XZxsZhoF37n2Rdw?=
 =?us-ascii?Q?8/msxz10LIwE/414t0u7mIG1nXk2Up33I/HsdrJpmKdq/ek98IzfUO7xxiUj?=
 =?us-ascii?Q?xijDsR4uWp8mRVuI+tyBzbxJeaElpyE/PvQ2WrGknf0EzpbTz9ow6A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W0dD6Obe8kon/CPt+SIdBdhsGE+ZSo1DKm42w1/O7kNQZw5sMsT9cKRfaID6?=
 =?us-ascii?Q?KmEyuo4rPbl2E42aR/L9XXijgnvccke2cvKfdSjgPOTpiw8+UvXJZMonBBrc?=
 =?us-ascii?Q?ALoliQqa51cN8nP9jhk/uw5xIREa1IVo5l+PzApNlz42e4mjverrtXny5gpX?=
 =?us-ascii?Q?TS21+lq2VIe/yP53goMQG+wbTnQF8furrQ0VrxcLzzXwK2nHUSfI6+t5hYQJ?=
 =?us-ascii?Q?k2pLSxwxfkFyRxeVSKL1zhVvTA7TvyAW98tpDYz7RZ2g8gy/3eYQqVFNr0Oo?=
 =?us-ascii?Q?EzQq0MFEvvd1629OCUQeP92QA6nOxOqHDyYxXSUCWkNdnD5Veu2+Wh5GR/vL?=
 =?us-ascii?Q?ftMCn4UQc+bSvrW2Qvo4HpvC7Lm4eXyt5Mhwd14bxzNyG3pVqbldKLqdgabt?=
 =?us-ascii?Q?9ki0TXWEm+akmEq51SP+wobIpELAYmiNOjvbdscSNlGuwdOCidhhpK2RmUiU?=
 =?us-ascii?Q?1v5y/Bz652J5CBO7L6B1W3DNcfrWnYCUSWax9EOrMmauN3JfOb005IMA7PRE?=
 =?us-ascii?Q?ITkhV22Ux3ypMnvK9S6y5vhBvABPnYMjdoYXOyViu6vBXmkBctnHYGnrmy4/?=
 =?us-ascii?Q?FRUBwkH0lMnE9ayzEN1ToYfEgQI/QSc2qQjn47qeeLaHTFAveoWKeHGtLpYF?=
 =?us-ascii?Q?P8eVpDhw49I32CrtyEC6pef752nT6cYdzQfwl6a5zPcrZpLTK/6xl/RYY0+K?=
 =?us-ascii?Q?pLDGaT8n5yZMN+xcQv4WLW2cfHJ8LO5N2T6eVgtqPYeYiRqrFUjCjSnRYkCy?=
 =?us-ascii?Q?QagwHcCv5q4E7LL7T4YUZ1SEDnSbgj/dcJqrs2PlXpgbcT7HWnQI1vT3mk2F?=
 =?us-ascii?Q?YBg6TsRShGtsJ1oBf53m5EKwsexQeM2RIQgFwC/g0ABF0XeOrhtJNmVDtNHq?=
 =?us-ascii?Q?hcIz3mEb+y0BrR5w+BmP2NkbfZS64+09mxlKlC/U3cft4Kch8nk23aTGP2gi?=
 =?us-ascii?Q?YfQspC2trUOUETD4NdiRC4aEqbUZP3PAm4hvRcZ+a9hfbdwNZKPfZnbAQ98P?=
 =?us-ascii?Q?M4H24Z66XR7mjg/C/ZHzi6T6SO4MnuT80lTz21PV0SZnuOI8IVcAVRBzgX3N?=
 =?us-ascii?Q?itIbFa4JXalewWSbTznArZnvM2mwNRgWC494NfT0cBY87K+YdW6KHmuRuclD?=
 =?us-ascii?Q?u9eoIA0DYVM41SYFJ0/ii0YT/uNclTU2qzOeHc/B1XKdEzac2dt5474AgCeh?=
 =?us-ascii?Q?7dgVM0VPTDXbGDnPy5f0HbZiAEmzXVzGboQlgRl8cJcYneJn3ihOPOEj2/oq?=
 =?us-ascii?Q?q+V37nznSBa0PPDkIhXMXkvFK+ETKZIC8euoEcdif36N7Y0pdr85Oq8KcLhF?=
 =?us-ascii?Q?IwEYEA4BeQhAqPf3ti+Y8TeERNz9gskGhn7KPSr0BFPrIXS0I1m+tErbfdT5?=
 =?us-ascii?Q?Pz/86PzHJvkgC/GACkQNUWlMmvGCavK0H1JpXVWE5cbmRwdarJwSThS0OJxa?=
 =?us-ascii?Q?rwvu1PN/d4/j7KHQ3VShVOExz2lAnKqICf2ngObFd+Ujgs1/qqCArpGDPVOE?=
 =?us-ascii?Q?UA9HpHV8p/pop4+NZehm+JNKYmmuUkHssDOW6TKB5rrPqRmvxw8N0uGnMl3m?=
 =?us-ascii?Q?TeYai4hf9n5DBGU7D+nwrX1Y/5Ivx4Bn6GT2CNiFhBIpCcwgDq5fcixIFHhR?=
 =?us-ascii?Q?IQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59518639-4e62-444b-abcb-08dd8e69566f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 19:48:43.0796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GppVc9eYZrUO2JjZVRFGdRNYyuuyzIlw0tuvD9AZSufTT+G6ZB+CDkKWGV+iEKT1vbjrh8ObrpAM98eA7HHiDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8395

New timestamping API was introduced in commit 66f7223039c0 ("net: add
NDOs for configuring hardware timestamping") from kernel v6.6. It is
time to convert the cpsw driver to the new API, so that the
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
 drivers/net/ethernet/ti/cpsw.c      |  5 +++
 drivers/net/ethernet/ti/cpsw_new.c  |  2 ++
 drivers/net/ethernet/ti/cpsw_priv.c | 55 ++++++++++++++---------------
 drivers/net/ethernet/ti/cpsw_priv.h |  5 +++
 4 files changed, 38 insertions(+), 29 deletions(-)

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
index 68d8f7ea0e44..87e40f2dca45 100644
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
+	if (cfg->source == HWTSTAMP_SOURCE_PHYLIB) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "PHY timestamping only possible in dual EMAC mode");
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
@@ -671,34 +676,36 @@ static int cpsw_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
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
-	cfg.rx_filter = priv->rx_ts_enabled ? HWTSTAMP_FILTER_PTP_V2_EVENT :
-			HWTSTAMP_FILTER_NONE;
+	cfg->tx_type = priv->tx_ts_enabled ? HWTSTAMP_TX_ON : HWTSTAMP_TX_OFF;
+	cfg->rx_filter = priv->rx_ts_enabled ? HWTSTAMP_FILTER_PTP_V2_EVENT :
+			 HWTSTAMP_FILTER_NONE;
 
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
@@ -715,16 +722,6 @@ int cpsw_ndo_ioctl(struct net_device *dev, struct ifreq *req, int cmd)
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


