Return-Path: <linux-omap+bounces-4857-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DD3C37C97
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 21:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F0BF04E4821
	for <lists+linux-omap@lfdr.de>; Wed,  5 Nov 2025 20:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F42312D660D;
	Wed,  5 Nov 2025 20:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xIaOMfY3"
X-Original-To: linux-omap@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010000.outbound.protection.outlook.com [40.93.198.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C0A262FC0;
	Wed,  5 Nov 2025 20:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762375956; cv=fail; b=uf5QDmlQyx+za+3zb7H9V5xxw1C7db8WKzMZDMyYkhGUnc3PC1dAiqqAPgvAi7sIFhidVq6qbjAk8GFU2gRmSfdMChYKheGlzkrDehd6xQZUAKICFmTssjoHkAXGWJgHQ4G3B10meJmEz7y7LYctGmbQU90Sx1ryu4SVaT47yW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762375956; c=relaxed/simple;
	bh=CKgBynlu+Gk+gvMnBQkOG6dvv0I6hmkEoa6bpt6M8bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=W7gkg/8U0VTacHaSjo8KO3zXVXM37ljL/f+oJCwd2QmYENch7j0RMI6xoYPsHFixpgAw1inoTzmubHxf5gYaTV3nSmSxiY5kgWHKLEC5aKhdfbWqP8QRSExtgGgnWyjvPbPD3aor6h4pwevDJzi30vQwZfDl/mhnXW2TdEqYKLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xIaOMfY3; arc=fail smtp.client-ip=40.93.198.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymunrxhspbvoOKicZ3hh1cNKjFwokqx0JFtT+7YISBWFnfYyy0FRcsjNCZmKtTzqxQ1hxg31W/ForR0C3/3W/rL5OK5ratbT1gjqcxCGTcMxwPwWQBz+YupInE9VrrwapYNBBIr8BlrhlDfO+YUHttbpIWvzSgg9Qjmreingtmq8SwIV/01SkxEr+PsY4/SsdCmGkf5Aibwhc7mWcrr8jrI30TYsu4wERih1/JglpyzkowCgwDifxZPGcudbvrXImFdtyl0yD8Ruyb8FcxSRudmNk0DwH8CvlXzEm27+if6rq2JcaJ0RRLSbxvYWowrYsFQx4q4irfFkY3d5aiR5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtDXoeQrYMfzTJvjIhmSeYb2t90Mhevrmbfpgwq/SW0=;
 b=Zf7j2+eJcYgnM5et2fIeoW2fK8M77hSyHSemTMfvWS1Hjm5BStgP4RyN0pDmNc1CJ1YQIh7MfC6FRfkIDWn/AvG3tWKUCiwagtlUhZ/Pg8XXHmsiW+lecWTiVfHIa1oRSy/TdUprn7UOeJdYpSkym+DdTnMClwgcjtbUHF+oWqFkKlFcBQK2B3Mo1F+483eIth0QKzbsc38ZEieGhdHQk7LnNwOvHcUzpl9VivdJvGZPy+B2lEC8S4JLn+IVEGIAgNNSohuB5nqu0a+x2sN9f1yH8JvQIsOqRD3kHpTRdc6ShgmblPkizSGZiTTJ8SUtXGhe8nz+iWB8omE/qul1tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtDXoeQrYMfzTJvjIhmSeYb2t90Mhevrmbfpgwq/SW0=;
 b=xIaOMfY34EHmXU/H6XZWmnzEN+sLnkD8vG0PeCzURN+fys88773yhZlKvN9bXy1RxIWv/1LzpCaKvYe3CBf8DT9fnfQ5tY7C3ugnAiRyvnEj3kfOsKB66osHrbOSMtOJxHEX2EjH6Jgl5h6j0zxJV/2d1i10QUaoaQMEWmhrGt4=
Received: from BY5PR04CA0018.namprd04.prod.outlook.com (2603:10b6:a03:1d0::28)
 by SA2PR10MB4474.namprd10.prod.outlook.com (2603:10b6:806:11b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 5 Nov
 2025 20:52:28 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::5d) by BY5PR04CA0018.outlook.office365.com
 (2603:10b6:a03:1d0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.9 via Frontend Transport; Wed, 5
 Nov 2025 20:52:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 20:52:26 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 14:52:22 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 14:52:22 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 14:52:22 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A5KqLNT083928;
	Wed, 5 Nov 2025 14:52:21 -0600
Message-ID: <cadef564-3ef2-435a-9611-ac007f32c10d@ti.com>
Date: Wed, 5 Nov 2025 14:52:21 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: tps65219: Implement LOCK register handling for
 TPS65214
To: Kory Maincent <kory.maincent@bootlin.com>, <linux-omap@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Bajjuri Praneeth <praneeth@ti.com>, Ramamoorthy Shree
	<s-ramamoorthy@ti.com>, <thomas.petazzoni@bootlin.com>, Aaro Koskinen
	<aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman
	<khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
	<tony@atomide.com>, Lee Jones <lee@kernel.org>
References: <20251105174735.1465461-1-kory.maincent@bootlin.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251105174735.1465461-1-kory.maincent@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|SA2PR10MB4474:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb82485-0cbe-4314-ceea-08de1cad3a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmN1cnRQcXpXQ25GYVUrblNQZGlkR09ka1lub0JMcnZJZDMzMWNma1I4SzNw?=
 =?utf-8?B?cG5nVWM2RkEvTzMrdjRBQ0VzNGErc09JUDA2UDNkdCtuOXdCWk1qdG4wcUFz?=
 =?utf-8?B?MnZHVGcrMk90Zjl2SjFyT3JRbmtrWTNzRzJNREd5UGZaSHBWK1VOcFVZYU9r?=
 =?utf-8?B?L1B1bEE0MXVyci9WWFFpQTNGMENndExFSG42YXEzWXdYSlpFS2ZGV2RRbzI5?=
 =?utf-8?B?QVRRNjg3YVJYUVFWK0hXcE0ybXplYjZQN2Z4WjIyWWgyMjlDdE5VOGFVQlpl?=
 =?utf-8?B?WWR3NTI4dzA3eGlwY2U4d3VMdUoxenBLN09oWWpsdlZHS0ViVkovY1lJRFUx?=
 =?utf-8?B?TXlyQ2kxc3dRbzhlMm03Mll0NVZyejF0WkVDQmk5Ym9rdHV2akhyR2hGbGZK?=
 =?utf-8?B?a1ZtcEx4Y1ZvZ3JZa2toaUpDMnRrZnBoMm51bENnNlRlcXllTzJWUVpLQTlx?=
 =?utf-8?B?SGpHSzlmNUJVSzdDbzBCaTZwMmdzeHdMOFkwOFpqOC9hdUZGdk1aeVlKUjZn?=
 =?utf-8?B?eFlNb0pWL0l6SmJlRW42UVQxT0ZLeVhEdmloWkFQTlZ3UlFTaUdJY1IwRTVI?=
 =?utf-8?B?K3MxUHNQcVVtek9MbzlYYWY2dk5WV0llN1NEdHZkVy9NMHhhQkhZSlEvYk5H?=
 =?utf-8?B?Q3JLTG1oVGpuMGtja1BXVm9IbWdoYld1NHJmLzRSKy9qRDZDcHV2cVd4TEtW?=
 =?utf-8?B?OEFEOXVWRFpJeVNKTGRDY2pwZzE1eTE3NENwRnBOM2YrWDZJeWQ1SlE0YVFK?=
 =?utf-8?B?V01JWkJaelNDWEU3YTE0UCtwbXhxdnRLZ3RGR2tXNzJYNjZ2WmYyUUFKSGJl?=
 =?utf-8?B?Zll1YUtsQjJSUS9HcDVVMnF6RlMrT0pHRjVXbUZLOXBZd2F2ZGZndVVIVXJY?=
 =?utf-8?B?M3dFS3p2MUpGTTJsZGhYdE1qUWEyQ3lpMmc2Z01DSnl0aGlqWEoydC80MDdp?=
 =?utf-8?B?NVFzUTJPYW1wcXdDRGpTMG5MbEpUSE5HOVk4bXJmeVhNczR5TlBQRllJek9X?=
 =?utf-8?B?dDlvWTBMZ3FsZ2F1ZnVSZVErbnpOaDlsU0o5bllnTFhvWmJRQ3QzejF4dnpT?=
 =?utf-8?B?OVU4MGFJVEMzZWJhMUVCYzMyK09uYnovYjRRWnBCRmkxYVgwdmk2Zjh6a1ZO?=
 =?utf-8?B?R1RuaGc5cDlyRWJGb3h2emU5VUM4ZngzUUZvMlJMM2lCQXk2SitPeGxNNU5r?=
 =?utf-8?B?elQrMWVsTjFJd3hnZlBPM0dFOUtBVEVXWUxqejFsMFFhdWZ3bDA1K3VxR3hn?=
 =?utf-8?B?UGF0WFhFdjU1b3VQV3RwRHQyQnorcTlDVlZMQldlMXEwd1VibkN4RXhFdHMv?=
 =?utf-8?B?SmVQck9OcVMzQThXc3ZCUVVUNWhqM1JGRDkvMUJPL2lhUC9SU0JYb1JhOXpM?=
 =?utf-8?B?UElqbnhSTFVVM2hIVlc3Nm9tL2pDREMyOFdjZG1yaWZSSUFJSGhBbWdVSDJt?=
 =?utf-8?B?bWFFaG9aNXN5QWV1N3pTRUNVSzNVYkFkdnp2SUh4MkVpdU5IU1NXOGRVUnB5?=
 =?utf-8?B?OHcxbFhQYW5Ob2hrV0dpM2F1NWI1ajJFMURuaHlXVnVNVjU3SE5hUVRhbVZS?=
 =?utf-8?B?QmF2TklpRTNjeEVDYnVZME9GWU1JRkQ4eHVOdU1PNmkwSkpxQUlCVWdhdWF4?=
 =?utf-8?B?WlhjanZJMzdRMWQ5TFdWYjdTQ3BuSjNlTXorcXByOG8xOHBrd241bXpyd3lH?=
 =?utf-8?B?MXd6dnRvSWdKaVg0UFlwbXFyaHpYRFUwd3NOZUczZEJxbmpWWUl2cWFTWGIx?=
 =?utf-8?B?dXNIek1vanBpcklGOUVtdUIwOUEwWEpHNTh5Q2dmNTFQQWRWMzRNbGVQMXhB?=
 =?utf-8?B?ZkFNQmRBaDVWZUFLWkJCa1NlVGcvQ1RENkRORkR5a0Q5QlNpSWttVXB1R01E?=
 =?utf-8?B?STJkVUlPL241L3hxK1BraXp1V2xUdFE3TGRZK3JKSmpBUGY5VnpaeTdZMDNE?=
 =?utf-8?B?M2Q4OXhRWkNmSU96bUlsS0JkL0F6NHg4aWR0RVVFRmZsOXFpN0FnWC84VWcv?=
 =?utf-8?B?NDdaRkxaZXZMUnU4T3NEdDV4bFZkOWZBOVRGTWk1MUZMU2lvZmFSQzgrSmFB?=
 =?utf-8?B?YVEyRFdMRVVFL1RYR3lxdndRVFFiemU5MlkyQ2VEOGhHOU02eTc4M0xheFFJ?=
 =?utf-8?Q?AAZU=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 20:52:26.9934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb82485-0cbe-4314-ceea-08de1cad3a94
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4474

On 11/5/25 11:47 AM, Kory Maincent wrote:
> From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
> 
> The TPS65214 PMIC variant has a LOCK_REG register that prevents writes to
> nearly all registers.
> 
> Implement custom regmap operations that automatically unlock before writes
> and re-lock afterwards for TPS65214, while leaving other chip variants
> unaffected.
> 
> The implementation follows the regmap-i2c design pattern.
> 
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
>   drivers/mfd/tps65219.c       | 53 +++++++++++++++++++++++++++++++++++-
>   include/linux/mfd/tps65219.h |  3 ++
>   2 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
> index 65a952555218d..1d8a06afb1048 100644
> --- a/drivers/mfd/tps65219.c
> +++ b/drivers/mfd/tps65219.c
> @@ -473,6 +473,55 @@ static const struct tps65219_chip_data chip_info_table[] = {
>   	},
>   };
>   
> +static int tps65219_reg_write(void *context, unsigned int reg, unsigned int val)
> +{
> +	struct i2c_client *i2c = context;
> +	struct tps65219 *tps;
> +	int ret;
> +
> +	if (val > 0xff || reg > 0xff)
> +		return -EINVAL;
> +
> +	tps = i2c_get_clientdata(i2c);
> +	if (tps->chip_id == TPS65214) {
> +		ret = i2c_smbus_write_byte_data(i2c, TPS65214_REG_LOCK,
> +						TPS65214_LOCK_ACCESS_CMD);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = i2c_smbus_write_byte_data(i2c, reg, val);
> +	if (ret)
> +		return ret;
> +
> +	if (tps->chip_id == TPS65214)
> +		return i2c_smbus_write_byte_data(i2c, TPS65214_REG_LOCK, 0);
> +
> +	return 0;
> +}
> +
> +static int tps65219_reg_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	struct i2c_client *i2c = context;
> +	int ret;
> +
> +	if (reg > 0xff)
> +		return -EINVAL;
> +
> +	ret = i2c_smbus_read_byte_data(i2c, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val = ret;
> +
> +	return 0;
> +}
> +
> +static const struct regmap_bus tps65219_regmap_bus = {
> +	.reg_write = tps65219_reg_write,
> +	.reg_read = tps65219_reg_read,
> +};
> +
>   static int tps65219_probe(struct i2c_client *client)
>   {
>   	struct tps65219 *tps;
> @@ -490,8 +539,10 @@ static int tps65219_probe(struct i2c_client *client)
>   	tps->dev = &client->dev;
>   	chip_id = (uintptr_t)i2c_get_match_data(client);
>   	pmic = &chip_info_table[chip_id];
> +	tps->chip_id = chip_id;
>   
> -	tps->regmap = devm_regmap_init_i2c(client, &tps65219_regmap_config);
> +	tps->regmap = devm_regmap_init(&client->dev, &tps65219_regmap_bus, client,
> +				       &tps65219_regmap_config);

Why not do the (tps->chip_id == TPS65214) check here and only setup the
special regmap_bus for the TPS65214. Then you don't need to do the checks
every time reg_write is called.

It also means you don't need to store chip_id in the device instance data.

Andrew

>   	if (IS_ERR(tps->regmap)) {
>   		ret = PTR_ERR(tps->regmap);
>   		dev_err(tps->dev, "Failed to allocate register map: %d\n", ret);
> diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
> index 55234e771ba73..53e53cbc5c76f 100644
> --- a/include/linux/mfd/tps65219.h
> +++ b/include/linux/mfd/tps65219.h
> @@ -149,6 +149,8 @@ enum pmic_id {
>   #define TPS65215_ENABLE_LDO2_EN_MASK                    BIT(5)
>   #define TPS65214_ENABLE_LDO1_EN_MASK			BIT(5)
>   #define TPS65219_ENABLE_LDO4_EN_MASK			BIT(6)
> +/* Register Lock */
> +#define TPS65214_LOCK_ACCESS_CMD			0x5a
>   /* power ON-OFF sequence slot */
>   #define TPS65219_BUCKS_LDOS_SEQUENCE_OFF_SLOT_MASK	GENMASK(3, 0)
>   #define TPS65219_BUCKS_LDOS_SEQUENCE_ON_SLOT_MASK	GENMASK(7, 4)
> @@ -444,6 +446,7 @@ struct tps65219 {
>   	struct regmap *regmap;
>   
>   	struct regmap_irq_chip_data *irq_data;
> +	enum pmic_id chip_id;
>   };
>   
>   #endif /* MFD_TPS65219_H */


