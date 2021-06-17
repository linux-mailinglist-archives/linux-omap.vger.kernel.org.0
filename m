Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A603AB10B
	for <lists+linux-omap@lfdr.de>; Thu, 17 Jun 2021 12:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbhFQKNy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Jun 2021 06:13:54 -0400
Received: from mail-db8eur05on2048.outbound.protection.outlook.com ([40.107.20.48]:21472
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230272AbhFQKNx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Jun 2021 06:13:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOcJ0ciKpcJQEKi/x3Eh1jq+nNGhfKMcHeshXpQcY7b0Ue1UEtUde43qtKv+pAPqYsSxsfp5HTBBhAnf4pVzw0cPl+fxQUKYbFvcP/krZ1dw3tnCN7QKd20oQXE2Vr+CogSjFmRsLZABASIFdnlAv7pwbSAgTzAx0DlZwg+d2XyOBYC1HYzvkU8cPgllelcacrm49xfziVdGttGis4iKi/EnhC1D4IkUoooeTNFPP24hSUZ0L2BFc5VHJ4R58NANMEveorrEk6vIQs2FWTlYNG3tayb5ZXO3zEX093pXzqXHPNQ5pG5FIbLeTpGrLmPdgoH2Yapr6W4aeQxEXwgPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQZ6161ksrKji6kntrPMBBcvU83xUNb/nj5YfKkbaBs=;
 b=Hoon5mFufNcdTub5fX2xfQu20AtstwL3qOKtDGyPN8ZqhCb6YiOzvWl/znMrseYRv08QddK5dtpdiYJNVFAdNvSTrGF4hj5F27dtYbZJYwqaGO+08EeTNfOZfyLJAH6EMdlxSzAGmtBIclocV644MsaWv6G0n0a/4FmtQK4w8lXyLy08roRK7xsSNOHwEMwIoCjuc6GeXEI0YXt/o3ZBUx9QCu0ayzSCyHuoEGwSDR3CdDhhJ1cCoD2QPrf5/f7sL6SJlr4Bfb++2quEx3rwIVnxO9q9AcCe19XQHxeRPzSO+j6I+ZVlRLSEPK/8qForx/m6VIK4oC3P7oH5/TjZ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQZ6161ksrKji6kntrPMBBcvU83xUNb/nj5YfKkbaBs=;
 b=hAZoQ5WEaGpuen6BqmFnvVrOJvACQqSwT7U9GNGMoFEZz7RQKbQSSxwQZeS6hlGpu1cO+0E4hQaCPzVGM07oje9GlVFAuhMCNv3vDCiNxexjxoMKHyrZhPBVexTemiZFPNXqf+BLtiK4uroXwI/GRv2TOM2bu5RuENiSdhaWcCg=
Authentication-Results: atomide.com; dkim=none (message not signed)
 header.d=none;atomide.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR04MB6816.eurprd04.prod.outlook.com (2603:10a6:803:12d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 17 Jun
 2021 10:11:43 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::c424:7608:b9e8:f09f]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::c424:7608:b9e8:f09f%5]) with mapi id 15.20.4219.026; Thu, 17 Jun 2021
 10:11:43 +0000
Subject: Re: [PATCH 00/10] Rid W=1 warnings from Bus
To:     Lee Jones <lee.jones@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        German Rivera <German.Rivera@freescale.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stuart Yoder <stuyoder@gmail.com>,
        Tony Lindgren <tony@atomide.com>
References: <20210526081038.544942-1-lee.jones@linaro.org>
 <74eb170b-348b-1bba-432c-52c9541b05fe@nxp.com> <YMsajH2uxw4RHPeF@dell>
