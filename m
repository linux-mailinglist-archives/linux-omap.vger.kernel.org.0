Return-Path: <linux-omap+bounces-5146-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B114BCB0D02
	for <lists+linux-omap@lfdr.de>; Tue, 09 Dec 2025 19:17:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FBD730B1174
	for <lists+linux-omap@lfdr.de>; Tue,  9 Dec 2025 18:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E93B30594F;
	Tue,  9 Dec 2025 18:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cyjz5494"
X-Original-To: linux-omap@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012048.outbound.protection.outlook.com [52.101.48.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2F03054C7;
	Tue,  9 Dec 2025 18:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765304177; cv=fail; b=NPk8iTNUGLwWulT7mLIjpkrTcvFnvokWPHokbwgn6k1UpURf6mzhZK7jCEicMyFJHN7gq/RwCbS0cynjqXnqR9zzW0SHekvp5bHv7x6vSPL91gBbP3ZYt9PfE3OYIzM06uCMA3xpvXGqRg3abi2btj67FVqWzEHCNC7veKjbnNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765304177; c=relaxed/simple;
	bh=7LtXjaloJF8xkaMVum9sDygd9O0Vo8N4nHjvkJedyHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZPVo0WaZq+sxtRSvynbPAZfbXV8qcedwWkp5VGTAYPsHUzTEvA144SPQAG7E2Dg6kOCELClx7UVDAph186gwYCce2mpN1xAe9Tj36oU74z/l9rdaUoEhd9CtqpPYKxHVLlW/Mer4tfFg3uboG2XqqXjAzPma5v9ic6mPDsFMtik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cyjz5494; arc=fail smtp.client-ip=52.101.48.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZVPjgT1cCkHGHIiYan/24PXEIoJqaVZIfJ4xFhKEU2w7hsgvY2HvdXSqaNtmckdKZBFyuTeG5Jbbr0h3g63rcxd9+hzViXhhJlmQ0aY7ju8Wvt6XQnM9XRny6Drha++9Gi6j4NgyufrtxJuFAWFT/3mV6CWEC1M9kxguD1hYrhkcv7GwUmpnkWFUhD0JpjDuZ8pNeoLlcvWkqUj0YUzbgPe5X7gkay1pOUR1w/hIO6+hO6NA3c3t4ljRtEXA5nu2yf7AZjL1V3tMlFbtgp9YUAkd2a7fRKZpbPwGwhbf861RgHqNRyaIEXog7gsWUJWrUU9pIXURPNhPguUM61H0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wrbGiaZ/a5Hgbwh9XNUBy0wnNG5rUqlaqtltCbnFlQ=;
 b=g6HzARi3+5wP2/Xn9fpjRpwpCC8B1k46ewLgi0QtPOPZ+CPi058DR6DH3e50/W7x1LSdMi7JdFGqOFxN7zSL6HVeDsUbqXjQOLv4KoRSoRVww4ITqEJE8NxfQzR8GW2uXiqwZg0wmnjVqc1bc0k8eaaQyc+ZTHJV04p37Ekj0SZfgIf7v+Ceu+EHJFyStMPtG48LtldaJKqcgJ5Y4PAtFwZNem4notqCg5Y5Q1ECfCz2PGbVNXUKq/m2QaNISf8yOxPflhJaU9YwB97MkmlULWCdEqgrpKNcdnRahihe04hd8L4S/IdLSbz+H8DcWdC05znSWmdbLeEGUJEES4JXxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wrbGiaZ/a5Hgbwh9XNUBy0wnNG5rUqlaqtltCbnFlQ=;
 b=cyjz5494e1CM9zpvRF80MIduXL60zWQB8mm0DCscrx3n4HOsMPSIMxxjWyI7AWW/LkEgqpgjDrHc9ZtNGQqaVTp+uw3ZQstDR1l3luVUwKK+cCFr/h0Ej4w+H7BK6eR3PZ0Gc4qF3/OWKOssmGGpx2/qEBTmXTXG/1SyfzTsq84=
Received: from CH0PR03CA0347.namprd03.prod.outlook.com (2603:10b6:610:11a::26)
 by LV8PR10MB7728.namprd10.prod.outlook.com (2603:10b6:408:1e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 18:16:10 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::74) by CH0PR03CA0347.outlook.office365.com
 (2603:10b6:610:11a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 18:15:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 18:16:09 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 12:16:05 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 12:16:05 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 12:16:05 -0600
Received: from [128.247.29.251] (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9IG5TP1611666;
	Tue, 9 Dec 2025 12:16:05 -0600
Message-ID: <d6de7066-a802-41fc-bb10-2f5d248743db@ti.com>
Date: Tue, 9 Dec 2025 12:16:05 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: tps65219/am62p kernel oops
To: Francesco Dolcini <francesco@dolcini.it>
CC: Andreas Kemnade <andreas@kemnade.info>, Jerome Neanne
	<jneanne@baylibre.com>, Mark Brown <broonie@kernel.org>, Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
	<kristo@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
	<khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
	<tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
	<linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <aBDSTxALaOc-PD7X@gaggiata.pivistrello.it>
 <20250429185240.6a7644bf@akair> <20250430080109.GA65078@francesco-nb>
 <aBH5s7p2RxLGjTQD@gaggiata.pivistrello.it>
 <23eeda43-a938-4c15-aee3-b1b9df217ff8@ti.com>
 <20251209134343.GA238880@francesco-nb>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <20251209134343.GA238880@francesco-nb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|LV8PR10MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: 2280cd60-1aa4-4d9f-1c19-08de374f0751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzdNUmdUdmtaVTNjbDlWcVlNV1NoYS9VTXR4ai9FUGhrUTVQSGRncy8zQ0No?=
 =?utf-8?B?STI2b3k2L2pyRDdDdFlqYnJwN3Roc01BbWMyQmRSNjRpRVFPWDE5NlhCTitX?=
 =?utf-8?B?U2Qya203MHFRa2Z2NVdwc0dDM2QrN3Y2SDVWSVkzWVZYTjRScUdoUy96V2gx?=
 =?utf-8?B?VlVOV292RExSQ3RUZDg2S3RhSkdmVVJ2bEZMNnQ0YzUwU3ROZDZZUFNzNjVr?=
 =?utf-8?B?ZUxaWFNLbkk0SC95bnFJTlhqdE5yMllSOEtiZWtodTAxWWM2aEJqaFZtck42?=
 =?utf-8?B?Zk1iTWdCbFl3Y2JDZ21nRmFDNURwL29xUkxqZVhMMDhYazZ4cHN3M0dvRkpu?=
 =?utf-8?B?dXZuZjFSVk1wa0NuWVlOYmlsL2t1OXRmZGpYMllJdUpvMlkydjdOYzJKc1Yw?=
 =?utf-8?B?ci82WEFMaDZaVS85VWlIT0JzVEIrOTNwa09YK29ESkRRaFp1eEhGdE1pUDV1?=
 =?utf-8?B?bDdoZTFWb0RLTW8vR0l5bzhOTFd6TFQ0UHltNFdqVmNTOTM3cUZVU1hCSCtZ?=
 =?utf-8?B?dnl4ajBMREFaVCs1L0tPbm5WSjNwNVd3MjJXTmEwSHVhK1cyYnUxNzNjZ0dk?=
 =?utf-8?B?aC9WSzBnNURhMVpXcmM0TCsxc2lNUS9scEloUjQxWDVudXNOTkt6S282Ukky?=
 =?utf-8?B?b2tCZTVuUU8xUHd6Q0FJVVNUbko0RWJnTDFZMUx4MUJMdTNjWE1mQ1kycksw?=
 =?utf-8?B?OEt6LzhhUU1sd0JqeE9WNVdaVndjSGZDNHB0eWVUZVZVbVVLMHVvek9VTlZp?=
 =?utf-8?B?eTFQd1FFZGF0dkEwRVAxSys2eHFCUHZUYXNRTDNqWE9RRHlhYjhpMXo2Z3V1?=
 =?utf-8?B?QTI0ZUVvSUN6VjhWR0MrdDIvd1JUWGdnSDNSOXF6MXk1OUUvOGw5R2hadHNu?=
 =?utf-8?B?RHc2a2YvNFI0eHhudklNbnZqWjZmSW9XZFkrQlE0eGdNZEZwZ0pzZlVnYWxM?=
 =?utf-8?B?bUttbUZkWTVMWlV6bGdQVTFTdGc4L2lLMkw3N0h4MTZtbDFmV0VyTmFFVy9j?=
 =?utf-8?B?aVdhNGI2SEkycCt1b1o3NmFOaDVIVnByOWt4MGhuSWticUNrdW50d0pPMVBP?=
 =?utf-8?B?UlBvVHJIbEQ0QXlrb0FPTjFBTzdZaEJwdnZQRTBZTzNyQm5KTjFCaWtHUi9W?=
 =?utf-8?B?WEdRNFJnRHo1L1dFQlREZXRUMUk2YVF6YXp5cE0xK3c1UXIwdklGVnpSdmdx?=
 =?utf-8?B?a0UrTnR2T2J6emJGT2gxYkZUc0lHUFdCNWVvbkVycnRxcndUMmpUc2RmMEEy?=
 =?utf-8?B?TmxPeUxJYVR0THIzc0Rzb2dHUWk5NDljOWVMYjVYd0ZCekJVaEIrTEJ4cXk0?=
 =?utf-8?B?MWVHU2FqT0M0azNsMExXN0hrYnlFem1uWGJuL01kcHN6OVNjY01VNlRVTUV6?=
 =?utf-8?B?ZDVEbkNVWlNuR2hzaFpWODk3MjVEVEdDNitrbC9tOVNZY2VqaHJxMHJsWU44?=
 =?utf-8?B?bVI5RnRteVkwdGpVVXpMY2ZvZ1hDWjRDcjF4M1Fac1RZZXkreW5qU3c5OXpG?=
 =?utf-8?B?N3N2Z0NLZGk4ZFRULzJCT1lJdFgxWEwxN0toSEJQT1EvWkVZeURoaWU4cGQz?=
 =?utf-8?B?ZUVTU0x1eThrWWZyZzRGdm42RTBXcFVYQmh5TVpkdXpSNEdQTWJtYkxCUjdO?=
 =?utf-8?B?L2xwcUtRUFAva05xYVdWQ0dmL2UvSjRqMFBJcUxqNmNUdmxINklCbForRVBh?=
 =?utf-8?B?bmdlVXFPa1NnUzVwc2J2WEpzUG9ML1FzZytnc3F4a0JvRFNyTytzSmNNWEM5?=
 =?utf-8?B?Q3FNcEJ6djFubEdWeFdHQk9RYkROMUF6T3pOa2lNUlBrOUZqd3BvY3VyTmNt?=
 =?utf-8?B?K1pJUTZHRFNBajVoeS9YMmpnSUQ3d3JiVFhUT01ZV0hKdWRYWUJhZHc0U1hS?=
 =?utf-8?B?RnBWUFpmMFdzTWtsME1WOXBWM29McmFPek9OUFI0S2hITm1YaTVuKzNJTE8v?=
 =?utf-8?B?OHV2QUhTQ2RWMU9rSHNGYWtVTExoRVMvd1BjSkhWTGRaYXk3R3JzdUVqNVUx?=
 =?utf-8?B?azhSRkR6TDdxamJMR3Y0MW9pY09zSkVHNGV5WE8wWWYxVXQrOGV4TjJTeSt2?=
 =?utf-8?B?NUp3OWk4TTFBRGVLWUc4Yzdtd3NKaGpHVEhjRi9MeDFQaWthNVRYTW5CNEhU?=
 =?utf-8?Q?3QxI=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 18:16:09.6890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2280cd60-1aa4-4d9f-1c19-08de374f0751
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7728

Hi Francesco,


On 12/9/25 7:43 AM, Francesco Dolcini wrote:
> Hello Shree,
>
> On Thu, May 01, 2025 at 10:32:12AM -0500, Shree Ramamoorthy wrote:
>> On 4/30/25 5:21 AM, Francesco Dolcini wrote:
>>> On Wed, Apr 30, 2025 at 10:01:14AM +0200, Francesco Dolcini wrote:
>>>> On Tue, Apr 29, 2025 at 06:52:40PM +0200, Andreas Kemnade wrote:
>>>>> Am Tue, 29 Apr 2025 15:21:19 +0200
>>>>> schrieb Francesco Dolcini <francesco@dolcini.it>:
>>>>>
>>>>>> Hello all,
>>>>>> while working on adding support in mainline for a new board based on TI
>>>>>> AM62P SoC I noticed the following Kernel Oops.
>>>>>>
>>>>>> This oops was reproduced running current Linux
>>>>>> master, 6.15.0-rc4+, ca91b9500108d4cf083a635c2e11c884d5dd20ea, but I was able
>>>>>> to reproduce the same with 6.14.4.
>>>>>>
>>>>> [...]
>>>>>> [  +0.000022] Call trace:
>>>>>> [  +0.000011]  regulator_notifier_call_chain+0x20/0xa4 (P)
>>>>>> [  +0.000018]  tps65219_regulator_irq_handler+0x34/0x80
>>>>> wild guessing: maybe because irqdata->rdev is not initalized in
>>>>> _probe()? At least I do not see where it would be initialized.
>>>> your wild guess seems correct, I'll send a proper patch with your
>>>> suggested-by after doing a couple of more tests, thanks.
>>> so, the bug is clear, however the fix is not an obvious one liner as I was
>>> wishing.
>>>
>>> we would need to add a link from each of the interrupts to the specific
>>> regulator. as of now such a connection is not existing in the code.
>> I'll try out implementing and testing the solution, but will get to it early next week. Will email with any updates!
> What's the status on this? Were you able to do any progress or work on
> it?
>
> Thanks
> Francesco

Thanks for following up on this, the task got lost on my end. My apologies!
The original line deleted `irq_data[i].rdev = rdev;` was never replaced.
The correct code should be re-implementing a version of the tps65219_get_rdev_by_name() function that was removed in commit 64a6b57
& add in irq_data.rdev = rdev;` where the other irq_data fields are being assigned within _probe.

Is there anything missing with this solution?

Thanks!

>

-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer



