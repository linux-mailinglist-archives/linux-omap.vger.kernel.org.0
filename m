Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B867842D582
	for <lists+linux-omap@lfdr.de>; Thu, 14 Oct 2021 10:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbhJNI7l (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Oct 2021 04:59:41 -0400
Received: from mail-eopbgr1320124.outbound.protection.outlook.com ([40.107.132.124]:6724
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229985AbhJNI7k (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 Oct 2021 04:59:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KS+UaAyoWFCEW4xvZ9I+cHlQ7dkngQe8FRMysH4KdNUTlskj7cqG0JZtB1NR+MiMAVPTd/CHUoWNuOKlfFTRYhdVtsuIWi40t3jWYQQn81Bs4XqM4s3tq8WYay/noVD+mGu0RUDADARUgIbSP7JhqNSIWhPuyAbVmaLdgA2WBK9zpIokHShYohc/xXDtzLe2bCDhA6eeFG9aSbHFssZ7Hz2Vbd8pebbMbEtaHAtUKQ3AqzZE8eAWsbpGzcQC7Yhv+pTeaKMPUJQWDJtvFi2eaCLdroSabIp5ufVj5QDW8QerT9dTptDeSUJmBKKh+gmW1L14T6rFhKlwrG6CaQ/7NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3uWbzBrSVwTIIMUrUqqC/VZDyoL07a0JDe5fICurmw=;
 b=CNJpTk+ZzBvfEih2Hv0u/BXVZZhYHFH/Xk82wQnAMi4i0WwFRkmGYP/XMR1rTLe8etNhgo6JtOf/Iv8EApxCMwC9Gu+dH3iW8BjXpP7VuHyhtomyMmsrDOs/eP21ABHj1u5rdzT9LAGBeeFUV9/2qu3wOFh04Z7WznY5SSca9Y31+lrPF1+Oa58G+zB4mjk4ygFgtxYDzqUr49SWeAfQtq7aipxu0FTmbEL0EvYf/rq6sC/7fjnk39ezXqrAQ5DbksJ49zSLF7E2rifpOemvgezeIzug+vfwbTEO9y7+J6LPo6VwCOzQM3TnDOwzhcyfGSx50IKkjcOv4wPy6n3VZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3uWbzBrSVwTIIMUrUqqC/VZDyoL07a0JDe5fICurmw=;
 b=n93oyTQx9rGyE3ySMd9izhHsaDORp7Iz58Q/URLOQtmSzOnUX77+uSvd0eDe7Yy+AU0FohyxNNpwkGyicfMz8+aLYzqczUEaQRRPZt5Ak+MpyZIniGfe09ukG6tnNmrqlq2Mh88kQ7pd4CeRdSThlJfFTG7wbZnS6wrLz8w+SzU=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15; Thu, 14 Oct 2021 08:57:33 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0%6]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 08:57:33 +0000
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Paul Walmsley <paul@pwsan.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] ARM: OMAP2+: hwmod: Add of_node_put() before break
Date:   Thu, 14 Oct 2021 04:57:19 -0400
Message-Id: <20211014085719.23739-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0052.apcprd04.prod.outlook.com
 (2603:1096:202:14::20) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
Received: from localhost.localdomain (203.90.234.87) by HK2PR04CA0052.apcprd04.prod.outlook.com (2603:1096:202:14::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 08:57:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d58b6d4e-dad4-41be-bd45-08d98ef0a88c
X-MS-TrafficTypeDiagnostic: SG2PR06MB3367:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SG2PR06MB3367B8AA701ED6A63C0DBC1CABB89@SG2PR06MB3367.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wO3LAnyIs8RBImZjQOFSIkqgO9DCZIguwhEdIwtPNgOUfOFPRsyPhBWs06WrRcgJlYxvSCP/wVUCUrMk4PYTzLFsoqrnmPt797QHFNPcovyhea35iXXmaQB3B+uPfbuOu18/xWmIRBykhHr3k3gBMnDajSJXbOS7Ox7rlm8SGGjGnI7hiqyUNZrujzDyVOKC4Dm7WEwXPffLhTJ+vh80cUJztIyJmRjAtzIfUGA5SFcQuVTHmgDBjvzttYdgOeClnbTGeHBzEjMsgrYHr4Y+UfZi7zjG2y+oDY+KYa79FKjkaICGfCRwmczZWHnm+CRNf9guaA0YKj//atyprwE849qSJqkWaFquA2/8BuWnCIc6H+L01PqkdNBtESv9EQYgR5Q1+BHj3LhC+/cBa3BhfUR7onQFZr/xe5AWc1kwpmkcftFdJOAi95/1rRTRp5WWmx/dtskSOi0Qin6OMM5zkBb5AQ174sH+XYtrVFbXKtz2A1niOaONHdKnmxSYSX/yMI8wXYsr6DfWzfioVuZavDE4rlxnsnmDUE1jjTK0KOg2oIFxl3KMsH73vCxjtNQKtHHbnu3I9IpTj77eeX5xjvfhjM1U1BXTK41dSfk0RLoYa7G9VNZH5mxAM4MfqS5k7TVKHhB2h8R+/qL7muZ1JY2NUk6NqHMlPXI7H2RRAdhxvq0sI0zNd7g8Ega8wdGa5pnTZRiXKyN5fIMM1GSutQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3367.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(36756003)(4326008)(2906002)(316002)(38100700002)(38350700002)(110136005)(1076003)(6506007)(107886003)(66556008)(52116002)(83380400001)(956004)(6486002)(66476007)(2616005)(8936002)(66946007)(86362001)(5660300002)(6666004)(186003)(4744005)(6512007)(508600001)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IpYXyxPmI5TWEX7Uo5QlihOyDpJtIZ25dPuPb1FQ1k7/LrqSQcwGdFgBtD1B?=
 =?us-ascii?Q?PbQ3w3Y6jPZh38exE3ttw7VR7QJ/Yc5UFk7CQxMPUE69QFho9Jza08VRpnem?=
 =?us-ascii?Q?5OTskEuO6K5N7b2ZrBwLVx1nv//YpAyzqu2WVaV6U2m17CnGUza2x0ilmd6Q?=
 =?us-ascii?Q?kCYTMaBUm6tP8qAMJLKiKWP9v5b2+NwzSE/RDC4ykco5EeWJYDt2vqpsI6tm?=
 =?us-ascii?Q?O11btJWrD6GLU1d1edxGY5icMW/sGhGiohrfWA6rWKnhkM9z1jYJdyOApq95?=
 =?us-ascii?Q?Uhshc30Yv4jONbFsliq0WlkXh0PE120nLrhZAkhOxlSKMBDhtCOu0gqswDEX?=
 =?us-ascii?Q?AyPJ2xhshyeEo0wZor1WhnIxow5xpRwgz//2+OD164EafqJy9V23vnpWCcxD?=
 =?us-ascii?Q?zwCMv+oz06+bOFCchQcMljXtRo3xIN1bo+Sv9/0wg+yGG/xU7n1nt2MhS/Rb?=
 =?us-ascii?Q?QRm47bYK3SoOqXyu4jaSSNAjgPE8m5bepv0yissAUUFHgnpzu0QUkmzFcnwC?=
 =?us-ascii?Q?Ao1uR2ZyJHYEgrp+dlY1Xwi74apthXKtWdlmyapl5Vod+I1DIDFrEl6R4qcy?=
 =?us-ascii?Q?VBjpIaa7qe8kWV7OlIGDuGs6doUW46zzJRch5TJ5gnM16rMoILktPtf0iBOb?=
 =?us-ascii?Q?hRpH1ORLmn8arKNdbqX+7BaDPpbWUixeb2eOf/5a5fdaQPOGnq/1ecTgpn0n?=
 =?us-ascii?Q?3nKKrSN7J5bvbztoAq/MrBNatzdQmfeq2fUJkPRFJ78BahEWIoOIGQvN1nNo?=
 =?us-ascii?Q?9UyddHTDvo1j6DUL2uW1+Ag3sJPaAl7QXnrbiRGJX/Vi+2KIs6E7fKrOtswI?=
 =?us-ascii?Q?dR5fsCl0SlRKBuIjmG9yKOazDvrLy5+AwPArBHaRi1BAlWiMngwsri3fAhY2?=
 =?us-ascii?Q?WI/V914CDtPCT0r9xiq+YpFZv1QCuJkXkx1a8eEkA/qZgGxSPaJ7fF9cWrJE?=
 =?us-ascii?Q?AZr5ohPePVO7mIHnzDANYwfXI4U5SaVrltettb1kR677qtKVJoWzBA4hNTvl?=
 =?us-ascii?Q?UgfIFUGoYXI3i1tA+gBY0w/EC/kVpn5TzLhgRgWHHWgYjTtca6DxhSS0Pzfo?=
 =?us-ascii?Q?3zkbIXVXeMWa/3DNS+gqTM8fo3HK0saBsBdcll26tPGmF6acruR4R39OGNyt?=
 =?us-ascii?Q?z5ws8LusNFVl08dgYrEeYPvLNyypoU92aZ7MgADdJAOKb0fco/9irNyZwZOD?=
 =?us-ascii?Q?XIPxFKaVMS6RZHtIloWC31rs3gPQmYj7shcEkimK788m1xPA7OtvgqNd//rU?=
 =?us-ascii?Q?vGKUl/6689Yh7CnQAeHxgWSN87atuEMUOWjU4/2AAzotLJ9NHkeVWZcC2lYZ?=
 =?us-ascii?Q?OdBhVhlKtpvgev7UqRbEPAul?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d58b6d4e-dad4-41be-bd45-08d98ef0a88c
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 08:57:32.4334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntVhXcLb9PotQEEZ4LIW/Rqdpy9DZX7GctfJjPAMqc0+MspCRct01wlNhOAEeTEggCFWbMcr/AoVpBAk8hmmew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB3367
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix following coccicheck warning:
./arch/arm/mach-omap2/omap_hwmod.c:753:1-23: WARNING: Function
for_each_matching_node should have of_node_put() before break

Early exits from for_each_matching_node should decrement the
node reference counter.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 arch/arm/mach-omap2/omap_hwmod.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index ccb0e3732c0d..31d1a21f6041 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -752,8 +752,10 @@ static int __init _init_clkctrl_providers(void)
 
 	for_each_matching_node(np, ti_clkctrl_match_table) {
 		ret = _setup_clkctrl_provider(np);
-		if (ret)
+		if (ret) {
+			of_node_put(np);
 			break;
+		}
 	}
 
 	return ret;
-- 
2.20.1

