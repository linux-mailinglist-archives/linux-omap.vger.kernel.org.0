Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4080C44AC81
	for <lists+linux-omap@lfdr.de>; Tue,  9 Nov 2021 12:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245707AbhKILYU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Nov 2021 06:24:20 -0500
Received: from mail-bn1nam07on2080.outbound.protection.outlook.com ([40.107.212.80]:41281
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245705AbhKILYS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 9 Nov 2021 06:24:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWnlaH6FrAS0q0j2LJUElzs/8dqWG+sXhOLLLa3YsX5klwORlPloxxpgjB+/9n4krvDXPdGULFcvAW1D9ti6UgTsBLuKMs1nIxSZxo6F0pqDRYjPwle96Td5sTZTOi2Iq2r4dltL0lwbxIG5GigmoAqya/CiCWW4mxQfWZS2WV7f814l9BqIPF/DprrY8X1Oy1aAMCNEVrvIC07oehPADsVaCrX0ElbqcApIMBsBx/P+VtuXGAX0oKZW2IGsyYxZI6PG2HMMr36TER3SySu2mUKBgEvoj4yit3PELJSQywaU/JkuP9xZwY26mLoXuLbon99bsLHmLMYt9TJiVO6OBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pg4SQuIl00eRX5N676Tb0S96MkdTBNxnGdlfvWVzGqI=;
 b=hluHhgQYbJWpoQGZ2MomKkqem4mlLcss5dgcR2ssfj6FbW55JZlQFMHM7wNDfBV2oSDpcYl2I2eEc8H1T6VopA1vqxFlcy22Xrrs3m7oF653zhGM7nYcW6litOgJJTx5luqsFne2/4uw7CJUUy0lbO7S6AN13z1guwhSd4uQzXaJ+JkOi4yNGLZswmNBHahL35EC6HCOOmo5x0XMQempFAGpJ5kJkn9ey72cW3vadfdnEDX/UBFsO6MgUc1nF/w99Pf3HMVrxHF5AcrI2AvbG+ViW3jzeuDI4aX2WyAJ0xdxM6A9z0RranTERGQvEaAGMC9OSbLD2EmvFPofE5JoIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pg4SQuIl00eRX5N676Tb0S96MkdTBNxnGdlfvWVzGqI=;
 b=XgS5OxxM2WeH+rLjV3LE5Jak//wB7esnfVReFbW7wPqgCdHy8dsRBtmtlP6aI2ssML1RO4GSEgCsXLK2ooYI9fIemZ6kuRKM23DkJFvQQ39DxyNJGIQpRx40mxKxQjrk2z2U6dmI43bwmDRHorZ8nq84teWtW2XcU3DnQHQEMX4=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=silabs.com;
Received: from PH0PR11MB5657.namprd11.prod.outlook.com (2603:10b6:510:ee::19)
 by PH0PR11MB5612.namprd11.prod.outlook.com (2603:10b6:510:e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 9 Nov
 2021 11:21:31 +0000
Received: from PH0PR11MB5657.namprd11.prod.outlook.com
 ([fe80::999f:88c6:d2d5:f950]) by PH0PR11MB5657.namprd11.prod.outlook.com
 ([fe80::999f:88c6:d2d5:f950%4]) with mapi id 15.20.4649.020; Tue, 9 Nov 2021
 11:21:31 +0000
From:   =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jerome.pouiller@silabs.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Avri Altman <avri.altman@wdc.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Bean Huo <beanhuo@micron.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     notasas@gmail.com, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Subject: Re: [PATCH 3/5] mmc: core: provide macro and table to match the device tree to apply quirks
Date:   Tue, 09 Nov 2021 12:21:22 +0100
Message-ID: <2478962.rqbgcO2f2E@pc-42>
Organization: Silicon Labs
In-Reply-To: <b13fd8b3eebc3c23b6816b254a518c224cbdcfd4.1636455548.git.hns@goldelico.com>
References: <cover.1636455548.git.hns@goldelico.com> <b13fd8b3eebc3c23b6816b254a518c224cbdcfd4.1636455548.git.hns@goldelico.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-ClientProxiedBy: PAZP264CA0049.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fc::16) To PH0PR11MB5657.namprd11.prod.outlook.com
 (2603:10b6:510:ee::19)
MIME-Version: 1.0
Received: from pc-42.localnet (37.71.187.125) by PAZP264CA0049.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fc::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Tue, 9 Nov 2021 11:21:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12a820db-aafc-49c9-04da-08d9a373143c
X-MS-TrafficTypeDiagnostic: PH0PR11MB5612:
X-Microsoft-Antispam-PRVS: <PH0PR11MB56123B550CD787E86D6B4A7193929@PH0PR11MB5612.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MSw+g9qRbiY+sco9LpqZoAgt9Pg4Mwp8NOYzbX39xino1OQ9aVM2oY4iObxBERfXbzFSI4K6/MhPl6EYifpk30J1rH5MUOxE8J15G7SQ+FvmQv489KcanUb1CE641ZmQWswJL566WCoTxZ8rhjgO1Ykm62L/VGljeNqwKJy6rCozHsb1egZ1x3RdiwSaWkVr/d1JYFaVrXN9CtAgcD8kecDqzRal23/P6g40bB5kSvBd+YfsUvl9kgazlfS4YhxnqcteAZWf4k3oa9M754uef1R9rcR6y2NoQ6cfb3ujFSJpQQCbqVAJbw2stuF2wA3XOrt4jSYSYZuMO2BQaiNDSR19ldsLI5AP9Fm9a6IcQf6FtPsoI4TCVOo2XNt9sTCBdW9jYIr3PUsMwmRQBcTsGlSbJIHR6Gkx6o0SZubdvV0MMjdLXnUTKwBOdhnZudRncE1eY3Nza6M4x5DJf/hfeL1n6RUv0tipgok0zVaDfpmSsmz6rQ5ViXsOvilFw9rWItOzbWKE2wSKCc6DUGEMemmMDbYO9o+vHXGZrIq8SbvDCvJ/76NW3bg2uf2iRQInBEBXfc/RoRTnEgx7fVh8x3ejHGI9wr7wMn3wRt0oiMzKiZMr55mP/tMQ0l3HNW/DYl2vO7JTgux7KPQ3cbJ/lW04gj3a9L5VbkWq2Dh+TWNPpMEB1TJYL9scpGDWs0JD4qA+3J+ag8sSMohM4eIhQpRhQib8AUqJhnnAYGmOfDVrmymG+8oRgPi6/TGip5c8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5657.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(186003)(6486002)(86362001)(5660300002)(9686003)(921005)(8676002)(6512007)(4744005)(508600001)(6666004)(8936002)(6506007)(2906002)(956004)(7416002)(4326008)(26005)(316002)(110136005)(52116002)(33716001)(38100700002)(38350700002)(36916002)(66946007)(39026012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2gtFIVsc8Ehwp/ZMUtGFEnOBGh+Cqb6rlInzDe/w00anPXmUIK0sEjpYNL?=
 =?iso-8859-1?Q?JTtXYf4iM6I8AqzI8jsmuyBjFUolYRWOFS6uD76fXJqhD9OK6KUtEUtwod?=
 =?iso-8859-1?Q?eGhQ50Uy+RTaoj/RjDOlbVrB5mYCplbbCtHPNo6HVPb6WJMnEwAXcHa/G4?=
 =?iso-8859-1?Q?L4uQi0oKNr6iqqjH/WwMtYskoCAPcsdvC4KG1JBGDrl21hJHMsyDoJD1Y9?=
 =?iso-8859-1?Q?umlcZ/oAC8VsE8SrUp5Zu2gyCM1Is6RkrZCrM4nDIJ92gwD92GRdOr4dBS?=
 =?iso-8859-1?Q?Hr9NPf/phrUfSv3zxfkMIH+KJmHHRdsaGvk+C3LzROPgaH2YEHW29qzvgd?=
 =?iso-8859-1?Q?7mhti6s/xdeWd9qUE7Jm9YWf/o0S/3+gp7oPICmF/s2xS89lWlNi2fPWJR?=
 =?iso-8859-1?Q?DB9btidpjN5iyeTQ09RH2q5TMwRQBaDJz1XP3e5WUNdH6/Oonb864n7i2Q?=
 =?iso-8859-1?Q?+4upYtTWKkXPRu7HfHb/3ZCCqRzcXfHoM61yZu7uvBfk5wTp3HISACdloQ?=
 =?iso-8859-1?Q?AR1U3mP1Z0JfADTpKZJkvRIrimFYDuIze9RJvemXh10u9cimeEsKEhbf43?=
 =?iso-8859-1?Q?jsZvmo/Jx+UsS3EW8Ax3FX+qYl9UK0/ZqMrklkZVi8FIDazep7FxbQIecn?=
 =?iso-8859-1?Q?lmqhn0git71w5e8o+nFprFEup/Yc3LHGq/Y0OMNS5ZJVqoPhLb51CLQYDY?=
 =?iso-8859-1?Q?K60GGGYpecWCZUMIi8f5NOhE9PYVEj7L7KVJftIkdAb2oylRHauifblPTH?=
 =?iso-8859-1?Q?VqBJ0owDm6hWShpk1GWsQ3diKKPJsU8528D5N36+vZmjxFwaLv6T5lTZQt?=
 =?iso-8859-1?Q?9NOjQrK6mEVkmIh2h+naJF9kOz/HyVRXOqIXLIrINszyHTrpSbE3vii5Lg?=
 =?iso-8859-1?Q?qmedWdnOqZEeQG6Bq01j/qzmE6pf8bQq6nqSDWcooQhNywjgtM4ZiTfiGs?=
 =?iso-8859-1?Q?SGJBhJEXhV1InLJiyzK8ybxoHlzIATIKR2M3of/P5gKK/+byynw4RNR5tN?=
 =?iso-8859-1?Q?sl2ZkqSoe7zYPtrsgbPDwZbrsMg07oWYrZVPXFpeVWlZwGcZLsn/rS7JxA?=
 =?iso-8859-1?Q?v7sgXR8gB/a+VzZ+Tv91y5bmF3LhMfZ2l9YPrfyaQRZ/U2HgeHwdV4T9u6?=
 =?iso-8859-1?Q?U9Wu3bv8jy+0LEtDioL6Ye0ctoEJ4Sls2OH6H0791DMzZ/dakwZr90FP4A?=
 =?iso-8859-1?Q?ondAG1jJRGH0cceN4wuEN95F5ig8sU+e0ZuIZzfKDm9jX5q6FbSc9Wreex?=
 =?iso-8859-1?Q?9gtihHxMlPnDDGnbzf0VGsoqSvMzYpEO9IioCAunPgHZ/xYzyDOhQVOb3o?=
 =?iso-8859-1?Q?XbyknNwoylvleHmcmi573DoFXQayglj8vkdfy9yZZikca4hG3HtZK/ngs0?=
 =?iso-8859-1?Q?GECcQXYUPUmO+ESgn8/9xW0HtJ3RMc6Wa5EAVkrDQ1rj8xiBeGJYN9vHnM?=
 =?iso-8859-1?Q?5zNzOaNUbGBnBu2zF8vQIP36o6gnvd9MN3huUYQNt7cIYqqr209sJwGRWL?=
 =?iso-8859-1?Q?AmWPc+JKo+HiM3pJwbuTN/OD5N3iLhIQC1geuYrIz4s5XhmYuys6haTcbA?=
 =?iso-8859-1?Q?hv2c6ebjOaRjWZvF35MP4rOddi4Sue1P1/CDxWufQJ4nsd13lwje2bKXgD?=
 =?iso-8859-1?Q?p+4upPDLnTtb2CDsYfDAzu0k2yLCTFeSP8etFbCflCOCYYIAB67NlBsNvK?=
 =?iso-8859-1?Q?W9vrt7LHyQepa9g/ydQ=3D?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a820db-aafc-49c9-04da-08d9a373143c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5657.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 11:21:30.8696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QTxr1lXL/SH5KznJgkaBWVjcykHqLdPw8o/W9QlnkAMR1QcqVWxPygGppqgRYzvRLS5cGjofYv2h4V3WwlC7Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5612
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tuesday 9 November 2021 11:59:06 CET H. Nikolaus Schaller wrote:
> This (initially empty) table allows to match quirks early based
> on .compatible of the child node of some mmc/sdio interface.
>=20
> This allows to add quirks based on device tree instead of having
> card specific code in the host ops.
>=20
> A new macro SDIO_FIXUP_COMPATIBLE makes the definition readable.
>=20
> And we call mmc_fixup_device(sdio_card_init_methods) just after
> where host->ops->init_card() can be optionally called.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/mmc/core/card.h   | 15 +++++++++++++++
>  drivers/mmc/core/quirks.h |  4 ++++
>  drivers/mmc/core/sdio.c   |  1 +
>  3 files changed, 20 insertions(+)

Reviewed-by: J=E9r=F4me Pouiller <jerome.pouiller@silabs.com>

--=20
J=E9r=F4me Pouiller


