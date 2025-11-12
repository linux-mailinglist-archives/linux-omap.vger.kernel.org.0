Return-Path: <linux-omap+bounces-4911-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 647C6C540DA
	for <lists+linux-omap@lfdr.de>; Wed, 12 Nov 2025 20:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15E0E3B0117
	for <lists+linux-omap@lfdr.de>; Wed, 12 Nov 2025 19:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69D834B438;
	Wed, 12 Nov 2025 19:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dH+/pRpn"
X-Original-To: linux-omap@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012061.outbound.protection.outlook.com [52.101.43.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDA633A026;
	Wed, 12 Nov 2025 19:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762974217; cv=fail; b=rVXiXe02KzDix0fMzFYsqblg2ZeBXlkFP6uMnub5HQ7dRf50RizFrcc9o0EaFPah4+E2cNoPlzG7ztepsguSNASvr6+o6CzyPKah9fu09C09yVKUTvjV0U08uwfmTbmiuBW+yoOpWmas6v6t6axwqN9IinPqHmHE7/nmXi0PTeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762974217; c=relaxed/simple;
	bh=rUMrp+6xrUAHoVF0m8ksdv4yKv9L93McAeveADuxkNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ed65n9vw9jd2IaRl388D2Y/d4MtRz56ZZ5Fl2gBOM4QvcYOtyES/zXgaBbytnmq+bdB9h1jyxoH4bIdK+D7cZPnCsyEFn2bC98DqMYym4mZHSWFXq/vizIQh+2FeZSXkrSocflULodeOIlWPbAFm0k9rR+QoY9MC4cFzR82EbOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dH+/pRpn; arc=fail smtp.client-ip=52.101.43.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5cpJQZsc5aXmbzeMzC5haM9Xd5Idt/SnrNAU7NyR/kUcOvWzrYZfgV6QdkqwkvvAq9OJC2kpThTayrmwAe/m4e/nJz8n1Fvj5940MKDDmKwwUUjj0QQdFVt5MJpi9sDCg/smZPlZ62Gy584BqYLoF97pJoXmdrXpYdHMuCh7ciXL+mZQkehIPjYqhfSLhjKHQ0+caZhA+M7xLPfIP2u0ksbft8DPkOSCIhbQmCFRvamPmeO6IKLelLyafhWxcL6z5Nl7+5iE7sGbwvanV41AC+U1MUav7WI+HZLJmeCcpDBjQcDV/9JVnlPkDnMxnegyDOlOgjk+N0p76h3igXmqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fay81hVUrORiCZdZGEHKh5DIRT0r63EEk9jmeJs/NnI=;
 b=Jz3HbAT2XX13jm8ybMe5ehejCFrI21ZFxSlmzYqKprWYfzEZwBGB9iKy/w+cpsQ/2t0pasLDHRoLPWy1uc256rKQkz3NaSyitj6Nj7DMPpY2eGd9JZ6t7ejFqNRkoYkM3e5Io9SbYUFNusr+46rlIj1jaSHRFSdHBahmBgU8DTlkU+YzTplPZkl9mZN0dmsfxtbY1vVGxV+gwHbwfb1DIOqe+ahNlc1qr6iTxgclQT/soCL+OYOrSN/v+Np6mvCltg43L1A76rgCfd+V74xaxdKbHzhuLFhCCdSm4NIec3WP4tPNvhvHu3tjWdsAt63Tof7d+kTjPyLhMLgYmiDiFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fay81hVUrORiCZdZGEHKh5DIRT0r63EEk9jmeJs/NnI=;
 b=dH+/pRpnzYLEHU10TRortb/TAzLS7U3B1OoCBjTqRlni+ALyRqWG1wN6QJ790bHnnssCrhqmqA6J/AK3qJhyoneIlGyB9aiN3d7CuAvaz+Kaoz4h5mdyE0PQXTuGL4DX8BsQ3vhTq5DK4oAKL2tLpOfzPtunWbZCrjl3WRUgwTg=
Received: from MN2PR15CA0064.namprd15.prod.outlook.com (2603:10b6:208:237::33)
 by CYXPR10MB7921.namprd10.prod.outlook.com (2603:10b6:930:e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 19:03:32 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:237:cafe::bb) by MN2PR15CA0064.outlook.office365.com
 (2603:10b6:208:237::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Wed,
 12 Nov 2025 19:03:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 19:03:29 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 13:03:23 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 13:03:23 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 13:03:23 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACJ3MvJ3202957;
	Wed, 12 Nov 2025 13:03:22 -0600
Message-ID: <454220b7-81cc-4450-812c-06bfbe527ee2@ti.com>
Date: Wed, 12 Nov 2025 13:03:22 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] mfd: tps65219: Implement LOCK register handling
 for TPS65214
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, Aaro Koskinen
	<aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman
	<khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
	<tony@atomide.com>, Lee Jones <lee@kernel.org>, Shree Ramamoorthy
	<s-ramamoorthy@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Bajjuri Praneeth <praneeth@ti.com>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, <linux-omap@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20251112-fix_tps65219-v4-0-696a0f55d5d8@bootlin.com>
 <20251112-fix_tps65219-v4-1-696a0f55d5d8@bootlin.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251112-fix_tps65219-v4-1-696a0f55d5d8@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|CYXPR10MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: 48331d56-8103-4fb6-7337-08de221e2af7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDA0Sm1mL2YrUktkQlVVdThBanRBK2IzeXpGeHVnckIwT0NlejgybUpOYU5E?=
 =?utf-8?B?eXdaVUw0a0NKaXJOUldYNkRpdUhHWER0cWZCbm1KQ1Q5VFVOSzVCTW42c0FM?=
 =?utf-8?B?WG9pMEZhUEFMcDA0THZpZmovN2J5WE1YSFBFdUwzRDVsdVdrL1cyU0xiZG1V?=
 =?utf-8?B?cHFRRFlUVGtuYkcvMWdJUXd6Mnc0ZHE1RHNDU1VXRUZlUjVaVlZnWGVTRFdh?=
 =?utf-8?B?bzZiU0NoMHM3S3lCcFEyTmtDL2oyTVUwNEFjN2crMzRpL3lkaUNsUC9UV2Z3?=
 =?utf-8?B?Ym9qSkFFczZxN2RWK2R6ZU1XSTg1YmppclExbXgremdLWklKZVl2RWtkT243?=
 =?utf-8?B?S2ZISk1ncWxEeS9LdmhIUVVRS0hxaG5VZDRoMkN1TUt2TDJZdHgzQUd1eDI0?=
 =?utf-8?B?TmFSNTBBKzhva2RCczNPK1FhS2NCRFBoNHF0K0JlQzUwcTVySnhMa1h2cFBy?=
 =?utf-8?B?ZmJUdG92WnBzaHhDNVRxb2NnYkpHamVLcnZaT3JZaTNnazlyZjZkZ3RnR1Za?=
 =?utf-8?B?NExudkptQ1NKNlRncVFQYWxGRmpHQndva3A3ckV5ZlJpUzBPd2Q3M1BWSTg4?=
 =?utf-8?B?ekpzMDZsV1Erb3VhN3p3OWo4eXplQnNYK25kaHQ4TCtzYTRlak5Ub2lZekF5?=
 =?utf-8?B?dFNyL3hBc1p3elpIcVFoYTVYL0dWOG4xVDFhak1hRTlicERMcG1sUmFoeEJK?=
 =?utf-8?B?VGlZTmJsSFg1cXd6OTNUWVBra0crQm5WOFg3bzFXbDIzVXp4UGpDOVNHVzdN?=
 =?utf-8?B?Ym52U2R4WS9aSUE2cjRseXRPR1dVaXNBbkFpZTF6LzlqS2d5WTd3UHZMWW55?=
 =?utf-8?B?SlhBMXV3NG5kTmdhTkN0aUFFVUhJcnRMbFhRRUdvcEhuR1Rtczg0T3NBZDZL?=
 =?utf-8?B?c01SWGsxMTBoU20rOFloekZPb0Z3SzM1VWR1UXdBS3M5UzVrWm5udU9oUmdw?=
 =?utf-8?B?SnR5b2FJcGptTE9ETktzK0x0NnZGbkVqVDRJSk5KbE1PdFA3cnFhUjhrWGZ1?=
 =?utf-8?B?bUt0czIvUTF3MTFvdTRNT01xbitVUmQ3d0pyWTh6aHdwbXlONzJYVWtaWm02?=
 =?utf-8?B?MFg0ZHRYY21sR1ltaTBYZEZZZEYzWmhuM083YnhkRU9YL0tRVzBqd3RFZi9p?=
 =?utf-8?B?R0x3WmNCSDRGS0RFYzAvaXlyblg0NVhzaG5PaDcxMTJ1RkM2WVU4aXo0ZExG?=
 =?utf-8?B?MkdDeHk4TUpCa0crUVg4K1NWYVFhYThUVXdIY05EMVRJNjY0NnpXVmFlS3py?=
 =?utf-8?B?bVJNaUxnRUN5S1g0K1JVZlRKQ2pRUGNHa2VVTHlBM3Vuejk2TEEya0pKUmdM?=
 =?utf-8?B?TE12R1lraFdRZVE5cVhMeTljQkExbVVCTm9WbmNORkN2ZDBSS092VHBkc2JE?=
 =?utf-8?B?bXF1YjZ1c2poZzlpaXg4OEgyeWJxVWplcGZCZ0Zzc3hTYm40UlBsc2JIWHN3?=
 =?utf-8?B?NU9RT24vdExhVmFNK1dtcG1VSVA0SFVjT21sU1NPMkVXaGdhbDh0R0c4WjRz?=
 =?utf-8?B?SzR1blo0ZG9Cd2JFTFdlR2VSOFd4RG4vRm56Z1N3Rkhmdk9UQ05EVGFEV2lY?=
 =?utf-8?B?ZHVGdHlyR2orZFlVakg5ampibjZtcFREZmlEQy95bUJJQXJKUDN5MGM0WUtF?=
 =?utf-8?B?UnhaWnc4NXVNejJYZEM0Y1pNS3Q1ZkQ3Nm0rZSsrcmFaUnluSHRzdE9BUWpU?=
 =?utf-8?B?NmZ5RHZwbzcreHB3RTBlK1gyTC9seGZHZ1lyYzZuQWRmcFpodDlSZ1NHamJj?=
 =?utf-8?B?MDVkT29jV0lrSzVDMzd6eG52SXJFbnppekZuQTBZNzBqL2VJVklmQ3pwSVVJ?=
 =?utf-8?B?LzFnUmFvR0NlOG5aRFFPZm5yMFZBZWFENThKZHpoRUI3d2FyTUtVWVhQVit0?=
 =?utf-8?B?WGs5SS95VzNiU3BzK2ltNk4ycjBneEQ3NXNHMFcxQ0NJOVE4WnB2VXEvYzg1?=
 =?utf-8?B?OTRYd095T29pd2ZWZjFFK2ZUNjdTT3ZtWkZ6TEJiL3VhdWdPR0dTK2Y5RUdF?=
 =?utf-8?B?bElkQ3dPVEFZSEk2UHZ6MVNRWjd1cjBubzgvMVd5UDdlOHdVTFhacGhuTGJK?=
 =?utf-8?B?MktDM1kwQTU4MUhHSDhGbEE4cDE1RERVS2Z2Z3RaQTBSUSt0dGlmS0ZOYTNt?=
 =?utf-8?Q?2B+EDkIEMphqEvg2YRY36vF/W?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026)(921020)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 19:03:29.7237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48331d56-8103-4fb6-7337-08de221e2af7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7921

