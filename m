Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD81E43DE3A
	for <lists+linux-omap@lfdr.de>; Thu, 28 Oct 2021 11:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhJ1J5r (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Oct 2021 05:57:47 -0400
Received: from mail-dm6nam11on2078.outbound.protection.outlook.com ([40.107.223.78]:6528
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229775AbhJ1J5q (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 28 Oct 2021 05:57:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rd928hMiozBU/tWafx52f/IT8luzUTPmdqAQ6qc5ahIev403bsPGR0sloa6mpQ1op4k7zQpIztbc6J3Vvst3P4QUr3/hOG9/8Cu/dqB5bjU+nm3X0qoOU2HVJK7k8cIWYC1IIZRmAbilqUh11outXtQcP4iUwUI/9oePRzZ/FqJSpJTarwxauH9lWfcNeNBhXB2NVOCq6hPT/Rit2crN/qNGuK/rLnADlr2MLkdRAxwBphZarKYRsaRjCsJCX13iWHyg724kjlno6D1CVngZmxywwjGOJWUbERlIUHRHzA6hvWelXylel1ZNLA1RQTvdmlvQHHZi8j8HpNEMp2363A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rY1cd/SjfzSfSXvElw6c2ib8h/lzpM56io9QkISocP8=;
 b=WLCjpnKkWQx2srqjY0YOSsSpEPlXXUm1h3ffV21ussBTv1F0GWX7RYGwPc4HNMUxl/fj2NFSeqSRQbC0SrZDwbCSbGcNnbIShJFAY/jIqMsr64bn7F7h9y3/PA8yXgcYM2JeRDxC/v0vL4pz4eN3HN/2W51lbrQX5z2cyHNNlK/HsdSzQwj/VWRrX/4VMQ1LAn/zx0Xd3aRegYGlx4gUPcJTpFj7B8zplTlhINYVy7DH4gTmh2LJ2LqXn6LOzCd27cZMQni4Xjwus19TaR9Ui3ficiqoyNxE23wys5tgVVnyPu3fxUJSHSd1qpWRJX1nXPS5XwCiK3BlBpZyXzqGAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rY1cd/SjfzSfSXvElw6c2ib8h/lzpM56io9QkISocP8=;
 b=amwYRCzIhYO36Hk9VBalqXQrKv9EfaCUxi0rGVsu6a799MvCC0871z6NgK7/B+x0FMNneS/W0PTHEkkGu1Onmj5Xow8/vbGIn91HvZlHyHdl5xTJiFo5Qw1qjatfgRpq8vKvW8ruwC7jrAjXXMuIdZLI0nn8Xs2aBZ1zt3+Kx34=
Authentication-Results: goldelico.com; dkim=none (message not signed)
 header.d=none;goldelico.com; dmarc=none action=none header.from=silabs.com;
Received: from PH0PR11MB5657.namprd11.prod.outlook.com (2603:10b6:510:ee::19)
 by PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 28 Oct
 2021 09:55:18 +0000
Received: from PH0PR11MB5657.namprd11.prod.outlook.com
 ([fe80::31cb:3b13:b0e8:d8f4]) by PH0PR11MB5657.namprd11.prod.outlook.com
 ([fe80::31cb:3b13:b0e8:d8f4%9]) with mapi id 15.20.4628.020; Thu, 28 Oct 2021
 09:55:17 +0000
From:   =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jerome.pouiller@silabs.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Avri Altman <avri.altman@wdc.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bean Huo <beanhuo@micron.com>, linux-mmc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: [RFC] mmc: core: transplant ti,wl1251 quirks from to be retired omap_hsmmc
Date:   Thu, 28 Oct 2021 11:55:09 +0200
Message-ID: <34072875.m9Xp8G9xV5@pc-42>
Organization: Silicon Labs
In-Reply-To: <1EF25CD6-7801-4C15-AB4C-5F499948A653@goldelico.com>
References: <8ecc5c79c1dd0627d570ede31e18c860786cacca.1633519499.git.hns@goldelico.com> <2013308.OSlt1BDEiP@pc-42> <1EF25CD6-7801-4C15-AB4C-5F499948A653@goldelico.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-ClientProxiedBy: PR1PR01CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::32) To PH0PR11MB5657.namprd11.prod.outlook.com
 (2603:10b6:510:ee::19)
MIME-Version: 1.0
Received: from pc-42.localnet (37.71.187.125) by PR1PR01CA0019.eurprd01.prod.exchangelabs.com (2603:10a6:102::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20 via Frontend Transport; Thu, 28 Oct 2021 09:55:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e775fb5-acbd-40e0-e9d8-08d999f90c02
X-MS-TrafficTypeDiagnostic: PH0PR11MB5642:
X-Microsoft-Antispam-PRVS: <PH0PR11MB5642338A33A09FB3B5AF5D6C93869@PH0PR11MB5642.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kmJjc1D+lbhRDFdhJhsUvn8xRIyqpRfku4cbR5tUEf/pCyEs9Zmx6jP+ieRF5t8Y3+w+WWaHFYjhbLc2Rr/xn1AKhVcnXgM3+BEVlunjAJO9yrVKz6vf1DSU9MU7xkqrmq6vNGo0gn7dc1D2ofRwA2xJWpi7uY+ZSou1DRkyXbfZlVcP11aY2c72l7ZDixE7cRHGf+8hraJh7NpLNYL+/fDDWITXY3CwMNJqxp+9Ac+HFTKFJXY/WX6ThQl5HmcoMBUqHpjaJ5wPL857+KQrakUmEQehuwvUDGaKDYajDgatom2Z86ss3LpFfurXftvxGX667N9BZq/BfCtIB9I1ZrhVRLdNE2UyygDUIlWsS9p8Vxwm/oxWuYS01Rwxz5HHV7WYe2HrAcmwoeGkhPq5Q40AdIuDVMq7GjJtradaiyIzd+yFsGb8YKPPogTohWxZgVCbF2ywAsOWLVwX/WKObRCaLU2rrEiEhJpWtW+dV5jSsDtG2AzFEjXHxb6slR3phMb+wnspr+v4aTDMAu+Y6tBZhTKKd5EGA5HKVDtnrG6Wj+xEQOpYq+OjSAyb5NylwFnTJst3pr0yVdqwXVEzuddxnFfWwMxiGzoHjGXvkkFewK9sbL3oBKHB+fiSUwTX3OMuQ0LbElNlSwl35js85cISxICg1LjCMCronNG4B0Psr8tH/rYGZxJEQmw4EgsOeiQccmp6A0mWk0vDubc4n9fENEDuVSmOATkhXBi2hvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5657.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(186003)(316002)(4744005)(508600001)(6486002)(54906003)(66556008)(66476007)(8936002)(38100700002)(66946007)(6666004)(6506007)(38350700002)(66574015)(4326008)(9686003)(26005)(33716001)(83380400001)(36916002)(6916009)(956004)(2906002)(8676002)(5660300002)(6512007)(86362001)(52116002)(39026012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+Vz3MSFCzFIhrVoIYvnttibynbs5VDU1oaGBHEVIeUrqY0XY3C/9KxgzY3?=
 =?iso-8859-1?Q?feBfTX2sxeiIDNtNLsWW4XIWrIi7BRGtWVUVDLLtTsYNRCN1wLU7eYk4TQ?=
 =?iso-8859-1?Q?vAV8ghv7sg4FLkDpssWXf36KncS2O3EKVDtXsSHKG24EyXffa4fh/TL6nL?=
 =?iso-8859-1?Q?ebjIDVZNwKjUt/eCMRS2FQyfU4HhTTCdYp3wvowBamTG+ni+LooDdx2r3P?=
 =?iso-8859-1?Q?8vR3EKw5g2kNiSJGPsFc9dMyDRaP0WZkB7dz3csoTPb0NU1MbF1O8mXiUQ?=
 =?iso-8859-1?Q?ha6pNrf3VheUt9pCmdtjfx6bWtBdCufFVFZ7DgSlOfhbkCvM7MRa2XQR9F?=
 =?iso-8859-1?Q?3km7huD1PXAHbebB1EQj76z1k3NHGYA4+f2P4Q7kV15KsZ9Bcqz+5bXx1x?=
 =?iso-8859-1?Q?ECKcRt3c7Cp5jwKv1qm2UTeynqNiRJmAwD6i3zv775Q9rK7Sc+I9Po93Sq?=
 =?iso-8859-1?Q?3/cS7djB4m+7MmrXhu45fqvrWIImmbXnC8F0G48eUSCbewBp1N1DDp+hcR?=
 =?iso-8859-1?Q?nhOIyjy473wD9X4ZuuvVN9C+rTthB3Gm1vAL5J3EbjI13cNRtT6Kn6j/w5?=
 =?iso-8859-1?Q?owNPrGdMcwkFbx4oMEhQnuuPR6Kf3/REJqJvJ1TAzwyXn0piracfLHz5S0?=
 =?iso-8859-1?Q?nkAR2pqkYsRUPE6lcXHaLLaM02gabIUirHJ/k8L4XpT0rnIZIxpn5OMI1G?=
 =?iso-8859-1?Q?BEdhu5FLQgNuzNe/7kcOGFTjC7ij7+vW3gXgH02Q0nPj5FkWAUHSdaj2Ao?=
 =?iso-8859-1?Q?jMJYeDNQoY5f9HumTQle7u231Ee81SS6mckBt8t45yru/px3nY33F9Jm7g?=
 =?iso-8859-1?Q?uqUUdyziHEPQ0gXFORBes+HJ+QoGLCuRDdjQY+AEFKpBhK//4vPrV5pl0X?=
 =?iso-8859-1?Q?wWHUznHxOmA0rHB+OxeklUI7jWP4jsctKRHSFBQi7ZZSDPaXPVN2uxM65j?=
 =?iso-8859-1?Q?3v00OyvnBR8xFFQ4vPdVJcXsJEU8D+KTDlE632+cpxfxzlrIEu+6k3zyt1?=
 =?iso-8859-1?Q?hfsYXahNzZPA+XOpMhgyErFHJg6rpI/H/33cA68ymixGXhZ6r/ePCvOPtC?=
 =?iso-8859-1?Q?0BPZJiToDKFo2DiPgmHqYLaPH8JT47bTwABSQmV9KMLhMananGwVxPgVjD?=
 =?iso-8859-1?Q?88f0cwro72EKpbXazhdwapZJ5POWhH3IXhupYtlQDSpdtyr0HFlnTslTzw?=
 =?iso-8859-1?Q?mWFDsnC39DzHlcuv76lfraCxTY+AN8tmwPnDOQ0qnpTLvFzmsrMi8l9B8R?=
 =?iso-8859-1?Q?H6T3tr4Cd2v6HlqIFSrX6YjjpnxQA9JoslotYUxNhWgLh8XiNO7bUP0C5F?=
 =?iso-8859-1?Q?+VSjYVJlJcRrAS4t4ZKHrE+oh8lBg8gh1Jg3TWh82CnKuHLFGNlCq+6dWK?=
 =?iso-8859-1?Q?43XX+KlosEz4hBvQ5GfeqQKf0hj+gWaeL0qRJeMuEUpaKRpq6zqpI/Tb7R?=
 =?iso-8859-1?Q?8cdP/O0DwwjOOwYDg751jAYIGrt8YQt8yeNMmtAM/lu7JsrWwsNyMe/yXT?=
 =?iso-8859-1?Q?sfW6pylMNZslJdby88mQLd54vdA1TajnnYHJTUp/GDDom4QfWn4BXrUQ/+?=
 =?iso-8859-1?Q?Cb1re47wG3FJ9XOfAYhZN2ii8jiJZfU63Psz5fGU07aQxUI4Em9PPhGUKy?=
 =?iso-8859-1?Q?/9yYwfMC8AVNHdEGe1gRJX3stYemCuKXu/4aBsxM5UG64m/CCLxpG/uot1?=
 =?iso-8859-1?Q?uyiGLcknmzWSEzueoCY=3D?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e775fb5-acbd-40e0-e9d8-08d999f90c02
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5657.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 09:55:17.8274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwAmmOhJRu3ydhACb960aF97aKR2lm9GoSFY5L+BtCS2+tb10lJ2R604YWFh9aFXs1vTjzs0GdH6TVo78ISo6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5642
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thursday 28 October 2021 11:40:59 CEST H. Nikolaus Schaller wrote:
> > Am 28.10.2021 um 10:59 schrieb J=E9r=F4me Pouiller <jerome.pouiller@sil=
abs.com>:
> > On Thursday 28 October 2021 09:08:50 CEST H. Nikolaus Schaller wrote:
> >
> >>> Let me have a closer look - and for sure, I am willing to help if nee=
ded.
> >
> > I confirm it does not have the expected behavior. !mmc_fixup_of_compati=
ble_match()
> > should be mmc_fixup_of_compatible_match(), sorry.
>=20
> Ok, I see.
>=20
> One more question: how can I specify "ti,wl1251" in some struct mmc_fixup=
 table?
> Does it need another macro like MMC_FIXUP() or SDIO_FIXUP() to set the .n=
ame
> field?

yes, I didn't provide it with my RFC.=20



--=20
J=E9r=F4me Pouiller


