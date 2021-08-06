Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFD53E2699
	for <lists+linux-omap@lfdr.de>; Fri,  6 Aug 2021 10:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243897AbhHFI7o (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Aug 2021 04:59:44 -0400
Received: from mail-eopbgr110132.outbound.protection.outlook.com ([40.107.11.132]:58544
        "EHLO GBR01-CWL-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243725AbhHFI7n (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Aug 2021 04:59:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+8I9YM3HYqHDnH6zZ44rjrluXBp5kudm3+1Zhlo0VcdclhBP977PVS4u4bNevOcLBPqayK8nSaI3+gUhCFpQihet5Fa+e0TGVxNNaiwecFWWyVd9YSF0GfwXpfLdqnMqMVCeSnGMOPNkr118qyEoMTSXVY9MDTHJM3/ILJ/4rxmBTOpFPHtI8TVLnPemh+TKAUExiERCd616fZoZ5fXxLztD5HKnZEY482SzOI2Uk/X6W2uyieBXRZrSlI+FGe5leyMFm4yPXbYp0zlVmbpeQdl1vIw6OCzUXUSVjTFDU9bQoRtrApLSR5VoBfvtwB9f59stSkElZEp4pz07sMubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yNNDNiklxbpPa4SH//bzr3nGLwVDc2EI+Fa6GxdGGY=;
 b=ECqtecWkGTCPVVDGLycdUKVv58ypycEb6OCKLz2bmjcot/t4l/6pf4MN94r00MKu+Hh9zqeItKr60JYoLWWTZI9G0Nw7XsmxdYaOWQ3PUfoET03lzvrS/NcZY0UDT6Xys9v3Jec2JAYxpdZgxJvFWALpvzgtuLQ7eCEwq0Z2eP+eqptGEhYkHHstdXHWGSatq5mMArkzgrQxjrFKpHrrsJzm5aCbtsi+idl5ExryqJH7j83u6Z44oy9+rZxdWyixx19Ch1P5Jsuznv/bvUubJd8/DS+d75jA+UZv6N1ZtFLtU3WruHdscntgFWI37mh4grGATC0Gg/NlPw2znho+7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yNNDNiklxbpPa4SH//bzr3nGLwVDc2EI+Fa6GxdGGY=;
 b=hgvmUyBXtmiOXQFqdkvT260ahiPzgk9JpkSROfTa3AMiJVq7SkcS/aeqMDPzcwxysrGJLDCthQjTATxNrb5u6PTm/YbuFSlXpNh7IFr9vQZ1kY/dzMSoXhNbaf28ZT0IgJs4H1hpwEbK69TB4wnNLXX2eOmKANIMFvMYBWwug6E=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWXP123MB4934.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 6 Aug
 2021 08:59:25 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0%7]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 08:59:25 +0000
From:   Paul Barker <paul.barker@sancloud.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc:     Paul Barker <paul.barker@sancloud.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: dts: am335x-sancloud-bbe: Drop usb wifi comment
Date:   Fri,  6 Aug 2021 09:59:07 +0100
Message-Id: <20210806085907.14615-2-paul.barker@sancloud.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210806085907.14615-1-paul.barker@sancloud.com>
References: <20210806085907.14615-1-paul.barker@sancloud.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=689; h=from:subject; bh=C4RUr2ApAySaKXCMflCP2a4rPSQdy+lHX1nIDZhnDp8=; b=owGbwMvMwCF2w7xIXuiX9CvG02pJDIk8Py9E1lVWGuseW/TATdzhhHaatFL9vrr1a7zuB6aKeC29 /WZyRykLgxgHg6yYIsvu2bsuX3+wZGvvDelgmDmsTCBDGLg4BWAi2qsZ/unPMFQPkZtV5bn2xMzNb4 qXl4oGpu8XXe2UxfjOftsUvzRGhn7Huz6npVYm13PPNV8szyfF+M9J5e6Uj+b6Nv6vuaf5cAEA
X-Developer-Key: i=paul.barker@sancloud.com; a=openpgp; fpr=D2DDFDAE30017AF4CB62AA96A67255DFCCE62ECD
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0133.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::25) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from owl.home.b5net.uk (80.7.160.81) by LO2P265CA0133.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9f::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 08:59:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac332bb7-4509-4024-b579-08d958b87d74
X-MS-TrafficTypeDiagnostic: CWXP123MB4934:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CWXP123MB4934E3962D592FB2F174096593F39@CWXP123MB4934.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6E20UE+fM6GOYIk3A44ZBoCSjafvmqn1I9JCva0yxHOB/htT4XSBQlP95CmtF1C3qD8r8xPyzzLIRyfYhiG9jgaNR+Y4vo+9OlOeT1Q6RPSck85/gQR/5G1U82BxbadkHJK0Nhw9T+FF5y/lQQKTEc/+ppFHyiYT4jDTVZE5eMWTPJ9iu6M6rOpKrWOyEGMiLJ1i1UhP/538Ce8IjUdaPj53oCRS6ZiRJBTj2eMincXVztnsfxc1gaB2qRy5YV8k8jrgSsj1Olvnsl5dERid4fSLJDG1+uiHayyNQwEo3LN4IFd7ofiwBnrgNt3oC0+c4SC3cOon+fTixWFFgedsiGmnK6BkzEvW5OKg6hOPktbXcVbtjBvth7n5JeCExzf2sQpziGlJLN8Gjw0IQ+77gxEyjlGWy2p7jVmrj6dPWX+R8aZ0tiPFQJxstgKEM3eu9i5gXby8Qe5cO/n4QP79Z+0N+sDZ7qzKAj42ktiOzlWjDTQCtT37QFneZLUaAhPpciG2uTQNsVBc7bnBvAoXJ7ddKZvCJXMXJAa1AkbB3XfbpTe3cxGqg+qqtwudwjcwoUWgVr78GMrRkn/gO6QJrJ+3Hm3RHkxl69Q6yC8vNnZMBmGZjbx9kKasKZcbEQYi13jqdUtCx/QlNs2VjDvJhBfv4dTYCbZG5OC+Tlbggz3eXRqBhCHjqaMTKLrBZI02ML3vxgqFOLx1T5q8eoW5cw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39830400003)(366004)(136003)(376002)(346002)(396003)(83380400001)(2616005)(8676002)(956004)(4326008)(2906002)(508600001)(66946007)(66556008)(66476007)(44832011)(38350700002)(36756003)(6506007)(5660300002)(38100700002)(186003)(54906003)(1076003)(4744005)(86362001)(110136005)(6486002)(6666004)(6512007)(8936002)(26005)(316002)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/aBiUDTE5FtWn94ERa6eLDdhn9GemW/lr3v/WspSPU9MnG3UskyAHeF3BI2P?=
 =?us-ascii?Q?6iLQA/z7/hu3Q1+G8MCKhqM4PfsRODXkPm32n9qt35EMMkCVaaGSkM9PRfmU?=
 =?us-ascii?Q?/so9CfZbsgwT53tWgYoyOlwKqPR4GNRtzH056G0Csh6xmFrbciekn2LTvN1G?=
 =?us-ascii?Q?u1maJvs6C3CS9OtWfpBh46dvIutBMKtAAt9oXDQ9NGRWn8L2LqjO9UuoOfCR?=
 =?us-ascii?Q?MaiVa5KowXoQqoWU+fZvjJgUV9PUoX/CHlkgRTki53fC6OHKiHk4gj+U4sH2?=
 =?us-ascii?Q?VJKKJBbqHicxdmBx1JYMvRhw0+umNVJCiBbkaplsqmNCG8QPgkKNjwkVvIkZ?=
 =?us-ascii?Q?G0UCOIpVuslvF9Sf9w1lVcc3vppyUQop6bBalz+/jocbVsea9Ni7bdOBaiI4?=
 =?us-ascii?Q?UFiFSv5Hoyx57l70pC2DqF+2yUvtHkiaFHHPLe8c86aJCo4hV3AmoJcZ0mp/?=
 =?us-ascii?Q?0PyMwhqWzjoRe7dFAQ30Fkdp+g/dJIxSeOkhL4l5Eui/WTtXsGQ5JHXbLM1t?=
 =?us-ascii?Q?Bnm4Dq6uTkB/Wf027G1OyXgKqfDcTeaoiqgvryx92qzXIcleY9of2lsi3NN+?=
 =?us-ascii?Q?RTdjpEdq4y/0tnTWuMQdIfTSNIo0sx6eNKq5npKLvVWzu5XCk5k8chU+H18/?=
 =?us-ascii?Q?nHEa/CEPmBUg6762KESHWyW8L+azD1+uMszPOyD88JjIBY1bhsaWIcdTy+eO?=
 =?us-ascii?Q?bal1Ci3g+5z0mVF+/stDvr1DsuzrBZaQ4FaVm73oQHMCCEYRTJKxVMnyIVHM?=
 =?us-ascii?Q?fVKKMARl7iJSWUny/khn9uSKNiTBfj6726h0PIfNtToqBmKtBl/TO+3WfZmK?=
 =?us-ascii?Q?f/EFpIGwydwBLhaGQNMvrlPttLNJGAhg7ap2rQRfbiplt3+moikGlwLQBViP?=
 =?us-ascii?Q?mjs2vjqaWuDyrTcQMtFvzjidgq3xBO/JS8iNi59P14gNtf3nXoLdkXS/g7Pp?=
 =?us-ascii?Q?ms9tQDh+ZMa9zcUnOgHPiFxuqf0hOvuLM9lPzHljc2g0b5lnJpPUX0VU1gFM?=
 =?us-ascii?Q?wFy77LGomMJXQBhzZf5Vzk8Qe65DKnyb/dyyeiDMasLBvoj3+kUguSVXfwfo?=
 =?us-ascii?Q?1TkE0uCL1SPeeUIhLw4/MQpUcwb06upKiX+fiy1wDtEMR6vBaZxifDpYHvzz?=
 =?us-ascii?Q?+4cRqIKzdiBoKyb/lOZWfGgpTr6Zg4/jqxOfn0pd2WWs4/pBpmXH8x8OnfEm?=
 =?us-ascii?Q?2P7KlKXWYkiCaSft677LQcXdMybB74BoAK5u2jv24yvlj7RPT549iHp1PfZ8?=
 =?us-ascii?Q?i495X9J6zHivE+ObUc6GpRYygHezjkJ8iRMf0jOd0l+AcTGn1FVATR9+cCyB?=
 =?us-ascii?Q?I8sJf5qu+wBTvumXqDu87S2N?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac332bb7-4509-4024-b579-08d958b87d74
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 08:59:25.2742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /L+XKu2PFe7Xu+699mtpVpnrs4rxfuUj6Yo3/TJ5bCy21RuLlwgxjX/fLwqooXo2aWPJ+q9RTY49BdHciNa5iiOMtlXoi39M7W+uLsXsFHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB4934
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The wifi chip on USB port 4 may not be present on all BBE variants.

Signed-off-by: Paul Barker <paul.barker@sancloud.com>
---
 arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi b/arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi
index 55952fe8687c..f9b7e774ac48 100644
--- a/arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi
+++ b/arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi
@@ -63,6 +63,5 @@ usb2512b: usb-hub@2c {
 		compatible = "microchip,usb2512b";
 		reg = <0x2c>;
 		reset-gpios = <&gpio0 29 GPIO_ACTIVE_LOW>;
-		/* wifi on port 4 */
 	};
 };
-- 
2.31.1

