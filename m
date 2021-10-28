Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72E8543DD60
	for <lists+linux-omap@lfdr.de>; Thu, 28 Oct 2021 10:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhJ1JB5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Oct 2021 05:01:57 -0400
Received: from mail-co1nam11on2073.outbound.protection.outlook.com ([40.107.220.73]:45217
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229791AbhJ1JBz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 28 Oct 2021 05:01:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxTeh5v2JKUGXTQZqE3NT5pfisEkgyDW5MjHrFVeRxl2/C/iW/Gv5OaFwCtIzPnzqBReyFHEMVZEpvFfcM0EmdorrPWX0fiZBhv+jVn+tdgK3J0NgchEhCJMHmuyJLI2l2a8ZYwEuJYeojbXuG9eBTqbIlf/nF9kLWTgCn5vDTAeOW+7weUhEqnANkB1KEpMlZ5otvvg9QxB2iE6KGL1Bkj+znIkATBYSybt2jswlS9YihVEowz/FPih7BH8yT15xCkO7HP4zf9RFuWTe09e1Iyqkb6Vnf2o95YSzUgcO+7JZdt4JYXjDz3yq8yhB6tw1SJiS4BKDW3yOZUfKYc8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMNKFJ4oHHqQ0aofXt/zsA6e3KSUrbf0pUcq4sUB1gA=;
 b=coL4XSBFWexKj+sA42yLp+ODVAYp5TN/dZIXBQU0Tw3tJgcfSuHOMkW7Ts8Dv+dfXSpoZ/ZQ0MlKn28ByOEYmGAFrxyvkQU8NJ0WOROKlYokYvcCee6+KdJH4frYMVZ+6uC4e4oCk9SbtVSXMIa9F1L/HL9dcMUI5B4/KjzJABvTjsiZvoBA5FPX3NMIEyMkttrvk/702AGkc1GTObj7Wth8ae8sNCyZCmCdPLeWS+1GW5tLhmy2yBei1Oa/WJKxO7d5rBu6mgpLMo1q4Qm9PhpIC4uS8FD1HS796xfxFnbgRpDnG2TOWoNbx55VJrxADAldLz3nn9oNlOszzdfFIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMNKFJ4oHHqQ0aofXt/zsA6e3KSUrbf0pUcq4sUB1gA=;
 b=PA60R27B1paoJmdYViMd+nY0aGEANqAR34cDrqjodt5ESCHzssl1oeYfLu+q63SfGaxJx2TxP4xFtqmIxkkTHzWR0ZTzfOYjqVRizuVkLENbcqXqahVFgqO5nVN8Gt5NRQqpXYY3CAHfZrVPOMRkY7UbTjA5CLpPgNadvDBmndY=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=silabs.com;
Received: from PH0PR11MB5657.namprd11.prod.outlook.com (2603:10b6:510:ee::19)
 by PH0PR11MB5612.namprd11.prod.outlook.com (2603:10b6:510:e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 28 Oct
 2021 08:59:25 +0000
Received: from PH0PR11MB5657.namprd11.prod.outlook.com
 ([fe80::31cb:3b13:b0e8:d8f4]) by PH0PR11MB5657.namprd11.prod.outlook.com
 ([fe80::31cb:3b13:b0e8:d8f4%9]) with mapi id 15.20.4628.020; Thu, 28 Oct 2021
 08:59:25 +0000
From:   =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jerome.pouiller@silabs.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Avri Altman <avri.altman@wdc.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bean Huo <beanhuo@micron.com>, linux-mmc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: [RFC] mmc: core: transplant ti,wl1251 quirks from to be retired omap_hsmmc
Date:   Thu, 28 Oct 2021 10:59:17 +0200
Message-ID: <2013308.OSlt1BDEiP@pc-42>
Organization: Silicon Labs
In-Reply-To: <470A96FD-DB24-4C32-BC9F-AE2F617FBF2D@goldelico.com>
References: <8ecc5c79c1dd0627d570ede31e18c860786cacca.1633519499.git.hns@goldelico.com> <CAPDyKFp47sAXhM2s5HOqV2wLf-kYRhdqSdzcn7a62ZW23SSPdg@mail.gmail.com> <470A96FD-DB24-4C32-BC9F-AE2F617FBF2D@goldelico.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-ClientProxiedBy: PR0P264CA0277.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::25) To PH0PR11MB5657.namprd11.prod.outlook.com
 (2603:10b6:510:ee::19)
MIME-Version: 1.0
Received: from pc-42.localnet (37.71.187.125) by PR0P264CA0277.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend Transport; Thu, 28 Oct 2021 08:59:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e74c73d-dbaa-4f0d-0c33-08d999f13dd6
X-MS-TrafficTypeDiagnostic: PH0PR11MB5612:
X-Microsoft-Antispam-PRVS: <PH0PR11MB5612835835EB0956E6D8A3EF93869@PH0PR11MB5612.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HByCEgUGvmkPk21NIjxeVb2WwcG8/zGFKNj7aJ6ZFwZgDMLbfgcafwovbBRwkPNTN+TyOfYtN5wbU+3SQJenbEPYbfAJfWLK11sMQmf95AXYXHCe7D4NnQhrKh51pQNsF9iXyKs6+4XnEv2vFepqbE93Hfnit4Xrd23yIZXo8jR/1aCklzXnvyijzT/1oYqLxtdX1y4aDF/BSBYhLmMG6m2VkdIbXwxpe7Dty3wyx2TJMIx61n8S3lllcOHnbmr/z8cBOXO5IkcLuBQZ3FyIz4GTrvKDHlnc95VFUtU8AeSG553cNFO6LJrPk8qbOzO+c8NCniWH34+96zLYwlmfdZdhaL9w7Zd9oMFGuyiByEeRZvenhtEMT5rzdMO6Px/p6TnhYMvcjjrLjdtS/QTeFBa7oXGfHcIfXdZdl9SoWJzspenj+q1vtgbdvcQm46HW3JrSnO/TGF+AiNdxknK1hhvF1qrKV4zTsyGRRel/rPtgtQX9mAmqxTmrXattMHj+2lHf5zbb7XE9EafCSaLpT4QqENr1au1/0ViBY2HZ5wMPBnEG64ct6VKaV0Fmqdm7xPcPjd+jqK3HAhfBy7c9M1eEu+rlb+23IL4xfXZPF70TeBiKTFSUMAFhbgXSfsdGUfqCgBZtC5ovS8Y61ntQuoD/oGAh+/krxVJx1d2sm4fLj9GQ5lETrXGHyeNKE1CKdXktDioVbS5nFWTNh6+pPhw10n95eth6psB8tKbzj2w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5657.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(66556008)(66476007)(2906002)(66946007)(186003)(9686003)(26005)(956004)(4326008)(8676002)(8936002)(6486002)(316002)(110136005)(52116002)(33716001)(6666004)(83380400001)(6506007)(54906003)(6512007)(86362001)(66574015)(5660300002)(38100700002)(7416002)(36916002)(38350700002)(39026012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?E44jxA7hC6DyuP1CzC3H5zdE3FwtW6VaXTA//l1JsL5cEssQLfWicUQqU5?=
 =?iso-8859-1?Q?gdeRC1kJrbGYkUm+dp+Qj2StSsPXqBnLZ8F20/z5vVRbVvopA5ZixtkGaY?=
 =?iso-8859-1?Q?17J8Hrou2sigo3ePPooRCH9d4Tx804bD9DJB4gTs+u60d/+lAMs9Wd78Vu?=
 =?iso-8859-1?Q?JTdYvuVJIbbCw8Pvusld4yCH4nTQ/Cs0YGfpVNXAMTD2uzIptTOHW7+IIH?=
 =?iso-8859-1?Q?gXjM2gGvshFt76o1COUxi1KRDMSVhaa+y4HlkRByr02vS0fIajGhmCcAcf?=
 =?iso-8859-1?Q?PBxCew3tZ/pAiUfauVySincaFCi0VQMmbxE+CdtsVYyOkuHhqf2+qr3Ybo?=
 =?iso-8859-1?Q?hpzGHXQDJWeMa16rOp7/wfWI93ppSGY/8IPkgSjJ3yLGE4s2mAuWek0LJT?=
 =?iso-8859-1?Q?Ve+aJQTPqJmifUgOmgojq+JjABsteJSz3Iinj9zr7NKu5mKE2U4zG2RV0s?=
 =?iso-8859-1?Q?LBv3mdtAd5lfWtQcCtTG9rDbwAZbNBmNJCWng5EFas6ZPwYLNg27W0l80q?=
 =?iso-8859-1?Q?oEX7C1pYYHnJoBCYJdnnCQjdgVoctDQyhnAeZ0sacTvDzNe9WHPJdqLBww?=
 =?iso-8859-1?Q?2TTqPlC0U4f5/gVuo8iCIQnrcb+i6fWU72rl30sn0Nt6dWReouFqy5nJ2z?=
 =?iso-8859-1?Q?HW7DiVqRXQr+qPX9ZD9os0IOp7kcYpOEBtk9JtjtNbX/+oTOvklI4Ca6l0?=
 =?iso-8859-1?Q?9VUc6OvF8B7JDTTLVmhThcEjEdxsb/7rptrw6v70naFaOiul0e04yFrgth?=
 =?iso-8859-1?Q?CqaXw2a6xvEVUAdaSQ7gHoi8cY5YSo8t8o2w1z8Clu97JYs6kO9p6Ggcxl?=
 =?iso-8859-1?Q?BAGmRYMy3osHXoCPFnmeGP0vT7e/bzP7zpbmP0fZtSbaiycWl5Hnu/z/8f?=
 =?iso-8859-1?Q?G4wjNDphXQ5/FsO2qHwUlRajhjmE4v5TBz7T9MstnDkuXCm2uhjI0/3xyZ?=
 =?iso-8859-1?Q?fs28YYhzZ4mdcRmTD4uVd0ahjkMCmyktBDb0EWONNnS5qLHgxWmvMVdLtA?=
 =?iso-8859-1?Q?Kydin+JaOAYMKmOOLheNlUVVk47ZaCeR4upwTjp1U+C+oiDVtPXSgXQQYT?=
 =?iso-8859-1?Q?6dY4qKvbHchtYoxoqjVm+j04gjUi4Mo3fXt1hsFGyuoUDUQlRyJz05Et4f?=
 =?iso-8859-1?Q?CMzvtj2cZPz1h4FSVeyBWYhHiqvxAS4swNn+RE9ev9DYJK2m9Xfaxk0xHN?=
 =?iso-8859-1?Q?MrpeM5X+weZ3UiFqmcEaDyb4qN4GOQNwfmMSzWBP/ZUvWLLpFp5sgweAz6?=
 =?iso-8859-1?Q?HL1eZsjvTGNBSC9+gPgR4wWxYZ9GST7LwemkW+BtzfT/1oDqTtA3J/HW20?=
 =?iso-8859-1?Q?ivkDknUWMoISik8+tXtWtaP5js1dfDxbtqEJ9OoHqr9d4VvuUkiOf4FpUz?=
 =?iso-8859-1?Q?Obq3glXkjdFsaAQi09GFJ7SFIpm3gbhfQZGmLfKGnKvefuNQAia+e4GhCs?=
 =?iso-8859-1?Q?qdJh7JCL+dc0tjRaMNrPI6KwUlYuwu06p9zYbmHZZqZb7xu6dhmGF2dNxb?=
 =?iso-8859-1?Q?WmLCO+xV3fIIyN0MvWle3AoszldaQQyHcfrGPFtu8j4IrOJ5zzJTNhhtkt?=
 =?iso-8859-1?Q?FgHK++aQJTUtS71iQr5LLoOFNVza68igiDYrgwV2ftYGsM1MHVyCoT0H1e?=
 =?iso-8859-1?Q?JBpzdtx25m3dzI5bdmIZiKI/1Mk14+oF3rUELIQnVACoj179wi+LwMs6yc?=
 =?iso-8859-1?Q?zYSHNgqq5FWilDWgiY0=3D?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e74c73d-dbaa-4f0d-0c33-08d999f13dd6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5657.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 08:59:25.4914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4cYu0UTUPfPT6hBG0aLZllb2tjRXqtxrtcIu4wy0mr2/u35yLy7uIbkjj+RbR4eAonl9bUiQB7U64FdAxDSBkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5612
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Nikolaus,

On Thursday 28 October 2021 09:08:50 CEST H. Nikolaus Schaller wrote:
> > Am 27.10.2021 um 23:31 schrieb Ulf Hansson <ulf.hansson@linaro.org>:
> > On Wed, 27 Oct 2021 at 19:01, H. Nikolaus Schaller <hns@goldelico.com> =
wrote:
> >>> Am 26.10.2021 um 20:08 schrieb H. Nikolaus Schaller <hns@goldelico.co=
m>:
> >>>> As a matter of fact, the similar problem that you are looking to
> >>>> address (applying card quirks based on DT compatibility strings), is
> >>>> partly being taken care of in another series [1], being discussed
> >>>> right now. I think the solution for the ti,wl1251 should be based up=
on
> >>>> that too. Please have a look and see if you can play with that!?
> >>>
> >>> That is interesting.
> >>> Yes, maybe it can be the basis. At least for finding the chip and dri=
ver.
> >>
> >> I have done a first experiment.
> >>
> >> It seems as if the series [1] does the opposite of what we need... It =
just
> >> skips entries in struct mmc_fixup if the DT does *not* match.
> >
> > Ohh, I didn't look that close. In that case the code isn't doing what
> > it *should*. The point is really to match on the compatible string and
> > then add quirks if that is found.
>=20
> That is what I had expected.

Note I have not tested this code. My primary goal was to submit the idea. I
think I will be able to send a true PR next week.


> > Let me have a closer look - and for sure, I am willing to help if neede=
d.

I confirm it does not have the expected behavior. !mmc_fixup_of_compatible_=
match()
should be mmc_fixup_of_compatible_match(), sorry.


[...]
> >> What I don't get from the code is how cis.vendor or cis.device can be
> >> initialized from device tree for a specific device. As far as I see it=
 can
> >> only be checked for and some quirks can be set from a table if vendor =
and
> >> device read from the CIS registers do match.
> >
> > Yes. I thought that should be possible, but maybe it is not?
>=20
> It seems to be a hen or egg issue here. MMC_QUIRK_NONSTD_SDIO should be s=
et
> before we can match by vendor and device or compatible. But it can't be s=
et
> late.

I think you can add a new fixup table that could be applied earlier (as you
do in your suggestion below).


> >> Instead, we want to match DT and define some values for an otherwise u=
nknown
> >> device (i.e. we can't match by vendor or other methods) to help to ini=
tialize
> >> the interface. So in mmc_fixup_device it is too late and we need somet=
hing
> >> running earlier, based purely on device tree information...
> >
> > Okay, I will have a closer look. Maybe we need to extend the card
> > quirks interface a bit to make it suitable for this case too.
>=20
> Combining your suggestions we could do roughly:
>=20
> in mmc_sdio_init_card():
>=20
>         if (host->ops->init_card)
>                 host->ops->init_card(host, card);
>         else
>                 mmc_fixup_device(host, sdio_prepare_fixups_methods);

I think I mostly agree, but why you don't call mmc_fixup_device() if
init_card is defined? (BTW, mmc_fixup_device() takes a card as
first parameter)


> Next we need a location for the sdio_prepare_fixups_methods table and fun=
ctions.
>=20
> For "ti,wl1251" we would then provide the entry in the table and a functi=
on doing
> the setup. But where should these be defined? Likely not in a header file=
 like
> quirks.h? But there is no quirks.c.

I think you can place your function in drivers/mmc/core/card.h. There are
already add_quirk(), add_limit_rate_quirk(), add_quirk_mmc(), etc...


--=20
J=E9r=F4me Pouiller


