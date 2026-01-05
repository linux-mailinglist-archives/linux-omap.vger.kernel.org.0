Return-Path: <linux-omap+bounces-5327-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC33CF55E5
	for <lists+linux-omap@lfdr.de>; Mon, 05 Jan 2026 20:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCFF630BAD60
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jan 2026 19:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C1834107A;
	Mon,  5 Jan 2026 19:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ubc/F03a"
X-Original-To: linux-omap@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011000.outbound.protection.outlook.com [40.107.208.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86472319855;
	Mon,  5 Jan 2026 19:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767640963; cv=fail; b=YY1mWK/SPmASGbgoFukXDM5BByV6bj2lj+KLONSgOUMOVYEfA09+39BBkVRhdkDLKakCPVNmrOx+aSX4HYq3Ej2pUuJY3gl+5YVwB25Hhofkx+fKXg5RA0Ya1GfTghtiNehHtwIjey0B90bP5Lbu5fihDG990nEcSY63exgN/Hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767640963; c=relaxed/simple;
	bh=34LIxHKSOjEbIx5gnJMTwpgiVSAk97t4atzvhnFZW5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Eo4t7ZaPj866QDpkucpPzK5c8AxtE3EzMrLZyxAF/z9xnRfV66dhFcEIl9E5cKrowuQaRV9u5y/Qwa4fw9SpcJtj8cNFMIr1VnOoG0EEdaji8PyIt6J81i0XmMMJ0QOz8aFKc0TdL4+avI+OiMZwzoJf3k/ynw/Vt5KjXMhydwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Ubc/F03a; arc=fail smtp.client-ip=40.107.208.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HN/oAGAGOWETIhxzCvavLBWmpxWRyrInfbS1bh/otgssDo+/dpOy40/FNlHwaIqBF8gUE9FCCI8P51+3X7UWXlQrOoUWOElJsFrwR4UXGa7ci/VYO72YdFWJeZyfCHKyk2FgHWaM7+/tXwV9pO9V4OrKOSUqF41ir5cd+XoxA3lOW8uVVuKEsmxBhCgSp9PCG0RSz61KiF182YFSIm7+njISJPUg622iekh3MICB/0/6OoQwqDLWfnXF7bZW4bjudxp4aWbtIQQJOTCoS/xKu0ZZduwONfUuarDS5gomQ96sCVQ5kGlzuRQIjXOVRUUoRyIltZIhrIv++rQZ4Yt8ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBS4XE1RQjHJ697H+XWglnWyiGY9xQPLImETwM8/eyk=;
 b=DCR3jObrOXX7T3USg/zXyiaIJ0utOJ3jC+9PUb5206daeAtRw0lfNfL978VIMoG1Lo9sP9vogKpYIeR2PHeA/zaWNlzLYOvDfj6UpVv9DCscelpN1BTBHR9egZMNTr4uGc4gsqz/P3mmhgUNLfKIIDoXesjBFcMMw3oSYxizv8YeGwZU506oFj/EzaWydC+ewkdovujYYL1zcmskknWO/GK9tAGUpIUTZ+vaFGeNJ+AenB40EMKh7zMCFn2nXhYWNQZhSXTk5pcMQfeiOTINJUXkxtQ9Wa+xM8iB3VGLGbuOUc6w347nGeOLo7yYtvHqgrcKlNCyng0g1EyDOoLaAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=couthit.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBS4XE1RQjHJ697H+XWglnWyiGY9xQPLImETwM8/eyk=;
 b=Ubc/F03aDqQH+bPIs70LkYsbFpTmoK5NQWUPWI9sPOlB+2sDTlI3dy/KnH+O/+4z1vTJNm7nlyPL8ZWwUrRCICinsv3fxBfJpmlcsKPflTzf1MafpicA6wAfdyLlR4CobBXv1gNMYeXaitrSph9sDnWlgyX0RrhAKJWA7mN+dpw=
Received: from BL0PR05CA0007.namprd05.prod.outlook.com (2603:10b6:208:91::17)
 by BY5PR10MB4227.namprd10.prod.outlook.com (2603:10b6:a03:208::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 19:22:37 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::25) by BL0PR05CA0007.outlook.office365.com
 (2603:10b6:208:91::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1 via Frontend Transport; Mon, 5
 Jan 2026 19:22:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 19:22:35 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 13:22:31 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 13:22:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 13:22:26 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605JMPun1784282;
	Mon, 5 Jan 2026 13:22:25 -0600
Message-ID: <84b08398-5622-45c9-a8fa-54639c1cf0b3@ti.com>
Date: Mon, 5 Jan 2026 13:22:20 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm: dts: ti: Adds support for AM335x and AM437x
To: Parvathi Pudi <parvathi@couthit.com>, <nm@ti.com>, <vigneshr@ti.com>,
	<khilman@baylibre.com>, <rogerq@kernel.org>, <tony@atomide.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<richardcochran@gmail.com>, <aaro.koskinen@iki.fi>, <andreas@kemnade.info>
CC: <andrew@lunn.ch>, <linux-omap@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <danishanwar@ti.com>, <pratheesh@ti.com>,
	<j-rameshbabu@ti.com>, <praneeth@ti.com>, <srk@ti.com>, <rogerq@ti.com>,
	<krishna@couthit.com>, <mohan@couthit.com>, <pmohan@couthit.com>,
	<basharath@couthit.com>, Murali Karicheri <m-karicheri2@ti.com>
References: <20260105162546.1809714-1-parvathi@couthit.com>
 <20260105162546.1809714-3-parvathi@couthit.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260105162546.1809714-3-parvathi@couthit.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|BY5PR10MB4227:EE_
X-MS-Office365-Filtering-Correlation-Id: 450f3670-0e02-4378-7a33-08de4c8fc864
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHQwT09zMCtMUEN2UlJVejhmajhZK21PL0pteDdOVVN1cTU2L0RmTmR2dDFM?=
 =?utf-8?B?d3VwNllHcXIyNC9ReXVmNUJmOXh4VkpnTmduMFZzbnZwcEVpdmMyaU5mVWg3?=
 =?utf-8?B?aTdlU1hodlJxLzBrdXhkdzVDRG81RUNjVU9tVlZNcGNZOERLM0lIRFRweUMx?=
 =?utf-8?B?b1ZTNUMzcmd1RGZOR3U1RHQwcGlpUzM4SzdQOVN2UlNHR2JhRXRkZFlMWm9s?=
 =?utf-8?B?TGxHenpaT1NPMjU3a0R0RXJWakVlN2drcXI1T0lsVUlpTTc1b01mSjlZUHd3?=
 =?utf-8?B?MW1wWnQwbGlaUDdualBYSTBFL3Q1MGd4VEJydFdXcWIvT3JnTTRaYlBTZm1s?=
 =?utf-8?B?MzJNbGI1cjJoZkF4SnhwbkRpd1czVEZ1dksvYkVSYXRmbEhwcjZpaU5ESmFK?=
 =?utf-8?B?d25MbCt1YTFOZmN0ak5Hd05lTGNQeVN0YXFkaks5RVZMYUlFMVh4OURYaUxY?=
 =?utf-8?B?c0tGc0RjY25jQkhieFdsM0x3a1YvZ0tJMVBXWXlMQ3ZENE1zMWlLVVRqeVAx?=
 =?utf-8?B?Znl5TEJ5SnJmRzFKNlRGNFduYktYVXZmTldPcVZ4bUg1bTcwcHdxWVc5TTlU?=
 =?utf-8?B?Q1RwZUt6aUsybThrQ0ZaZ3FRV0Rhcm9lSlJYamdRenc3bEJvaVJlQWtwQW5M?=
 =?utf-8?B?ZFUyT3Y2M21mcWN0MDBoWisza0s4ZzFadmxjM2pncGxIb01SNUVsUzROK09S?=
 =?utf-8?B?QTFLTWdLZUZWVXFYRE50NE91VHErenFKYXppc08wSFVQK1BZd2ZvMWJ2L3Nn?=
 =?utf-8?B?R1NZY3VGeTZtRXBtbmQxTXpOeUhNR3ljTDlNeHpUVVVjUzdyMWIzc1Z0UFJJ?=
 =?utf-8?B?NDdCSWZBQ25DUHVPM3FKOVFrWFhwR0N1d2dDNEwrbDJKTkhLUUNZVUIxODFG?=
 =?utf-8?B?MnZrNWcxYUEwcTRNN1ZPNHlYVUFYSkVLZm9mV1lveU5aelB2bnErUElDaUZ2?=
 =?utf-8?B?WFpUZmdhQnp4Tmo0OFNpZmF6S2xhWTB2OTFxQTdpRnRCdU45M0IxVlV5L0Rm?=
 =?utf-8?B?TGZPVm1TRkg3dXVObmZmZmpRVW9OcUVvd1F6amhHSW1WY3VUVkw1cyt1elVI?=
 =?utf-8?B?WGdQcE80bVBnUVlhZ1lqQkdiVlhkOER2ZGhDc2J3TUluYUZyOFNpRXdBUStn?=
 =?utf-8?B?eVNXWkN5a0huMnpadkNoUGNXL055Mjh0VUpxTWJyUU0rK1ZNb1N0dzhCSU5M?=
 =?utf-8?B?Uzh4dWs0RkF4cE03bXpZM0hzK1hrWFhlQlgwT2dtZjN5bjB6NCsxY3dsMjNY?=
 =?utf-8?B?bVkzK3BlK3R6RUJQVnNnUlUybEVHem13VFNLSTdYajdrcDNtc053SzRmazkr?=
 =?utf-8?B?dGxBeDc3cEVVTGRHNDZwOFlaZGtqdnliK29wandwbTJJVUwwSU8xUWhUOUJx?=
 =?utf-8?B?TlNGQyszOThwQThaaXBTTDNFZzkvd28ralBTZ21iZ3dTN1c0dDQ2T29XOEJi?=
 =?utf-8?B?d0l4VVZNOHh0cmhFOElUUlRuMXY1UHBDcXU5RjQ2ak0yeXF1bkpSS0REeWk2?=
 =?utf-8?B?amtzekdDYi8vY1dkRXlzYmJLUUhrUEwrdklLczVXbkdKUENkOHRJS3hCUXVY?=
 =?utf-8?B?eTByckhmQVRwTmRGemdpa2hzOTgrSmlxY2NCOUNxeWp3VmZtTzJ5M2xUcWU1?=
 =?utf-8?B?azR6bDFUUUdXc25Od0FicFVWSUlMU3hERGJZV1NjR3lvdmJPTHVLUGJPWG9q?=
 =?utf-8?B?NHFNdUJtbVpUT2lKelA3bHRmMnJIc3FPa2xMRnRBeXhNZjBzUzJ1SnlrMzhn?=
 =?utf-8?B?Rk5VZmJWOFJhUGZ4Q3ZUQldQSTJMOGh3WWw1RXpJRE10T2p4RDUvU3FqekRQ?=
 =?utf-8?B?VjgzMnR4SWRabVczSHJOR1hHaGljT1ZZV0dUMzNjUUM4RHc5emlxMUJybzNX?=
 =?utf-8?B?TExncjMyTkVPdndqbTJNVk9YM0padHV3eTFRRktUS1AxRDI3TEErWXFISEFG?=
 =?utf-8?B?Q0lvemFjYXlDaXZjVVBpS0xrMnFOelBlN2VHZFRwMnE1UkFkVDZKbDcxck1i?=
 =?utf-8?B?V1RNc05wWTNlT1N4MGdrbnlzRktrdnY1dy9KTTZlSXdYeWp6Z3lLaTVWM1R3?=
 =?utf-8?B?TnRLSVI4Uk5kU0t4Y1NQWXRzZW04Qks4YzZSdz09?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 19:22:35.8502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 450f3670-0e02-4378-7a33-08de4c8fc864
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4227

On 1/5/26 10:21 AM, Parvathi Pudi wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> PRU-ICSS instance consists of two PRU cores along with various
> peripherals such as the Interrupt Controller (PRU_INTC), the Industrial
> Ethernet Peripheral(IEP), the Real Time Media Independent Interface
> controller (MII_RT), and the Enhanced Capture (eCAP) event module.
> 
> The TI Sitara AM335x ICE-V2 consists of single PRU-ICSS instance,
> This patch adds the new device tree overlay file in-order to enable
> PRU-ICSS instance, along with makefile changes.
> 
> The TI Sitara AM437x series of devices consists of 2 PRU-ICSS instances
> (PRU-ICSS0 and PRU-ICSS1). This patch adds the device tree nodes for the
> PRU-ICSS1 instance to support DUAL-MAC mode of operation. Support for
> Ethernet over PRU is available only for ICSS1 instance.
> 
> am33xx-l4.dtsi, am4372.dtsi - Adds IEP and eCAP peripheral as child nodes
> of the PRUSS subsystem node.
> 
> am335x-icev2-prueth.dtso, am437x-idk-evm.dts - Adds PRU-ICSS
> instance node along with PRU eth port information and corresponding
> port configuration. It includes interrupt mapping for packet reception,
> HW timestamp collection, and PRU Ethernet ports in MII mode,
> 
> GPIO configuration, boot strapping along with delay configuration for
> individual PRU Ethernet port and other required nodes.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> ---
>   arch/arm/boot/dts/ti/omap/Makefile            |   5 +
>   .../ti/omap/am335x-icev2-prueth-overlay.dtso  | 190 ++++++++++++++++++
>   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |  11 +
>   arch/arm/boot/dts/ti/omap/am4372.dtsi         |  11 +
>   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts  | 137 ++++++++++++-
>   5 files changed, 353 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso
> 
> diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
> index 14e500846875..c68948035eca 100644
> --- a/arch/arm/boot/dts/ti/omap/Makefile
> +++ b/arch/arm/boot/dts/ti/omap/Makefile
> @@ -82,6 +82,10 @@ dtb-$(CONFIG_ARCH_OMAP4) += \
>   	omap4-var-stk-om44.dtb \
>   	omap4-xyboard-mz609.dtb \
>   	omap4-xyboard-mz617.dtb
> +
> +am335x-icev2-prueth-dtbs := am335x-icev2.dtb \
> +	am335x-icev2-prueth-overlay.dtbo
> +
>   dtb-$(CONFIG_SOC_AM33XX) += \
>   	am335x-baltos-ir2110.dtb \
>   	am335x-baltos-ir3220.dtb \
> @@ -100,6 +104,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
>   	am335x-evmsk.dtb \
>   	am335x-guardian.dtb \
>   	am335x-icev2.dtb \
> +	am335x-icev2-prueth.dtb \
>   	am335x-lxm.dtb \
>   	am335x-mba335x.dtb \
>   	am335x-moxa-uc-2101.dtb \
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso b/arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso
> new file mode 100644
> index 000000000000..abde5119875f
> --- /dev/null
> +++ b/arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DT overlay for IDK AM335x
> + *
> + * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +/*
> + * AM335x ICE V2 board
> + * http://www.ti.com/tool/tmdsice3359
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/bus/ti-sysc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/am33xx.h>
> +#include <dt-bindings/clock/am3.h>
> +
> +&{/} {
> +        /* Dual-MAC Ethernet application node on PRU-ICSS */
> +        pruss_eth: pruss-eth {
> +                compatible = "ti,am3359-prueth";
> +                ti,prus = <&pru0>, <&pru1>;
> +                sram = <&ocmcram>;
> +                ti,mii-rt = <&pruss_mii_rt>;
> +                ti,iep = <&pruss_iep>;
> +                ti,ecap = <&pruss_ecap>;
> +                interrupts = <20 2 2>, <21 3 3>;
> +                interrupt-names = "rx_hp", "rx_lp";
> +                interrupt-parent = <&pruss_intc>;
> +
> +                pinctrl-0 = <&pruss_eth_default>;
> +                pinctrl-names = "default";
> +
> +                ethernet-ports {
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +                        pruss_emac0: ethernet-port@0 {
> +                                reg = <0>;
> +                                phy-handle = <&pruss_eth0_phy>;
> +                                phy-mode = "mii";
> +                                interrupts = <20 2 2>, <26 6 6>, <23 6 6>;
> +                                interrupt-names = "rx", "emac_ptp_tx",
> +                                                  "hsr_ptp_tx";
> +                                /* Filled in by bootloader */
> +                                local-mac-address = [00 00 00 00 00 00];
> +                        };
> +
> +                        pruss_emac1: ethernet-port@1 {
> +                                reg = <1>;
> +                                phy-handle = <&pruss_eth1_phy>;
> +                                phy-mode = "mii";
> +                                interrupts = <21 3 3>, <27 9 7>, <24 9 7>;
> +                                interrupt-names = "rx", "emac_ptp_tx",
> +                                                  "hsr_ptp_tx";
> +                                /* Filled in by bootloader */
> +                                local-mac-address = [00 00 00 00 00 00];
> +                        };
> +                };
> +        };
> +};
> +
> +&am33xx_pinmux {
> +	/* MDIO node for PRU-ICSS */
> +        pruss_mdio_default: pruss_mdio_default {
> +                pinctrl-single,pins = <
> +                        /* gpmc_clk.pr1_mdio_mdclk */
> +                        AM33XX_PADCONF(0x88c, PIN_OUTPUT, MUX_MODE5)
> +                        /* gpmc_csn3.pr1_mdio_data */
> +                        AM33XX_PADCONF(0x888, PIN_INPUT, MUX_MODE5)

Have you regenerated this list lately? The pinmux tool usually puts the
comment after the PADCONF entry. It also now also shows the pin number
in the comment which is nice:

	AM33XX_IOPAD(0x88c, PIN_OUTPUT, MUX_MODE5) /* (V12) gpmc_clk.pr1_mdio_mdclk */
	AM33XX_IOPAD(0x888, PIN_INPUT, MUX_MODE5) /* (T13) gpmc_csn3.pr1_mdio_data */

I'd recommend regenerating these nodes to match the latest pinmux tool output.

> +                        /* gpmc_ben0_cle.gpio2_5 */
> +                        AM33XX_PADCONF(0x89c, PIN_INPUT_PULLUP, MUX_MODE7)
> +                        /* disable CPSW MDIO */

Is this needed? If you disable the CPSW MDIO node the pinmux should be unset,
so not sure why you are muxing these to GPIO pins.

Also, this patch is a bit busy, might be easier to review if you split it
into one for AM335x and one for AM437x changes.

Andrew

> +                        /* mdio_data.gpio0_0 */
> +                        AM33XX_PADCONF(0x948, PIN_INPUT_PULLUP, MUX_MODE7)
> +                        /* mdio_clk.gpio0_1 */
> +                        AM33XX_PADCONF(0x94c, PIN_INPUT_PULLUP, MUX_MODE7)
> +                >;
> +        };
> +
> +	/* Pinmux configuration for PRU-ICSS */
> +        pruss_eth_default: pruss_eth_default {
> +                pinctrl-single,pins = <
> +                        /* dss_data0.pr1_mii_mt0_clk */
> +                        AM33XX_PADCONF(0x8a0, PIN_INPUT,   MUX_MODE2)
> +                        /* dss_data5.pr1_mii0_txd0 */
> +                        AM33XX_PADCONF(0x8b4, PIN_OUTPUT,  MUX_MODE2)
> +                        /* dss_data4.pr1_mii0_txd1 */
> +                        AM33XX_PADCONF(0x8b0, PIN_OUTPUT,  MUX_MODE2)
> +                        /* dss_data3.pr1_mii0_txd2 */
> +                        AM33XX_PADCONF(0x8ac, PIN_OUTPUT,  MUX_MODE2)
> +                        /* dss_data2.pr1_mii0_txd3 */
> +                        AM33XX_PADCONF(0x8a8, PIN_OUTPUT,  MUX_MODE2)
> +                        /* dss_data11.pr1_mii0_rxd0 */
> +                        AM33XX_PADCONF(0x8cc, PIN_INPUT,   MUX_MODE5)
> +                        /* dss_data10.pr1_mii0_rxd1 */
> +                        AM33XX_PADCONF(0x8c8, PIN_INPUT,   MUX_MODE5)
> +                        /* dss_data9.pr1_mii0_rxd2 */
> +                        AM33XX_PADCONF(0x8c4, PIN_INPUT,   MUX_MODE5)
> +                        /* dss_data8.pr1_mii0_rxd3 */
> +                        AM33XX_PADCONF(0x8c0, PIN_INPUT,   MUX_MODE5)
> +                        /* dss_data1.pr1_mii0_txen */
> +                        AM33XX_PADCONF(0x8a4, PIN_OUTPUT,  MUX_MODE2)
> +                        /* dss_data14.pr1_mii_mr0_clk */
> +                        AM33XX_PADCONF(0x8d8, PIN_INPUT,   MUX_MODE5)
> +                        /* dss_data15.pr1_mii0_rxdv */
> +                        AM33XX_PADCONF(0x8dc, PIN_INPUT,   MUX_MODE5)
> +                        /* dss_data13.pr1_mii0_rxer */
> +                        AM33XX_PADCONF(0x8d4, PIN_INPUT,   MUX_MODE5)
> +                        /* dss_data12.pr1_mii0_rxlink */
> +                        AM33XX_PADCONF(0x8d0, PIN_INPUT,   MUX_MODE5)
> +                        /* dss_pclk.pr1_mii0_crs */
> +                        AM33XX_PADCONF(0x8e8, PIN_INPUT,   MUX_MODE2)
> +
> +                        /* gpmc_a0.pr1_mii_mt1_clk */
> +                        AM33XX_PADCONF(0x840, PIN_INPUT,   MUX_MODE5)
> +                        /* gpmc_a4.pr1_mii1_txd0 */
> +                        AM33XX_PADCONF(0x850, PIN_OUTPUT,  MUX_MODE5)
> +                        /* gpmc_a3.pr1_mii1_txd1 */
> +                        AM33XX_PADCONF(0x84c, PIN_OUTPUT,  MUX_MODE5)
> +                        /* gpmc_a2.pr1_mii1_txd2 */
> +                        AM33XX_PADCONF(0x848, PIN_OUTPUT,  MUX_MODE5)
> +                        /* gpmc_a1.pr1_mii1_txd3 */
> +                        AM33XX_PADCONF(0x844, PIN_OUTPUT,  MUX_MODE5)
> +                        /* gpmc_a8.pr1_mii1_rxd0 */
> +                        AM33XX_PADCONF(0x860, PIN_INPUT,   MUX_MODE5)
> +                        /* gpmc_a7.pr1_mii1_rxd1 */
> +                        AM33XX_PADCONF(0x85c, PIN_INPUT,   MUX_MODE5)
> +                        /* gpmc_a6.pr1_mii1_rxd2 */
> +                        AM33XX_PADCONF(0x858, PIN_INPUT,   MUX_MODE5)
> +                        /* gpmc_a5.pr1_mii1_rxd3 */
> +                        AM33XX_PADCONF(0x854, PIN_INPUT,   MUX_MODE5)
> +                        /* gpmc_wpn.pr1_mii1_txen */
> +                        AM33XX_PADCONF(0x874, PIN_OUTPUT,  MUX_MODE5)
> +                        /* gpmc_a9.pr1_mii_mr1_clk */
> +                        AM33XX_PADCONF(0x864, PIN_INPUT,   MUX_MODE5)
> +                        /* gpmc_a10.pr1_mii1_rxdv */
> +                        AM33XX_PADCONF(0x868, PIN_INPUT,   MUX_MODE5)
> +                        /* gpmc_a11.pr1_mii1_rxer */
> +                        AM33XX_PADCONF(0x86c, PIN_INPUT,   MUX_MODE5)
> +                        /* gpmc_ben1.pr1_mii1_rxlink */
> +                        AM33XX_PADCONF(0x878, PIN_INPUT,   MUX_MODE5)
> +                        /* lcd_ac_bias_en.pr1_mii1_crs */
> +                        AM33XX_PADCONF(0x8ec, PIN_INPUT,   MUX_MODE2)
> +                        /* gpmc_wait0.pr1_mii1_col */
> +                        AM33XX_PADCONF(0x870, PIN_INPUT,   MUX_MODE5)
> +                >;
> +        };
> +};
> +
> +&gpio3 {
> +        mux-mii-hog {
> +                /* ETH1 mux: Low for MII-PRU, high for RMII-CPSW */
> +                output-low;
> +        };
> +};
> +
> +/*
> + * Disable CPSW switch node and
> + * MDIO configuration to prevent
> + * conflict with PRU-ICSS
> + */
> +&mac_sw {
> +        status = "disable";
> +};
> +
> +&davinci_mdio_sw {
> +        status = "disable";
> +};
> +
> +/* PRU-ICSS MDIO configuration */
> +&pruss_mdio {
> +        pinctrl-0 = <&pruss_mdio_default>;
> +        pinctrl-names = "default";
> +        reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
> +        reset-delay-us = <2>; /* PHY datasheet states 1uS min */
> +        status = "okay";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pruss_eth0_phy: ethernet-phy@1 {
> +                 reg = <1>;
> +        };
> +
> +        pruss_eth1_phy: ethernet-phy@3 {
> +                 reg = <3>;
> +        };
> +};
> diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> index 89d16fcc773e..a63ef307d918 100644
> --- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> @@ -896,6 +896,17 @@ pruss_mii_rt: mii-rt@32000 {
>   					reg = <0x32000 0x58>;
>   				};
>   
> +				pruss_iep: iep@2e000 {
> +					compatible = "ti,am3356-icss-iep";
> +					reg = <0x2e000 0x31c>;
> +					clocks = <&pruss_iepclk_mux>;
> +				};
> +
> +				pruss_ecap: ecap@30000 {
> +					compatible = "ti,pruss-ecap";
> +					reg = <0x30000 0x60>;
> +				};
> +
>   				pruss_intc: interrupt-controller@20000 {
>   					compatible = "ti,pruss-intc";
>   					reg = <0x20000 0x2000>;
> diff --git a/arch/arm/boot/dts/ti/omap/am4372.dtsi b/arch/arm/boot/dts/ti/omap/am4372.dtsi
> index 504fa6b57d39..494f251c8e6a 100644
> --- a/arch/arm/boot/dts/ti/omap/am4372.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/am4372.dtsi
> @@ -476,6 +476,17 @@ pruss1_mii_rt: mii-rt@32000 {
>   					reg = <0x32000 0x58>;
>   				};
>   
> +				pruss1_iep: iep@2e000 {
> +					compatible = "ti,am4376-icss-iep";
> +					reg = <0x2e000 0x31c>;
> +					clocks = <&pruss1_iepclk_mux>;
> +				};
> +
> +				pruss1_ecap: ecap@30000 {
> +					compatible = "ti,pruss-ecap";
> +					reg = <0x30000 0x60>;
> +				};
> +
>   				pruss1_intc: interrupt-controller@20000 {
>   					compatible = "ti,pruss-intc";
>   					reg = <0x20000 0x2000>;
> diff --git a/arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts b/arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts
> index 826f687c368a..3d755d875a70 100644
> --- a/arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts
> +++ b/arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts
> @@ -168,6 +168,48 @@ led-out7 {
>   			default-state = "off";
>   		};
>   	};
> +
> +	/* Dual-MAC Ethernet application node on PRU-ICSS1 */
> +	pruss1_eth: pruss1-eth {
> +		compatible = "ti,am4376-prueth";
> +		ti,prus = <&pru1_0>, <&pru1_1>;
> +		sram = <&ocmcram>;
> +		ti,mii-rt = <&pruss1_mii_rt>;
> +		ti,iep = <&pruss1_iep>;
> +		ti,ecap = <&pruss1_ecap>;
> +		interrupts = <20 2 2>, <21 3 3>;
> +		interrupt-names = "rx_hp", "rx_lp";
> +		interrupt-parent = <&pruss1_intc>;
> +
> +		pinctrl-0 = <&pruss1_eth_default>;
> +		pinctrl-names = "default";
> +
> +		ethernet-ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			pruss1_emac0: ethernet-port@0 {
> +				reg = <0>;
> +				phy-handle = <&pruss1_eth0_phy>;
> +				phy-mode = "mii";
> +				interrupts = <20 2 2>, <26 6 6>, <23 6 6>;
> +				interrupt-names = "rx", "emac_ptp_tx",
> +						  "hsr_ptp_tx";
> +				/* Filled in by bootloader */
> +				local-mac-address = [00 00 00 00 00 00];
> +			};
> +
> +			pruss1_emac1: ethernet-port@1 {
> +				reg = <1>;
> +				phy-handle = <&pruss1_eth1_phy>;
> +				phy-mode = "mii";
> +				interrupts = <21 3 3>, <27 9 5>, <24 9 5>;
> +				interrupt-names = "rx", "emac_ptp_tx",
> +						  "hsr_ptp_tx";
> +				/* Filled in by bootloader */
> +				local-mac-address = [00 00 00 00 00 00];
> +			};
> +		};
> +	};
>   };
>   
>   &am43xx_pinmux {
> @@ -303,6 +345,86 @@ AM4372_IOPAD(0x94c, PIN_INPUT_PULLDOWN | MUX_MODE7)
>   		>;
>   	};
>   
> +	pruss1_mdio_default: pruss1_mdio_default {
> +		pinctrl-single,pins = <
> +			/* gpmc_clk.pr1_mdio_mdclk */
> +			AM4372_IOPAD(0x88c, (PIN_OUTPUT | MUX_MODE5))
> +			/* xdma_event_intr0.pr1_mdio_data */
> +			AM4372_IOPAD(0xa70, (PIN_INPUT  | MUX_MODE8))
> +			/* cam1_data6.gpio4_20 */
> +			AM4372_IOPAD(0xa00, (PIN_INPUT_PULLUP | MUX_MODE7))
> +		>;
> +	};
> +
> +	pruss1_eth_default: pruss1_eth_default {
> +		pinctrl-single,pins = <
> +			/* dss_data0.pr1_mii_mt0_clk */
> +			AM4372_IOPAD(0x8a0, (PIN_INPUT  | MUX_MODE2))
> +			/* dss_data5.pr1_mii0_txd0 */
> +			AM4372_IOPAD(0x8b4, (PIN_OUTPUT | MUX_MODE2))
> +			/* dss_data4.pr1_mii0_txd1 */
> +			AM4372_IOPAD(0x8b0, (PIN_OUTPUT | MUX_MODE2))
> +			/* dss_data3.pr1_mii0_txd2 */
> +			AM4372_IOPAD(0x8ac, (PIN_OUTPUT | MUX_MODE2))
> +			/* dss_data2.pr1_mii0_txd3 */
> +			AM4372_IOPAD(0x8a8, (PIN_OUTPUT | MUX_MODE2))
> +			/* dss_data11.pr1_mii0_rxd0 */
> +			AM4372_IOPAD(0x8cc, (PIN_INPUT  | MUX_MODE5))
> +			/* dss_data10.pr1_mii0_rxd1 */
> +			AM4372_IOPAD(0x8c8, (PIN_INPUT  | MUX_MODE5))
> +			/* dss_data9.pr1_mii0_rxd2 */
> +			AM4372_IOPAD(0x8c4, (PIN_INPUT  | MUX_MODE5))
> +			/* dss_data8.pr1_mii0_rxd3 */
> +			AM4372_IOPAD(0x8c0, (PIN_INPUT  | MUX_MODE5))
> +			/* dss_data1.pr1_mii0_txen */
> +			AM4372_IOPAD(0x8a4, (PIN_OUTPUT | MUX_MODE2))
> +			/* dss_data14.pr1_mii_mr0_clk */
> +			AM4372_IOPAD(0x8d8, (PIN_INPUT  | MUX_MODE5))
> +			/* dss_data15.pr1_mii0_rxdv */
> +			AM4372_IOPAD(0x8dc, (PIN_INPUT  | MUX_MODE5))
> +			/* dss_data13.pr1_mii0_rxer */
> +			AM4372_IOPAD(0x8d4, (PIN_INPUT  | MUX_MODE5))
> +			/* dss_data12.pr1_mii0_rxlink */
> +			AM4372_IOPAD(0x8d0, (PIN_INPUT  | MUX_MODE5))
> +			/* gpio5_10.pr1_mii0_crs */
> +			AM4372_IOPAD(0xa40, (PIN_INPUT  | MUX_MODE5))
> +			/* gpio5_8.pr1_mii0_col */
> +			AM4372_IOPAD(0xa38, (PIN_INPUT  | MUX_MODE5))
> +			/* gpmc_a6.pr1_mii_mt1_clk */
> +			AM4372_IOPAD(0x858, (PIN_INPUT  | MUX_MODE5))
> +			/* gpmc_a5.pr1_mii1_txd0 */
> +			AM4372_IOPAD(0x854, (PIN_OUTPUT | MUX_MODE5))
> +			/* gpmc_a4.pr1_mii1_txd1 */
> +			AM4372_IOPAD(0x850, (PIN_OUTPUT | MUX_MODE5))
> +			/* gpmc_a3.pr1_mii1_txd2 */
> +			AM4372_IOPAD(0x84c, (PIN_OUTPUT | MUX_MODE5))
> +			/* gpmc_a2.pr1_mii1_txd3 */
> +			AM4372_IOPAD(0x848, (PIN_OUTPUT | MUX_MODE5))
> +			/* gpmc_a11.pr1_mii1_rxd0 */
> +			AM4372_IOPAD(0x86c, (PIN_INPUT  | MUX_MODE5))
> +			/* gpmc_a10.pr1_mii1_rxd1 */
> +			AM4372_IOPAD(0x868, (PIN_INPUT  | MUX_MODE5))
> +			/* gpmc_a9.pr1_mii1_rxd2 */
> +			AM4372_IOPAD(0x864, (PIN_INPUT  | MUX_MODE5))
> +			/* gpmc_a8.pr1_mii1_rxd3 */
> +			AM4372_IOPAD(0x860, (PIN_INPUT  | MUX_MODE5))
> +			/* gpmc_a0.pr1_mii1_txen */
> +			AM4372_IOPAD(0x840, (PIN_OUTPUT | MUX_MODE5))
> +			/* gpmc_a7.pr1_mii_mr1_clk */
> +			AM4372_IOPAD(0x85c, (PIN_INPUT  | MUX_MODE5))
> +			/* gpmc_a1.pr1_mii1_rxdv */
> +			AM4372_IOPAD(0x844, (PIN_INPUT  | MUX_MODE5))
> +			/* gpmc_wpn.pr1_mii1_rxer */
> +			AM4372_IOPAD(0x874, (PIN_INPUT  | MUX_MODE5))
> +			/* gpio5_13.pr1_mii1_rxlink */
> +			AM4372_IOPAD(0xa4c, (PIN_INPUT  | MUX_MODE5))
> +			/* gpio5_11.pr1_mii1_crs */
> +			AM4372_IOPAD(0xa44, (PIN_INPUT  | MUX_MODE5))
> +			/* gpmc_be1n.pr1_mii1_col */
> +			AM4372_IOPAD(0x878, (PIN_INPUT  | MUX_MODE5))
> +		>;
> +	};
> +
>   	qspi_pins_default: qspi-default-pins {
>   		pinctrl-single,pins = <
>   			AM4372_IOPAD(0x87c, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_csn0.qspi_csn */
> @@ -539,5 +661,18 @@ opp-100-600000000 {
>   };
>   
>   &pruss1_mdio {
> -	status = "disabled";
> +	pinctrl-0 = <&pruss1_mdio_default>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	reset-gpios = <&gpio4 20 GPIO_ACTIVE_LOW>;
> +	reset-delay-us = <2>;	/* PHY datasheet states 1uS min */
> +
> +	pruss1_eth0_phy: ethernet-phy@0 {
> +		reg = <0>;
> +	};
> +
> +	pruss1_eth1_phy: ethernet-phy@1 {
> +		reg = <1>;
> +	};
>   };


