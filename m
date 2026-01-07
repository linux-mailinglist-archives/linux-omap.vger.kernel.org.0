Return-Path: <linux-omap+bounces-5383-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BE1CFE6E7
	for <lists+linux-omap@lfdr.de>; Wed, 07 Jan 2026 15:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AE503011001
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jan 2026 14:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4103435CBB9;
	Wed,  7 Jan 2026 14:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="gJOmX6qQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011044.outbound.protection.outlook.com [52.101.70.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0997634EEFB;
	Wed,  7 Jan 2026 14:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767797960; cv=fail; b=cYmpKNO8uuGoI9uX4iC2az4dVbURGw0v/aZsFRQ7hAaGzAy1J2Y4xsUy+IQ9MVT++HQH8qxmLriYZlPGT4sq9x0WpIPeEveiEeeRy7WoaCFHKYZj25DnSC+pk4M1YXUw21NwRf3HDdye3rr7/fSKbGw+CpALUtzbrhYpQk5Usyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767797960; c=relaxed/simple;
	bh=4A8e/B4wcyl9PXpBGbWsrbAqiNfLTadrVOEKyOdpynY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t7Ki/FyAjWOXzBzXsrA1FfD5+NaHVugdFiJHS2jxMeKaQ0nhNKBkby4RebnICJGcuiRAR6iiy+RndKKDGrGOZoOYB76c09/pyagt9jae4iVBrhLangV387Y7sjHhtic+S5mxxIA8vLezgFHQzeKznNcbOH0e/LqABeqdmqdrpsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=gJOmX6qQ; arc=fail smtp.client-ip=52.101.70.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EkRmN/EZB6YCveKnlgY8n5R0dv7Ae6YJxdA/P8caXRCo6ITwH39dDZetP8eUoZkaPeLxnzZKnnaaQsSN9kNsgYZYc1J1nrWuiz2i2cb6LOPeEgfr8kt0xvOELz7LyiW8eXl+5YI8MTUjrL3dYswM0yWDTIy41WBasJFAIHxv6DwaojZqWmihsB5SojU0XYvKhiC9I/CubpKFkzATtq9FWwmwzNzbwTxhqFOR5pDUuJq+kzTEbdwstHRvOwBvnD29Vc+e5gEkKotP9G9m2hzh2+J+ebWQoc/Q9JeSqtGzjL+ija9HsydoyvUC7XKZn8/agmmbQvK2lYwqVFOxExEaig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3Avr1flkcu05+QEFFg5vag36YNeF24yO+XhukDtA5Q=;
 b=Mazlg7e2aMQ6TuCIWCcpmCR8pP4XrWkl/Z7YBPBlUaKreN4JK/K07w3MpBS1srPGfuFkBPkHkutnjH9tlij/TvNuzL1H2CJvtggiAt3Dhxdy6qvOyTGYpjMnPSi0r+8sYR7b7FE4zf+cKqvHcoCzNltOYKqMYWO4794eh5yw9z4cuPPjd4SiziR/r65kUVRUetAFPQ/QFh3craW2epgcwtfKHs4BjFtUsmvqhgyKSOSVb3ZJ69QGIkFQI/Wa/ZgGpyXwK+YD6b/miB6j40kqMmjPrU/ZRpgGKLWOVCiD+AgBnl0EFo7vaF9qOHnoL8GQzeamRZcvOQQmO0IuST6qfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.30) smtp.rcpttodomain=davemloft.net smtp.mailfrom=nokia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3Avr1flkcu05+QEFFg5vag36YNeF24yO+XhukDtA5Q=;
 b=gJOmX6qQTazEURqmVLOYrE4Y+HZ9j42Z9tWObaGjwIsdu9jZ4aJwyixlM3gp4CCjQxV7qf/H4cC0UMwwq+jpiqFGcE0pXn1fAAfi2EHIOz8P97gsi/kNqUHY62plAwGwdChxHgpemwopkAzSWN+MJYvmN7MVBYSe/ORB56PxSP0GIpqdJml55l4xGv03pOdrC4vFXonxmoEBO3YGobvJ4yoTmXsuOtIl++2EuwAh9WLv6SRn6TmCJJqO5bBXskTCDAGqPSPwJ7Nr1AMXw29XXWFFFUgvNAgZ5KjGKznUCT5LUv/e62X7o8hr7vLBwSl3NNy9joQGv9xtRIXlpjnOPQ==
Received: from AS4P189CA0049.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::27)
 by AM7PR07MB6455.eurprd07.prod.outlook.com (2603:10a6:20b:137::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 14:59:15 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:659:cafe::df) by AS4P189CA0049.outlook.office365.com
 (2603:10a6:20b:659::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 14:59:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.30)
 smtp.mailfrom=nokia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.30; helo=fihe01smtplvp01.emea.nsn-net.net; pr=C
Received: from fihe01smtplvp01.emea.nsn-net.net (131.228.2.30) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Wed, 7 Jan 2026 14:59:14 +0000
Received: from uleclfsdev02.linsee.dyn.nesc.nokia.net.net (uleclfsdev02.linsee.dyn.nesc.nokia.net [10.47.240.2])
	by fihe01smtplvp01.emea.nsn-net.net (Postfix) with ESMTP id BB41180000A1;
	Wed,  7 Jan 2026 16:59:13 +0200 (EET)
