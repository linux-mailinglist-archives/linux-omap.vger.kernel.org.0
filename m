Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02E0344AC7D
	for <lists+linux-omap@lfdr.de>; Tue,  9 Nov 2021 12:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241608AbhKILXn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Nov 2021 06:23:43 -0500
Received: from mail-dm3nam07on2045.outbound.protection.outlook.com ([40.107.95.45]:54753
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245689AbhKILXm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 9 Nov 2021 06:23:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAe4NpMREyAOH5JvFAlMqISy0/2xMO5emRyWhJx6CwgWWa2/Ml+zsSXy1PIT19JizGLkORlu6U4bgmM4IzM5W4OYFXK6be/JZOcPXutzevHep0oU9AZy7/l+MjScjyLOJDS6hKsf6kLds+i2UCBJlk7jLZU144ss+fN/lG6tSCJvnbCJpM5We10AXqOZCHNNhIoWH183AXqSxCm1CCsCNits0+MmleXeyxJwERwmgA7FhMtw2JFchthbpuPUryBRn0HBefjphoEwvkmj7o73r5jhr6q2DdJMD3E6TjVe0obkfc45g16bro5MOcRuD0ARe8X+D8WuOICDKCKtma1bow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khOp3Hf1x1lwgB7qnxRqsgBp1aL1xyd9RxlqlOJJgRw=;
 b=ma08mTYra1BQ/ZywkmFImHBx5F2j8aZ6xrHrVqrgQuUb0gmbSUojIWFmV9qxsyaHyL6EadMsrmERRaS9PaIsvo5D9rjrIQmZdP0sg353eadCI+zkL0UHq3I4AuBN61W1b1jqfMkAaVciokkPDi3kBAcorGBl3FpT0Kf7f3foc6wLaZ5HEobokThmHbPGO+e9vME/xXoF+9l7mQyjVcXqRaTjylw/KsqRcNdReE46dlpBwLEw/7GvdM2bwZxIUZ4wnbYPj5D64m6943/5ehGfDg+RDY9agk5LHJjIB6/ehmEVe6GYB8gxCTiZT42tm+Inl6axkaw53j2xbHfUOiLQZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khOp3Hf1x1lwgB7qnxRqsgBp1aL1xyd9RxlqlOJJgRw=;
 b=WXXwetTjKNNpB+CRs1u+Z5cm8gUE88j7kZLTnyRCepEloE8Vv0Qc48+ItITXxIzmZ8Zv4qLQeRuJlf5GzzC6fJSJGIvewK8PzCWu3Z0M3bFyu+mP2ZIaRxPjDTHsbl5cJM+ePmqLUYGhVMKBphUWlxFBGdiUDjNSO6UqDcBpeKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from PH0PR11MB5657.namprd11.prod.outlook.com (2603:10b6:510:ee::19)
 by PH0PR11MB5644.namprd11.prod.outlook.com (2603:10b6:510:ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Tue, 9 Nov
 2021 11:20:54 +0000
Received: from PH0PR11MB5657.namprd11.prod.outlook.com
 ([fe80::999f:88c6:d2d5:f950]) by PH0PR11MB5657.namprd11.prod.outlook.com
 ([fe80::999f:88c6:d2d5:f950%4]) with mapi id 15.20.4649.020; Tue, 9 Nov 2021
 11:20:54 +0000
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
Subject: Re: [PATCH 2/5] mmc: core: allow to match the device tree to apply quirks
Date:   Tue, 09 Nov 2021 12:20:44 +0100
Message-ID: <7266463.CDUcQxx6n3@pc-42>
Organization: Silicon Labs
In-Reply-To: <9e68e3d23e62a78527aabc1281f89e15200c7d09.1636455548.git.hns@goldelico.com>
References: <cover.1636455548.git.hns@goldelico.com> <9e68e3d23e62a78527aabc1281f89e15200c7d09.1636455548.git.hns@goldelico.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-ClientProxiedBy: PAZP264CA0037.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fc::7) To PH0PR11MB5657.namprd11.prod.outlook.com
 (2603:10b6:510:ee::19)
MIME-Version: 1.0
Received: from pc-42.localnet (37.71.187.125) by PAZP264CA0037.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fc::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend Transport; Tue, 9 Nov 2021 11:20:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 639752e5-8b67-4932-2570-08d9a372fe56
X-MS-TrafficTypeDiagnostic: PH0PR11MB5644:
X-Microsoft-Antispam-PRVS: <PH0PR11MB564443CC94ACBA4961EE042593929@PH0PR11MB5644.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NHX5NhZG0k08vVlsI3WPtenmunp6Ht2dVcjve/T7yeh54LoagvpZCGSQE2qiLIcjXWP3fQ34X75ecWL/NeZ59hTQIpBXbe3fO2kNfrkCOrsgMM5fBrm6KAFGepJhjGXSMclD8hG4jebsqkXhfIcK2ld6gq1+zIpvE8UV0pTQDd4VONA8Zvh+3ZuQjpQwik2LYxY2DfAYgJmDH07H5QUmWG1FDUJwjK9dj0sURL+9XQLeWT22ebvHDX5NB/4VfxnGwuexpGnZiP2ol2m4ZXG5jU4bcCe3kKdvNVFTeLyShvj+CZsQOH9N4vbchB0aAHDbFSezQrL4YEvo/meDdrz5f3vCCn15yD8MAcrreW8Fb7EI+YkYuhp+5Spp3jsfnhPShE5MM+ihN0hNY8eRNi1rrTQxEoRzbHgaK3q+K8ZcV5Nk/xRlisTAl7UPsZpyfzlvYFI3V4eW9KoMJbKDRYeav9Uq24Doy8zU4nn+h2NF/+cJWQBaF/iEjSTuFCBuC48XsZI4+p2i0ePoRCDleZEzwg/MofDdH+70Oddbj5lHrRH204bto1UgN9YcIjgdViIKluJUgY4Ymtjq7fRi8V92t4g/YfdSG+SOT2YIvWQFdeIdS3VocKzr0xifDEiIbIh1RE6O86cjINycAodqLduYI7moKVDGY0MLgJENLRhRI8Lgj0hfh05NZbEdA8bWQKtZ5XWnbgggTA19HCmEHzpqzoikiTDcBY01jlhF/1rIxvXerlLTE7E6SY5syR4wsz8Z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5657.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(4326008)(921005)(36916002)(508600001)(2906002)(86362001)(956004)(6512007)(38350700002)(38100700002)(5660300002)(6486002)(8936002)(7416002)(6666004)(33716001)(66556008)(26005)(316002)(9686003)(66476007)(4744005)(52116002)(8676002)(186003)(110136005)(66946007)(39026012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FAtIb5Wqt1JtmH7J3MQtpzTcuwWgurQsbvipCXUsovtPThn2TulS3SkG/u?=
 =?iso-8859-1?Q?XisbHF/2qjqfAjXCYSQq/NJ6/xNT9FzW74hMr7cPbOWJnUmYF7I7UPCIv0?=
 =?iso-8859-1?Q?zOUmY0SkeolZCF5Lv6xUbjEar2Wh01FDbCb2L92RkIjivHKQbJa571W0HF?=
 =?iso-8859-1?Q?tA4Tzcf8SJzWAbGG4C8V3Zs5Qg7dSfscxb1IkzueeKEVejhVJuQ1RQwg7p?=
 =?iso-8859-1?Q?JUZS6ZyzK/wS4S3kMBGWbI7NwKU3MMPr0OVE+vK1J3FuLD3z+0o+rzGEy4?=
 =?iso-8859-1?Q?En5cFc7dxP3l1Jo6tZNRlm5ezxnB1Bp4XdSbm/pFEbC7o/uuVzRif4eP6/?=
 =?iso-8859-1?Q?wOoJ0j2JwahxtJl/I96i1Uc8lNYzI6+/P1NJ+w91aSLCGfYdjJMGPHueeC?=
 =?iso-8859-1?Q?ul4FFlHwHY1jzisoWaeuHkUXhtq+wSqXYr92eIMhyqjVRpbgai8NHjUZki?=
 =?iso-8859-1?Q?DKtth7VSahSlGqoz1PEAxBQVCuBT4XJcdhJrbtjl1ECvlBdcHyFnBEQMQy?=
 =?iso-8859-1?Q?NcsyMZa3XSY1JvS+V9e/Xi5hmIajJ81fUzFDwU6YL/iAVAPabjnjyLqUKY?=
 =?iso-8859-1?Q?7IRd2dAggGTp7HG1jYO6B/q5kTUL5VnHJ4gyjreZZtJUe3G0pFjz3U5xQK?=
 =?iso-8859-1?Q?bQahBKo5SWBGJLuE8Kr8BhtSdmlLe2NdMnWWz4LAHBLlHOnjJPKVHfZNu9?=
 =?iso-8859-1?Q?nRd0/xgS2D+zIHPPNwsLItwo5NnZPSHkbt+pPRQh0/sOGCFSExy1WARf65?=
 =?iso-8859-1?Q?V9lS4BX/V/2vLKLvWAnblJcnUJFfZ2Cfj/UTpvlPf+S3zDf9joVlu01DXl?=
 =?iso-8859-1?Q?LH3Ms8jqrJ0oF16cLPCjyXXLICfxwphTiVA2VMtVrRAZtKqrRN8SNaNWz0?=
 =?iso-8859-1?Q?acemrxZ82PSvWpHiwuiQtib6EQqf7SBpNhSsa3x3M0AppLcD122xzeQl28?=
 =?iso-8859-1?Q?RBf6hosgeVlVXK15R1Nf0kW1UWxCSb9LG6T5S6Vk117uLrg7cY7MMPeNxb?=
 =?iso-8859-1?Q?kQW7RGgntXZ6143bnEFWei4sH1WQFZTq9AYj2lr0Tjm1v7N6y0XkHLjwBE?=
 =?iso-8859-1?Q?RwKbL6mxLpSke0Sh8v+BTAwY88HemDIuniKSDcDtl84NizesW+RSe3Tt8c?=
 =?iso-8859-1?Q?N4aP5XEkNr32HSHBQEGfZVMNFvQ8EdpKn3iSPdVJqRzpAF7dShj9sLWcAI?=
 =?iso-8859-1?Q?9zzJAkrRm9XqfDjcFDsiKNY0oINvXFTslD4VzXt4ZxH/ah+/42/b2/uFrn?=
 =?iso-8859-1?Q?yurJG2nWwrsjiAMO0XpqCCTccdu/D/qJygnKg2JSD5+gMOslk8Vt3D8He4?=
 =?iso-8859-1?Q?juzI4RYj5gkCCV7LMiukn0NTw+wqzEmP0u6NaTA7DvsvtkX58gTwY7xdju?=
 =?iso-8859-1?Q?dXZSWvcBQZy72T2E9ug0kwVF405iebJfLvI36FYeIr00ZN4GFFVs9Ffms0?=
 =?iso-8859-1?Q?t+jMuyDzPvA4yNN+JeIta1X57BUG1SLtLU07FdHNCAXZXrnQn97TZDan1j?=
 =?iso-8859-1?Q?3cfSMoOyn1zTwbtGJH8Fg+SJWvFyLApzZK+c0uiCRe6ua+l6vZoZ3cpxSY?=
 =?iso-8859-1?Q?iio/+EVuxIWTZK2bI88Wf4THmPEIG4aJMQUv0TVQHOYiScU1DOoYorVkXG?=
 =?iso-8859-1?Q?XQDOT3HwcgPzZOnntG571+d60S222xpO1J3mVaBUYYI+IlZFqjcy7Oi1a4?=
 =?iso-8859-1?Q?/WMfO4tuwL8RXON0abM=3D?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 639752e5-8b67-4932-2570-08d9a372fe56
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5657.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 11:20:53.9737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izfk2QZMppQRC/VmqYjlGIrLmkB6vPX/mb3g2NMaSvoiES031xGs8IdA+cM3YPn7zHA6Eot/tcpQo+pI9Zpe8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5644
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tuesday 9 November 2021 11:59:05 CET H. Nikolaus Schaller wrote:
> From: J=E9r=F4me Pouiller <jerome.pouiller@silabs.com>
>=20
> MMC subsystem provides a way to apply quirks when a device match some
> properties (VID, PID, etc...) Unfortunately, some SDIO devices do not
> comply with the SDIO specification and does not provide reliable VID/PID
> (eg. Silabs WF200).
>=20
> So, the drivers for these devices rely on device tree to identify the
> device.
>=20
> This patch allows the MMC to also rely on the device tree to apply a
> quirk.
>=20
> Signed-off-by: J=E9r=F4me Pouiller <jerome.pouiller@silabs.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/mmc/core/card.h   |  3 +++
>  drivers/mmc/core/quirks.h | 17 +++++++++++++++++
>  2 files changed, 20 insertions(+)

Reviewed-by: J=E9r=F4me Pouiller <jerome.pouiller@silabs.com>


--=20
J=E9r=F4me Pouiller


