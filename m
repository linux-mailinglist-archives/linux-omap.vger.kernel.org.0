Return-Path: <linux-omap+bounces-3694-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58895AB3620
	for <lists+linux-omap@lfdr.de>; Mon, 12 May 2025 13:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 301973A83B3
	for <lists+linux-omap@lfdr.de>; Mon, 12 May 2025 11:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB682292935;
	Mon, 12 May 2025 11:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bW/8dGg0"
X-Original-To: linux-omap@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118F52920A1;
	Mon, 12 May 2025 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050287; cv=fail; b=ieXsSgf/46cQvpYg0xdtErqhvZXZQrC5NVwh9PUcDCU/pyxiJh4u1lfT3KB9L/4eEUAy+03zeFxH1p4PXKEfW/vgUMbTXR88frbruJtYLQvIz7LTX5O/q07DnzLoW5adTxShojdpyy3CtNW7mOhFMqdGU2qGfZf6jb0+ob4t+64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050287; c=relaxed/simple;
	bh=pa0QvTTheUO4ReECLz/3p7cYuU+3isqzkAhEYIsr9es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uson9OoRYEgGA3wG/C72rS8XqUx4tVnsCuQjCuC0xPez/XJ9sLyiiYHNaMNGU8tHk5EO78YsbdImkr4m1d2ucl4mReyOBTOEKo4iSdZk0rmw3+JpTWSSSQSxFZhgm8d0rhrJ4k8F4A/0hWf0IpvKzEffLdoHvT3GAuOODH2VIaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bW/8dGg0; arc=fail smtp.client-ip=40.107.21.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/cX2ky71+QwktQgpdWgzJUxTOr8MQufWyRQvkM7JhHLa9OOLD8pz0cohBnrzU7stqIbEZtk8hACfzkgzUGyt0dbk/Y6gtboPzZ1lyWCwzaPrSV1enFvHUF/w9jeLaKm47JLKYKafaNxkgsGiNuLchVznNVrV+CHS50txTwgSqVPSRwluZxZ2lHWJjTJJgtymM9gsI5EOOXzNb75taW7AIOx3aKzB43le5g6a4uaa9lyccDF+8f0LNpOdfX05ZUoq5/RMuFV3vtleErdIGFJUzcHfl70HxjZt/PdrWzt07EuNc5XYPu914v9xNldekAojNxanqvn1ULOi7iAgSqCkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UX9Al2NkGkmcp2qaIwB/MbOMf57ptv6j9XzaOqPf3G4=;
 b=xF69QFO5oCyrcjZTeXQvGmtZLGzm9qNwz14ZAWAN/ZYRm1XHqK36z82zyU5k5Mac76NcV6HXdap92gmP8yOxUsxF85WuTYE/ihgDl2Yfu7JVg6Llcg6gLXDep6u1q+hEVr1UGPcbCZNCa/6GsGmErhC+ct+kxWmEt0zucGCN55KRoeAFOVHeCQhLGpVbO9tGyDUSyGBvizQ6kOxBFZNFgakQGjTQfpocJwuuIfa+/mNdJ6sqRsojl7N3a9K8AecjJZCgVVDfJK2Dr63l2JcxBlaMDlWGX1p6U4le7A9S/OwMBgKNjEWF0K1BW8GgghVeDqqr4et1NtLYT12yVR/zhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UX9Al2NkGkmcp2qaIwB/MbOMf57ptv6j9XzaOqPf3G4=;
 b=bW/8dGg0tOgznPVln4i/BDnFrQGpw+QOk9ECTLGlo52cJJWtiXIka1Jaum8ukL5JL3tSE0WjbJmPWW7Esl1U7wQy09uM4dEybS0RnqvEiWUlHxl/jNAWVrt9gq1CK/yOPdbZgMUnj13k67euo0Rj6SvIH4j4RzZ1O7gKCfy+vNW1JKI1GCmuwkSEp6ZeS8tPdNm1n204UdQRuQgT0Jg4TFJDh75ntmUXuwX39ctbP+HYIhxjvtGzsa/dE29WOwcu+CwxG+HNb1FHIVhp39/FH+CYU7dYQDkIhJl/2GczWt8WAcWZK7Jm0CifHIK9v3w0SPoIEWloqm5endhErueC0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AS8PR04MB8214.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.27; Mon, 12 May
 2025 11:44:39 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 11:44:39 +0000
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
Subject: [PATCH v2 net-next 2/2] net: cpsw: isolate cpsw_ndo_ioctl() to just the old driver
Date: Mon, 12 May 2025 14:44:22 +0300
Message-ID: <20250512114422.4176010-2-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512114422.4176010-1-vladimir.oltean@nxp.com>
References: <20250512114422.4176010-1-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0487c3d9-113f-404d-a54f-08dd914a60e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OpnN/lAxgBk4HkNWCJiq/iMJIXw/NrPfGOQwQRhEAoXaEEQJFSAqIPKsJtsV?=
 =?us-ascii?Q?ynUmky7F740ZybV0Ql+T948NqSz388izFj/jfOjSunViqyz7DLDOioxsoLh4?=
 =?us-ascii?Q?Fd2qhUWqY5boPQD9J1AYuXcHdCi3Sv1onBmanulFT+8hzSCYgup4NaqjHQCB?=
 =?us-ascii?Q?akxKi4tYXss/7VPbtLGx3f/d8pAL3gxu/U9pAAKo55uX0fkAhIdxecRdtj1a?=
 =?us-ascii?Q?fqbtBU6V8U9CoVUTlNksREqzbD7vB4Jvp2EfwdL3k6+1n7ThYMJ7t7RARnos?=
 =?us-ascii?Q?w8E1ZdOUxskyjDPiYySJpf+NYtb2kL+YlcEvZZ3cC0ZSUzKLcDoIkad8N22D?=
 =?us-ascii?Q?lpEHVBCq1kRs+crxtHZz71niSyCwoGZsnSxNdE2p67l9ui9bdKMFx0XYBaFi?=
 =?us-ascii?Q?mDnPtxvJRyxXI7KbhYPQldOzRYtg8zJIbOPPocmII5tK8s/bsHrOsFH51pjn?=
 =?us-ascii?Q?8cTz4VLr8lwzG6BgjYG1CYj0g9vWnmwSKqLiiCE7/+cyPl3l+yIVIzwxr6s9?=
 =?us-ascii?Q?990+Rdzlf1rlt4rKMa67l6sVle2iVQVzJgTLyKMkGTLrC0enBUpewdvuE2Sm?=
 =?us-ascii?Q?Ct/xaBaP9TRLsHzQM1CDl6Fqyxj3VLJSiFtpDL9Hgv4hKX6hgr9vB9stfNC6?=
 =?us-ascii?Q?8k0z0U/6h0qz9uUvpUEbDH40xNuCq7xNT5OAB/nJvE43WwZb2Cm6P8Wb4H9t?=
 =?us-ascii?Q?hwMmJHZpuEcDb3v/S8cGQirzWwH4lOH9kXulWc+m1C6mKcgHXmbgUwrS7cv3?=
 =?us-ascii?Q?SMiAct0W4ZV5pjx9/TuzXseUN8X2tFQC39j4Y2do5CwsdmqXhJi00J8/Q5gV?=
 =?us-ascii?Q?tS8a1su9IHcaK+yXeCy1pxVa25CQVdOd+1TzBf0r3Wby6dASvDM87F4BDrEV?=
 =?us-ascii?Q?6afHXw91LebrXwef1RPgLKI3KP2TKW+JuELiYMBJEorfcwjAMET/Lz/DrmrB?=
 =?us-ascii?Q?sd6iblHZFFTHK0nWEQMVgDQ6kaWEx8SvS4MQiZcOtkHDsLjI5Aau024WF2Uz?=
 =?us-ascii?Q?om0vw4eYaho+RbZnYmqf2sncju7M/SZsfSWwBeuGFLSK3b9TdI0WcF1QlKjr?=
 =?us-ascii?Q?rr5iv1So0OAzqFTv1nyzECa7ujPi1wZURXthVjt5rko/LEN1gL/lhIyt7PCh?=
 =?us-ascii?Q?eT43i/XF3TO6hg3jrGQc8WrRTe8zq+O5utyj+/A+6oAVhSY/oYTowW5+bXOQ?=
 =?us-ascii?Q?gYSIzPGd3vWoC74TxMUQ2ZADbuHYbXurtJXVXJFIAFIcYhSa6g8By//Sc729?=
 =?us-ascii?Q?Xy2uoYqO4cBIfwXLolHxZf+xeJkpNSiH0G97DBfF7OT5Q162WXTsL7GYbrsC?=
 =?us-ascii?Q?jtfuieKSHQc1ZMVDLTG7bggpXaCgXapz9TT//i25bCFT3CLSC20GgTCp+Pxb?=
 =?us-ascii?Q?JOQLNsyR1wTtX3KPakyhX5LxWkXb99q/koms8IRdFO+hsAWCeQR93nmEXfJW?=
 =?us-ascii?Q?Es0ad1HPNXQti1hC8+pd2jXM545AjZK31/TcFjkLWQCYrgmquVBQOQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TkrrB87VRQIFtovEyBYhm7UL9fdHHgm+2uZsUO9GaDeztNhVKu2JnmMcWq1D?=
 =?us-ascii?Q?AjN9gXDT3j2ZkGwOijB+ozjSO958fYZokd7IB8/b2K8Y+5d9bzfs6ixviMeW?=
 =?us-ascii?Q?TWEWDKGjLC4eg3tIBscBHSOOAJBysmVp41+8ihiXY1b2+wQKDed/Jys+YCfS?=
 =?us-ascii?Q?oWaQuGCyKVPsXmIShNbYLjnUaTWKDKof1rUMkXGOLvY0tMWMzZOREdTrfcDE?=
 =?us-ascii?Q?E1KG8ahuZuiZ0QBJM7m8CN5EXfdiywcdsRjEfgNCtUxoWJqTkzG6TAILeoqY?=
 =?us-ascii?Q?Vy5Wc63h9VFzXkaeJuWRJu5Ol/JVmoh+a1udQqrr1D8NECn46Qdc2+2aKgEJ?=
 =?us-ascii?Q?cJZSoxkcs94hYGODyCNU+SmEby/oEl6wjx4Za0YPrShmJ++outmYiztYuzSv?=
 =?us-ascii?Q?P1xACD08ViIJQ+MmZ8BcE0B5Q/rSP/OsPnAL6cLmVhULyw9Iyjhwfb32aDI8?=
 =?us-ascii?Q?7yR9P8EYDFqWxuZkNKtg96TXu+QZuE9ASXSFt8kNSzo4s7IAr8crpXQefb/5?=
 =?us-ascii?Q?m5V7pTqFdUQ6b3nsQ0RPuDKCWS4yAc/lHxRTW2bz/zK3xg95IleuOgmhI0Tp?=
 =?us-ascii?Q?a5dwKB8n2n7NdrWmEeQDBRMIm95omWfmo14TvGpZ4xQGEH0JnGBmnCbuMoWA?=
 =?us-ascii?Q?oiSH7Xyli8ZH7taFMHzi9ksj50WDEV222MnRKAls4u+FSE0wWOI+8PNGhXZC?=
 =?us-ascii?Q?7GlRfPTZp4xeiR6oeYEsoUyXD6S3YC7WeGCU5BdKZeWy6xjtsHhvhVQOwzkd?=
 =?us-ascii?Q?auBqE4UEpiZh+SivcLnVteyV+sTJRQScN3GahhXl5wehwVbDY+DnE5WmgqR7?=
 =?us-ascii?Q?VQq/Thl2UQIajG2j3Wr4V9JT4VJUFQq7uWlylVFjnxz/kS0NGCHGwqLlfX9W?=
 =?us-ascii?Q?6Fuang7C+sJumN8kucDHQPmhKwAhwZQ0TqqkFNvKuW22GyuiL/Y+Y0iRfGUm?=
 =?us-ascii?Q?kDETxtDIGOE1XTckCnKMxHfsHRRDKV/sBni/xDgntj6o3b6kZSwwr8dG3vVo?=
 =?us-ascii?Q?5cBQKi9uiCA6EmwUQKeZDcOiCtQ1jZV6Y5j3TaiRHmdVjAC/iexisapIf0oQ?=
 =?us-ascii?Q?vlwqAP8ngkZpXP5CSgN3eJkvjPgFK1dQfEPw6zK8QVp5ieFWFZz3Mn+zmA1u?=
 =?us-ascii?Q?yImRuVqZiJpfNMDpHYxtzEruFEqXCC7hlFTewLuG8tm25Cu3IVN5ff1u2m1x?=
 =?us-ascii?Q?/OIddSJSS+6Pjt9PlHsFJp0Rb5Bg4qCBOzU7I8IZe6RvxjwhBJZGjFVe3MRv?=
 =?us-ascii?Q?bSQRiIEskVbKOWA6t4I+WKBZup2SqriA1PXIGnX+UA9QXGKQn22XyokISjsq?=
 =?us-ascii?Q?/7WJ6yTAVaQMLAFFD2bd/HHp+5R1NzdmnXFdk3cY56r+6lQagH0ZCVe3pR6e?=
 =?us-ascii?Q?mEUhoGxtE2imQJuN616FPlOKuc1Luha6XkUifPxDpa70WT9xknaW904lU/Pz?=
 =?us-ascii?Q?xURzXKplZ0mGeMsI5J3dseQSI1sxQvyftgFPEZGJ8LzrkLfivYVQGTFZL4+c?=
 =?us-ascii?Q?BtE5qltqVHlgyG+aRWe2RdRdvFuYTzYohTUxAPo1mHkc8/xdVGMsgObyu7zf?=
 =?us-ascii?Q?3RSObQ7CRBQSYKbRsh18gQ552efitvqq8V3Cw345FP18g2R5Tg6WmFRPVoq2?=
 =?us-ascii?Q?MA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0487c3d9-113f-404d-a54f-08dd914a60e3
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 11:44:39.7739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNCMsyjDEN3B53KLbEuyn5O8cczNFWQ7ueJ2qBYRajdZ4hpwgxaJNpcl/KBHqrWOcCS323kRcBmwgBTreWXZ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8214

