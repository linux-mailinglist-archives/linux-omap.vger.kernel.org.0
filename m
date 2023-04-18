Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B61DE6E55BE
	for <lists+linux-omap@lfdr.de>; Tue, 18 Apr 2023 02:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjDRAXo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Apr 2023 20:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjDRAXn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Apr 2023 20:23:43 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FA2BE47
        for <linux-omap@vger.kernel.org>; Mon, 17 Apr 2023 17:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLNl8agIxPxqkm3O4ZAlVm1pFoMspQvHFHHEA0ZGd4dNRDq+dEOCDpxqYr+ZWs6H07ndMsaiRNhBNg7lTU1S6k5G9gRHC3ImmMmLSxpS4+kRMnVnPHPLbNrAb7svjsQHKlRbETU9l+MAqNfQ4Yz3jxQFPKTe6G6RrsFGZbYbInLR3pXjC7cZ7ptJyE2vXHpL5t3P7YRhEPRkPC+9UKKITb7ViHCANnn6Imi+ZvEsEgpRQBYxu0s+x87bmOiNid+yNF/b/gvks+F+eAzHVP4YIMkt/8Cj847Qcv+tyKFPjQMKOmAG5skmM5WOZ1Sd1e/9hajyQpuowcFAvFdEI1jjUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3/fvya0HQsFubTh9VjgKAsBwKWdTWp4DyQllrwcoPE=;
 b=g3eiMmBcrTm4++JnGyTdoj4c381s5rTnZlHGH/RCXhjAsXbJHLk52y4zPpeNL6MAWMVcBVjnRb/w5+b8Rmhk0qb6l+gpRz7kfrIMfrzaCHcR3C+zPmPSIajnP7+vohlH6V+5Pvt6bCK8H2YidrrosyDKnC/EQtwzJsPObpSQgeQqB+ot5otRuYlLDmBy/oSFuI4k9O49vCqDMCCMmt0pRGWmaYLoxZ8UwXQzgbGWW9tAtFTGNrT6RhoR3yrkuRUjD/NKctJtV2eQuiEV0FQAVZC+IugLgjXQdzhPHrtE/r/TOmTOTJZLCBvFDKe2JHPVZoJK6FKbfRTVpkqs1Rt+vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3/fvya0HQsFubTh9VjgKAsBwKWdTWp4DyQllrwcoPE=;
 b=PapUfNb2oD+nGiOgieApzRQYepc+LNpYPSaiUnQbj38rIKR9tTRodoBqsaSh6Yw1fvTY5qCZ60XQ5K1CXNlyDt6vgCyJMpFCohfH4d2pRdVfKWabUpq2eEwlC8t61CLC7AZ+s+9pOOyMCVllCrveVr5cYacBV84cgomd6EbU+80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8855.jpnprd01.prod.outlook.com (2603:1096:400:17c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 00:23:40 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 00:23:40 +0000
Message-ID: <87zg762g38.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Mark Brown <broonie@kernel.org>
In-Reply-To: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
References: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
Cc:     Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        alsa-devel@alsa-project.org, linux-omap@vger.kernel.org
Subject: [PATCH 03/11] ASoC: ti: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 18 Apr 2023 00:23:39 +0000
X-ClientProxiedBy: TY2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:404:42::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 241743f4-1bf1-4ea9-4ed2-08db3fa328bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 35usLZqOykEuON7NP3z6tLkxX+0vMaHR54HqPczx/gLRq/F8+wBtmgzoQvndYTy8bbJD6/89goK2W1A/iV4fDlUpRSB4t2wHweE6lEiJCY146f/7kY7Ih1iOwDerUYsTgSZZA5bJcIRMKwh7JZnRn7UhTqhK2N3376Uf17j4/bnFK2HiRcbDIZWcbUsHzaNKp8Okx5BrG1WsxKhdVSptUW1KZCy9gKqU70ozjKi99D55U/jAV78k2qaqDrcwTrNvJOI/wKPDHWY/K+lnMDRpZHXq2Oe1FZWUVOTdKSd73oYFM0IjGt0M/mFcxRmIGCNU3BHDHOwn4FZvjdIDehWOZiM7+oaLW/OMz7yrizxC0BW/NS9c6Xnso/Y7QOd7woiNyJQvf9zfRx/BDW3P+XY6Hu7Scr1TlId9uw2xZIxJ0t+zbVXCoWGFvbOkNgLkoBmVMwx2W+e6UJrVG5bJCOdprdpMnEIpqYjlPrix0v0h1dHS5tcdXM7owb41ckfsr37BrB8ROiPdBSHNQuiJ9IbLOBn31h9XPrPylB9oFGnJNZ+tjGTwlo4MgnbBmSdUpBpz+QQyYb67QTkbmbvlf/BPHFxWozuJevJJDcOJxFI6xXntvkjFfdvbcs10H8a182hi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(6486002)(478600001)(86362001)(2616005)(36756003)(26005)(83380400001)(6512007)(6506007)(186003)(38100700002)(38350700002)(52116002)(66556008)(66946007)(66476007)(316002)(2906002)(4326008)(6916009)(8936002)(5660300002)(8676002)(41300700001)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t+wzdvfd7AD+jJ8g3SeRzFhljZ75uaMTWlVqfticc3VAYEo7xp339uJ7eXNs?=
 =?us-ascii?Q?Th34Ip6vuIuZwVZIDYgx44WvAnJhHvYUkpGrzMJZSCoyRT7PXYt0w/Pb9y+X?=
 =?us-ascii?Q?9dAoJJgB2LSvmB5HaUHQeqpJq0reRxCWbzRFQMJeOMn9c5AwF4XGrTexKD/8?=
 =?us-ascii?Q?13UnmAb60MPM3D/45dvdAJ4Rt2JcY2Wvxr1dlU/Ig01UlSNxiGaYAKpHuYXA?=
 =?us-ascii?Q?9sCRkpZIcfIzXAYKqbaLZMwGVrE3lNyXKaYCAOcR+Cs2lDTFjZ8mNuoVjCAB?=
 =?us-ascii?Q?vZzvyHlbvx6i5ZlOFr+Jm++XhNHcC/wZkObVPwv4+GD/pnNkthVG5gREpJMo?=
 =?us-ascii?Q?pv9+YacmF6gz0IsXVIItsUrSpKc6sD1vZKgdpS3TrWu3cprRFIKgMPkGc8Gz?=
 =?us-ascii?Q?wuNDugPD8bv3xi9AF2yZyxbRURt8JdmmttEqR/VuOIh4h6MV7zhbszIwQ0Oo?=
 =?us-ascii?Q?1r/rPQvikWvLfS0FHibjnh8wXVBZkMzDKm3bGN2ru3vfLaA392TaNOCJWjfS?=
 =?us-ascii?Q?h1xJW43OfnuDc+T4UNWBxq03ZvU3Y4uJxURg09Cm7PoNsOOOQg7uN1dSSzsC?=
 =?us-ascii?Q?qCedZVXlJTaEnT8T0OYxNF1hXAavKTkGFb3dRpUgV7fUMpT5w8samrxMqfZA?=
 =?us-ascii?Q?9xei1t9Rj0547+Yl1ZdpDFJ79vpXywCrK/9P77IP4ONEiipK9xUO5RkA9I6l?=
 =?us-ascii?Q?CGzMJ4GP5e1BkS53r/6qn90/J4kdEXpMu8bahtf+o8qUBibvqpmRU73plNEA?=
 =?us-ascii?Q?87pGNEw5yeC0GoyVJ1xJbEubO3mhmQURFWVAVMmJTLZqYjfjReYtRfteYYpb?=
 =?us-ascii?Q?XPfpRB0uqk/Qn8o9H56efOz8Tw4XFw9TgjldoOrejkHRR/RbklacTZOkpwqH?=
 =?us-ascii?Q?Guc/3ww7yhw1ZX/FmSaJDhJDwkJ/q4DK0M8c1ecKCdIzL3QZQQZs3JkDwqTH?=
 =?us-ascii?Q?lS578t2CyRtTyLKJ2oG5gj/skaByL5m7B6L5YjEdYkzPZoLxYmLOIwgbZ3Zi?=
 =?us-ascii?Q?AT1oxdrXbAwrYI9znJz1xHR1m4+Lbzfq3lXlFx3JwpNXBlI8Gu5s3gsVUbKZ?=
 =?us-ascii?Q?dEYLQeWpRwzbX7cHUZBPyJCg/jFSgu6JJEvcmnM03rFM7/eZcyxdRnk5mYfw?=
 =?us-ascii?Q?3EdC2VsCJGA0vupyt8vBxNH8UuBiItLPxMV8bfKRIT4vyrzKHl4/v6sSaUnk?=
 =?us-ascii?Q?MFU5IelA4GWEFyzXpIW6OJcqkAxhGmY4pwKQ+c2P8J5wi4Iw2b0y1C53x124?=
 =?us-ascii?Q?DDkSnXkHex7Qzqa1Eo4LL4Rizy9RUTKF5BEWbFV5ae+AL/dPWso0Pbcrg2ku?=
 =?us-ascii?Q?HgXU5R2NLTbh+LO9aoI4OqFYtaVbOpYxVMRRDqLE+uwIMt9k0uQ/nAqX6JPV?=
 =?us-ascii?Q?jYQI9L2XwirH/X3NVLFfjsVudsCVYoydONVBAJvDVfPE1/QfX6Ry4094gPSP?=
 =?us-ascii?Q?r1kBRrmSIdHNGCeQXPFF+uqES24kG03kYK+OGIUtteges+bfGDUbYo29mZA9?=
 =?us-ascii?Q?q+NeJosIZBJ1HNcsr8GhyTuHWh0+RdTQCQiG41CV/+xweKDu4WhGcu/QPJvX?=
 =?us-ascii?Q?ygyoPUN3dvRc5+NQuS1tPzh2BUOitZRWRBYLGAusyCqCbGBbpVnvvGUvsR74?=
 =?us-ascii?Q?psdXe3K8GPTkPhCqfEu1JOA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 241743f4-1bf1-4ea9-4ed2-08db3fa328bd
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 00:23:39.9666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nItuYxvdUo1I9pmuGvMybo6BBGRB6uCm/7U008fdV20uwadUWhRo5qHp/WdUHGAgm8xE2bTkGD2VAyYIns+MgAk6Gm7sBsNoDGPS0TjGO8v2fnD4V0s8FB0LhJThLO3A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8855
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/omap-hdmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 96c3569d7643..fee7b82d7e52 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -365,19 +365,17 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 	if (!card->dai_link)
 		return -ENOMEM;
 
-	compnent = devm_kzalloc(dev, 2 * sizeof(*compnent), GFP_KERNEL);
+	compnent = devm_kzalloc(dev, sizeof(*compnent), GFP_KERNEL);
 	if (!compnent)
 		return -ENOMEM;
 	card->dai_link->cpus		= &compnent[0];
 	card->dai_link->num_cpus	= 1;
-	card->dai_link->codecs		= &compnent[1];
+	card->dai_link->codecs		= &asoc_dummy_dlc;
 	card->dai_link->num_codecs	= 1;
 
 	card->dai_link->name = card->name;
 	card->dai_link->stream_name = card->name;
 	card->dai_link->cpus->dai_name = dev_name(ad->dssdev);
-	card->dai_link->codecs->name = "snd-soc-dummy";
-	card->dai_link->codecs->dai_name = "snd-soc-dummy-dai";
 	card->num_links = 1;
 	card->dev = dev;
 
-- 
2.25.1