On 11/12/25 9:14 AM, Kory Maincent (TI.com) wrote:
> The TPS65214 PMIC variant has a LOCK_REG register that prevents writes to
> nearly all registers when locked. Unlock the registers at probe time and
> leave them unlocked permanently.
> 
> This approach is justified because:
> - Register locking is very uncommon in typical system operation
> - No code path is expected to lock the registers during runtime

Any other entity in the system that could re-lock these registers?
How about low power modes or other PM handling?

> - Adding a custom regmap write function would add overhead to every
>    register write, including voltage changes triggered by CPU OPP
>    transitions from the cpufreq governor which could happen quite
>    frequently
> 
> Cc: stable@vger.kernel.org
> Fixes: 7947219ab1a2d ("mfd: tps65219: Add support for TI TPS65214 PMIC")
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
> Changes in v4:
> - Move the registers unlock in the probe instead of a custom regmap write
>    operation.
> 
> Changes in v3:
> - Removed unused variable.
> 
> Changes in v2:
> - Setup a custom regmap_bus only for the TPS65214 instead of checking
>    the chip_id every time reg_write is called.
> ---
>   drivers/mfd/tps65219.c       | 7 +++++++
>   include/linux/mfd/tps65219.h | 2 ++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
> index 65a952555218d..f1115c5585545 100644
> --- a/drivers/mfd/tps65219.c
> +++ b/drivers/mfd/tps65219.c
> @@ -498,6 +498,13 @@ static int tps65219_probe(struct i2c_client *client)
>   		return ret;
>   	}
>   
> +	if (chip_id == TPS65214) {
> +		ret = i2c_smbus_write_byte_data(client, TPS65214_REG_LOCK,
> +						TPS65214_LOCK_ACCESS_CMD);
> +		if (ret)
> +			return ret;

Might be good to print out some error message here, otherwise LGTM,

Reviewed-by: Andrew Davis <afd@ti.com>

> +	}
> +
>   	ret = devm_regmap_add_irq_chip(tps->dev, tps->regmap, client->irq,
>   				       IRQF_ONESHOT, 0, pmic->irq_chip,
>   				       &tps->irq_data);
> diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
> index 55234e771ba73..3abf937191d0c 100644
> --- a/include/linux/mfd/tps65219.h
> +++ b/include/linux/mfd/tps65219.h
> @@ -149,6 +149,8 @@ enum pmic_id {
>   #define TPS65215_ENABLE_LDO2_EN_MASK                    BIT(5)
>   #define TPS65214_ENABLE_LDO1_EN_MASK			BIT(5)
>   #define TPS65219_ENABLE_LDO4_EN_MASK			BIT(6)
> +/* Register Unlock */
> +#define TPS65214_LOCK_ACCESS_CMD			0x5a
>   /* power ON-OFF sequence slot */
>   #define TPS65219_BUCKS_LDOS_SEQUENCE_OFF_SLOT_MASK	GENMASK(3, 0)
>   #define TPS65219_BUCKS_LDOS_SEQUENCE_ON_SLOT_MASK	GENMASK(7, 4)
> 


