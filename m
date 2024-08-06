Return-Path: <linux-omap+bounces-1850-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D889488BA
	for <lists+linux-omap@lfdr.de>; Tue,  6 Aug 2024 06:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B71F71C221FB
	for <lists+linux-omap@lfdr.de>; Tue,  6 Aug 2024 04:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEAF91BC090;
	Tue,  6 Aug 2024 04:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="i+ZeQ5Q8"
X-Original-To: linux-omap@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C2B1BB686;
	Tue,  6 Aug 2024 04:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722920339; cv=fail; b=ZHpuPUtmr5M8PGw2S4I3dIRaTLO5qHh7LfedyxkCzs/L2m7foshfR1VfA8fPEUUuF42WZX1wPkMR92z8hkbr0iwbyVJ98mIxLBb730dsI6C6Mn2ltdyyCE/Hesy8BqIbe+xdMlZAQEDyxdXzDnY9DAS13OV9diykAV2k3Q79ACA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722920339; c=relaxed/simple;
	bh=mg8aPdjfj8RwMfSnBel27b47brMcpDU/JeJn8rTtrvc=;
	h=Message-ID:To:In-Reply-To:References:Content-Type:From:Subject:
	 Date:MIME-Version; b=SNCnBGWUkT5MXS4gXfgoG9u3ucDM2oKPP6NESFv7gpf9UeEkUHRNZm801I2YtyhV3ES6+lPGRpLmj4vay+t1VaRWi/u9y/pNdotz98BSYAQPSM1F1W+U8wWE0GQdNze+l/Qz9S+y5VrPaZW6nbRqxBimNVAb1gR/+agJqq2mVtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=i+ZeQ5Q8; arc=fail smtp.client-ip=52.101.125.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmZGJ64Lvyv+XEXFozhyZPLtFf/gNaIQQ9QdZnRKU3kElRYcEwTdPPOsoqw6Vnu0qxpNzw/iepM2VF8d9UhiYydhLoJj630DxdSw5ljPoFPyACNRDupXGn6YskaQx23PJUQcmor2WbZOX4HXbnx0jldsynhFB0tSMs5e66ZibeOmWsvOnXjSSUdx+H5WGMSru8m+EnfgKrYJZIWuEXWF3B/GUiO6X80FWY/9tgAC52a1UiAcYksW7lHzCfYw5koIUSOhzYmsdENUdQmjMT1N/t3UrTsHGEs0tQJ5f6YCNJiEDVLU9BB3CO8FXRC6BvNBbr+X1kY/4askHjGcmQyw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqpCLsY1CmrUuWtVZbk0ujoYsWif8tltOD/VUVSoA/Y=;
 b=c7GOsj8dUgRmdmd56C79/X3ADenboE6NOnHk5PtjqnAO3IM0xE1W+5nYEAZFI6OXye6sgF3J66EmKfPwxODkF8ldw4DfbtZBkscMkSutdCRSQWwr74Or0Rawu+oJES2BcTPfKOG7UdtoztvmzVzj9YUN7rm82KsksMErUMzxc0yCwO6IVvdkDkyEE9LQOnhZY0qfDpB2aLyvMyVvD6wsTw8UUT360quGhwpelCvZ2X4jrMgy1M09KSUFgiKtw/yCifFKmF994HHXPZL1Ww3AABxEgiJaEW7T8sJyNzgju2B1c/S5m/qxkuaq2Lh0DFf8NPTajnphbgnYVSotAg9QDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqpCLsY1CmrUuWtVZbk0ujoYsWif8tltOD/VUVSoA/Y=;
 b=i+ZeQ5Q8n0le8pJ2Y6hdLEb9y/6+C9LsA4Kd8i/VFginYCebIet9aRkIVpaxJk9MbJbVyJ5S4UGtDDQHC+eKnUpXsDAkyoVXhO1Pe9xZX+88poQnqs75P7YPbzGQRxU72RmZlbztqf2zaVpokhjAAa+od3Vk6esnLEyBEIw110E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10409.jpnprd01.prod.outlook.com
 (2603:1096:400:24d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Tue, 6 Aug
 2024 04:58:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 04:58:54 +0000
Message-ID: <87bk26w8kx.wl-kuninori.morimoto.gx@renesas.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Helge
 Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mark Brown
	<broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, Rob Herring
	<robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Takashi Iwai
	<tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <devicetree@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-omap@vger.kernel.org>, <linux-sound@vger.kernel.org>, Daniel Vetter
	<daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Helge Deller
	<deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mark Brown
	<broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, Rob Herring
	<robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Takashi Iwai
	<tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <devicetree@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-omap@vger.kernel.org>, <linux-sound@vger.kernel.org>
In-Reply-To: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
References: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 8/9] fbdev: omapfb: use new of_graph functions
Date: Tue, 6 Aug 2024 04:58:54 +0000
X-ClientProxiedBy: TYCP286CA0117.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10409:EE_
X-MS-Office365-Filtering-Correlation-Id: 452ceb44-3f49-4691-d361-08dcb5d478de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|366016|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5YFaQKb499fBCqUQrfEo19uSd0NgZgdsy19A2tLdS4C+207p+ds+uYl0p8V9?=
 =?us-ascii?Q?lmwwyNu+vh3EQynXsosG//AktMzwjwdodMZjn0iIYS2hceCvULCHi2ZsHnKT?=
 =?us-ascii?Q?CWitamMs5Rc9NmO6XFSS95EPxYW1Vo8Ug4/Afgfeidqo6qaOuQJcH0EMmcSc?=
 =?us-ascii?Q?5Y31YcGETI8dcgnUnE0sA6w7CWIzApyeKhYHWaPBOPgxZlxhUBbbI1dD8oAY?=
 =?us-ascii?Q?xnK7c5dIeEskpceIqG205AxIv+KNR6wUgC/QUnmlu/7E+e+AU59I3ajx8gac?=
 =?us-ascii?Q?ekMKlgZDGHgbEqlGGkE9lDypPMMp8KJbKFfc35HYuUuljTc65Xyk1d48oDL0?=
 =?us-ascii?Q?9ID0doNu7hVVzlCe2h09fCQO6DkA8Op84dlZuJ8sqWdrTQBpHrws7zFdtAFN?=
 =?us-ascii?Q?SQ/r9n+q31dm9LYSsPMHc8MdbrGeHnSCyBsIHE0dhJuURkcGU6D+G0tD/rS6?=
 =?us-ascii?Q?xGhksOvLImPCucYccwB/macTxULPg+awpSWnORwi9sLWjP7IBgJGz1glhO/Q?=
 =?us-ascii?Q?DOB6nOGOmc55hZol+RXzQjwOcsehHRWIKbc0IVHrrjrtw3ypv0eYNL1KEgNW?=
 =?us-ascii?Q?FZUdOXEREzIJskqb9jFXzfmKSWAYm0XrhSJIzdaXTOOn3EypWtAbvYOpMyeG?=
 =?us-ascii?Q?txiEmUrsoGFaQpkWGurb2l2HEeG9FKHRy8y2TugLyGuOHTlIJ+6ClQKadBEE?=
 =?us-ascii?Q?f/tPLHjarb6Xw3PISm4FFFU925QpsJVc3Vby1+xQLeZ0vvMRsxKAI+cnWSaf?=
 =?us-ascii?Q?YfGxtpKp+AaAVmJI0miSeDo5499v+Cus7e05vQzLEbqZ8Oybh/gZGxGzqmub?=
 =?us-ascii?Q?0mDB5gW5rtjGoNuq+X2YJcIxvWlGslIuVvMxGC/l3ows/Gm1pPTcLmVB2ue6?=
 =?us-ascii?Q?7VobExck+vshGVrJx4ScmYj8PJyZr2wZvXZIK1k0fOOLjg1J8w5JoNci+rR7?=
 =?us-ascii?Q?he8H9J9cnEKHh4kVzOq2ouoSsIz7dogcLaa1+q0zJFogRZg+NLlyRaeK5V/W?=
 =?us-ascii?Q?Q5PcieSuvbJ4NIwX/DcA3l75fqnOXdfrJBA8jtjOJd5jnbAqtBF+T+L4Z6JO?=
 =?us-ascii?Q?ulCueKn5dtREgA+18GaKqWH3nHBnPwPGffWtt4hdkiAlSeZdi8OkPaOUo9ZU?=
 =?us-ascii?Q?uOWFf4PV75hilM4Grz97PoRosV131tDhPEssCOz3nIPsXKG+nnynXVn5DCk9?=
 =?us-ascii?Q?r8avwqRXoclvN7syyTB81QM4FJPUgh6R2yVoG/IeX/cUbUgqcncf1R4SVutO?=
 =?us-ascii?Q?xg8t/zvRf79YhJSq+YW4DtN1d8oynfklsmSDk2CkfrMj76M2j5OP0UNlFf/K?=
 =?us-ascii?Q?FfoelKCin5UFU0v+4oqrra5a2eQlzXUcBY7d//1cJRjqXDYuQuooohTflsYt?=
 =?us-ascii?Q?XoLYtAw+KkZ6/bqe1a03IxcsPiV8bvgB+rJrdTl/kae+y6iiwUcmkyPI4xF4?=
 =?us-ascii?Q?r1XbmVtChwI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DNWq83VbUMboEgqRd6uVBO53107Z1V01pf3D+sxLDFgqY/OYLyCeANJySjcM?=
 =?us-ascii?Q?mzagLTszhdhpnJhzim5+N4UelE1n2ke/qv39md6/uJhrHNvL2344d5xtBs5K?=
 =?us-ascii?Q?rF2Qt0X5naZUxnOOpRjTw7fUbwM42aEc7tHcSAioVSXZUkPnGp3d9vufShz4?=
 =?us-ascii?Q?o17ShfLv3urMeJ8iel593eZS69/JQTraievOBu/UA8qbNSXWXAdfn78MJdjd?=
 =?us-ascii?Q?efhGK8hsZqHd4B4py3dZjSWbZV+x7HVzO4TUSfsDo5KBFjwhhmlYFKxxStut?=
 =?us-ascii?Q?3M17srUTvpoTW2k+511+ZenfC19SJSnGF8DqTRMGmQtP9mVo/35CiVYQlXlW?=
 =?us-ascii?Q?XS8cPKMAxCv944dWUZeH/SReYegrHZGPbmPrSqRBXJ6WvN0KjoHsP+vyzkmK?=
 =?us-ascii?Q?PfVk9zoDcIjX585dLIOqCNEMXwOw9P9xczEg9CvD+72LG/u86OYB9sEIg5q5?=
 =?us-ascii?Q?279gac0n4bkScthQfH6EP8IBtw24HJgLU0iIhMj8QL98Fq4PRMJSHSt6NuAX?=
 =?us-ascii?Q?Qfkzf0Ljemd0beOZBMeUvF93ZQvQ4JUI+LK9UOSqiZTk6VvlnL1g7Ri/tYBr?=
 =?us-ascii?Q?0mOKEslH2Xo3ZJn5Hf4oNC5jor855QzaP4LdIbBN7XJFanczrNlAGX52DAph?=
 =?us-ascii?Q?eZj5TP2pitbsC8lMRRKyrSVcQuO333pw6nXhoFsnLiAxh4Yq3UkkFPduVxvt?=
 =?us-ascii?Q?e0OsA0TAwt5r32hq3CU9fPKeKz79rhvY5mzbQVOhtGN1Mt1aDQptipQbvtRm?=
 =?us-ascii?Q?RpYSN+r+aleB4AKOA7Y3rsZnEHtY5V0E6tQlUtvxPpXrg5OCpxLym0dW93p3?=
 =?us-ascii?Q?vtQJAj50MVEbocSP2MjKj13fR9CvWoVOpzLr1gDNxoDo/7ZTiKu555jLzlDL?=
 =?us-ascii?Q?4r/s/LRkL/W/HVj/mbYA2+IpC75yNbsAPGWceJFMfKI8TpikOHrJ+ZU8d5MJ?=
 =?us-ascii?Q?w8ug6ohet7iRq5MpsKERGqB83qVRmOMObLBgXNlBfNsvtGnSe002BFI2Xhvv?=
 =?us-ascii?Q?nwh1mBdlLGkKoIPWmPNd9TbRehdDQ5w5bdSo1B0rEOCWZnRfSMQ/bOfv715o?=
 =?us-ascii?Q?GSRpOO/08OaqjY/drXyfe1/6J5ZA0qGCbqZVa4OMN85MDKCqIkNwJlC6l7ZS?=
 =?us-ascii?Q?ngtk0LvyKez3QstO19becdh5xGF99SmhaTT/lD3DzxOrvHMqK0505Ks8E2iY?=
 =?us-ascii?Q?y4+0qNCC7pP3ZxUgz5c4hMfbNO9VNxdql1/yOVNLchMjXRZH37hGAS7KTW0F?=
 =?us-ascii?Q?MgPqIN1FTzVv7y7xSD/dbhnc0VXYJwe7VK7Cdv7p5iCXd1JrD/EMR76QeZVr?=
 =?us-ascii?Q?rW0s90acvIF00GRrjyCKh+nj8IxSutPySoVQmDnlbCJB+psl4ZrKfN6W098C?=
 =?us-ascii?Q?F07f84RQmyFrfGK2/fcjq7dSs5MzntOYjBKfDKTAy9Yh7y3Ni4MEWjogGxuA?=
 =?us-ascii?Q?AnITvTKfslE+3J4QjFqIhMRYLDUvk2oRWXBn2P4Ig6TUGIsIVVaUdxIS0DXE?=
 =?us-ascii?Q?syKXyAYpzTu9LWuWWOyJTAzUHCvKWsV1GTy3cAmq0yeDUCXhvW6utbS6t97U?=
 =?us-ascii?Q?4ymTR1J0+yG2y2u20dbWc7f1Rwt7GYEVlsahY3itWG1cPBw8SpZZc6QpkzIA?=
 =?us-ascii?Q?2AQ1xSumwhgBTSga3jMHcF4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 452ceb44-3f49-4691-d361-08dcb5d478de
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 04:58:54.6409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aS7tIn8lrawtEp0GdisW5BzeSLvSA1cVZjXJaWMmqAZB7gjxvCj3ptG9Mr0JkFo1qYeeKml5UJK8wRb5ITTznQHDrtsK+kYC8APF6esSUO9I/ZsEeQ24IXpEdMYIuKU1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10409

Now we can use new port related functions for port parsing. Use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |  3 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 66 -------------------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  9 +--
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |  3 +-
 include/video/omapfb_dss.h                    |  8 ---
 5 files changed, 9 insertions(+), 80 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
index 7c1b7d89389a..395b1139a5ae 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
@@ -20,6 +20,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/string.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 
@@ -845,7 +846,7 @@ int dpi_init_port(struct platform_device *pdev, struct device_node *port)
 	if (!dpi)
 		return -ENOMEM;
 
-	ep = omapdss_of_get_next_endpoint(port, NULL);
+	ep = of_graph_get_next_port_endpoint(port, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index 4040e247e026..efb7d2e4ce85 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -15,72 +15,6 @@
 
 #include "dss.h"
 
-struct device_node *
-omapdss_of_get_next_port(const struct device_node *parent,
-			 struct device_node *prev)
-{
-	struct device_node *port = NULL;
-
-	if (!parent)
-		return NULL;
-
-	if (!prev) {
-		struct device_node *ports;
-		/*
-		 * It's the first call, we have to find a port subnode
-		 * within this node or within an optional 'ports' node.
-		 */
-		ports = of_get_child_by_name(parent, "ports");
-		if (ports)
-			parent = ports;
-
-		port = of_get_child_by_name(parent, "port");
-
-		/* release the 'ports' node */
-		of_node_put(ports);
-	} else {
-		struct device_node *ports;
-
-		ports = of_get_parent(prev);
-		if (!ports)
-			return NULL;
-
-		do {
-			port = of_get_next_child(ports, prev);
-			if (!port) {
-				of_node_put(ports);
-				return NULL;
-			}
-			prev = port;
-		} while (!of_node_name_eq(port, "port"));
-
-		of_node_put(ports);
-	}
-
-	return port;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_next_port);
-
-struct device_node *
-omapdss_of_get_next_endpoint(const struct device_node *parent,
-			     struct device_node *prev)
-{
-	struct device_node *ep = NULL;
-
-	if (!parent)
-		return NULL;
-
-	do {
-		ep = of_get_next_child(parent, prev);
-		if (!ep)
-			return NULL;
-		prev = ep;
-	} while (!of_node_name_eq(ep, "endpoint"));
-
-	return ep;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_next_endpoint);
-
 struct device_node *dss_of_port_get_parent_device(struct device_node *port)
 {
 	struct device_node *np;
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
index d814e4baa4b3..5cab317011ee 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
@@ -26,6 +26,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/suspend.h>
 #include <linux/component.h>
@@ -922,7 +923,7 @@ static int dss_init_ports(struct platform_device *pdev)
 	if (parent == NULL)
 		return 0;
 
-	port = omapdss_of_get_next_port(parent, NULL);
+	port = of_graph_get_next_port(parent, NULL);
 	if (!port)
 		return 0;
 
@@ -953,7 +954,7 @@ static int dss_init_ports(struct platform_device *pdev)
 			break;
 		}
 	} while (!ret &&
-		 (port = omapdss_of_get_next_port(parent, port)) != NULL);
+		 (port = of_graph_get_next_port(parent, port)) != NULL);
 
 	if (ret)
 		dss_uninit_ports(pdev);
