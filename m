Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB933AAFD2
	for <lists+linux-omap@lfdr.de>; Thu, 17 Jun 2021 11:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbhFQJf7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Jun 2021 05:35:59 -0400
Received: from mail-eopbgr100128.outbound.protection.outlook.com ([40.107.10.128]:44672
        "EHLO GBR01-LO2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229714AbhFQJf6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Jun 2021 05:35:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQO8+BtkWzFkOFXUBHCWAJH1wGclyhfb94JjSsyJ7/Z4+NJeqDr/myo8C6/Sg9P9KRlSSwJ8E7pjQigaSxF8sJBxjgETsIiWWqbyuueC/JZNej5qaRR3yL2VfwaCyyd2ntO4q5s5CD6/JMHnhLrCGqbYbuRqFdZFhhux4TFM/Nici5fOItTyXwOe7JXiGoXtA9MRENlRcX5cQvZe3+YqMz9ueo0ovVH0Iw+w+msCY4oIOLxYK/IxFuu1U4g/NlcJiHErlZoDY71zeTPWgVPATSIz/umuK1rudMbgu+TCl2fZqHv8z3exiP4oFRAVtlM7NL6G1ZwErJfv57oJJYYo9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWs9sy5bRtv3YkUC2K5M+LD1KVPi2QEP5FhBRBMUA2M=;
 b=gswigizxQuAlCpoOls6LYeZ56RLbpLawHS+2WBugegaBVuUeDzHl/gzANeXjFRckdVl259DG8QZoXC072MhqoKezIpXIjA9FTxCowZrTP+nJylJTkU7pbeYYE4E4O9vaSJTJ/TXnMlPK90e9PEAJgPyNC6m/9/ZrrvpKI4mV0SAoU7PQ/FZA6f5RwoLSbFFD9kYPnYpuTk4WWWeb8Id9CVBaSbWmAxK8l79YeT6IvjM22A7/SDlJXw7C50AS1qOsu19+XevFsu3MSxckKuN3j5+JG47m5KoNTyyaZ4xKoDa2x8K1xZ6gKj8fvDGNvPRrSlth70MiYjbHSOuBga7XFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWs9sy5bRtv3YkUC2K5M+LD1KVPi2QEP5FhBRBMUA2M=;
 b=VyMAX/IxoW+A8JfX6249pOWvvy2cMF3m0yBjnCxiyo7EmHNqfaJxS6azwh7bO/nn0z7l8zmGeScFiWQ6Ogd102jukxbDGPSOZPAyUnH56jMaoXeqtSvmwZBRULyMn9MnyCam+0hIjQOYGlFn1WvaDWkwrQDYhVsXktjIdqQ0dW4=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWXP123MB4855.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:114::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 09:33:49 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c84c:4809:6da7:ecf5]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c84c:4809:6da7:ecf5%6]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 09:33:49 +0000
From:   Paul Barker <paul.barker@sancloud.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Paul Barker <paul.barker@sancloud.com>,
        Marc Murphy <marc.murphy@sancloud.com>