cpsw->slaves[slave_no].phy should be equal to netdev->phydev, because it
is assigned from phy_attach_direct(). The latter is indirectly called
from the two identically named cpsw_slave_open() functions, one in
cpsw.c and another in cpsw_new.c.

Thus, the driver should not need custom logic to find the PHY, the core
can find it, and phy_do_ioctl_running() achieves exactly that.

However, that is only the case for cpsw_new and for the cpsw driver in
dual EMAC mode. This is explained in more detail in the previous commit.
Thus, allow the simpler core logic to execute for cpsw_new, and move
cpsw_ndo_ioctl() to cpsw.c.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v1->v2: expand cpsw_ndo_ioctl() comment.

 drivers/net/ethernet/ti/cpsw.c      | 21 +++++++++++++++++++++
 drivers/net/ethernet/ti/cpsw_new.c  |  2 +-
 drivers/net/ethernet/ti/cpsw_priv.c | 17 -----------------
 drivers/net/ethernet/ti/cpsw_priv.h |  1 -
 4 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index b71352689768..54c24cd3d3be 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1156,6 +1156,27 @@ static void cpsw_ndo_poll_controller(struct net_device *ndev)
 }
 #endif
 
+/* We need a custom implementation of phy_do_ioctl_running() because in switch
+ * mode, dev->phydev may be different than the phy of the active_slave. We need
+ * to operate on the locally saved phy instead.
+ */
+static int cpsw_ndo_ioctl(struct net_device *dev, struct ifreq *req, int cmd)
+{
+	struct cpsw_priv *priv = netdev_priv(dev);
+	struct cpsw_common *cpsw = priv->cpsw;
+	int slave_no = cpsw_slave_index(cpsw, priv);
+	struct phy_device *phy;
+
+	if (!netif_running(dev))
+		return -EINVAL;
+
+	phy = cpsw->slaves[slave_no].phy;
+	if (phy)
+		return phy_mii_ioctl(phy, req, cmd);
+
+	return -EOPNOTSUPP;
+}
+
 static const struct net_device_ops cpsw_netdev_ops = {
 	.ndo_open		= cpsw_ndo_open,
 	.ndo_stop		= cpsw_ndo_stop,
diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti/cpsw_new.c
index f5b74d066f0e..8b9e2078c602 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -1132,7 +1132,7 @@ static const struct net_device_ops cpsw_netdev_ops = {
 	.ndo_stop		= cpsw_ndo_stop,
 	.ndo_start_xmit		= cpsw_ndo_start_xmit,
 	.ndo_set_mac_address	= cpsw_ndo_set_mac_address,
-	.ndo_eth_ioctl		= cpsw_ndo_ioctl,
+	.ndo_eth_ioctl		= phy_do_ioctl_running,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_tx_timeout		= cpsw_ndo_tx_timeout,
 	.ndo_set_rx_mode	= cpsw_ndo_set_rx_mode,
diff --git a/drivers/net/ethernet/ti/cpsw_priv.c b/drivers/net/ethernet/ti/cpsw_priv.c
index 8e17da12d8f5..bc4fdf17a99e 100644
--- a/drivers/net/ethernet/ti/cpsw_priv.c
+++ b/drivers/net/ethernet/ti/cpsw_priv.c
@@ -710,23 +710,6 @@ int cpsw_hwtstamp_set(struct net_device *dev,
 }
 #endif /*CONFIG_TI_CPTS*/
 
-int cpsw_ndo_ioctl(struct net_device *dev, struct ifreq *req, int cmd)
-{
-	struct cpsw_priv *priv = netdev_priv(dev);
-	struct cpsw_common *cpsw = priv->cpsw;
-	int slave_no = cpsw_slave_index(cpsw, priv);
-	struct phy_device *phy;
-
-	if (!netif_running(dev))
-		return -EINVAL;
-
-	phy = cpsw->slaves[slave_no].phy;
-	if (phy)
-		return phy_mii_ioctl(phy, req, cmd);
-
-	return -EOPNOTSUPP;
-}
-
 int cpsw_ndo_set_tx_maxrate(struct net_device *ndev, int queue, u32 rate)
 {
 	struct cpsw_priv *priv = netdev_priv(ndev);
diff --git a/drivers/net/ethernet/ti/cpsw_priv.h b/drivers/net/ethernet/ti/cpsw_priv.h
index b23f98032669..91add8925e23 100644
--- a/drivers/net/ethernet/ti/cpsw_priv.h
+++ b/drivers/net/ethernet/ti/cpsw_priv.h
@@ -461,7 +461,6 @@ void soft_reset(const char *module, void __iomem *reg);
 void cpsw_set_slave_mac(struct cpsw_slave *slave, struct cpsw_priv *priv);
 void cpsw_ndo_tx_timeout(struct net_device *ndev, unsigned int txqueue);
 int cpsw_need_resplit(struct cpsw_common *cpsw);
-int cpsw_ndo_ioctl(struct net_device *dev, struct ifreq *req, int cmd);
 int cpsw_ndo_set_tx_maxrate(struct net_device *ndev, int queue, u32 rate);
 int cpsw_ndo_setup_tc(struct net_device *ndev, enum tc_setup_type type,
 		      void *type_data);
-- 
2.43.0


