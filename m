Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FEB941D1A1
	for <lists+linux-omap@lfdr.de>; Thu, 30 Sep 2021 04:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347894AbhI3CwB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Sep 2021 22:52:01 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:2865 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347891AbhI3CwA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Sep 2021 22:52:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1632970218; x=1664506218;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=kRCPIMyPIcHaFO3W2JZRibhvRYFEtz4YoFKUL+l7wmc=;
  b=MmGtm2JSd7ubTG8WiV4zYeRm1o33mctoqQ+RQhezXBUBywgyR99iqMdy
   x16PpBeCsnAsIcwue6u8RJ/O8e48YL/4FLp2R03RWzoS1mfdyd3ze+9Ix
   FhsYKJ9w9/HddyJVeEYUceDMXtBLGJGfhxx1T9VL9JaI526fh87TJTBOZ
   KIgXwZSKRtLFg9zshia0STCBG7GqYQvvSGBCZcMFFIEWhLSK4ZygWZxxn
   Dp98CDSpQkvo9SfN3hXr9hsSYaQfKfZXfHmucIm3eqycEyshVjY77/EXB
   Qubxm920vYSWp6ghXQcMdKn7KbU7c7s1XgD1klMGlrWS3iDy1Z6JtsYQl
   g==;
X-IronPort-AV: E=Sophos;i="5.85,334,1624291200"; 
   d="scan'208";a="181387537"
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
  by ob1.hgst.iphmx.com with ESMTP; 30 Sep 2021 10:50:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Am9WKF53m03lzmr4XZx7AdFnU87zXBkznJuhyFbkKTO5UUOf1ikVY6lNYFAabWO19YEfGQIKq6ODJV1gVA52vbqEI1CNJ12THF6UrQNsgv6wMYXzf7yI7PccIPmy6XsK+44nfHYCfg+txCO40B383bYxBFcLqPeRV3CgvDlzzYCRqWKXRnMtO6+ypXIUiXPGeeojMdkEITCUiORpG6vA2ie/hWtUEc0O1IF/cuSuO9P4mZSSVS+fB6DC76bkjWgq05Mcm73Ajoz0rkmS/gn4kqoDdhTXMHko7Pamf88KSE5H29rHs+Rv6d+bSxyojiy+iRmsNqFv05BP1/axVGpk+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=PQbQU2DssIevzFmhF28QrI2qy/TSwYckX7lUULGRexo=;
 b=P4ruO14AFwN8wgI6HsBOfRg2xUCwK72Sl4ixNHLycNYe4VscB5cCB6JolQ8WQhuL9EdJSVLVCw0LktcFa0E9js3z2Kc9pZJlWGUN/gk2CSxcXq6oS5egunoaOhQU/hjfMfP18Z9I3f9iszox237Yhezh1gTOyBQFE2Y7VozxzyIAfSaxosY1+9RMtwLG+gJwkwMP6p+DJl7fcwWsR6SbZX+ZL5WCACwiDd2YjukB8zjghmRY1umC3EFhKY5wsSacFw2JKwB6hnI0JNqYqePVOpDJYFOGglOhQLQR4SnhpNpiirF7tqBSt+NaleGQZ3bPTcNOFeuVfVmg1hIbKfV5CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQbQU2DssIevzFmhF28QrI2qy/TSwYckX7lUULGRexo=;
 b=YXV/RFwsKZdflGWk+fta7EVUwxBALKjiwED9dBh3IA/HZuiDoQ4NrPia7+Sup+1TT1WRuocpvsM7risb/BjA7JUzMDWg8OlHy/6NWdSY9kCe1bGAIWg16cofc2JcOtNMuxA7eiszeCO80KpPgHDObB/k/TF3E6CeliCWERFHWDI=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB6606.namprd04.prod.outlook.com (2603:10b6:5:1b6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 02:50:15 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::7c0e:3e95:80d3:7a70]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::7c0e:3e95:80d3:7a70%8]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 02:50:15 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Saravana Kannan <saravanak@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "kernel-team@android.com" <kernel-team@android.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 0/2] Fix simple-bus issues with fw_devlink
