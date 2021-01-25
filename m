Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C410B30275F
	for <lists+linux-omap@lfdr.de>; Mon, 25 Jan 2021 17:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728690AbhAYP7x (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Jan 2021 10:59:53 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:49474 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730546AbhAYP7P (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Jan 2021 10:59:15 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10PFYhVv143276;
        Mon, 25 Jan 2021 15:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=gc+lntb553fCI2STjXWemiwyxUzjMCiFDDHdmyWyvTM=;
 b=uCGnIHiT/FIVQ8t57cIXecXUqOgp2XKZZKAg5wgvWQLf5cOTI1Vw1hrcq0oKKzfTeBVo
 cUb7ev3WbIgG4Tmr4EBsvh96k2RFQzpdCgm8tPrmpSytsjaxB3fvrL5+cYhlHVUfSSBi
 rmmX325y4ZRWa38Zw+NgpUu67A8drSpCszECI8pgBSM30K2EVV+JsH2U6MJDI3MsFQTY
 5ak4uTIapU2U6ePQR0EUa71solStY2ngkFUPXDOlUtpIjQEoerPyBO+AEVsiNR37B/MC
 u470VAul4b3n3fANm6Ts4h6i93EXYxz5t2C8dw0+FWnUT2ymTUGJF7nCFLFtxBaPzNm5 JA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 368brkdw27-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jan 2021 15:58:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10PFaJqg154002;
        Mon, 25 Jan 2021 15:56:22 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
        by userp3030.oracle.com with ESMTP id 368wqv51up-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jan 2021 15:56:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fl63MYf6yOvCkfte5a2h2w4kzzyy4YZRzGkUeZlaAIVaPJP0xAcS0DlK5/IjFD042gFBX1OoNrisRNIIbVAcsLxlpsOPL/YGMtF0UcJfMDIGlLwtP6epFPA3ZG4AJ9NqSFmMnqUrxWbxnOw0tdK9RNC/rnnAQpaHxcnq4cjT2RI3DAzmzTTfqVq7P2JZt9Sj3lAavbtj7KnvTqsRbBF1GnqVRXZRThVoq9RrOMYWadfM84Uyk1zA0OUmiyg0BSSXKAKzUOTwt+IW6avCoBB9JTfFNGsym9T+1K+zB69eWwxiNKe/llREnzNfvhuxeZweBAZVOepK7JOWY4gKLZcEfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gc+lntb553fCI2STjXWemiwyxUzjMCiFDDHdmyWyvTM=;
 b=i+bTUa9P9JMZtmPRGdNyKAjK3gB87gGCEKHs5UOUypNG8kQ8gjznS9RPi9AsZkH4lunRBD98fv5XhASr31Bz4RHxc4ggSeckosegvLg+59I2MNS/vfjnvQsql9pVL+5v/ytNsXULl97VCDlJXhEYmjm3Ac+qZsFQErBTs9OomXnulRbdNZGE25ONRJQIkAJD1OIB2pmNbugjEUkyFGQd+NA4e7KT5OsLkpldiYYMcVYW0edJSwuVYiMrI2eHaMLbAqmVNtxc1JAJ3O5VsXqceSV6/fj63vM3dhzs6mAm7KIS1PxaodvkGZYIvmZjYfMdb9Ah0w63R0zh/+75w4i+eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gc+lntb553fCI2STjXWemiwyxUzjMCiFDDHdmyWyvTM=;
 b=rTFZaiReQIpVelfgqFAkglB354lzsLy1S4/sk1AOPD1IMl43l1OnIGi9OfYOFA36rcxhAp0uO0jky82a88whnjnxRDEgdmw8c4+8oP3A5HebiMwOwyMHrACB9kvX9Utmab24nr72ABIjRHove5tjSjE5qz8d7iv5NaD6Xhw6ZlY=
Received: from BYAPR10MB3270.namprd10.prod.outlook.com (2603:10b6:a03:159::25)
 by BY5PR10MB4210.namprd10.prod.outlook.com (2603:10b6:a03:201::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Mon, 25 Jan
 2021 15:56:20 +0000
Received: from BYAPR10MB3270.namprd10.prod.outlook.com
 ([fe80::61fd:7c42:26e6:1e15]) by BYAPR10MB3270.namprd10.prod.outlook.com
 ([fe80::61fd:7c42:26e6:1e15%3]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 15:56:20 +0000
From:   Santosh Shilimkar <santosh.shilimkar@oracle.com>
To:     Suman Anna <s-anna@ti.com>
CC:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "ssantosh@kernel.org" <ssantosh@kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "praneeth@ti.com" <praneeth@ti.com>,
        "rogerq@kernel.org" <rogerq@kernel.org>
Subject: Re: [External] : Re: [PATCH v2 0/5] Introduce PRU remoteproc consumer
 API
Thread-Topic: [External] : Re: [PATCH v2 0/5] Introduce PRU remoteproc
 consumer API
Thread-Index: AQHW8tO9Ps27yqEPsU6euCznK8m0R6o4e/IAgAADogA=
Date:   Mon, 25 Jan 2021 15:56:20 +0000
Message-ID: <886AD9CE-A967-4DBA-A212-A752040EE2BC@oracle.com>
References: <20201216165239.2744-1-grzegorz.jaszczyk@linaro.org>
 <20210106232704.GE9149@xps15> <11303a1b-5ab4-def5-77b1-c500894c9c87@ti.com>
 <20210107224448.GB43045@xps15> <75365443-57e3-e2e0-5865-f78af9d5890b@ti.com>
 <b0e32ad0-487f-9d57-7287-835eee836514@oracle.com>
 <c5252e8d-094a-dcb7-7ccb-172e58ab3413@ti.com>
In-Reply-To: <c5252e8d-094a-dcb7-7ccb-172e58ab3413@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [138.3.200.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79ca05ff-01b4-49a4-1264-08d8c149c1e7
x-ms-traffictypediagnostic: BY5PR10MB4210:
x-microsoft-antispam-prvs: <BY5PR10MB42102A0C361485D6998188C693BD9@BY5PR10MB4210.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S8Hj1g3JlAxyKobtWPMSisLvDUXHl7htxcSex4n3yJSsGIiVIvB+o5AyORzVA63haZDoPWjWyPYDvS4oBXZr7Bo6rJH8G2IWwS5Unxe88m2T5rYPZBg4HCyJhiCHzwmwrxIsNzomn5TiTkUR0xxgXU8yMiyvNekrBQNdfLEEADCJQ5a8WbL4oRW5IGp+PKnK56n8BJPhztzm74dUSKBtdaNQDXRLi9C2HgiZ0Qb5Y+bdE3EvE9IsgOCarKA3nHefrPGnp47L9BLfeHtxh2+6AHcdyUZmiv2Wuut+2A3MT7M68qamhWRRkNGZKGXDaAKbYJHW/wrmQnwiezOLeKiQPYVIL5VB8BwCdMVB9nmnNnKtYBc5hJrADOSGDkhZKV2dVBudBdENsjnyhynP2jPcTeOr/d+LNj/oV6+xxnu+e9kNeCx4DU/yc8rMrWRfZ9xSFQJLU1fIKD42GIrDW5K/O2UZVRz5tyMIwR/8sieJRq+SOpyG+BeODcUNNhiFEVyXV9h2dsRJflzzcumZR3qw++pU5SyAfTs/98EghHxzz7Zfie5IzsNSw7Ct5cdcV6KWi6kg8wsCu19ciegUGM5exQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3270.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39860400002)(396003)(366004)(376002)(66946007)(76116006)(91956017)(66556008)(6486002)(64756008)(66476007)(66446008)(6916009)(8676002)(36756003)(5660300002)(8936002)(26005)(4326008)(2906002)(186003)(71200400001)(54906003)(44832011)(316002)(6512007)(7416002)(86362001)(53546011)(6506007)(2616005)(33656002)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?vW7E/nhI8pYwZQ56of7dRQAaBct4gYfZfUxDUa7jl/RsIP2BRh4Hzmfm/mhS?=
 =?us-ascii?Q?+yIHfBBq8aVIZbGqtTnHLhwl7yB/VNKb8lS5YHU8rzLuMBFOg0rnIALB0vn5?=
 =?us-ascii?Q?FRa0U4rMxqJbdUuFqqkUGiYN6mhwxf1xysmm9gUVOfxHyx/UMjBPVREcvVBy?=
 =?us-ascii?Q?uxHzlCNFx4voNhnkOBuanbNGQGEysCtmm3tXVr1iDpczJfMRC/MrtM2R6BjI?=
 =?us-ascii?Q?zM1srSLNZO7OZWetYMMDZG+iRG2HDVR+QmeEUD895zHjsry0alj6wvGmnDiu?=
 =?us-ascii?Q?koKwnhEsUafr54OYOerE7Z6UVEqrSZKXXRk81XY/P2BKpplMwzP5XwxfyEtb?=
 =?us-ascii?Q?DQ/21/FiC1C2qRpnTXClH+finBXxW/ywz8Wy1Lm4JtAydz5dbAjeEf/pfsBa?=
 =?us-ascii?Q?rWtvX38OPXPydaNQ8EnDp+RZBIU9HlQCxpcykT30sjbnPgXeRxvzJcsFrkPC?=
 =?us-ascii?Q?dcbQaDtrxhTsiV7NCMXtuFMzC31p8Yo8QiU2wW7l4JfmX+ES6PEYEabPOiI/?=
 =?us-ascii?Q?iEAtwhismx06CM+PzsAwWKWenmvqXzRldJasLSuYDC4/pdr22Jy9kPM5RCuy?=
 =?us-ascii?Q?ARRDf152pTT70V3n1Y4EFVzPiya5YRM1yu+H1/cyZVlzuJ3ptOiUKhGGieEN?=
 =?us-ascii?Q?ki4eCxS4rJakQ122l+kgitZx4zByPnl+MYmmfgVX2WcFIxqITiITd/fGzJNs?=
 =?us-ascii?Q?SaOt4By/e5IC6iBl1C3jVLIVadfBuC0nYR/3JSNcvRXlFAYNNmByI1nID4Ow?=
 =?us-ascii?Q?3UpSXmROFY67UufhyJGcl4lFTplzNmgIMFAuO8WeJC45BxHLIACd0lioL4RH?=
 =?us-ascii?Q?S0kdnsI7LSJfwftb4tARPsPn3aUOywSIUFoCloJ89lTbAxduSRko9aNi+Ltj?=
 =?us-ascii?Q?rcOyXrKq76Ljyz1FMxmHaERuu+NdSuJxFKwePdrLuELOkOZoAqInjmF3faL+?=
 =?us-ascii?Q?AlwVbWH498x+sx/inbFSZDFcQGb6mHZFxZCMGN+y327lXyF+4Y+XeNjxyGbW?=
 =?us-ascii?Q?WhybyBfpaxiFvxwQ5uJiCd+3gTM8JhYQ/pDqVj/VeZegSh/ycE1mJw1LkdQC?=
 =?us-ascii?Q?5lK4fC6U?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EEEDF3124974544DB3901A1849F5358B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3270.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ca05ff-01b4-49a4-1264-08d8c149c1e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2021 15:56:20.2315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7pq+kv112ACaZyV9cRSNSL0AGNamLpl1j/A9KSVKlD4p2GKE8nxArnaIShqUJvoJuefWUyeqrTDmgoO0iSBZ1BL8r7Kxe6p+Myuk8s2xDbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4210
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101250090
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101250090
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Jan 25, 2021, at 7:43 AM, Suman Anna <s-anna@ti.com> wrote:
>=20
> Hi Santosh,
>=20
> On 1/24/21 10:34 PM, santosh.shilimkar@oracle.com wrote:
>> Hi Suman, Mathieu,
>>=20
>> On 1/7/21 2:49 PM, Suman Anna wrote:
>>> On 1/7/21 4:44 PM, Mathieu Poirier wrote:
>>>> On Wed, Jan 06, 2021 at 06:03:25PM -0600, Suman Anna wrote:
>>>>> Hi Mathieu,
>>>>>=20
>> [...]
>>>> I only see input from Andy and Lars in the thread you point out, nothi=
ng from
>>>> Greg.  I have also taken a look at the patch [1] that made checkpatch =
complain
>>>> about ENOTSUPP.  From what I see in that commit log the goal is to pre=
vent new
>>>> additions of ENOTSUPP to the kernel.
>>>>=20
>>>> Please modify and resend, otherwise I'm sure someone will send another=
 patch to
>>>> fix it before the end of the cycle.
>>>=20
>>> Yeah ok. I will send out a v3.
>>>=20
>> I haven't seen v3 of this series yet. Please post it
>> if you would like to include it for 5.12.
>=20
> This series is dependent on couple of patches that would have to come thr=
ough
> the remoteproc tree first, and I need to post the next versions of those =
as
> well. So, let me sort out those first. You can drop this from your queue =
for 5.12.
>=20
Sounds good.

Regards,
Santosh