Subject: [PATCH 0/4] Add support for the SanCloud BBE Lite
Date:   Thu, 17 Jun 2021 10:33:26 +0100
Message-Id: <20210617093330.9179-1-paul.barker@sancloud.com>
X-Mailer: git-send-email 2.26.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2074; h=from:subject; bh=W1TslFvlHVfbeHRHs34VLggVVEeUXZAMbsWYq4CI9x4=; b=owGbwMvMwCF2w7xIXuiX9CvG02pJDAmnxe5dOtKbU9mUXVGzX7aKoWbv/V0VER8jPyR+XhfIyyB6 7VlHRykLgxgHg6yYIsvu2bsuX3+wZGvvDelgmDmsTCBDGLg4BWAiDzoZGdZyrWu76JXAPKt12sNNXH IPN634dma3490onSlPHjIntMQxMpyTWy5xV69a06tnAYuGjo+Nye/MtLiAiqxm++RNS5klWAA=
X-Developer-Key: i=paul.barker@sancloud.com; a=openpgp; fpr=D2DDFDAE30017AF4CB62AA96A67255DFCCE62ECD
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [80.7.160.81]
X-ClientProxiedBy: LO2P123CA0071.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::35) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from owl.home.b5net.uk (80.7.160.81) by LO2P123CA0071.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend Transport; Thu, 17 Jun 2021 09:33:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4d54729-c72a-40d3-cdc9-08d931730326
X-MS-TrafficTypeDiagnostic: CWXP123MB4855:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CWXP123MB4855A15D506E6C423C5D880C930E9@CWXP123MB4855.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: txICyQmuhllTlA6MJJnUPQ/MP7jvOW69l/LZshg+xOIyDoLPppyIy8k0hYZ94hThvprq6BlIT5SiGQxpEq488B6n5LbfjX/CVc3CEgoExB91ONiaa1vDR0hoDOXXB4qkBACgpr4ZiI6CsXWY03aNpMV0AJVl+GtENHWCt1bsMbQyoRmpoNiz3VtSrGG+RqdnIuPV6/6dUWWPw5sbrHNutXIWf90yHGkCxqxOEw+rAXfHeN4QMVgxrZqLWZn3VQ6FUfb3CxlA8vDLW0i3VyHP6kRzuAVtJPEEXdGxYwVppyRId05gZWxA7slY+2PaFtjIBUyLvTjQwkHdT41qLgPWSIGDKjenHNjQekhSia1CamzNFxWS6Vg8EV4g8rcqCUB2HNGli1/rYxFhBK1bJFqr7VfjEYvWIgRJeSRCMJDrpY0BObADnHTPw4Y/q19+VK10i1sX8bJcdJqVBMx0+pknXSB1nRP1uCV0rJVgBzjKdpK/7cZZnlvH5yR46hCRJ9mRUa/KyibDmrv02jx5A3FR/PaNuvx/VS+QNww4vyenOBIBFW+BOSKctGODKdAFUDXFgEIguoKMgRhUAH6ZWIl6a4WSuqugDvQUkALaCDW1LbsOAPZpeJJ5SMgDpYm+/W7SltgzGPTcs8lc3pz1IFRSz1FaZMn8vZuIZCs0X+V5yqc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(346002)(366004)(39830400003)(66476007)(66556008)(66946007)(36756003)(316002)(478600001)(16526019)(107886003)(1076003)(86362001)(6666004)(6506007)(8936002)(4326008)(38100700002)(186003)(8676002)(956004)(6486002)(2616005)(110136005)(54906003)(6512007)(2906002)(83380400001)(52116002)(26005)(44832011)(38350700002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uYd+fZcj53lII9TiM/LBW2wSGPFJRJeh6dW3BKPNNI6vQbI5yolv3PxRtzT6?=
 =?us-ascii?Q?AJzHO5En5Fn0yjKj6MT0Pl7bHbnot+LpfTbB8qzELJChKTHcd0WaJcjY77k/?=
 =?us-ascii?Q?WuiHRe7Nf8hEhnfpxhaIlA6fNnKa2xRbVZbJ9olA7sI3VvnkIKK3xU/43/Id?=
 =?us-ascii?Q?wVRq4g3mCQMkKuyKDgFPX8Ilv8kq1qLvUJB4sNtUeXK9S3jJNHvdDtOBraAm?=
 =?us-ascii?Q?E3lTSHyvx7/IFGncrmMtJcjidpp50RHF4voOJwmU6u2onHgDScS/a+4xHOxh?=
 =?us-ascii?Q?9Rr3wyjKdkV8B6OC2UXRcuppcqLy+cyAGrFV3FocvvWPUCq15Db6oRdHEd2R?=
 =?us-ascii?Q?534/nbSnb/RlH/UdblmFl1WT4BXWSjuWd71aEjmNvaL0PzHYtQuXVQuve9DG?=
 =?us-ascii?Q?qHwqRlDxV2GbZUFoQAi4Q63q12j9evOBESH2WXxEu0ytFwQJuJtyQdPfmbxQ?=
 =?us-ascii?Q?RfAsSil6nwF8stxo62qdm8o4K2ADt0CiwGKddgww8WrtW/4mnY1tZ/YivPxu?=
 =?us-ascii?Q?rryPhjqUOX2h3em3bwdTAXUWwEIh5h0P9xidZussmuF3v+xWI5ycyVsmzpx6?=
 =?us-ascii?Q?QlNnm0hC6Sdv9Mm5+IsvqPoGpe/6IX0c7SsbxPIpaE5cM4TwBpSBT4qIfdVN?=
 =?us-ascii?Q?R406E6rrNrnJEl1O4NJbMVPFADyb09UGdXVacSb5JZEldUfyLT8YXeuMYsC1?=
 =?us-ascii?Q?iepMJy2fjVEh3rgviB/StxLmgTpnG+TTxrls74g/xLyxmTIrk0isnZNpwJit?=
 =?us-ascii?Q?1KN73mspLnAFyc/USbTN6hB+06aht2ssGiQIoJighywvrf69S78EJm/rLSaH?=
 =?us-ascii?Q?r/5UxPwA5lLBxVOg8WMaWvtgII5NoOkliAp80oOXaiS+Vna6972Vianh4vxR?=
 =?us-ascii?Q?HeAJvjslF9COA8cTpvEKY3Th6heoj3BYUojmx3lMWBrh2XT7KwGBU2csVzC1?=
 =?us-ascii?Q?9zfZX7/Cpz3XBsYoXx8D8tlxPJPZ3WHnC48xfZCmTkEIoPX767DLiSK3mCiS?=
 =?us-ascii?Q?AMVkSC8aP18TBIhhZ3lRhZwTjnRwxhWx7Rh1X5c3MEeqhlY5sa9o+UJuOhj2?=
 =?us-ascii?Q?Na+Ey7Nlxi3LUCqZu2wj34mQeUxAZd4Ntjk5jhKOKN2UOf7AsMrsCQP1z7KE?=
 =?us-ascii?Q?RGbnhGVpxoZLu+pyuKol7OHJevA/HqzdON2NtoN1rziCh2xIhFMQBoVtfhUO?=
 =?us-ascii?Q?w33yQyaHNiQ1SHpWmpyi4hsFyKEIBN6c6MvSEEb6g1CPo5E/b1OpbKhjzbfG?=
 =?us-ascii?Q?eN0Q24xTyi84InVuOjbvTMgSWqphFyfPxZUCxDOWz3QP9sGlXyjytRsAsw5/?=
 =?us-ascii?Q?ZOG1AXqDgboRDzX+FRBzrPsC?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d54729-c72a-40d3-cdc9-08d931730326
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 09:33:49.4839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bs2iHxsv0743579uKVmhLfrummVmvazpLAAf2KBcmnumv3hafpaPz4gfmKdOhD3iafWCIGR4dIgzYLRfAfWE+brKyCfsyJt8Mj62pV3a07Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB4855
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Lite variant of the SanCloud BeagleBone Enhanced (BBE) removes the
HDMI encoder, barometer and accelerometer chips and adds a Micron
Authenta SPI flash chip.

The device tree entries shared with the original BBE and the BegleBone
Black are refactored to avoid unnecessary duplication and avoid having
to override the status of nodes to "disabled" in any of the dts files.

The final patch in this series adds myself and Marc from Sancloud as
maintainers for the device trees for SanCloud hardware. We're happy to
review any future patches to these files so that the SanCloud boards
work well with the mainline kernel. We expect the patch volume to be
pretty low and we expect that patches to these files will flow upstream
via the existing OMAP device tree maintainers and linux-omap mailing
list. If there's anything else we need to do to adopt these dts files as
supported please let us know.

Paul Barker (4):
  ARM: dts: am335x-boneblack: Extract HDMI config
  ARM: dts: am335x-sancloud-bbe: Extract common code
  ARM: dts: am335x-sancloud-bbe-lite: New devicetree
  MAINTAINERS: Adopt SanCloud dts files as supported

 MAINTAINERS                                   |   6 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../arm/boot/dts/am335x-boneblack-common.dtsi | 135 ------------------
 ...common.dtsi => am335x-boneblack-hdmi.dtsi} |  28 ----
 .../boot/dts/am335x-boneblack-wireless.dts    |   1 +
 arch/arm/boot/dts/am335x-boneblack.dts        |   1 +
 ...be.dts => am335x-sancloud-bbe-common.dtsi} |  41 ------
 .../arm/boot/dts/am335x-sancloud-bbe-lite.dts |  51 +++++++
 arch/arm/boot/dts/am335x-sancloud-bbe.dts     |  92 +-----------
 9 files changed, 62 insertions(+), 294 deletions(-)
 copy arch/arm/boot/dts/{am335x-boneblack-common.dtsi => am335x-boneblack-hdmi.dtsi} (90%)
 copy arch/arm/boot/dts/{am335x-sancloud-bbe.dts => am335x-sancloud-bbe-common.dtsi} (77%)
 create mode 100644 arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts


base-commit: 009c9aa5be652675a06d5211e1640e02bbb1c33d
-- 
2.26.2

