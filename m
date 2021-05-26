Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE0D39173D
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 14:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233859AbhEZMUn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 08:20:43 -0400
Received: from mail-eopbgr80088.outbound.protection.outlook.com ([40.107.8.88]:30596
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232191AbhEZMUl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 26 May 2021 08:20:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yes2G3E1XU/TFxm9W30ntU5Mak/Rgt5xnok6R0TeYqvk+98dsclFPZsuAwAVQnRi6lk8UJW/SghzJ+kuRAQZU6n7VXlmpDmPtKj+iU0B9vEWZ6GIH82SZSM6bS/mX1IhAQyTCdmKxwLEkEIXsUgPfrNbXYghi82+0RdIwGgQ9S55N8Eu7ONZ6izxX+3JKgQYFEcwyq0zIZ9u15hTtw136AAP5b0/NbnmvSqngjMvXb4N88xwOZC5c/vN2Nq0PavhIFLHjsGMpPgkPeUWh62pYJrOPxq0GKR6zFpIZ06ojnDC4vjtbg1/cDCMOsSSpvI167BR5pDFLqBXmkglXPNcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woNuf8H/wtg9GucKg4MtHuElYqt0XKo7dDsnb8z4Dr0=;
 b=mESHnDf4tNcuC8nhcmY0N9gqjuPYeb1ff8gyEVMb71QW1SA5bi/jOKaIq6PauBCQcQgj70HeZmW4jhnQ5RVDED7FGXjwDaOTj8jCWe7OEdljSUNE5UM0plRSA5I2nafpQRCt/1ojSHB7sLqoYVRM/tiy4by1b6nmh2865mnTvIK4n6WpMWp3NsnaAjGXN045nfBYRK/YsAx+DYnstdWv+n4qJaA5p1HmRU4sBmuM8V/1hB3qc9gTYI/ebTYOrZQXXsT53j6D6/dmq266ay/bacBIKiZAtfZiMnFjK0+jLSUcJcf8w54fTXxB/RZcolM9AipoUJA/OSKppdUKZUQxdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woNuf8H/wtg9GucKg4MtHuElYqt0XKo7dDsnb8z4Dr0=;
 b=ZrQL8uZ6YJtx5WePVR4orVFtlCYHe08SjQpsXG9lgfp46J+IkzhPhCANlN/bypzS6QrnOTsFH90qcUXDc641sMuClFd3F+6aUGjf7SZIuSwtDOO2VdeCfCawoxUFE16t1iBjhKw6FOrsK8JhW66jEbzU53ef2QaRPzsPBcetCTk=
Authentication-Results: atomide.com; dkim=none (message not signed)
 header.d=none;atomide.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR04MB4237.eurprd04.prod.outlook.com (2603:10a6:803:3e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 26 May
 2021 12:19:06 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f1a9:a104:7d02:2efa]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f1a9:a104:7d02:2efa%3]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 12:19:06 +0000
Subject: Re: [PATCH 00/10] Rid W=1 warnings from Bus
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        German Rivera <German.Rivera@freescale.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stuart Yoder <stuyoder@gmail.com>,
        Tony Lindgren <tony@atomide.com>
