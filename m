Return-Path: <linux-omap+bounces-936-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DD3889D4F
	for <lists+linux-omap@lfdr.de>; Mon, 25 Mar 2024 12:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5714E2A2769
	for <lists+linux-omap@lfdr.de>; Mon, 25 Mar 2024 11:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78CD17E3C8;
	Mon, 25 Mar 2024 07:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RWkaZOwX"
X-Original-To: linux-omap@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2059.outbound.protection.outlook.com [40.107.113.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9567A396E40;
	Mon, 25 Mar 2024 03:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711335911; cv=fail; b=XJjUfC73WpBujYSHfO2u3ApE3s++InrQ/O6qN9uciYIla9LblCJ7/hwQ8zmNpijEsyFp8Qdim2wkIkfvnNY/WcRAaQEOTqsw0uICEY0XhjpE0dro2hrWsSHjBzkwe1AaH9rI/tzLBZHR/zWDIR0H3mPYAZpg23BZD8bjqm3RkXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711335911; c=relaxed/simple;
	bh=+OzyFz8qEq+fvSCCLYMKxODLTLiOofNVDgQtB++Astc=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=PtQe9MywZLmwJ6AWzsKMetUL5q7Qjdv3r3Im1czt695JW4AVRLrejK0d6MUgR/YKfV1XAb0wQD6xRa9FGzG2r87IFdl1Qxv/diQckdjYKPUlxEcOlzPWJPFLBVwRflXt1F1/rz6YnT1mPrWnsXfSf9Hh0yNCXKb8c/X+ZJRpg/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RWkaZOwX; arc=fail smtp.client-ip=40.107.113.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKFnnUT3MaovWUDm94QMxlyfogSy7LSyOtOpW8UKZD8B9wOvSP3NThG4CuWriqW0SX7b7FUoNtU3SIfh1QPDio45StapiczyPGvt7mHcDhQL2ihM6YWuZScLcjSM9EnPc8PV2VCQNKxPKo5bjSBihUGPUTKDfA8SOIYbXbVlFHvk9464Js5lR7bbDCwEoJtFLv8LkMPaW5x1CzEExMT3G8NLdD+PApKQ7JInkBss84Ot6wyRGMJQ1Fv1yt+f7bv2XIyXrzjhpdgywoaTvqWFi4XBxZBYdmOGN/PvfzffN3CDtghpy5C77rKyOGM5xpWRgL/g5cAaqP9iCj02n7/biw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NU/WFUEU9+Vgl1x0Z0UzrTl7yEXRkmD9+IO2Fh9GS2Q=;
 b=P8WMuxE9IGsuHJBqThCqlnHvMPyOxnFyM2eKaH2Worza/VdCqXcb/AYm7VUlm9JNoQM66uRdNmlRjGC8K+gsCIJol/J+Syca6DBuYdZTQPNZMSTtyYlLZNqJcwfP2DTprMW8lNHiOf2FpHuSL55a/1th6Kd8YLlRbOcjuAnqLcqzOMPWT3n1CtnR2yaHQpbglRxW6lXlf7h0yL8FBtz8xdqWRagEttOI2RxNn28rLv6hnKAgsr3qjzasxrrhBLMghMPcjZNMJbkGDop0MyZUmLAYMcQ53T0QCXRrtKgIbIh+21THOD/9ukspNnaFarwGnmRTcMFrqi9Pxs+LhJV7wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NU/WFUEU9+Vgl1x0Z0UzrTl7yEXRkmD9+IO2Fh9GS2Q=;
 b=RWkaZOwXq/O9v+RI8NjJJrBq/zRc2lgyYQ+wOc18RkOG3KMmf4aqBt3shNCrZphjond3Z7kmVEZdlPjVyIRpHAVHzuD+yEBa3lP4NxfgfcSPcBxRStJCrNFDQGHuVG45+CMW9D98KwAw9WTe4y2fwvqLZdRQhJNmthABV+8E5iE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6966.jpnprd01.prod.outlook.com
 (2603:1096:604:12d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 03:05:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 03:05:06 +0000
Message-ID: <871q7z6mfy.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	coresight@lists.linaro.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-staging@lists.linux.dev
In-Reply-To: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
References: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/8] gpu: drm: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 03:05:05 +0000
X-ClientProxiedBy: TYWP286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: ae788b89-fb2d-48cd-59f8-08dc4c785f7b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ADwJtuhz9+sy8cScHpp2kav/3zwZLI5Fe4kCgmRYF9wEipIfeqay7JeT+WCmYa4I/Dssc+lFHzZibY5ieceqNJcryvD3e9z1gtpUoDF7elz3jYLhnzs3hCDRkVV3cTlEVwGZwgJj4j0ff6o5xzgTrvKPjDWh6YCLK+8zy1cXQXsSMkS0sJZkD0kZsYKAfqeyGoSmGf/g8F7wYVjJFpvfYQO7tumo4Rwsv3UX5darz+6k4IZVQmiYrW64iQThtvgkAByRFy8Ltl1TT9OFALZZqbZeKoT/opMCSEZ47UtkNgxhTm1UrXOzDkLourSaXq7MpS+56PXgxIR/FYKJ56SgddTx/NBFFyHQSayCuXYwxWgaKPEqq8NXXHgOxdBcwV919ns9i8uxrYb/Em/vVncA7fUJr5EdccXAbyQgcePliFYMloW7gCgu2rEQsC4g68WYkTRx3LXvUUugnB1uhxWA8A0tYD8jF09Z23PMS2e5XliA6bb/0Ff4wR0tdlLAtYTxJxqILrIpkOvBXzREF5GKBcf87ccDN3iRinZCfokMe5O26cp4c3Nqhk33dI8cBX6Sz3EpAeVIxzO5Y6qTHKsssGY4lQr/eWCwpxC17fKCfMjQcGmXb0dK9L419Bx5Qn/vqUgLJ7donOR1KZqPFQBDZQ0M4QeKORQxc8MXi084Yj2rJbWNgOMK8O1439A4wCdQMlDJ4ZG9QqVYCLrj974rDC2dMFHSjiE3S9eoLEYu5jM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(7416005)(366007)(376005)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?svF52yGCXdNPjhAu0SHbtsHuUQY/CNucEnMt2pFfgB9/DRcJP3ST2EbeuD47?=
 =?us-ascii?Q?57OCChIVEW7937DUrIXDuuJZQ8LncBENZgEvji8Ha0gb5Z6tqD07VJEuVqfd?=
 =?us-ascii?Q?4F6t+f7pXjF3BVaMTV9d/SrRGLLkbB09P+1pDbakvOkg+iXNZHsj11dnsWU0?=
 =?us-ascii?Q?bqQtbNzMaZZmrSCeSM3tAPvmh3er3tv7c1AShMDPVITuu7jEqPG4KoDxwKry?=
 =?us-ascii?Q?W8nFoQHilOQG+HMJBE4KNjgLcIlzjp6uCRQPpar4fEhM/QAJuXHW2+cgPByJ?=
 =?us-ascii?Q?3iRXGwQVpsALjdwPFd3u8vRHEv6+uswEJZac2CpfcAUQKxbRgo+WBGzPMo1p?=
 =?us-ascii?Q?R9sQYG/J7rsQkOr/wHiYiNzqX0OBlq7FcepmqqB9pCt7yW9YqpmMQTGrB/IT?=
 =?us-ascii?Q?ZStR1jwW+4cDgfDjRKtUkreh7MDnttBhm04PdtuTFQh+fWJg+JXrO5QScMfq?=
 =?us-ascii?Q?nJ3roJhuFyHG3yUXGiG1WiaS5IsviABDGL0jOmiMzt+Hgk4uAhgWWYLUUdHy?=
 =?us-ascii?Q?4zDQmNH7mccz1vhUcf2i4Sb/Jlr28HJDtzw1xjx2a+woFPuFlOgNyOXMH03C?=
 =?us-ascii?Q?WVNQobuEq0EMdzqPFNAYvSnT2hCft0bGIYtaXnI6j7n5TRPkZ2hlI/SBdCWb?=
 =?us-ascii?Q?wHIp5LdEtqllijdN66qTeB5uvulQCR+99QPQaI/5Bfj8zO07fk93Sdwtc9ow?=
 =?us-ascii?Q?dEYBQtpySNyD1t85IDKYiUx/HbKWE7X8hPWlpQsIY+vvXTnzCFqYtXDil1ht?=
 =?us-ascii?Q?4O26lSdJO5ls21cX60fSxIkxEuFxjmg6vnV+cmdNWYOX7GXuZ7zUA1nrEf8C?=
 =?us-ascii?Q?K0CbxmFIfaS+0wAqXzvDMJcxsXJqrC01g45mu9tMrEP55FJPvhGzMjXdJyqe?=
 =?us-ascii?Q?8P563F7tMkZf1FxlYguzmHEuUZ8tEOvagN6rxO/dOreUzpQXpptSRreRj1je?=
 =?us-ascii?Q?yvhE/uJZbllnIjCslwnJ/HDHsGL4WTEjEr6BQfyG3Vq2ZB4tl/QLNSeXaYNx?=
 =?us-ascii?Q?n0HzOMKnGmYHXG0qHhVY3D8yrjKElg5MEaMxuz/u0qogOWBZn0RANglJ7zwi?=
 =?us-ascii?Q?nDc4bkPBnjwc8/CV0Faetksurlxk1uuldgrdRBWnOdgF0+37nYF/n1HTQoMD?=
 =?us-ascii?Q?fuK9iGoL3jP4BVqaJNo7R/OQXftwI4fkSYOuMAZYYGp374f0eTtIXnoEwA5z?=
 =?us-ascii?Q?XjuSCZ7WiX3JQ8myh9JHBxvSlvVa5AmMAfDGSNiep5vGaZLkiNiA+3OQKYoM?=
 =?us-ascii?Q?ZAuRyij9Oas/f2FDc9plqitbAaeci8atGoU+ZNB3ABVARpCSp9tNbH5lmWti?=
 =?us-ascii?Q?n/sNkMNZaY5zJzJndxR519yciVnNtPlZYR0Q9ghPY5dBxxOQ0F7jZkCb4vIH?=
 =?us-ascii?Q?yOQGaH0Dg8gfW5xe9LotEDkF3LnhJMS8fDmWTjF9iNhwgZd0Cf4OBQSw5lbD?=
 =?us-ascii?Q?9U9Qf1baFLFTk8lXGIs0aoTb7ULxgA+wQkNoie9K4I4e3ZhFEbbZnHVyFcW5?=
 =?us-ascii?Q?C2CTW5Khaky6CZqh1X37hGZtolo5uMQ2+ilqe+9FYVSvbOmAGdJFBzJaOsqu?=
 =?us-ascii?Q?AJO1/HKv+MrdRtx0lWLWPNsWhdIzWGD5z+I6Mt/iJ/xqy4zKuPmjmu9E6Lgs?=
 =?us-ascii?Q?jEO+BQLzTg+WgTRnpMP2kO0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae788b89-fb2d-48cd-59f8-08dc4c785f7b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 03:05:06.2499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLe53rOHpJB/IXEW+TMjkIc1WOU44Y4b3LkSddY5TdrJiAUwHNhWuW+UJw33MmsfMi0rk+p95zq8XGgMzO6wWE0TuviohDyWwQc6VoO9zcjNQ00oXiMPSJOxTQc14PeX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6966

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index 050ca7eafac5..5f8002f6bb7a 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -242,8 +242,7 @@ static void omapdss_walk_device(struct device *dev, struct device_node *node,
 
 	of_node_put(n);
 
-	n = NULL;
-	while ((n = of_graph_get_next_endpoint(node, n)) != NULL) {
+	for_each_endpoint_of_node(node, n) {
 		struct device_node *pn = of_graph_get_remote_port_parent(n);
 
 		if (!pn)
-- 
2.25.1


