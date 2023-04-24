Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 304166EC39B
	for <lists+linux-omap@lfdr.de>; Mon, 24 Apr 2023 04:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjDXCgL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 23 Apr 2023 22:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjDXCgK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 23 Apr 2023 22:36:10 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2110.outbound.protection.outlook.com [40.107.113.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDF72100
        for <linux-omap@vger.kernel.org>; Sun, 23 Apr 2023 19:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgwI1r2TZpZ1e8Hf/XH37PDKHCdUPwJQpEdYWJnTkKiBHAsmRLXXaA7cAv4Qx9B+8/7o9wATOaZNPoZ0ekCxb9nr6PYzyB1YmqpLm90962urLNZMJEI5oseaoJ0TKqp1pnDcerUzWPB4DBCJq7YlB4tCc6PF3H9w8c0fcpI2QaQnd2tziB5CVMk/pyn4FqrozGQB7m/C0odFMUOpDnx5ZiM0RIIY9gPOLjR+MFHi4XXZQMvB14Gvkr1qOnAnOa4B2nxyiISRSZGffInnX8t0D0ekoxVV6BA132R6naibNpz1KOusXTR0qq4B4TYuT+t3iieQIQwOAIFsvOdP/Dosew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4j6tL+6IPA1jE55WJqPVoiUo39FMLd9is3K4Ivq8dI=;
 b=hHD+ShO54GxqhMOLVE1C4zRvrzxG4Ru1sC7uxirfl60obEes163pyTps1l8zxn61e7iU1i4gAXRqWECz1VVbV8GYlQfCjiWRj6QXNyfXtmaVQevTFLqCdIezkgy3z4tVeBTHFCKD5GrvoamsHazl0ZNlPdKETOzgRo5pcgc1aIT45bYCJS86HOiiweVJIlEezehogkQL94psyUZCtip/NLzYY+eju/7c453XHlVRj+MSsL86OY5n6XxaON/PFnWPYVNodKbULGwEZf22jL6MYyaqudHyIPCm5VQKFQ76ng0f92yI8KMiF5X5Cqa9EZf14nQEVOGv9z7/EfvRAVOX3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4j6tL+6IPA1jE55WJqPVoiUo39FMLd9is3K4Ivq8dI=;
 b=TwVuegrJKYk+AKnRWeyCPLXTzzA/FyefI//oaH+2OLnxl/2SEqYSPNVHgk0E12W7X7zrqYKHA1vFbUJCTZIQ8udrmioRHOPQQwMtwLrGiiHM/4F7p3OIuPM7WlPV2rD7gO4VSB1GUtKZrUq8shx8OBqE9WuSik1cGaBZzWeihZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5681.jpnprd01.prod.outlook.com (2603:1096:604:b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 02:36:05 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 02:36:05 +0000
Message-ID: <878rei0zxn.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Takashi Iwai <tiwai@suse.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc:     Linux-ALSA <alsa-devel@alsa-project.org>,
        linux-omap@vger.kernel.org
In-Reply-To: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 02/13] ASoC: ti: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 24 Apr 2023 02:36:04 +0000
X-ClientProxiedBy: TYCP286CA0196.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5681:EE_
X-MS-Office365-Filtering-Correlation-Id: 220de766-e1ec-4696-a52f-08db446ca6f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jjPF+rJ3w7pZVEn2pCoqTCOxwRr80gFJBuI4IOdzfbFgkTsLprmY1mRa/y8+P4fG+UsYHVu60h3vAYtN625MYidZfEgPGyZgpDVbZ8oXwmyJz/7LSFAB2L1zlrjSyDdTo4dg2k3NPX7b+u4GFKdynj+A8ary/wY+oZuumTWIOSaqEaKvMDSwKD2EXBBuM57Lr+HLrbXQlBWcepDG3tEn7VJp7LPhJnIuNx+vsec7iSGobiw8uya8ekxFoDdy23dJk27lrq6bumpkPrtIhZkBJZU25z2qqIUyC7ETWPbc3BujJHHqhYIm8cqYj1R73+phUpRA5J84EefasIN90ggSZKEXAjVNEtq4ghDSfEItdpdd9hGD8LQ3nw6lLbkvDoXhS/ZtqmeMZtIbTQTeCOV5vcFSklq4G1PuRJ7CN1nZcLZ3+adDbYxbqvWp+/l0egYTJVtEoJPNNS6TABYlplUqO+Qn/IV9FJjMJ6LCyl5W1ESpS0Q38CeSxxdl7Z0XQqaY7wRtqzSBKFRseQrTNjI1pXfgeGlEp0tzWVQDtyaobe3Ft11sf0SDQ6wQPzaqCYQ322GtHMaXXqxLlth55HYbwb45uagyHEvbx8NxpUldWpvlqi42CZZ8im2W0bMOWBFp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(52116002)(6486002)(2616005)(6512007)(6506007)(26005)(186003)(66946007)(66556008)(66476007)(8676002)(8936002)(316002)(41300700001)(4326008)(478600001)(5660300002)(110136005)(38350700002)(38100700002)(36756003)(86362001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1NFZUVZEcFa2M3B00FHaA3NwSa62nDwdw+sQne0oXlQv0J9BWgdI1OOZUzfG?=
 =?us-ascii?Q?vU/ONpvoACuGiw0/iRh0RRueIX5ongBVrvtiyQHrEAvzRjOmQLBF37670ZvQ?=
 =?us-ascii?Q?Je9061zocx3y4PPnL4EIttUVCKkjqNv2VjA0LRQPKJEM4UhyK8a15hFgJZQ3?=
 =?us-ascii?Q?iXgUBYYUXyVsbmQb+LsJ2BqnJcxAv8UgRo0Ce6SDZ25UmkPUF5Pq6N1rqNWq?=
 =?us-ascii?Q?If4r76gB3u8RIyDCahX6fOcsdfJdz4mY2E1LGYSqYpoVFWBsxiY8EOQyA49z?=
 =?us-ascii?Q?1e7JDyaIXBKACdx+DDIb6elWSy5How2xwbEazAijeo3FIIMpUD2h60Rh4i3R?=
 =?us-ascii?Q?6c888FHKBJTzF7/+I3pnlCeZNrjVS6fLMYo/dfcW2mBbEgiQp8oy1TLWVeoK?=
 =?us-ascii?Q?7KUc1SoqThOrDsudqMZxVCB8A1I5YyOqPt2rED+IokfiVhhOn9it1anXLfxT?=
 =?us-ascii?Q?ptHddmd3ecYTu8c7rsJG9yToCnbLz/kpbegfsYmzeJAdoLcX8+yJdiPVW4S4?=
 =?us-ascii?Q?xPktqrx1d4zvn3jYHPt0J0RZuSYUirQIhq8/OMvAInmBheGH7ERVyiDq0Uux?=
 =?us-ascii?Q?Bm9Xuym0QLjTN5SI2kOxlOOL+2/IaXVlE1meNqJHkp8Yj+oXVPuz7pfgWfDs?=
 =?us-ascii?Q?1YrOFW2HMbDVDqVJWu48cZVOUgd4T4ZOZx2/gOHQtyjzMtGe4TApqckdjrNN?=
 =?us-ascii?Q?lDARwmvDrNJq65uMTX2Y/3nnJReuFOBbLcE618veU7uaIAbjNrM6cLh8coCB?=
 =?us-ascii?Q?W8Cv8BNjycdyVTEHoIzl3hrnt/gp0XFNHBWw7nBty5tXAixyNSwy0mxpK76J?=
 =?us-ascii?Q?Z2gl2aqVwaKSET4LEU8pmUp03FEh4oifn2iLPVfUcNADokZryS4pqNCXGinl?=
 =?us-ascii?Q?IfyrP/Z/j9bXI/hs7/kbbzKSEP2e6qA4G+ErPiwM23lzQLfiVTKhG4a4uqUO?=
 =?us-ascii?Q?odDFqif6teKodB3XxpHR310A/+WlhlSBP191DNaoFOVSi8Xb3pI6FGL045XF?=
 =?us-ascii?Q?TC09uT8BhDAviniQVkS0e1lOCiLfsgQKWk3dZvARXjdabtm0y2tNoGfYLVP6?=
 =?us-ascii?Q?ZSZDpdH3ihyJd5OqLSe/Q9/LITyzRBdWrOv1HyJe0TKu2kazjTFagdbG87aQ?=
 =?us-ascii?Q?HrMfcgVIfxf6yOvnqVYDmtCGZZOTmZ7ymN2vHHNPPc65vCu9xKMalqSnDdw2?=
 =?us-ascii?Q?TcK3ieRWxV7fOVZiO92/d3WMti3oSkpjZ4sx68HGvT66LIdw5bMywNmdYdJr?=
 =?us-ascii?Q?L9kEZ3t/ZfcD/opyUwr6FcaewQMCOXZ8fv9pzGbg5QNRu3UA2nVV7USWqdcV?=
 =?us-ascii?Q?7AkPGytj0m3ZjTF6YfB0SoUgxQ2LeUkvLXwRBQFMa89mjzr5oleqXHLW8NH/?=
 =?us-ascii?Q?hIJNhvDMvmo3dTUAUhqaTbkDgAJZWr9qgodez7Wo0SGVBqD6XqUZdDDvkmrt?=
 =?us-ascii?Q?CPYqcyItQz/KpbaQ8/QoO4Rv0qcmFBdP8qAs4Q7J09vJQb9jAo1WTs/aKorV?=
 =?us-ascii?Q?uCvNdHo2z2w2qYu1eyed/SM0SxtigqVfuHzka/TOj2ZjG/xnoKxBbE1dOuQX?=
 =?us-ascii?Q?Y6yO+bC7cTeNebbB7o/Z6cfA5nI9AsN3fPkFRYq0dqPDpxYmZ77HHWBnKlWN?=
 =?us-ascii?Q?EyLYr/r1xHN2u6D7GjDift8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 220de766-e1ec-4696-a52f-08db446ca6f0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 02:36:05.2294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zbzN7KpWeg553BNBcOAdhVbK2JPBtQgMt4bpTZenIm6QwhGchpNceiFHwLger68e9uitelMyxIaiDpBn5Z3ZGtCHWNrLGHeFizJi6jOrmjU8uSqBwPbAgkbhg2/xBJ6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5681
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/omap-hdmi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 96c3569d7643..a3663ab065ac 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -365,19 +365,17 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 	if (!card->dai_link)
 		return -ENOMEM;
 
-	compnent = devm_kzalloc(dev, 2 * sizeof(*compnent), GFP_KERNEL);
+	compnent = devm_kzalloc(dev, sizeof(*compnent), GFP_KERNEL);
 	if (!compnent)
 		return -ENOMEM;
-	card->dai_link->cpus		= &compnent[0];
+	card->dai_link->cpus		= compnent;
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

