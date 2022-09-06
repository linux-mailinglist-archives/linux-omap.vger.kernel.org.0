Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A61E5AE6A2
	for <lists+linux-omap@lfdr.de>; Tue,  6 Sep 2022 13:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbiIFLcg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Sep 2022 07:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231531AbiIFLcc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Sep 2022 07:32:32 -0400
Received: from CHE01-GV0-obe.outbound.protection.outlook.com (mail-gv0che01on2099.outbound.protection.outlook.com [40.107.23.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E054BA60
        for <linux-omap@vger.kernel.org>; Tue,  6 Sep 2022 04:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtD25OYVueIJuKSRq314vn1c7KkWsyTLxkH/+szAl45SuOVOUzmpy6cRiFN/YT3YFkRkAba3E1CDhO3WAaiLh3MOqiZsbW++oOBeHwtdbtveOIqnK5Z7PIDsCJ32uzTElYIPCGTOR0Qs4ZRMItsJ6ceBfDn2j45fl238Z4APUo8HWtvAXnBLQrbhLk38aatDMl5Yyjf+Tql8+b8Txc4E1lGzX3kCUUR624+XtZNAlwy/R4E3SLyiYru4g1fgBCAPzdUnifMdqLZRPKiH21GmAYeIpNjELNeWFfEXSGU/h4XjOr6nqwIqRYBHH/uuKYtN5VuTif+OWqRzYLVB0rvhPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bprav3U7bKigDqYxYL+KD4VEhPwcPTCj/ye3OXDtWtk=;
 b=nJk0x+93ekySYXL3CekAAzWrZlkwb2vct9jEftEq4mpg+AFGjPEEXA/ct9WoqK0FHNL5iGYvwvnh/s895Xf5IpIijMEpwcKOLR96quzQvsGITBZ20F44jkqKp4337m8uAkeXTURFGi5vUHQcPwnKi5Sy21JBkNWICRifUtAm8k3xFhTa53yi2lIjzPtw5c2pgN3+pYVIminuYPk7tDgPl9BTnePiFh5nc71abo6OyDQz5R+jpSTBVRe1HH1dZinLoAUOBRWKVgbc9E+gv2mdHoLppHY98Cry9K6npXBaUim/fGoD1Oyf1ImAGtryhAASKvOgkSiQcqwuw+Hqlz2SGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netmodule.com; dmarc=pass action=none
 header.from=netmodule.com; dkim=pass header.d=netmodule.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netmodule.onmicrosoft.com; s=selector2-netmodule-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bprav3U7bKigDqYxYL+KD4VEhPwcPTCj/ye3OXDtWtk=;
 b=YpxLMeO67JoRJun6YrgJE8KEUpb22nQqBiuFSJhJZfWtMM94R0vJmC+1forMW9s3yYGQNwneV4za2J55aOQErxR07j3uYA9ocRLxKuN/vQ6/qitjJ0NQvW9iH4kuBoCPtJgNWHBaGGY27o4U/RkDakcViBw12EZB8nea78E0ZmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netmodule.com;
Received: from ZR0P278MB0060.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1a::8) by
 GVAP278MB0796.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:46::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.12; Tue, 6 Sep 2022 11:32:25 +0000
Received: from ZR0P278MB0060.CHEP278.PROD.OUTLOOK.COM
 ([fe80::d506:15b0:af17:8958]) by ZR0P278MB0060.CHEP278.PROD.OUTLOOK.COM
 ([fe80::d506:15b0:af17:8958%9]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 11:32:24 +0000
From:   Alexandre Bard <alexandre.bard@netmodule.com>
To:     grygorii.strashko@ti.com
Cc:     linux-omap@vger.kernel.org,
        Alexandre Bard <alexandre.bard@netmodule.com>
Subject: [PATCH] net: ethernet: ti: cpsw: Set max and min MTU sizes
Date:   Tue,  6 Sep 2022 13:32:12 +0200
Message-Id: <20220906113212.8680-1-alexandre.bard@netmodule.com>
X-Mailer: git-send-email 2.37.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::17) To ZR0P278MB0060.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1a::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 870431e8-c970-49a8-cd8c-08da8ffb7823
X-MS-TrafficTypeDiagnostic: GVAP278MB0796:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ujv4mwPJpJy6WKsjLUx7ACxLwVdHNhUzKt9YCX/PM9ozNH19pYb3N2beQ2HX4xKIGxQ9Swc0VVuVWU6Ir2PUqffHNTbgHGiRteLxHBtCKhGTabe4wz5c1WanNplFIeunLvXgXJI1usjAfXDr4eyOhbKOEkqguSWb2MB9TMDERuJxnpzVEmQQGejUqEpxY6bMMvq8dflppL4zeTRi50VzHrVIzi75kceb3Gt7Cknc3aOyxH+wb5o2G31eYpY6kUPhKssW7+J9ik7duWAwtw7cd83lgKFoApEoP8aEe3nnCJoisYZuUs9KbFCx0Y1E+slFOhoppWdntwBAQEVZLxynv3rxmXTfqI1xCJRLNQU1V0cn3MBmcgE1VNQPaYRJw2IzSToO8vJMSsvlfhej9YyrU1QL76vwT5YPCIItuYrVAi0fai8EzLNUsLE87C40GKOPSGYeSNyOwO8tQgOuPvWMTzDbafhUVdQqtdxcg9WmxC3MOHQDGwSoVM51PVI6gRg9W/OjtoTF9ZcYrp1X9IodsOz9ds7DwICsEWlUgWXQFGLFDTpzd2vc7D9fhxsGWuDFO+cpat0kg560f+F45/TMHwikkn1pvVWNLFlWGMsnNQv1xnki+lS2Dk/9L4bkiG+VAlqu6Tol7NAntvT5lc8uNuCrwn5O3gWwLc52k7D1HAFfUjO+d3vFWNStmiyYZ0QKblor8t47UaXRKomlSGO37EJ6bqSU/+1UdACs7XbKceIqE+TNc4aK+a05QsKEQ9I88Spoegzx8E/FtnKUh+4rdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0060.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(39840400004)(346002)(366004)(2616005)(186003)(1076003)(8936002)(83380400001)(44832011)(2906002)(5660300002)(41300700001)(6666004)(6506007)(107886003)(52116002)(26005)(86362001)(36756003)(6486002)(478600001)(6512007)(38100700002)(38350700002)(4326008)(8676002)(66476007)(66556008)(66946007)(6916009)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Egx7EAFkSqblO2IxeOjHRT9uG4aupvT48vbwQA73YC+62oAqBcpdtCCAw4d?=
 =?us-ascii?Q?oD7Dv0eahivauu/NG/2iGeilbH4ORVt9v0Add/cM9YYamAMfrkvUVrzRtyFp?=
 =?us-ascii?Q?Z5Fl/7SPf/0zR62rjd3HS5JuajKZwlba8UfpfIw4hTm5HWVpg1SP8GAokfbF?=
 =?us-ascii?Q?bVcgibTgi++LeW6QNN0j/z3IvphW9aLRoR2/zTt0VbH1V9ApXn8NLM46dKrt?=
 =?us-ascii?Q?D3LxFNAPV+oChXCbNWmTdy2qoHKWp6oQXSXBW8bm1OknaviDVn00mvY9mfsN?=
 =?us-ascii?Q?baSIChZPYblbLI61tL9KEnhI8RIWpsxKIUaASkKaLvsq97VJQHPEkt5Xvk1y?=
 =?us-ascii?Q?NdlXWlRh5jOp5q/si3PdNMlBnEnyfuFJd4YzVYUwiNhJVQ02yz5FKLOvXUG9?=
 =?us-ascii?Q?5ggdMva3mXXX1CpVXArEqKBpi91HPiFAENosHPG6ClFmWzEo6IvIr3bvhI+J?=
 =?us-ascii?Q?IBEqXCFeI7M2hKnEgz5ze5VuqBLQlLII2MzktZcm8qkkHWiWH0FBzRu1/1o5?=
 =?us-ascii?Q?K3CBk4JT+IQvx+BO8rx8/uRpTkKuaPw4WdICH4ccYT3xRul5OPFeGDy/D+5K?=
 =?us-ascii?Q?Ij930UP9t3Cbaj3EmoTVaEchzQzh0vQsOgTRntCOF5xkQJw7rE/YWfiZl8yh?=
 =?us-ascii?Q?5zvgNSfEvgdB+GvGpIUxW+8L2h34W8ThMt2uoC0qWxbQ7FFHKEQKPJs2lwhY?=
 =?us-ascii?Q?Gcq7wm1hWHOZawMcaIEUKDeWmyjWpVYch3qYLjuQZoj9TTduXpzg6hyS6ZtG?=
 =?us-ascii?Q?e7goiD4s0HFBel2feI+0kgBzwRjfoJpCqnlXY9m4CpSIBjtkUn74wzEAMh4V?=
 =?us-ascii?Q?t4NqW4pqXMeB6uZW48Tc8nzPZH7d2qe0wou1y1HUJSdSWclGciUI40IaiAhV?=
 =?us-ascii?Q?MX6FTdFmpdzeWeQrQqWnBHKilik0hzYyFmZuPB8+yVl6sGRDTpXoDX25AnN+?=
 =?us-ascii?Q?gSexeITBO/mfxxr0jtjNElwIE2cUd8UO/LVp4BdSomBKIiXi+eF7VPGivKHU?=
 =?us-ascii?Q?0GdrlEyQqWJNW4SHw8Dh590/kzaiSm/+CVk4OtzyVk1KecAl+lVaD6evCqL3?=
 =?us-ascii?Q?O55F/v37fOQW5lU5Sy+57QeZW6zLQUavawMBywSEmNtIdnVjIpFHrfZe1J8U?=
 =?us-ascii?Q?2my8kXDqXayj9Q6DAe+HFzbQjbUgi7jUaO77IdEkWjGzSBmM7O9dR0khLO73?=
 =?us-ascii?Q?6IHW1T/OwTfpFQgbobNZYv3XXSo84wYaqQidhGr5mFCmk/uMLIR1wJzgakGP?=
 =?us-ascii?Q?Dza637BcyABeYyFyGMF5k6LqRAKKNq27dpMFG7LF07lgDPyhxczukWS19JZ5?=
 =?us-ascii?Q?8cxzSAWSfi7ZwJyWYv/iJHMGGEU+1iwkLdrt2mxeIXQnDsnZhrfdemGpTY43?=
 =?us-ascii?Q?VNtD3Kow21mqobk4/0kfhQ/Ae+5480mUzOzCCXmY5xJeQKtHRalCTTM+VmyX?=
 =?us-ascii?Q?f8+q3XU0oJ9xBC36BQIQmM/rMzeTVwcwbjWun5cPCfEZwFTOk9ud4clx9CYB?=
 =?us-ascii?Q?K593CJUKznBTXPXk8W5UXm2TSdHxPbmqyll7Xtv98eX6eYTeRAdfqpUxowO9?=
 =?us-ascii?Q?BSfoNMojBWiPVaE79LiFBftgvO2NY+v+4Jv2Q0fu?=
X-OriginatorOrg: netmodule.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 870431e8-c970-49a8-cd8c-08da8ffb7823
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0060.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 11:32:24.3097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: dcdfa962-340b-405e-be0c-5bfcc8a0841e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LuCoS23S97ex5wGMFu/cBG7rOeasmc8TjXQDs+g1VnqhZm9UkkdKVjlITIwEImto39NBXHTI62JhTHh1xaP7sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0796
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

These fields need to be set in order for the userspace or DSA drivers to
change the MTU to bigger or smaller values. They default to 68 and 1500
respectively. Since the hardware supports wider limits, it is all
benefit to set them.

Specially when connecting a DSA switch, the DSA code wants to set the
MTU of the cpsw port to 1500 + tag size. This was failing without this
change.

Signed-off-by: Alexandre Bard <alexandre.bard@netmodule.com>
---
 drivers/net/ethernet/ti/cpsw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index ed66c4d4d830..83d8c6a8a527 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1631,6 +1631,9 @@ static int cpsw_probe(struct platform_device *pdev)
 
 	eth_hw_addr_set(ndev, priv->mac_addr);
 
+	ndev->min_mtu = CPSW_MIN_PACKET_SIZE;
+	ndev->max_mtu = CPSW_MAX_PACKET_SIZE;
+
 	cpsw->slaves[0].ndev = ndev;
 
 	ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_HW_VLAN_CTAG_RX;
-- 
2.20.1

