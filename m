Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2358F5B973E
	for <lists+linux-omap@lfdr.de>; Thu, 15 Sep 2022 11:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiIOJPJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Sep 2022 05:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiIOJOj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Sep 2022 05:14:39 -0400
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10081.outbound.protection.outlook.com [40.107.1.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC1F9A6B0;
        Thu, 15 Sep 2022 02:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXL5vsTuralBiQXJ4bjLMwMH1LqgkrWGnH329TyPY4fVpWEhbOo2uk8K4zCDrmn/BIShGGQwzxQsmXuaK5KUhnaG+JKMNTFcTN+fuphScXrqKDHlfPJk9/xjTRdkhldEUS2JF153iLSEjF6TCC8Km72GBz9qRh7wnCwQoX2YWWVTFze6yipMMHjXDUdvfSXOFbITY+lK3Fs/FgMGMQV7XGfuOaQixcYcF7gMm/yRZPuC72FY7omhGGd5C129/tK5NFx4DzQV+8gPZTq3tSZOk1U7MSfI0FBenvS2NiuIH68XMp0gAnGCd9OCikeAmPwYPm4g8ba1v17f8IeLSoLT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8OSsBGWL2fu9pifgQy0rHy2ryaiWNNvHdS60SZAXM8=;
 b=MuMBZK4FBo19m195EQBtpQLWMiIpOOxmrunPiJbshBoMmGgxzTAOFsISpRnp/KQRKPTh+r7ErQG6F9nuKAnKIEeErzAgC9fUMakE8TDZFykBo8jPfEkMS8lYrQB+M9rRv2hLAv8KE3Ce47fSOt1tCqyJLsTODeJALl1hGQ97amQRgX362pazgFFm/tXmoZWeJVEJD6AdmqCPfLo+v8xyQYLS3zniYAVat3Nedrvq3c3EE5p8R1qVxmW9/KoqFJ7zerl9hr5v/lZ3ddvSEl5NNfUChQ1HYvRBpSiqGXAAzg2TL5/bQluXjxBmRhKWkpdeI/A7PjwHY0z+9b6ClJ44RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8OSsBGWL2fu9pifgQy0rHy2ryaiWNNvHdS60SZAXM8=;
 b=Nwh7qOUexJmjhigG9GJ8GdE+ZXZyN8Ml7HMvCU6wcKrT4sktjuCbXHnI1F3yk34MPU+6mZQ0Wr/iFiu75+BcNP4OCyaMgRkmTYc6NmPHuNeD1Ny6owkc5FtqxpHQIghwceZ4Z/xgW3jkDT7j88mFMUX6Lzjk7at85Wt9c8SQZvM/1QWIQ7ALf+SpDv8spRd+jf5JBK67y5HgRRyDW23lZYMyTWFVDmSgekgAK4ugVfLxkCYQTnsTc+Z40ylEi4mwwr8eUoq3ytgEGb821YPkNWxDGSfzofR0y3/INeAlSbBumcBOfQljzu0nmIhR0cnsg4OjSi41VMvnL48JuS+J1Q==
Received: from AM6PR02CA0012.eurprd02.prod.outlook.com (2603:10a6:20b:6e::25)
 by DU0PR10MB6875.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:464::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 09:13:51 +0000
Received: from VE1EUR01FT046.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::98) by AM6PR02CA0012.outlook.office365.com
 (2603:10a6:20b:6e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15 via Frontend
 Transport; Thu, 15 Sep 2022 09:13:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 VE1EUR01FT046.mail.protection.outlook.com (10.152.3.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Thu, 15 Sep 2022 09:13:50 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Thu, 15 Sep 2022 11:13:50 +0200
Received: from bennie-lenovo.fritz.box (144.145.220.66) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Thu, 15 Sep 2022 11:13:49 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v4 3/3] dt-bindings: memory-controllers: gpmc-child: add wait-pin polarity
Date:   Thu, 15 Sep 2022 11:13:33 +0200
Message-ID: <20220915091333.2425306-4-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915091333.2425306-1-benedikt.niedermayr@siemens.com>
References: <20220915091333.2425306-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [144.145.220.66]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--9.764200-8.000000
X-TMASE-MatchedRID: FgBlj4RFa/fEuqVdWhBa8X8otomh/kVbH9B97WCZlj2VyEX4i+SWU0yQ
        5fRSh265B0L0/Ut7x1D47Xv617HbR+THRSYVdIx5q9dxv4TizKefv2cITmCgNtfeP+V/VXwsm2C
        Uy/KcAJ4RxZBQI0dbZ/WKGThQ2qZNfKZSSl2fkbJNVVoqlq60cKPFjJEFr+oldywMrbEEeHuNo+
        PRbWqfRMprJP8FBOIaSV75InlJNiVWinQHdvOEPaUSlfmMuqTbB6/NalQ+MetfLg8e3/TOYg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.764200-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: BCB4B76AA377C106AA41DB6D34658161B1E2A8E31279B9469BE5EEEDF88099492000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT046:EE_|DU0PR10MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 3920ce32-bc93-425d-d147-08da96fa9ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YOw7n+/ctcgeNG0cohP63BanMCgY2gBrineqTIzqKaYlq7W980zjRW3XCGGUB34vMJksKTV4k/L5RUDN/p28aQydhg8XFsWL91dlnnb18DXOchb0rBQAoU4szg+XmhY/UTPoxa9FlSVT7erdEkTznpUwZdDMhlsgWLyHSCUDdlaRXi2sie1JondgA5RCghiyh5Ltb+WxZqOuWR8+/rOPHJuR6ornAuHPmwBfgg4X9Ruqid6l7UjzbDN7Cm4I21l0VbbE7Q18arFSTLXsygtGX3lbPwpQA2mj8J8acx0doAfTRSCotToLsphvP4aruZpUnkRpqhONS8f+H1IFh3OaYu4fYPvK9rd7ExGm4z0NWLg2a2YDXNYU935kFowVjQhox/fPA86VlsT5Zl3cITyz0WVTo0Jph3Rk0yRoL9tK6bykS6r7NxSQrn2kJSxw6vRGhQzqRvUZgV9ijH2BFBZhHl6NQnrJFggUwqRGpcGWPwNQ1dVkUSfB7Lg7obXVp6nEEjgU7ekY0gnxar93EdM3cNRsP0JF165Ch9p1dLMYIlGQXH+RjsbTjA+IouZ5U5SQGKH56+Fq2w9gxfdXyW+Kenv3LnppXwlzpdhJEq5gakJEB9iA2mD5Ogt57dW5CnDfJ/iGdB3Erh9BxdNue3TmzDz72MBneGpnc/c7yE4tGAinAaeawS7FtNiQcoe/WVtt1RMPJOXee/VVupUmCXorxti/QdeHXKC/jGY0+BvNN5UYvrNuWkIpU7Np57RD7mqgSqAryUwJaP/W4Qn8ic4G06uunk6Ijlnn41LK1rhU+6ItIxrLzcP01KgMZVqUcLnT
X-Forefront-Antispam-Report: CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(956004)(2906002)(41300700001)(336012)(82310400005)(82960400001)(478600001)(40460700003)(4326008)(16526019)(356005)(81166007)(86362001)(70206006)(54906003)(36860700001)(82740400003)(316002)(36756003)(40480700001)(47076005)(2616005)(110136005)(5660300002)(8676002)(26005)(70586007)(8936002)(6666004)(1076003)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 09:13:50.9153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3920ce32-bc93-425d-d147-08da96fa9ad1
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT046.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6875
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

The GPMC controller has the ability to configure the polarity for the
wait pin. The current properties do not allow this configuration.
This binding directly configures the WAITPIN<X>POLARITY bit
in the GPMC_CONFIG register by setting the gpmc,wait-pin-polarity
dt-property.

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
---
 .../bindings/memory-controllers/ti,gpmc-child.yaml         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
index 6e3995bb1630..8e541acdb1ff 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
@@ -230,6 +230,13 @@ properties:
       Wait-pin used by client. Must be less than "gpmc,num-waitpins".
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  gpmc,wait-pin-polarity:
+    description: |
+      Set the desired polarity for the selected wait pin.
+      0 for active low, 1 for active high.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
   gpmc,wait-on-read:
     description: Enables wait monitoring on reads.
     type: boolean
-- 
2.34.1