From:   Laurentiu Tudor <laurentiu.tudor@nxp.com>
Message-ID: <1711c37d-19d3-b923-d02a-433586c951ee@nxp.com>
Date:   Thu, 17 Jun 2021 13:11:39 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YMsajH2uxw4RHPeF@dell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.76.3.61]
X-ClientProxiedBy: AM3PR04CA0135.eurprd04.prod.outlook.com (2603:10a6:207::19)
 To VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.29] (95.76.3.61) by AM3PR04CA0135.eurprd04.prod.outlook.com (2603:10a6:207::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend Transport; Thu, 17 Jun 2021 10:11:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 809cca7e-ff14-4be1-fde4-08d931784e75
X-MS-TrafficTypeDiagnostic: VI1PR04MB6816:
X-Microsoft-Antispam-PRVS: <VI1PR04MB6816534A16E051537EAF3CCFEC0E9@VI1PR04MB6816.eurprd04.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:224;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /aMI24+cazKE+xmfEBJgsM0PhiMq5+0ztQ4FncD2taIiSo4xXuz6jZx/c5sXCwflmzIPFMeszf0l8TPMEdq3S6Mby2xLplPS56+oZD0KcVejCCW27cIX2qQpbyNCaQnlotg5ZyJzVkL2xTXv4dt/lOc6NfT/gaFyHJaxImG3wHjkCzbitRrVcMDHOvhOgWI33OEU0Rul1RF+CtwBrqWv6eIUHv9x4KkulyV74zp7mvDs2tW8w9802Y5/+ZNQJA/4rvPYfFR4vNnGP13xb8f2J0e+7MgRipHzTI/TQ+Ez2/swNDoGkY7Ffmda5OltO4MCm4cQ5DTabhX4HrycOH5gv24SJWqgJdq5Ky3WOncth5Yw7sjZHXnsKezhArwD3v2sRId3yYZOMcTHFTHyENJRHCbhiVnR45fHwgqUFxXrzGyyWlQCSezyPWkHo3vieky/OMxR4OlHCBfPIo03z3FbdlOfTQ88aUM/qfgh/ncuqv4CObiUgBzu4aS1u3YnWkM1Q2z07d+q/ciCoVH4w7VQJ4AlfRutyco1kqS2fPGZT0NI7ZqLns9fzHzQ4MERN6R6lQxQ3tBUKpAS7DJQeV4Vem0WXs0ZpXTP7Mob4b90V0T8/I2w/OulRP6gUZzhbJv9zHdf7hn7Spr+y5BuIEuxxwMXSDlQBwVjVbTUZM6/DinIPrRteTWBe4I4xe3mOaLkGDKtdljuRiEDmR9cPc3vvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3405.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(366004)(376002)(346002)(26005)(956004)(478600001)(186003)(66946007)(66556008)(66476007)(16526019)(8936002)(44832011)(2616005)(110136005)(83380400001)(2906002)(54906003)(31686004)(6666004)(31696002)(4326008)(38100700002)(38350700002)(53546011)(5660300002)(16576012)(86362001)(316002)(36756003)(6486002)(7416002)(52116002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2gvL21TUUZQUnc0NWJVT3dReFp3czg0clY4OXE1TTRBRThRUm5LVmg4cEs1?=
 =?utf-8?B?OWZPVE9YNXdFem16bW8zdmlQQzczdVVQMVFvSnhzcGVpbGp6WFNHTHBJZlRD?=
 =?utf-8?B?WFhscDkvTHlwSWNWZURmWmRpWWVMZXIxd0ZDSmxxVGNWbU9IOC9zTEZVNVZT?=
 =?utf-8?B?elhhL2Jwa1g0Sjh4LzVCbDJ0eWhkTGx6TWlJOThkdnU2YWVoanM3SWlIUzhC?=
 =?utf-8?B?UFpNQmFQV3lhejY1dEZxdUJxaVNxem8wV1hkZS93V2xBRjIyNG9zUHRXVERp?=
 =?utf-8?B?dnduNWNZSzRzSnlGVzdYYUJpNnhQT0YwM0tha05jWTE0cGtsL1YrVEZ6aXlB?=
 =?utf-8?B?aThVc3lHL1YzQmJrR2x2VGYzazBYdDZidzZPMVFXdmFQWTZmajRScTM4KzFZ?=
 =?utf-8?B?b2RwSGhvSklLNWZDc1pqaENlc3czTVhYbzFlQjlTcTA5ZlEydlo2cGFMMEhV?=
 =?utf-8?B?UEhFUjVKa2pkaWxNR0wzOVBjMFBsY1pHREhQY3FQQUZlcFRrV1F5TzVEdEpS?=
 =?utf-8?B?dkkvaGpJU0NJZDY5SjZBWk50blU2eEdNb09GaUlUYU82UzBaNDRnSXZ0Ukdp?=
 =?utf-8?B?Zy9rQ0Q5V3hFT2g4TldMRWdRcEFCelE5bUZ1NmpIRWFnQXp2SzZ5TFFNdU5z?=
 =?utf-8?B?b3NsbDYyMWVUL2UyWG5wQ0FvQ3hFbTRUbEhMVDhEZnlkOG5FYnN2T0NHTDNr?=
 =?utf-8?B?Z3FoNEVobWdadkYwb2ZFcXJ4aW5QU2pNQ3ZxZHNRekd1RmROZEhyR0M1SHhy?=
 =?utf-8?B?cDduQ0VQcXpUMHpTQTMrcFNlOTFOUGxkRDZNbmFUR0dGa0djV0Z0SWUxRHdU?=
 =?utf-8?B?UHJUdmZIbVVIM1J1QXJrbk91Y0dybkdLbm9YL2FXVUhpZm9LMTJIVlNyVlk0?=
 =?utf-8?B?bzd4WW5VUDRwZmxRSFVqOE9nOXFCK1NOY3NTTi9ONllmUFZPQUdPSWR6M1Fy?=
 =?utf-8?B?cnBCT3JiSzRPNzVvdG91QXdSVXd5NFhvZXRHaDdRVGc0ZTNvUDMvMzR0TGxV?=
 =?utf-8?B?VE5oMDFWdE5ET3JDY0k1aUpxOTl2NkxPbi9BaC9tem5xR2NXNGtLN2phNENv?=
 =?utf-8?B?NHJOaEJWbVFSUTA1R2VCUHhubC9oZllUMnoyM3pXdzZBR0h2RzZYSWQvNWlz?=
 =?utf-8?B?QjF3VVA2R3NSOFp0UlRtTXc3YS90bENiTWlqTS9KM2Vac2FJRHJPZWQxTUt6?=
 =?utf-8?B?c2ZBcnlzVnAzVVVVR1dUd2JpSjVleUVVV0VQaVIzR3MyYjQyNXZXTzBRNy9v?=
 =?utf-8?B?UnVURS9QZVJoWUtEWVNIMjdld29SQis4UTJiREVsbFhNQ1JUTXh4LytPWktD?=
 =?utf-8?B?QzJXU2pVYzdTRlBCaElMWUpNdXczMzNjMXZWNWg0S2NlcEYyM0dLaDRWSzhi?=
 =?utf-8?B?cnV4UFN2cUVNdjVtWWU3Tm9RT1BkckZob2dQalptbThnWXVQa05LQ3BSRlk0?=
 =?utf-8?B?T2JYVklDQW5NRnFieG5FOVNpS2JubmZ4bUxNWG83TnJ1V245VzRoSG01a1hy?=
 =?utf-8?B?N1ZrWWVzRzZzbEpDRks1REJldnZTYWZlTmhpSHlIaU1ya2pxS1Ryd3JsaEMw?=
 =?utf-8?B?b2Zqd1ZUMDdXdm16eWRFWU1yemZXNEwwaG10WW9ib01OQ05EVENCV3BsVHU0?=
 =?utf-8?B?My80bGxXYVNuSFBMd0lHS1dXTmFlZXR3bEtRRGRUMGxzQW1Eb1VtSkc5dzRs?=
 =?utf-8?B?azFBV3oxNUgvazlIbEN2ekxxVlM5bnBjNk1zSmR4QUxOKzZldysxYnYzTWxN?=
 =?utf-8?Q?wzH+VuxW0NlDZiE8m114x1qe1GL2lSKJSkMx/oh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 809cca7e-ff14-4be1-fde4-08d931784e75
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3405.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 10:11:43.3397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBvwVreJslfvw4Qm8e1ya67wX4WG7tLwvNb4Diw/b0bYHGYrVhINt37zDb/yA2eYmbllk5A8KfMuDl/DMUNvxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6816
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 6/17/2021 12:49 PM, Lee Jones wrote:
> On Wed, 26 May 2021, Laurentiu Tudor wrote:
> 
>> Hi Lee,
>>
>> On 5/26/2021 11:10 AM, Lee Jones wrote:
>>> This set is part of a larger effort attempting to clean-up W=1
>>> kernel builds, which are currently overwhelmingly riddled with
>>> niggly little warnings.
>>>
>>> Lee Jones (10):
>>>   bus: fsl-mc: mc-io: Supply function names for 'fsl_create_mc_io()' and
>>>     'fsl_destroy_mc_io()'
>>>   bus: fsl-mc: mc-sys: Supply missing function names in kernel-doc
>>>     headers
>>>   bus: fsl-mc: fsl-mc-bus: Demote a bunch of non-conformant kernel-doc
>>>     headers and help others
>>>   bus: fsl-mc: dprc: Fix a couple of misspelling and formatting issues
>>>   bus: fsl-mc: dprc-driver: Fix some missing/incorrect function
>>>     parameter descriptions
>>>   bus: fsl-mc: fsl-mc-allocator: Fix misspelling of 'new_mc_adev' and
>>>     demote non-kernel-doc headers
>>>   bus: qcom-ebi2: Fix incorrect documentation for '{slow,fast}_cfg'
>>>   bus: fsl-mc-msi: Fix a little doc-rot pertaining to 'np' to 'fwnode'
>>>     conversion
>>>   bus: ti-sysc: Correct misdocumentation of 'sysc_ioremap()'
>>>   bus: fsl-mc: mc-io: Correct misdocumentation of 'dpmcp_dev' param
>>>
>>>  drivers/bus/fsl-mc/dprc-driver.c      |  8 +++++---
>>>  drivers/bus/fsl-mc/dprc.c             |  4 ++--
>>>  drivers/bus/fsl-mc/fsl-mc-allocator.c | 10 +++++-----
>>>  drivers/bus/fsl-mc/fsl-mc-bus.c       | 19 ++++++++++---------
>>>  drivers/bus/fsl-mc/fsl-mc-msi.c       |  2 +-
>>>  drivers/bus/fsl-mc/mc-io.c            |  6 +++---
>>>  drivers/bus/fsl-mc/mc-sys.c           | 19 ++++++++++---------
>>
>> Thanks for this. For drivers/bus/fsl-mc/*:
>>
>> Reviewed-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> 
> Any idea who will take the 'fsl-mc' patches please?
> 

Usually GregKH (added in the thread) picks them up through his char-misc
tree.

---
Best Regards, Laurentiu
