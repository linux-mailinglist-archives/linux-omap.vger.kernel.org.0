Return-Path: <linux-omap+bounces-4878-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FAEC41C6D
	for <lists+linux-omap@lfdr.de>; Fri, 07 Nov 2025 22:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 133424E6722
	for <lists+linux-omap@lfdr.de>; Fri,  7 Nov 2025 21:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C362F4A19;
	Fri,  7 Nov 2025 21:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dfkQqhzQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011046.outbound.protection.outlook.com [52.101.62.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2157624DD1F;
	Fri,  7 Nov 2025 21:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762550718; cv=fail; b=VAmx08JLpvwGJ0Pdi6VL2O1VnEaU3uKinjYSQr0b0oPT7fy9Z7qAKWYHTjadyv6HxGWtQOPwIq3UMmMICniZBWPlyxiN6/XEeG8+spLmsGDCMp8KPeAwvdHYTrd+jShbvobxGNP45xojLPRGD7Ecg8Xs1vnLpwthugCr6l6+lCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762550718; c=relaxed/simple;
	bh=KaO9vJ0vTzlZWgGZB3iWwMjx8FFGnPHH97qu1VoYD3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=m7+x3jykWvHrrLZ3+Bxp10vfGXJZkXELDUrXATcRVb6E0nspUylDHe91jXO5R2D5jVmDqzt1tKrtbBPy486SYjYVsOByONdqrQeQptCjOZeGhiJAANfJtEnJVXfsLpHzRoVC7Ahzb7n5RI9WbM9waZVdZKI5i5KQYMBm3Qn21xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dfkQqhzQ; arc=fail smtp.client-ip=52.101.62.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovu2H2buTgWc4DkotrlVOt1sF16LbQ4ETHf5jW8zQLUhj7pLCVTnWygMGYjhP89dX39i4Z/LEgkizNXtCA6nGNE9wERyz0mXhIFGvgVLfnX9dvWDMRv+y0UrRf3NZ5eMLY/7QxWehJKm4H8vVciE8bFi43XJ3KchXxVBHRNE9rxtoyysbMEJAz79KaBw3HNDpR5fAmRXV9HBut5Z1HJ0Ml/WCECaoGMKQYqjGfCG7HlRxJJHydPSGNk2WMOPSZtgiPrjdrVmjkcRzRLj2AuIG+xYUz9hDpofHgK9sL4NGcYhc6vxIT4VDh0weEFNDLRRx0P4WDh7MsaSdsJGJvqC0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49f/dsrE0aeRW4jFyUv4zhu7dsTAIMmUkRxf8KHWCuA=;
 b=fs39GV1WCB11jUtFFUrg2qGQB4IBlNrGX86e71T4gzSYaRxC4lH3GZxjQQvNlOpz1NbNNGGdWhhseuYKM553I199CPeZ/OQ7BeT20PuxY2GmbAR2TnwevqSlMZUzxFVs/vtAvVj8FBClWAGQOAX1pXl7AHG0Ro33fOjCGmyiO2FkFzG1jUVHnBDaGi/QoW61HrWB+SvyBjuXveOGSK6mHOCvSb3rdQJGyVoSHpY8lUrcqTgE5J0xWwtB0puSzLe95DE71e2Ctp4CAWuno0ImIMqL7G+CNcXDep/9ERtUXf7Pyw44XH2mRO35OLScJnN8YyraP8BAm+ecibCMCus2pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49f/dsrE0aeRW4jFyUv4zhu7dsTAIMmUkRxf8KHWCuA=;
 b=dfkQqhzQI4FhRcviJEB6c25BzUyljOLOxL4B6FiPKnKjKrJduNy1cPRQGuna405+ezoCW/3DmHCxl3Cp8onaaE8aEJtnU85dOZr8+OB1c1nJ9U4H8QnbLMLzOCOaBmNwXxy0z8K12mRBoCyczMegkgmQiV+rjfQegyLJbgoc3+M=
Received: from DM6PR11CA0029.namprd11.prod.outlook.com (2603:10b6:5:190::42)
 by DM3PPFA09EE1970.namprd10.prod.outlook.com (2603:10b6:f:fc00::c3b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 21:25:12 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:190:cafe::7a) by DM6PR11CA0029.outlook.office365.com
 (2603:10b6:5:190::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.13 via Frontend Transport; Fri,
 7 Nov 2025 21:25:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 21:25:12 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 15:25:07 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 15:25:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 15:25:07 -0600
Received: from [10.249.35.170] ([10.249.35.170])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A7LP6r73649310;
	Fri, 7 Nov 2025 15:25:06 -0600
Message-ID: <76078ce8-aec3-4a3c-b866-926fc284692e@ti.com>
Date: Fri, 7 Nov 2025 15:25:06 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable 1GHz OPP am335x-bonegreen-eco
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, Aaro Koskinen
	<aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman
	<khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
	<tony@atomide.com>, Lee Jones <lee@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Andrew Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, <linux-omap@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20251106-fix_tps65219-v2-0-a7d608c4272f@bootlin.com>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <20251106-fix_tps65219-v2-0-a7d608c4272f@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|DM3PPFA09EE1970:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f2c3631-08e7-448e-ea15-08de1e4422d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFFIK3BKOEo0bnVyM3loUk03bVp5ZmFCdUZySHUrL3pGd3FUa3lYSndXY01M?=
 =?utf-8?B?ZXdFRDMyNXVxemdnVEFyOGhsbytWZzZ0eXFlT0pHYzhFYWZUcyt6QmxTeXRC?=
 =?utf-8?B?RXJLakNBaWFTVzlQZGtiSVRtOHNPYnprSmIvYmwyampxTzhuU00yN05rSElV?=
 =?utf-8?B?WXYza05ncDdmd01QSEo5VVdFYjNPV1dkcDBEalFJMU1qLyswaEtuTG9Kb2hp?=
 =?utf-8?B?NjRGeHR6bXpab1d2c0h0OGxGZTFIb2U5QmVaeHhWUUxZeDFySmtNTlB2NHVn?=
 =?utf-8?B?Ums1VlhVTlIycnphOVU2dytlWXBSbWhkbks1cmFvK00vSjlvYTkvZjU1Zm5x?=
 =?utf-8?B?ZytqRzVFNTU3UGlyTWZWTWdSUVJha0h5d015V25ndUpaMTlqSjY5cWNaamVP?=
 =?utf-8?B?OTZmUXplckNIRWN6MXpLUUkxMzhGS0I3L0pYTTVHakIzQ0UyZy9mWUc2NlUv?=
 =?utf-8?B?V1lETHZSUDBUMG9tekk0M2NTZm1Pa2l3VzNaWjhoRHM1WDlIZnlRSlNKL0JK?=
 =?utf-8?B?V0RGWGMvd0c1eUVQdkM1Q0QyWlZvZ2F1UDV2bE05K0hRSm1SbmcrRFBaRXE4?=
 =?utf-8?B?TzZrMVhPdWZET3h4SDRrSTcxaGZFL3V2NkN5dWVHbzVBcElmdERkTE9GSnht?=
 =?utf-8?B?RmNEUXg3VU9XSDBpTGVqakgrV2NmY3RyRGJDejdUM3JQc3dXZUJVdm4xNy83?=
 =?utf-8?B?Rlh6Z0cwT3ZkbHpFNmZSbUlCemZZbDN2SnMzQlV0U1IxcjVUZStYc1JoWUli?=
 =?utf-8?B?K3BFTFZ2b3h2aXE3SGk3S01aa3BVTnF0anN1ZG42Y01FQk1vT3ZvaEI0dWVk?=
 =?utf-8?B?akhnWTgxRUVpS042NTV2UjE4dXR3SXBTcXhkenVmYTFEUmRQUzNFMDhGangv?=
 =?utf-8?B?VWtOa3dFa1MrcE16c0tDT0VhWlBmcnoxQ1hOUGlPMU9hMnlXSTVTWjRTVi80?=
 =?utf-8?B?elluWXpIeDhvZElzSG52TmZsVHI5cEtkNzBEMjUvc09pTHZodUJGTm1xbWlF?=
 =?utf-8?B?RzZiazZjRlhNWEZxOFc2c3d0YXR5QWg1ZlJEekVKYm1iRlBJbW1ydHpRWUE5?=
 =?utf-8?B?Tk0wOWgyWnE4ZEwxV1ozRDlSL0JEdVhNeEVlVUdrNE1tdDVhWm13QmNtWHZN?=
 =?utf-8?B?V2pKUW9oUVpBUGswOVBhTnNrc3ZTMWxscjNTSnVOVlcva1NidTVkN0ZFNnJm?=
 =?utf-8?B?eGVaYVVWbGJoaDU2a1ZYNTRtbU1oTjVSYUY0ZHhFeFFEZ1EvZG1LKzFtQ2Zn?=
 =?utf-8?B?M0JYeU1hQ0ltVytGUlpXbG5HeWJOZTQ2K0pwVmJpSGFyM3RCVThPczNIeFEr?=
 =?utf-8?B?WVQ5dnNCUnRNSHVEekFoUGQveFdaS3RzRU1EY0lpVkplcVZZMnhScy80bHJv?=
 =?utf-8?B?NStzYWM1Z01zc1pDOHIzNGpMTlpjdXdlNkVoYVhMa2Zic1RNKzI1b1VDZUdz?=
 =?utf-8?B?UTcycVlTMUZVTkhOZXNzWUIzVllYeHBLL3d0MnpQcGMvbUI1TEhsY1lHK01w?=
 =?utf-8?B?Um00SmZYMmM2UEJpdVh2aCswUlpuUk5QMmhrYzZZN0JMb2JjcDBTY2NIU3o2?=
 =?utf-8?B?VENaTGZpQkFsVjBsb3pxMkkxTXhsYkdxUFRjZ2pIQy82UjJ0NlAzTDJRaXBy?=
 =?utf-8?B?eWVoTEo3aCtmS09LU0VPeGtNYUpXV0U5R3dTVHpBZDJ3ZWY1RGhrZ3F1aW1w?=
 =?utf-8?B?ODJnSmlneEJ5bGJrODFJN0R5bU95S3ZSV1N1dFk2bFBXTmlHRGpkNlYrVENz?=
 =?utf-8?B?amNpeDV4cGorTFZSekZtK2wyMmNpR1hZamN1dkZjZVJlam8zL3dnZ2lMc3Ix?=
 =?utf-8?B?ZVdSd1dRZmNISnlMdDhlcDI2UHJnY2dhQXR0R0tWUjFCZXVKZ0VidTNsdm55?=
 =?utf-8?B?N1ZCY3J1c2Vlay9NNGVMTVJUVDI1eU1JM2Zoa3AxNHFUeXNBREdkYm1MYm5l?=
 =?utf-8?B?N1BhbUVObWtId3dSWjY0Uk1vOVZDWmcrZzNaY2hMUDVVMkpyelpPTkRuNkRJ?=
 =?utf-8?B?QVROVEFITDROWXhWMzdYeVMxYkRFdmVXcnVHTjMwaHJRRW5lci94UHlEaTQr?=
 =?utf-8?B?YW1PckxnQmE5ckRYODlvd3pBRkMxWlg4N3AyeTVlVkZVQ2VnWG5URlpBZURD?=
 =?utf-8?Q?6Zk4HblER7cvLjjeDDgJHMEmZ?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 21:25:12.3334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2c3631-08e7-448e-ea15-08de1e4422d0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA09EE1970

Hi Kory,

On 11/6/2025 4:49 AM, Kory Maincent (TI.com) wrote:
> The vdd_mpu regulator maximum voltage was previously limited to 1.2985V,
> which prevented the CPU from reaching the 1GHz operating point. This
> limitation was put in place because voltage changes were not working
> correctly, causing the board to stall when attempting higher frequencies.
> Increase the maximum voltage to 1.3515V to allow the full 1GHz OPP to be
> used.
>
> Add a TPS65219 PMIC driver fixes that properly implement the LOCK register
> handling, to make voltage transitions work reliably.
>
> Changes in v2:
> - Setup a custom regmap_bus only for the TPS65214 instead of checking
>   the chip_id every time reg_write is called.
> - Add the am335x-bonegreen-eco devicetree change in the same patch
>   series.

Reviewed-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>

>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
> Kory Maincent (TI.com) (2):
>       mfd: tps65219: Implement LOCK register handling for TPS65214
>       ARM: dts: am335x-bonegreen-eco: Enable 1GHz OPP by increasing vdd_mpu voltage
>
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts |  2 +-
>  drivers/mfd/tps65219.c                             | 51 +++++++++++++++++++++-
>  include/linux/mfd/tps65219.h                       |  2 +
>  3 files changed, 53 insertions(+), 2 deletions(-)
> ---
> base-commit: 1c353dc8d962de652bc7ad2ba2e63f553331391c
> change-id: 20251106-fix_tps65219-dd62141d22cf
>
> Best regards,

