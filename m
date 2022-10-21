Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACA76071DB
	for <lists+linux-omap@lfdr.de>; Fri, 21 Oct 2022 10:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbiJUIQq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Oct 2022 04:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbiJUIQp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Oct 2022 04:16:45 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2082.outbound.protection.outlook.com [40.107.105.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138A124AE2B;
        Fri, 21 Oct 2022 01:16:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQ5YaCZgXZOtAx07PuiVojBHLw/euYFBaWUjBSZqMCBrE2CyAxdce2kCcQUOiGgsOexre7KkAqS5vcf/TPUCXf5MJiqkz/gy5MYikzP9IKj18RgEH+thD8CW7MviFnDYZeWwL2wBQIWrzjbMNbab4wLMrjAeH2PtCQWHlRkf/SOMAmx2gr3eK4XkAwdQ7Tjuz7vc8QvJNGVVkrA7ohzC2Fi5owg8Oq68s/+I5RZsA5UiOYbdtG1ir2Tiddt4x/iBcvy3zvmppZIadINudeQY1EXDHx5jndssYwGyC8COuVCjCZC4/pO/sLq1CXVPuJEj4dkRSa4JaLT7d+mfp1gdLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZtnFuqgOa72q0pgvjU1YQHviKTQlWGFTuBxhvDypxI=;
 b=byS0fGaij2sOvy/3JL6mS6jJ6OIDn3xvEQyQ3pvYVoSI3ZQExn3fRvy3795bgbyPYT55kgEx7YXxn5fTofPYpYEX28T9jTHP80zZ5Lv0XE1ChDcttYszEkMf6oPu0UNUvePhrL1kzYoq6G4qN+2TkjGnAxM+F7ScUvDi0rDVybrcJDL3wnwmS10UNVLWMmZWWz8lZl1AzN+b6vJnopZoPDUI900SLqFstPgA7OaBoX6JIMkuxioZBMwvst6tVXiSys3G2jb+PvowpjzPL51lrsSkFcHacFrs8cWMSWvIPdbrgl51vRtFEBjvThNAbKc+3g4iicto11gCpjx0CF7M1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 194.138.21.75) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZtnFuqgOa72q0pgvjU1YQHviKTQlWGFTuBxhvDypxI=;
 b=JyGeL1eHzjcZohZvwyrrYOho0MXSgMJbfWv8zfpIl00q01rYW5JAVqlS+d/etjAtqb5Q2L+wRNoOisPtwkz2z7hs2eEmINvPFw30UTfnJ66X5UD12iqR3LOsIoN5ob6v+RdijsfnBO2k8HdFsK0SQqK+E1LD1lzaRx43j64bsMNEHr3pFFjAyB/xidUFTUW5EuSquFyAXwgruCgMEItoL3KuLc26zk/64+3K1QHghRalzn9JvLP1C9w2BrQTiPl56krgElsK1OQ4/nCM5bMvVp6th+FtL0uFvrvP++FDE7kTHNCgyQDu1tbNpfKHZAl0PmeqxRMDeqKCxonZQ/mslA==
Received: from GV3P280CA0096.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::35) by
 DU0PR10MB5219.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:347::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.34; Fri, 21 Oct 2022 08:16:31 +0000
Received: from HE1EUR01FT015.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:8:cafe::5c) by GV3P280CA0096.outlook.office365.com
 (2603:10a6:150:8::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Fri, 21 Oct 2022 08:16:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=siemens.com;
Received-SPF: Fail (protection.outlook.com: domain of siemens.com does not
 designate 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.75) by
 HE1EUR01FT015.mail.protection.outlook.com (10.152.0.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 08:16:30 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Fri, 21 Oct 2022 10:16:28 +0200
Received: from bennie-lenovo.fritz.box (144.145.220.65) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Fri, 21 Oct 2022 10:16:23 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <rogerq@kernel.org>, <tony@atomide.com>
Subject: [PATCH 2/2] dt-bindings: memory-controllers: gpmc-child: add wait-pin polarity
Date:   Fri, 21 Oct 2022 10:16:12 +0200
Message-ID: <20221021081612.591613-3-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221021081612.591613-1-benedikt.niedermayr@siemens.com>
References: <20221021081612.591613-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [144.145.220.65]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT015:EE_|DU0PR10MB5219:EE_
X-MS-Office365-Filtering-Correlation-Id: 10be7025-eba8-47c8-50b1-08dab33c8f3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EcLGuBGbYxG4888JKReP2h1FZZ5RgB+m9fxx4Cl6VlF6VtQ4P7rCgtOKxL/cYOiO/8gOb0LkJ1rtJ1RM2PhOxMcW/cnSeXO+5CZ+A3q18IIsdPWZGTMwrlit03vcjQ5PUARmSrMPLyDQxg0B1tid5uRXZ0fwOo5DwUOCbVT6iqHg3xwb9qM61PIbhWJWT5Z3V4s2EQNuYHUpeRxs3qJQeXzQj3t5ZL6hyBeaMJB/pktJ/9NEMG1rBbriSIGIxnQmmgoenIVE0VrqajA5pBno3mNFKUxdhSDhhp5YT4KLinULeWGugiEHuwKYPKuTduMMMpVMzCZxGJSWG6vyAr3QL+tjvsvBZwnK9WpbS7hKXMV1l0//q1upZPDpsdnZ2mrKePc0teW/8uQfuJeOu5LuAfjCL+l2n0WTK1uyZcZN23FQDWis/R7C4pYyAQM5jpoQclLlrQ9ecBDyeaIkbPWsOXRWfRM+ci9dSsVbsg7xqgPIjlZZSW4k7i9izCUbKucbfygPpZMsPLp3by77o/i8ooTQsPUn2KYyQ6FfuYsR6qn+wkWXjG6Hnt78tbCaSzol85ehqUw9LGUlULaGAANHeHPJJPpBFBFGZynjcUBOqDYOVQRq/Df4CaNBSbvnyXK29E0aDDPJSL8OaGPmDXBUpnJ99b3lT4wCzgA1I/xYIaSwWd9nY2rDDmg5+xX4nIdAPXL35I6hFwSLVmB92S+GqQA4ZAlz352VNU1a8w1nONyMtQS0vUMSxDQDc2W/ndplZvHcqPGXKDDetkOKuXhF+GEZtkhpCttlEtVzpyhZO6SVZqzXHqsoFPRJ0qTHPCa/Tu5OyKWMVe6Oua9KiFaZMg==
X-Forefront-Antispam-Report: CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(356005)(86362001)(40460700003)(82740400003)(26005)(81166007)(82960400001)(8676002)(2906002)(41300700001)(956004)(4326008)(5660300002)(336012)(40480700001)(1076003)(316002)(34020700004)(70206006)(70586007)(36756003)(47076005)(2616005)(8936002)(54906003)(110136005)(36860700001)(478600001)(16526019)(6666004)(186003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 08:16:30.7822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10be7025-eba8-47c8-50b1-08dab33c8f3d
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT015.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5219
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

The GPMC controller has the ability to configure the polarity for the
wait pin. The current properties do not allow this configuration.
This binding directly configures the WAITPIN<X>POLARITY bit
in the GPMC_CONFIG register by setting the "ti,wait-pin-polarity"
dt-property.

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
---
 .../bindings/memory-controllers/ti,gpmc-child.yaml         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
index 6e3995bb1630..4a257fac577e 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
@@ -230,6 +230,13 @@ properties:
       Wait-pin used by client. Must be less than "gpmc,num-waitpins".
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  ti,wait-pin-polarity:
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
2.25.1