References: <20210526081038.544942-1-lee.jones@linaro.org>
From:   Laurentiu Tudor <laurentiu.tudor@nxp.com>
Message-ID: <74eb170b-348b-1bba-432c-52c9541b05fe@nxp.com>
Date:   Wed, 26 May 2021 15:19:03 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210526081038.544942-1-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [86.123.59.16]
X-ClientProxiedBy: AM3PR05CA0113.eurprd05.prod.outlook.com
 (2603:10a6:207:2::15) To VI1PR0402MB3405.eurprd04.prod.outlook.com
 (2603:10a6:803:3::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.108] (86.123.59.16) by AM3PR05CA0113.eurprd05.prod.outlook.com (2603:10a6:207:2::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Wed, 26 May 2021 12:19:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4907c742-e5c1-4c1e-3a08-08d920407511
X-MS-TrafficTypeDiagnostic: VI1PR04MB4237:
X-Microsoft-Antispam-PRVS: <VI1PR04MB4237FC709BD813600B2D5DA4EC249@VI1PR04MB4237.eurprd04.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:72;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B0W9fsSypKOCTaySmZlYofCv5g9WV917k5nHwkfu3oODS7e2r3b9vRFcljzb1y3UywRPU6oI9TmRpAF2mNOxR8lc7jmHac6jZFeGqbc1AvbR8KGe8P4v056QhJIxoR1RI20NWrqXAEn/TQ1Znqa/89z/51ray9qm8ru8K99SzZYNWvaDkW1UEYhzzfbx25IfwJ37ucvjPtEGzauHOyh1pR0OpuI3Dyb+WY88jj12h4KNWuWraYVwHd41Y+/TUXdmWIvmpzIlc6eGRGVTiwRtM8EWH7zOI+sfVV2JsnM+jWSA9b/i2bijKcBOYceytVZQ7AoT0QYJDS1zbK9e0bo319dFnIHtP6eg1+xLKZYvW2HdakIqLmT8jQP8Grfs+eh0sAFaEyDw5fno3+fCPnhDLM6Bhp0PzHr8wv3vrlvLS/268K8u6sgM2d6HLUuRx+yDoHcLB0b+ULyKYPHOcfizA/mlcbWFWw7YkQ5ZmzVfMLlPhuikqfJFuxdSpCam4ygRCAMmE74iPY2xio+R9LcIgXhb1n/5s+rRGO8biTfXUfnEJg0PPH2EgoOU3Ru42+srMK806seIjmXAqB/lr6fyv4MVCvLDf2XdRJfWsf11uF1YSm43jDM7gAxjlRz7HjT5v+lGpOPirKORVYKnP05apsihJZ5NJRHss/9lDxhI6c6WFLgaCym1uVRPsWre8R3nFcduyqE3AS2IH8d2alRTg8r2l7O5aXu5nAZ3y3lqMEU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3405.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(39850400004)(376002)(52116002)(83380400001)(6916009)(316002)(86362001)(7416002)(53546011)(26005)(54906003)(6486002)(31696002)(8936002)(16576012)(44832011)(8676002)(16526019)(186003)(956004)(478600001)(66476007)(66556008)(31686004)(66946007)(2616005)(36756003)(5660300002)(4326008)(38100700002)(38350700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bURYaitYMFQrZzFBRUFNbzVtdWVkdDJ6cmdxaEtJbFdxbkptRUZLK2NyM2dE?=
 =?utf-8?B?VjZRNkIzdXNINklHTGo4cmQ2U2dLcjJhMzdyZ1o4dm1jTHF0czd4RGxDNyt6?=
 =?utf-8?B?N25oRitGS3hxYTJEMm13WlN2b01uVnY0QVpSWTB6SzltVmdZRVlqdE40Mjdx?=
 =?utf-8?B?WVFUaFQ1NG9FZFNNSm9DbzZCTVl4RG5UdURCTEdhMktMSDJpMWJqU0VmTW0y?=
 =?utf-8?B?dDJEc09SWXU5aDVsVTl2WitYVEJrZGJrTjhMUWtMbzFFOTNabUxUKythTGc3?=
 =?utf-8?B?OG1tb05TVHBrcU51MEc0ZmdpUEtkNjRqV1pxNDBBT1ZXR3gvRkozay9LWlQ0?=
 =?utf-8?B?MUk2MXRUc2k0S3ZVeVVoTUM2K05Sbnh3YzRBbmNnaURxeWdlRnFaRG1EdFZm?=
 =?utf-8?B?bXVJR0JpN0RZMTNzNzZ2SStvbFRGTFVSRjQzdUtXQTlydWFJeGcwaWFTUnJ6?=
 =?utf-8?B?dEdQVVZaekswN1pzM0QrNHN0b3RheXFYbnNmaTVXU1Y1am50SUYvM0pXL2Vt?=
 =?utf-8?B?OVg5VlRDUlNmU2NvZ3NxQTRzTE1VR25TUWxvb1JxWU42cVhQWUFTSmpuYWlv?=
 =?utf-8?B?aGtUMHNibkNlb1g5KzlJamRLYXQ2dGRQYkxySEFKMHYxWVZ2VGtRaFJrYnNU?=
 =?utf-8?B?N3NWd1hTcHZqWFFxd3FTMDhnR1NSVkZ5eFk3Z0xsNHNwQTZJSFl2S01TeWw0?=
 =?utf-8?B?VEZXSHVCc21TekR4M1p1YkZGcDNvV21NSW4rYlFaVHNUQ1ZTK1V1Uk1WNlFY?=
 =?utf-8?B?NlBUdW1xT0VpY1loekp0VFA3ZXJZQk41WjlCOGZUNVllMG5GUk9MVUFDUkt4?=
 =?utf-8?B?Rk1YNXY4YTZvdzdqWDhicjJOZGZMK1JqczdpVVloRTNZQU9wT2lEN0crWU55?=
 =?utf-8?B?aU1rQjVJOGFJQmtENHUrM01ycEFQcng1RUR5NllKSVhPeEw4VVdHMG8vWGZs?=
 =?utf-8?B?MGsyeHR4cnBDYmVJejJwSFRhdzRhV2NaYW9wL2NDeHVlN0s1dzBGYVllb3lw?=
 =?utf-8?B?TGNGNzh4SEJpRDJ5L2JaT3U0OGx0TnJTUXg3cUFPL1h0TThBeFRVY2RGTlFQ?=
 =?utf-8?B?cGpBY2tPUkV6elhJMUV5ZHZCV3dBU2QzeXl3dlVYY0pVOHZjUzMyOGRrVW5r?=
 =?utf-8?B?cUNHcTVIZS9IeGxFUS9Pd2RuazBoVWYwMnZhMDdsTWUxYjRHdHV3ZUZjVm9k?=
 =?utf-8?B?eUloU2pyTzgwMDlmMnJvZ0M3WnVLV1ZIdE40YU9OVUF3Sml4U256MkdiVFdE?=
 =?utf-8?B?TlB6NndlaVZhRHMvZHRzS0FjM1lyNmpYVlNjWFhGWjZJWGlIejBycXBZb1Nq?=
 =?utf-8?B?blJub1FxWmNwc2FOaDJnb3dTbE40WEFTMTExeXBFUXNkWlNJOXc1a2tuZHJo?=
 =?utf-8?B?UnFPNVd0RlZqcENJekVuNW11MmRkRFY4UzRRWTU2R3lJNzBDTFhHNUd1bXlW?=
 =?utf-8?B?SldIQnhUc2pWRFBac1FIYUMrK1dNdkI3VVlrb2VTRVVxV25Dam9NUUMybWhJ?=
 =?utf-8?B?YVdGL0w5NzQrcjlSTGtQMUxtSFFOSVR6alJWcGtiZHhWd3RhcXF5WkxRUnls?=
 =?utf-8?B?OHMvdnRremR2NTJZczJvSHFBaEt2MGFqcHVCcjg4cnNkM01obTVlVVhQanJF?=
 =?utf-8?B?MHVLdEdyc2lXY1NQbDB3cWMzb1ZIdWdYT1FRdUpVdlNPWitheHRNamhHNU1E?=
 =?utf-8?B?NzR5ZDlXQktpOXA0b2ZOVjNiWjllc3hSY2VzNjFPUGJ0dGo0WERsdnQydzIv?=
 =?utf-8?Q?XylFoQY+Zu7ueCbBE4vEViRl6kqlOawzbj5dhiH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4907c742-e5c1-4c1e-3a08-08d920407511
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3405.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 12:19:06.5413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Qe/sp6ImB2YseaZjoJR/lEoweTZvWg4H3i2b2welcCwlUN4YtOYFu32hbrxlRTxe41sj0XFKmads2VLuTl+eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4237
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Lee,

On 5/26/2021 11:10 AM, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> Lee Jones (10):
>   bus: fsl-mc: mc-io: Supply function names for 'fsl_create_mc_io()' and
>     'fsl_destroy_mc_io()'
>   bus: fsl-mc: mc-sys: Supply missing function names in kernel-doc
>     headers
>   bus: fsl-mc: fsl-mc-bus: Demote a bunch of non-conformant kernel-doc
>     headers and help others
>   bus: fsl-mc: dprc: Fix a couple of misspelling and formatting issues
>   bus: fsl-mc: dprc-driver: Fix some missing/incorrect function
>     parameter descriptions
>   bus: fsl-mc: fsl-mc-allocator: Fix misspelling of 'new_mc_adev' and
>     demote non-kernel-doc headers
>   bus: qcom-ebi2: Fix incorrect documentation for '{slow,fast}_cfg'
>   bus: fsl-mc-msi: Fix a little doc-rot pertaining to 'np' to 'fwnode'
>     conversion
>   bus: ti-sysc: Correct misdocumentation of 'sysc_ioremap()'
>   bus: fsl-mc: mc-io: Correct misdocumentation of 'dpmcp_dev' param
> 
>  drivers/bus/fsl-mc/dprc-driver.c      |  8 +++++---
>  drivers/bus/fsl-mc/dprc.c             |  4 ++--
>  drivers/bus/fsl-mc/fsl-mc-allocator.c | 10 +++++-----
>  drivers/bus/fsl-mc/fsl-mc-bus.c       | 19 ++++++++++---------
>  drivers/bus/fsl-mc/fsl-mc-msi.c       |  2 +-
>  drivers/bus/fsl-mc/mc-io.c            |  6 +++---
>  drivers/bus/fsl-mc/mc-sys.c           | 19 ++++++++++---------

Thanks for this. For drivers/bus/fsl-mc/*:

Reviewed-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>

---
Best Regards, Laurentiu