From: Stefan Wiehler <stefan.wiehler@nokia.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-omap@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Wiehler <stefan.wiehler@nokia.com>
Subject: [PATCH net 0/3] cpsw_ale: Remove obsolete macros
Date: Wed,  7 Jan 2026 15:58:16 +0100
Message-ID: <20260107145846.3144585-1-stefan.wiehler@nokia.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78E:EE_|AM7PR07MB6455:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dbc0c92e-720d-41b5-dc0a-08de4dfd52e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gFGS0CBCGr8dliK7oDU4pBJ+gOZpMi68elxsAiGGCoowUXDzK2HcV/qW8EDD?=
 =?us-ascii?Q?qYVoS3F+CYSBTQCHN3kdE4RFGOfGu7goPtqah/RsYxnIz05w2RFG53fh1rWN?=
 =?us-ascii?Q?1jeuGWHATYBHOoH2TC7xwvxdTZkTxpy+izYn6v5fs2HUjR1WGuWYIszS3OyD?=
 =?us-ascii?Q?3HfkqbOa/Ss/GmkDsHRS8bnU8mjDpE+n7qaujulw6atl2QmoxK6VIyx/14Yq?=
 =?us-ascii?Q?QXH1dXUzBjwP6GURJ8dHRMnk476DUWwtcC3iofsdxLckXy1+e4VLCC/ri7sE?=
 =?us-ascii?Q?gzLPWMyHp/SBkRBIidQwGKL83WOAu9O6pdcamnEUBvRepbkAT83B5zmOGqVP?=
 =?us-ascii?Q?qrfysysmGL2E8aRqAcd4MK2i403FjD98NDboqZqfFqtRWIST4jYOQCltegIV?=
 =?us-ascii?Q?+yMxVXuVYTvCsoDDs4qmoZzwF41qaL20n9LpUKCx3qzcm/3HOy5cshmD4wRR?=
 =?us-ascii?Q?weagI5nxcjKHCl0Un7VT58+ghnNbqplTU/W6h0ab4gp24jjRFWXLET00EvjT?=
 =?us-ascii?Q?luIrlp7O6obgwzqPvWsnnzXs8BNNILsQScVj8FqJa4/WW5VGiyMEQcHzQH7C?=
 =?us-ascii?Q?mgK8Fxyu2ZVBnVnJWzR0PRytVGaM0Q/sAihzBcvHhkVE2hqIE2fSMZSn/C8O?=
 =?us-ascii?Q?jNNAebw3HBjHT24PC0wI3iW/CLrtYuZJy2zsy1yY0x01GwzJ+GgCE9KVN9DC?=
 =?us-ascii?Q?rjOj5E37WcD5oJAEs4VplEGJRsBDnd8yjYKSfXoXLVEvuSYIXVxGFpXSneW6?=
 =?us-ascii?Q?kpu/nGiPyjIu5LPx9qR+wBnvPq5OHCphU660GPazk7C9Skt3G22teMXM97Wd?=
 =?us-ascii?Q?2eQPGl8L27aYLAWlRnqIENo/tm/txqBWHi2YKPgRSdfPzazb03TzjaKq8Yta?=
 =?us-ascii?Q?4kOH13R9oH39I2wis+wWQBOu4TnHL/1P+PDYM/lNupRMFLwDqZtcULAMwGmz?=
 =?us-ascii?Q?oeMemat11S7CdWPmswJeOv/uoWc4JQZgLCH0H//MesOIlqxTSjnQHKzSdRAq?=
 =?us-ascii?Q?fnaXzPPE80RQ2u8t7tcQ39M6m7brAr+/nIUQCJO6EepbiY4wwNPTY7EwcJ5C?=
 =?us-ascii?Q?hZyYDdMX5Zyn+QYiHK5XfpKf+WzBkf4eysesEOeH6zOvXTgOr6SzJqEbM77F?=
 =?us-ascii?Q?Te5jiVCroG87teFaGA8BLusVbswzGvjVXkZvjV0YgkVqbp23rxm8dYVUvCjL?=
 =?us-ascii?Q?LT0oLiSKBdftVcsqyKR0mOKYtsiFLzw9BoN5MPU2ytl4F6hpbAbKJtuqMUTF?=
 =?us-ascii?Q?LvlVKs0mjsHSWZAawAAay3bhtok8eBniOEDnBGV5QEUczlu+s2fgeEWgNP+d?=
 =?us-ascii?Q?cyTc11UcJSb2GyWqoZx/opqorCgVrIsli8dDQ/p42Fht8QYlzJmzUoliUoqe?=
 =?us-ascii?Q?/dqbVL1lKpH4whtmojbhnrMEGoi+smqCXflwxoZe9pvWGQ3/kpazNfknem6Z?=
 =?us-ascii?Q?PS9TaPsY15ou0y2m454rBp/SXeCWnrchVRRIu/qIfkhsv9VKSCC+e/SR+gKr?=
 =?us-ascii?Q?7XbKIEWMKfqiZsETqOX8fFAEiyIZOH9+0ly8r599MXU2k7y5bHvz2kyu6Szk?=
 =?us-ascii?Q?1qsvCi3sQM96lJpmn3g=3D?=
X-Forefront-Antispam-Report:
	CIP:131.228.2.30;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe01smtplvp01.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:59:14.5054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc0c92e-720d-41b5-dc0a-08de4dfd52e4
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.30];Helo=[fihe01smtplvp01.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6455

Remove a bunch of obsolete macros from the CPSW ALE driver.

Stefan Wiehler (3):
  net: ethernet: ti: cpsw_ale: Remove obsolete ALE_VERSION_MAJOR/MINOR
  net: ethernet: ti: cpsw_ale: Remove obsolete ALE_VERSION_IR3
  net: ethernet: ti: cpsw_ale: Remove obsolete ALE_VERSION_IR4

 drivers/net/ethernet/ti/cpsw_ale.c | 5 -----
 1 file changed, 5 deletions(-)

-- 
2.42.0