@@ -969,7 +970,7 @@ static void dss_uninit_ports(struct platform_device *pdev)
 	if (parent == NULL)
 		return;
 
-	port = omapdss_of_get_next_port(parent, NULL);
+	port = of_graph_get_next_port(parent, NULL);
 	if (!port)
 		return;
 
@@ -1000,7 +1001,7 @@ static void dss_uninit_ports(struct platform_device *pdev)
 		default:
 			break;
 		}
-	} while ((port = omapdss_of_get_next_port(parent, port)) != NULL);
+	} while ((port = of_graph_get_next_port(parent, port)) != NULL);
 }
 
 static int dss_video_pll_probe(struct platform_device *pdev)
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
index d527931b2b16..22a6243d7abf 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/component.h>
 
 #include <video/omapfb_dss.h>
@@ -405,7 +406,7 @@ int sdi_init_port(struct platform_device *pdev, struct device_node *port)
 	u32 datapairs;
 	int r;
 
-	ep = omapdss_of_get_next_endpoint(port, NULL);
+	ep = of_graph_get_next_port_endpoint(port, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/include/video/omapfb_dss.h b/include/video/omapfb_dss.h
index a8c0c3eeeb5b..d133190e3143 100644
--- a/include/video/omapfb_dss.h
+++ b/include/video/omapfb_dss.h
@@ -811,14 +811,6 @@ static inline bool omapdss_device_is_enabled(struct omap_dss_device *dssdev)
 	return dssdev->state == OMAP_DSS_DISPLAY_ACTIVE;
 }
 
-struct device_node *
-omapdss_of_get_next_port(const struct device_node *parent,
-			 struct device_node *prev);
-
-struct device_node *
-omapdss_of_get_next_endpoint(const struct device_node *parent,
-			     struct device_node *prev);
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node);
 #else
-- 
2.43.0


