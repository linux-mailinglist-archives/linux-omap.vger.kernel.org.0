Return-Path: <linux-omap+bounces-3682-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6590AB03F6
	for <lists+linux-omap@lfdr.de>; Thu,  8 May 2025 21:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 208809E832E
	for <lists+linux-omap@lfdr.de>; Thu,  8 May 2025 19:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D749128B7E2;
	Thu,  8 May 2025 19:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RaGVySoL"
X-Original-To: linux-omap@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDD4288529;
	Thu,  8 May 2025 19:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746733731; cv=fail; b=bT+/5LNR+qO7HcX1pdcYJshu1p4DoKykp2UIV+6JDt6NcyuWhUkgCdHre37gkEm4KfodgUiFZocymYadB82brlaefZuf+ZY5epmrysW1UgFl5RsaQP+locaWaUdJS+mZg2Nvyeo0ZbsxTX/Tuz+Sm3jrIwKhBEyMY4eZk7Rlbdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746733731; c=relaxed/simple;
	bh=GvatIawSNaoBqIRaBoR9Gs0YfZ7/qk9ViBwiPcfoYpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pj+INZqjTNTkcXVDB4COTKetD9OKEX0ZlGFt7344YTwY+r/XLxgRBHSxykw+xOZwBrGcf8Sb64NQ+eqvGuS84uJOX7zVHY/eD5Tgr5R4BIz3Ztn+p6T4m9JMs73+U+9OP0VGvsNgc8LDROS9sFMifBhIEP0B7BqdFX6hztiCV5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RaGVySoL; arc=fail smtp.client-ip=40.107.22.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGDzoWu6mhXbWrKzmomP76MlQHMucQOtqrxCZNn4nJCZaAfT2KLTRDf3KV3IrlcMANsfiH2s4Op4OiH0smiuh7J5/E3GZTEjN9WYrHlDmotrdVpUafYuvI1oEp0UH+BMAptf+K3qqaSF1CDVdd6CNS/XtGQ13Pbh46FN9yE4AVkiWc2Ql0zsV7iE/xnCCdM3AqDxCV5NNlNzHPA3Cx7tRyyA9YRQe6LBD8wqaLJIOcHbaqkNhkjnebzneOj3qfNrIac4lxj8R1+rC6dNYGpT5ZX6Pm0Ehm4JINp9PxkDrbxhqxmJSTC66qiDEDfQttscgfA2JazFzF2/BqJa33Hh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yA7BiMV7QooS03S6VFFxjzCmgwSJJvvJhpQAwmIQKkU=;
 b=ToievGF4TOszIOjSKEYSrisjf/vuZ2WfIBJj6E9sWKNomRlHs9B6YN0oag3F4dXonfLtWvxpX5f0bCXjaYy4JjSI7P8gASv5wWYg1noAWLNET0B/nlzbEHvcEmjnVYMEMCj+hyL7VbBE24gQa6SsT1G1OTORjRqRJDgN8SV6JAGbfh27tc3Q9iZrbDB/BMrv1RhpnAt/gOS0IlcrUcFlAb9lLPh1VLGS6wggDIIh7NPwXmQ1kcytw13fw85mdqW0LMg6dp8IkQd0EAwT6cUVOWqROwkEhhn3NDn2muqj9wiEqmAKss/fabEijl+Hq0MfUdgfaMfOGtvrpzJKP/YgbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yA7BiMV7QooS03S6VFFxjzCmgwSJJvvJhpQAwmIQKkU=;
 b=RaGVySoLr3ohQ/HFq/jRnUFaBPTvhJ+4A770SmlZQBxyshb6Gq75+qAPC+PGAaAJohujpuTcbgeTmGH2v4/I+/+TUdRcSsnGcA77GkpQ2GJP3RYK+FRkUMczGKTgjACGDpXP8hSPyDfhNFO1IQr2IRwifISvVU0dSvzpsEJQN7d4xeCW4NaH8f4pnHNxwUJe9jlyOtFi9vzkAtASN5CKD6LyzJiU2tTnv7DlH2IEmss15Juf80IXzZ/JkJTK3X6Tj2SbZdhU5jst7cJwrr2qJYvLy5LKNT02Ys+fZBfQ3Vn9NTjJ2M3Cy2oXS4PFWFCLd4mkC5cDO4NrQhECpGIckA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DB9PR04MB8395.eurprd04.prod.outlook.com (2603:10a6:10:247::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Thu, 8 May
 2025 19:48:42 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%4]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 19:48:42 +0000
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
Subject: [PATCH net-next 1/3] net: cpsw: return proper RX timestamping filter in cpsw_hwtstamp_get()
Date: Thu,  8 May 2025 22:48:23 +0300
Message-ID: <20250508194825.3058929-2-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9d7e3a57-442d-4859-2d1b-08dd8e6955cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wE97FfXH/UZE0B8VIoM3H9Q5s7LXkBkIjRszFgcD+ivnD0r4euK2aWgZbGJ0?=
 =?us-ascii?Q?qMmaQdhNu99+n2fj2CNkBwgU9z4ZfsYldYyrHa5qw0pWoUEYNetriZEQCt7j?=
 =?us-ascii?Q?ImZCYlszHBzfgxXuM1kf3R7YE222ElM0PcRCqdA2FDe1g95sW+85hPs4zZJP?=
 =?us-ascii?Q?KNKUIHjlAxDwls9msNR2TjC498JnNvkQ3zRpC0Gt6Xmb+RMTec+QBDtKN9Ft?=
 =?us-ascii?Q?2MvLLNuhXv7fbC9SaAsLjUZqoPy33/1LZUxgBkt8UiCw75FEO3jfa4hA3chw?=
 =?us-ascii?Q?dTMmx9TATTVdh5Qv96iTNK3mhBLYFl4jyXGzQQsReKSyZV/GCa9EhX1mZKSh?=
 =?us-ascii?Q?H0IXsZSQfsnvwm4NPGM+agsJr/tyPqAZuP4uUg4nO0SLwAUtHNtlQEDwaCU5?=
 =?us-ascii?Q?m/bJDaw4NDUxHZjY/QEfcPM1OiQITzwABnc/8duVEM2p8aZTz6Tai9xCgu7x?=
 =?us-ascii?Q?G5WmGwE/dM2GoWrwYLu3KaDRpqIhpp2RcyHfBt5tkPL/oanKrRvEi9txtfc5?=
 =?us-ascii?Q?E0gjOA6UCZ8GVm6iJV+VOIJ8aqiA4bZUfFCKn4jEzi/hdcH5wYXmFwMo4erQ?=
 =?us-ascii?Q?jQ8bWLCLseFzoT/J5MZXmD8fPZGeB+nOYHTiBm9qMWjpzhBZbNHyNaUXB5WB?=
 =?us-ascii?Q?Pni8JnAPOdtd8+V6unHjXGyWC08mAZL3j8KsVauiKeROdfhgrhyVdhcHiKCY?=
 =?us-ascii?Q?1Iz5i8Qh8kXE/vABvdO9ZQ6Vh0tY01w6zVnvv9JydSoBwznf3h/2iK494FuZ?=
 =?us-ascii?Q?lyAjqmuKrYVFenVqRz2hbfvDjwy6CEpefZ30eeJxB4MvuRylO1GyJmc9xuRB?=
 =?us-ascii?Q?kbZCKogBAYedzuKudvnOvpyZ/HZY6UDpkgV6vXzlAUCMiKNlmpBUFKPL99GZ?=
 =?us-ascii?Q?la0CMxt0HWQkc66gDALblC2fCcQsgW8lHkQuSxoOE0eFyDKBradPLg4KGAqW?=
 =?us-ascii?Q?l5mvp4h41L4zgn9VXmuVWjikKwcWQ91q4BfKHjZFGbxYAjSon/mZOj6tXUHN?=
 =?us-ascii?Q?Nt3TKZ7GTN+ZFTr6x5THlZBP8Q77Z9MMbQ3LL+AgDl5es6bcuYBtzA5R763j?=
 =?us-ascii?Q?KnIK7MjAqKWbEZFd7iYkUhn4VylCz23ZEXJnw1Oj+vxb7zAmfRavxxqdUJaH?=
 =?us-ascii?Q?CWlBrKK/6cW4TJ7Xw0sfPJJ2h4UXvYGeNKuLBMmpCKGUhbp45iQPLfZnsWgo?=
 =?us-ascii?Q?xGgAVk4qWVfECR7R6TuZbckHS5vZwSi9h1OzH5lCyzYWbt72Y8qEkjN+iUtA?=
 =?us-ascii?Q?yM1u+NgliZP8RjbHOYL9o6+ElGSJ2NGLkiRDliC2WXBZmQ5IOWcplhFzLsZg?=
 =?us-ascii?Q?qm3dF45jOgpboSMCgs+jT2W96Hoc+j7vhU6wd7tMU50MTwwXLXJhbpr/urKW?=
 =?us-ascii?Q?LdaW7eS74Ljh+roly1Dj/Nw7YUdKPTrR8GeM9zmzGpbuBe3iVaBGzKtR8/lB?=
 =?us-ascii?Q?AeEto2SK1oPJtFoQor2UCiv4TD4mVt5RyIUThmKeCjwM8HL286NtHw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kMk/+V/k/25TUT0tMv1qbZ64meS8JjWqsM24x/jglzpGkjNQxZbRKJZMvHiW?=
 =?us-ascii?Q?EOLeELnv9kTWo5YfqkzhG0/A/FV+l2cDo2aNf1X3nA/p9VM+cn6hvMfTN1is?=
 =?us-ascii?Q?yTdms/f8XaPBCenMwg2ISNU7/ABBT5j1GtIjdENUsotz3VeJ7kfPDc4zTe7b?=
 =?us-ascii?Q?lcTs8AVfkTiW0CiD7H9dyBe4kEY91vUktawdDRcEG+OFT3My1J6lrkokzWj0?=
 =?us-ascii?Q?MeNC3VKlt3KBKDYLcVDxvhEjGtCtkYYv+aN4FQKemJTsri4QUBCRrbpgrOEi?=
 =?us-ascii?Q?t5zEGhOaycRXzv60s0F5KujeL+dnS0b6OlZgZy9Vqk93QG+3xSI6k7MOUDSB?=
 =?us-ascii?Q?I6v4dkdG6AX7Qv4yWY8tNHwk92dDvT2vYgQ0QghG1O5dZ27LigrxAxVLIcvT?=
 =?us-ascii?Q?qRJVbyRsnJRxf9gx9kZ6eOchVkoA0wjP3PM7GwXDMxNKnapo21vKegGeWGNx?=
 =?us-ascii?Q?OPgsC1maMFwRg47yy5XY353IdNSz2t17i8W3n+zxHV3oRGm6c/fk8rX8FeSQ?=
 =?us-ascii?Q?bbJKiFEi4hoRvfcFw8sPyLxGDfHKot9T6fg2zsCiA12KS692jH5n3pHWmkVF?=
 =?us-ascii?Q?bkXg8EGKPy+vfzFrLERK7Wwn3Y7/eitDmsg95Nvc1arKVsUQRF4uS9LncoIR?=
 =?us-ascii?Q?9j1lGYMcVSmUOyVITJmldGvQlSwdSePpGiyVBK1QpfMLqXgJAGYbNs+85JoM?=
 =?us-ascii?Q?y0RqHBib5EHeynAyk5MyO0dMGM7jvyx7zmJSfn3DpW2KElnOmffiox6V71AD?=
 =?us-ascii?Q?uOZpvequmU0VCu5qttur+sV6WaKLUURLe7PLVI2WWSTJ9axlvCbq3ooOBMOw?=
 =?us-ascii?Q?ePv1cgH89aiNZV87ku3wN8c4YOtqUPzJif+r0E15mMZqUx/pnPd5EPMgFC5L?=
 =?us-ascii?Q?/afw2howQBtnUmvBJY3cjQBti+Tq8GixBuu1YXjtnn7papuEaWhX3LRFMHIF?=
 =?us-ascii?Q?AtxsJwwzIpkcY8IML9he9WB1Jus9tSuh5hKqXodrBi8WI3zxsJQPMZeM1bp1?=
 =?us-ascii?Q?b2ydiUXzkxTd1YUNEhAncKjih1B+az6HgmzcFp1HNYKD1+bMC5AUdTw3ErkO?=
 =?us-ascii?Q?QoFQsSnNeWKjDIHxgYBMo9nOpLOiUmv0D42GuXLyYPUR51Nb+5ndVKMjG+NZ?=
 =?us-ascii?Q?JvMHlH7pm/QpVbmr9tgJ+OHTeF7fejJXHCp5hpB81n0iHrBbWY9q4FBTUDwk?=
 =?us-ascii?Q?Eoogh0qQ2WMAedv9F1VVaH9kkkbGn4R++3UPBWRcNNrMPVA/d+0xAa1ljoWX?=
 =?us-ascii?Q?nj6U1aQwNOh0YBT/jKmp0YRjGDTLO7hTaHJtmdO1LZpVaf28QC33bsVyYUau?=
 =?us-ascii?Q?HSRBXtU9ZEXQFtkR8rgK3iEdX6fCYIxFh8CZnDY9+VFY3u0yhDBjIAwKjpaD?=
 =?us-ascii?Q?wLU46kXS48Pi0ojJ6S6yhTQodnxJ6QNX/lEeWosdQ9H6R1mEnaKHuD5DldcG?=
 =?us-ascii?Q?XdMUDmlfBNlr2srxYcNNEgE1Rp4qVLHTfqShDf+ohbTwjaOzEVf0P91eaafL?=
 =?us-ascii?Q?YdwcgKeQ7USGLsKv+y4hEM9pcE2jsquBd9qayos1fmWDeOG7QZqVUqrrosT0?=
 =?us-ascii?Q?54pH5zs0K24gIm9Kof8XBoS23EanlE3HKl7NCMQIfUVSrczOaNWz/I8QJN70?=
 =?us-ascii?Q?5A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7e3a57-442d-4859-2d1b-08dd8e6955cd
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 19:48:42.0706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ddZPp8jTsKQudFP91uSEx6jXqPbmmuUc46jIotbiTqObOhdUync6cW2f9U8bq5+WPKlNVsH5EuvXm+alBdWmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8395