Thread-Topic: [PATCH v4 0/2] Fix simple-bus issues with fw_devlink
Thread-Index: AQHXtMYHtS6fHXMugU2E5Mhb0ZTigQ==
Date:   Thu, 30 Sep 2021 02:50:15 +0000
Message-ID: <DM6PR04MB70812E56DB9CB8CDC63C6535E7AA9@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20210929000735.585237-1-saravanak@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34049619-4b3d-4422-8742-08d983bd0809
x-ms-traffictypediagnostic: DM6PR04MB6606:
x-microsoft-antispam-prvs: <DM6PR04MB6606C63FCA145D7D084DE5D9E7AA9@DM6PR04MB6606.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OQUVQQLHrwxiHe3t2MqBGq6yyEvOQ8Tmyvn//TAiZUiRKJRCMciI7EGGzQu+Y9TH96kBViVXT3aCunVKUb2sXp4Wy5+apenAPYt7WbJMwwbuPZ5y++IioemVCYpW6jMKcpJU3JxvSg0APFO/re5CpMRE6yI6kLbyCpzAu6LcFDAvG3XLz4QbOaY5S3pV9IEi3e0bcR6kBtyYbEWslsiprL9xFMQKD9jyDzMQhCX4t985a/zvhCBG7ADc1h733XCoyb/vUFRUq051HHpzsbeLAvVQEDARIzIfgxK4G2CvYJ/6m+PXwFeeIQp+a6i21QRXMegvlQ3xgDIjSMQir39xat8fvN7lp1Br0/SOF8pHLHxffn9FTfHt6UmysbBJz49vtL81Da38DR5iG0TMoS7ZTv1s8PF62pDlpc61qQPkuP8lw/Vp+nVZdcLfIVzQIq+4CSBo7AivXb1KVUFFN/bphrVlhJHni3L23dvB4Xmv4OEmZGX6N39e1a86/vVypbLfoaqzSvjxLggmLHN5Pq3rVBWa21WK7Ke/mDk8SCVIPCtptWzuHJEuy2FvYrTkjDH6/7O6sxg/6qhU/PLs/RUMQky0ZXV75VvmeP4Qe8Hl2rbov0APjFfu4rrb37SARChTCjBZxouPD4sW+71a1NgApV6KV7O9xjDsVE0dB/d5jM/7IhCkwav9CGLMHLiJY0vSaT0xh+Ms4sCS2fOHf0/sYEKE4yEBOrWSe1Ec4tjZksZ59lWf6XGE3zIBRijhX+aAeAb3hw8+PNg3JAeO4GXLc9pPHvZda1jYYhYl+ATbuus=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB7081.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(76116006)(8936002)(66946007)(91956017)(55016002)(6506007)(66446008)(53546011)(9686003)(64756008)(66556008)(66476007)(83380400001)(186003)(7696005)(8676002)(33656002)(38070700005)(5660300002)(4326008)(38100700002)(122000001)(2906002)(966005)(7416002)(508600001)(52536014)(110136005)(71200400001)(54906003)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?X06IkIwWxMM7yc2mQIHgNDQg9N4auO6KR+lBimA9/FRi7v7LV20HWLzYmZtA?=
 =?us-ascii?Q?oke97pxxbAKfLRYLWOgAM0gf3tezDH1/mU7R+a9rjVJoSytLXGXhwqV0aDFt?=
 =?us-ascii?Q?9PcHC+Vm6xOeF7aucPbRQxFJzdRBtNPzA34vPk08esOZ9U1PLvQstojthh01?=
 =?us-ascii?Q?fOFFn08yf+lI71MaTB7rwqktqiZWn2imSi++f//PKYK5tX8ntXmVlXI1Ffuz?=
 =?us-ascii?Q?oAl/9yoyVcJduAwaIrxjF4qfjE1vfwM/Xs6wonevHBcAfqFSUvKaKzdbfGVe?=
 =?us-ascii?Q?6QlWPuiyZv2DSYaq8VFVDwq09coHdkNOSaB7WLNpcRP3dewu/VCAzlPRXJul?=
 =?us-ascii?Q?UQu6U5kH2VLO/MRT+VKhb6Tsuoyq4nvPUAhYZD75mAYVtZ+lXdQBlHsbjSAs?=
 =?us-ascii?Q?aOS5EelKGXN6hXswTbVL5NXaThwNQYyKY57aT0d23SHmC5rGoin6vWnGxDQE?=
 =?us-ascii?Q?l0zC/NiYlJoR2sIQDDVfqttHO0u8FccS7B3RffbfwbiosUr3uG5bbjKkWkRq?=
 =?us-ascii?Q?bW0QHxH9bH2HZP/O2sxa+sXLCh1xFDGVGAvFMRqeSmnoz/GAyJdns2WQ2rI9?=
 =?us-ascii?Q?4fjQT85X/ZXvQq+fzpSIvc5cXLz44OR2Vvd/iD2k0fMo0yEqYefIPmYzeqb5?=
 =?us-ascii?Q?SY3Zjm4lejQOQDdnMCrkPXAaAQN1Acnjm37M3PF/3hD0Svl2Q1CD0zbu2Kt3?=
 =?us-ascii?Q?3wByf/B08heGk3oplQlErDYy9Cw1YEhkIQ/aZ7FbA1k1icdSpFjcnxLUVulc?=
 =?us-ascii?Q?DxACExBcIrj8i2HmCZ3dUypEWisZ7gLu3LrapImRABo9UrszLHX5v56aVT4i?=
 =?us-ascii?Q?AiuDUrt2O4aWTNe/UezdVfJyn7SgXt41J0Lh2m5bOmwrMpNeg/4PE8QvWdoY?=
 =?us-ascii?Q?6P8Y2Scx1UPcmi4iyi8FTcn8XcMHfx9uWYkBTVupVS9KVWZ68GNgrWHGQ7oK?=
 =?us-ascii?Q?9Kfsi9pxeLSUm8sSF8s6jgxBX1cot13yxKAY+DIhzc+G1k1X7ASlsVyCGhxC?=
 =?us-ascii?Q?xWbCvNF/HWwu8WnUz5NDKLy8+p/RbZ99xuCmBfeq37C9S0Ar0jFmNDlwxLCG?=
 =?us-ascii?Q?t1GX4V4SggCws6EyemKyEA85QA7NMJ1aTIi7HvYNRnT+jqG3yFfUuBLgvxiO?=
 =?us-ascii?Q?u7yTlHqZFq5rpbkIARiezkDj9SvVAt1YG336Wy1urZWkVXNhvmksNEyy+2aR?=
 =?us-ascii?Q?eHSEQmMD64NkHkbmLbOufPntu1KhZXGnWbVYbI7IX8i/3dh93lbfumoYhN6Z?=
 =?us-ascii?Q?UI2LpRIVfSv5nzM5oidXR1VZCAdFEuZKa10kACutokw765IM2hQnRpbRgrXH?=
 =?us-ascii?Q?IncI7Wyz37gR5C/HbF8KWaOkH2ABioClp0gMWWsgfGZCATUUeytMiTuRXW3n?=
 =?us-ascii?Q?PQ9GLakb6gnVpH1ofbIIVE0xi4FoW38YePsoTI4ksSdfyq1srQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34049619-4b3d-4422-8742-08d983bd0809
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 02:50:15.4713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CpA65XKyKOZE+IR9oHD6IBrsjq6KUjT4cKAH7796pVnlZdabKm0hFS0U1/PEYafTTZ1Ba04o0doAOrF88N1QEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6606
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2021/09/29 9:07, Saravana Kannan wrote:=0A=
> Ulf reported an issue[1] with fw_devlink. This series tries to fix that=
=0A=
> issue.=0A=
> =0A=
> I replicated a similar set up on my end and I confirmed:=0A=
> - A simple-bus only device is probed.=0A=
> - Another device listing simple-bus as a 2nd compatible string isn't=0A=
>   probed.=0A=
> =0A=
> v1->v2:=0A=
> - Switched to probing the simple-bus device instead of marking it as=0A=
>   NEVER_PROBES.=0A=
> =0A=
> v2->v3:=0A=
> - Moved all the code into the simple-pm-bus driver=0A=
> - Addressed Ulf's comment about the remove() code missing a check.=0A=
> =0A=
> v3->v4:=0A=
> - Added support for driver_override to accommodate the case where new=0A=
>   transparent bus compatible strings are added to DT, but the kernel hasn=
't=0A=
>   been updated yet.=0A=
> - Added/updated comments to give more details.=0A=
> - Adding Ulf's Tested-by that he have for v3 (v4 didn't change by much).=
=0A=
=0A=
For riscv Kendryte K210 boards:=0A=
=0A=
Tested-by: Damien Le Moal <damien.lemoal@wdc.com>=0A=
=0A=
> =0A=
> Thanks,=0A=
> Saravana=0A=
> [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=
=3DzrkOVxHHxBmQ@mail.gmail.com/=0A=
> =0A=
> Cc: Ulf Hansson <ulf.hansson@linaro.org>=0A=
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>=0A=
> Cc: Rob Herring <robh+dt@kernel.org>=0A=
> =0A=
> Saravana Kannan (2):=0A=
>   drivers: bus: simple-pm-bus: Add support for probing simple bus only=0A=
>     devices=0A=
>   drivers: bus: Delete CONFIG_SIMPLE_PM_BUS=0A=
> =0A=
>  arch/arm/configs/multi_v7_defconfig |  1 -=0A=
>  arch/arm/configs/oxnas_v6_defconfig |  1 -=0A=
>  arch/arm/configs/shmobile_defconfig |  1 -=0A=
>  arch/arm/mach-omap2/Kconfig         |  1 -=0A=
>  arch/arm64/configs/defconfig        |  1 -=0A=
>  drivers/bus/Kconfig                 | 12 ---------=0A=
>  drivers/bus/Makefile                |  2 +-=0A=
>  drivers/bus/simple-pm-bus.c         | 42 ++++++++++++++++++++++++++---=
=0A=
>  drivers/soc/canaan/Kconfig          |  1 -=0A=
>  9 files changed, 40 insertions(+), 22 deletions(-)=0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