priv->rx_ts_enabled is a boolean variable (0 or 1). Overlapped over enum
hwtstamp_rx_filters, it makes cfg.rx_filter take the value of either
HWTSTAMP_FILTER_NONE (when 0) or HWTSTAMP_FILTER_ALL (when 1).

But this is inconsistent with what is returned in cpsw_hwtstamp_set().
There, HWTSTAMP_FILTER_ALL is refused (-ERANGE), and a subset of the RX
filters requestable by user space are all replaced with
HWTSTAMP_FILTER_PTP_V2_EVENT. So the driver should be reporting this
value during SIOCGHWTSTAMP as well.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/ethernet/ti/cpsw_priv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/cpsw_priv.c b/drivers/net/ethernet/ti/cpsw_priv.c
index 6fe4edabba44..68d8f7ea0e44 100644
--- a/drivers/net/ethernet/ti/cpsw_priv.c
+++ b/drivers/net/ethernet/ti/cpsw_priv.c
@@ -687,7 +687,8 @@ static int cpsw_hwtstamp_get(struct net_device *dev, struct ifreq *ifr)
 
 	cfg.flags = 0;
 	cfg.tx_type = priv->tx_ts_enabled ? HWTSTAMP_TX_ON : HWTSTAMP_TX_OFF;
-	cfg.rx_filter = priv->rx_ts_enabled;
+	cfg.rx_filter = priv->rx_ts_enabled ? HWTSTAMP_FILTER_PTP_V2_EVENT :
+			HWTSTAMP_FILTER_NONE;
 
 	return copy_to_user(ifr->ifr_data, &cfg, sizeof(cfg)) ? -EFAULT : 0;
 }
-- 
2.43.0


