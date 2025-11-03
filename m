Return-Path: <linux-omap+bounces-4827-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D13C2D149
	for <lists+linux-omap@lfdr.de>; Mon, 03 Nov 2025 17:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 841D2621501
	for <lists+linux-omap@lfdr.de>; Mon,  3 Nov 2025 15:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9734C2848A0;
	Mon,  3 Nov 2025 15:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EBC3aAGC"
X-Original-To: linux-omap@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazhn15011023.outbound.protection.outlook.com [52.102.137.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C672AF1D;
	Mon,  3 Nov 2025 15:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.137.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762184506; cv=fail; b=mxI/FipMux/Za5c3tm/1r3zDxMiVG4Cpijx6NtONSvF/lzPFPHwOJHJGCms3jxJcqcApPLWVeoH0pujxqiaylnjvX+dkM/RansRFYyuzc+dQAuEtoTa2smdOSH6F4Th2hpVZBwFlEfKQWoN/i2tmFQBW0W4DC93NnESTeOfjibA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762184506; c=relaxed/simple;
	bh=x1YaCeJweFn3puBtPTqyCZPbLfN1+HUVEYpIe/B1+aI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZexbaOGZaX1clrw20rzcgkB5n/msVhuNlinKCPVFQ0iM3ZsMiOURi7iNv+YpE/UpdLmjPOfmmoVX0acYIOFRKL8oNsPvFvepcvaj5wg+BsvkcRb9mqwJYh4/PCLMjdPmKVw9Qz0rbKCtG78a3mhCW7BmEhQG3RKhf9fb9g460V4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EBC3aAGC; arc=fail smtp.client-ip=52.102.137.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7YP9jkLwCx1t7zJh3FA5/7ICxN8rxJy5uhG5BN4Sba1oXCA0ezTysj/OHqQvXJl7WGR4HBHfC8aTz915WKQB5hx2unWq4QxnDomuU/TJvceuvvFJbeu01dQiPfv4bjnc0HxvVwfjRwbe2C4TboNSVcnsVcqvYIisZWDGUNZVZuZ5RkLRgrbc6r0hJQ6xXpZaaAbliXC5AfZxPRvsYST1yqK1eNHNWamhXzAGBFfKOdSTAZAKlRk723XsKxnOEYD68Ea2adGDeDWwn5BNVOy6peTHEeYpwHU1mkE+XtHT72d6Am/RiKCujLcxaxk20f/j4QaQYcja3YnClTXos5g9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jvDVKxQyFUel21kKV6TVRthJRxaSGBIothrscIXNiw=;
 b=RG0854pPxFyxE8U4QEL8jqiUb4F26MSoC2OQzhi84a1nNsoIOXTFbWPuQTxzQT1UUikuK3e8HdSuOGj8ztT79k86V5i8znacN7ss4MomKTinLyQRsFNr9luoUKw8BrCPAIlI8l4t/Af3TQ+b71o9zeydY6NQYDmA6JaQMSkd3Uj1yLJy/k/uU9wbKVudItXByRtbZyFmfazmZ/yBCIwWutJHvpxh4md7fqUUX4tI5nRdIgy1yThT6y8ThAMpaMQ/dCNAkBG9Jq08GEIi5zSfo2Tp6nFMwDrRjzrJjY5n+6NU5V0yyTQHqoX6yYOj+tD5pTaPXAJvW8jwp8BmgIuySw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=couthit.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jvDVKxQyFUel21kKV6TVRthJRxaSGBIothrscIXNiw=;
 b=EBC3aAGC+tEI4AACj45YsDYFEYY4OMEJ/Kc7Ku+gM628+Ascu11Oasqt9AbYV0xqXDXTxYPwE9dMCTFAqmML4yG+eETfbaIC5ArAJS0HeIximCNRId8umJLoRT3O1tV4DNa71e1DQE13miK5dEraAmSA7LY69MahSHV215/0YJk=
Received: from MN0P223CA0025.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::20)
 by IA3PR10MB8420.namprd10.prod.outlook.com (2603:10b6:208:579::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:41:40 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:208:52b:cafe::32) by MN0P223CA0025.outlook.office365.com
 (2603:10b6:208:52b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 15:41:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 15:41:37 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 3 Nov
 2025 09:41:31 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 3 Nov
 2025 09:41:20 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 3 Nov 2025 09:41:20 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A3FfJaM417550;
	Mon, 3 Nov 2025 09:41:19 -0600
Message-ID: <89858ed0-58fd-4056-b8af-065c92885a10@ti.com>
Date: Mon, 3 Nov 2025 09:41:19 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm: dts: ti: Adds support for AM335x and AM437x
To: Parvathi Pudi <parvathi@couthit.com>, <nm@ti.com>, <vigneshr@ti.com>,
	<tony@atomide.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <richardcochran@gmail.com>
CC: <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>, <andrew@lunn.ch>,
	<danishanwar@ti.com>, <pratheesh@ti.com>, <j-rameshbabu@ti.com>,
	<praneeth@ti.com>, <srk@ti.com>, <rogerq@ti.com>, <krishna@couthit.com>,
	<mohan@couthit.com>, <pmohan@couthit.com>, <basharath@couthit.com>, "Murali
 Karicheri" <m-karicheri2@ti.com>
References: <20251103124820.1679167-1-parvathi@couthit.com>
 <20251103124820.1679167-3-parvathi@couthit.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251103124820.1679167-3-parvathi@couthit.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|IA3PR10MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c6dba8a-b8ac-4e92-0611-08de1aef79a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|34020700016|1800799024|82310400026|7053199007|12100799066;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yk5pS01aMDZCUDBjZUNzSEg4b1h1USt1RXhXWU44YTlEZkdsM2g4OHlLaG56?=
 =?utf-8?B?Z0VLMFI4Zk5CUnkzMTlEak1ac1M3NmVuYjRQaEVCUzdCQzYzdlZBRnJwWXkr?=
 =?utf-8?B?TkQ2OUVOajdWNnV0VUZibTlyZHFSQWxiZlVpbUZhOE5IdVB3K1lubE1yZjJv?=
 =?utf-8?B?TWIvVkIyOHlHWmg1b3VLRlBEazMwL0pZRjJyYmI4T09VNllOd1ZqM2FERjV4?=
 =?utf-8?B?RVZGMDJmdkFRaE9YZ1EvQld3dmpNb2ZhZGgyRlgwRDdQdnE5c09yYW1vOTlm?=
 =?utf-8?B?RWVFSkt2RFpMWGJ6TDFlcElYZHA5Rm9UOUdhTWtvQXhvM1BBUTFUSW9LZytx?=
 =?utf-8?B?eUVKZzZTU1FpRGFEWmt2Wks4Z1IzK2hyWndkVDg0bTVVT2k0MlJpSFhnWTl2?=
 =?utf-8?B?a2ZIMmRUTjA1SmppelFyWnRCaDF3VXhPOFlvY2xWYURuRDNMNXpiWUx0Yndo?=
 =?utf-8?B?M1EvYTRaZlM3aUtyZXNnSDdyWThqVUVtZk9yYStiSjRJZVE3Skh5dUI2YndW?=
 =?utf-8?B?ZkR4TXVzTjNMazlvWmJaWkYyeFNNampNS1BKQmZSWURnYmNZYllvN09SYk9l?=
 =?utf-8?B?cE15QUFNR0pVU1JDcE9vRk9lQ2gzaFNTSWh5TmlSa1FxM3VGcTI3am9ZQTJR?=
 =?utf-8?B?bWYxbEc3U2VDZ2V2TUU3ZzhXVm14TzFzQkVNZ3JxVFZzQmpKcmFMVlZrZ3Fs?=
 =?utf-8?B?ajB3Q0wrbmdZS3pONGtxTFcvRWE2WnlYTE5XSFVmdEpJclJnU0xDN1BjeEVu?=
 =?utf-8?B?V3pyUU0xSVp3eTdDYUVUVjZ5YW84N042c08zNlJYd05FNmVxUytXNDVxOHo0?=
 =?utf-8?B?WFR1aG1zTHJSeGpmRUxLV1EyWldhTWl3SXFRcFBPSHpER1RLRlYwU1NNdm13?=
 =?utf-8?B?VXlVMEZSeHpnYkdMTFd4ZUlmakRDZmhheDlIMG82ckFaM1hFaWFic3pzc0pW?=
 =?utf-8?B?eHVVbURSRVBHTWt0SDhLb2wzZGpha0VIOWdRMmZkVFd0bHZHS0VCSGxxZVhM?=
 =?utf-8?B?V2EwSUZZMk9Gczd0UkRWd2J3MVlpa3ByMUdkVVBYbk16MUkzd1NUK01sSG1N?=
 =?utf-8?B?eUFWWXNMTTFzNlB4MEtyZUoyTEdKcExmMkNsUDNocElJUFVYYm5ZZmZyR3I1?=
 =?utf-8?B?UDBNVVZMYVFzeG0rNUNoaVM3azZKQjlLcUFJSWluQnlPcEtUVnlYaW5Kc29v?=
 =?utf-8?B?L09HaFIzVGJWRW0rNjc0OXFJT0VJZ0pzejJJakh3VjVBUWsvWlpSMjBldXZZ?=
 =?utf-8?B?UndWczhFK3BNQXBiUis4UmUxeFRlU25iTTJxT1lKbU9ReFhaelplMWpLSklW?=
 =?utf-8?B?cFhkSmFKQWJaOWxYWkRpM2s4Y0Vpc3huN3lQN3hVeXR1WjM4enZwbk1YK2lI?=
 =?utf-8?B?RTBGczZibnkxbUk3SFBjTThEcXE0QmtmL0VjQjRNYmJUenhQZDEyNG9wSG9P?=
 =?utf-8?B?TjF3ZFJSWHJCRjhtOVFTaTd5ejNyQnh6b3ZYWXNiUHZrcE9kVjBGazhBQzA3?=
 =?utf-8?B?L0loSkVBRGo5SFB4VEt4djdPSzlEODBNdnhJS3NqU1hVclNlYTJaSnlnSHJu?=
 =?utf-8?B?WjdJd0x5b0V5U1RKK25JY0E2c1RuNGcxU0h2VUVzblVPYS9oallabVRwbVM0?=
 =?utf-8?B?dnVVcXoyK3htTEp6bWlKMzdOL0VucC9OS0IreklxSzBOUEZxbngyaFFqREJP?=
 =?utf-8?B?YzlyWFRkNkpjMmNEUzdwSEVFbVFMMkZxNkRpQWZnaHRlUGJOZkxxazVzczNn?=
 =?utf-8?B?M0lGdFJSVE5aekozbEZhZDF6eFVWYTRXVE42RmZUVEpablk1cFdBSno0SHMv?=
 =?utf-8?B?bzd0NUFpd1pxSUZxTE9qWW5BdjBLUHFrRnlzbUZSTTZUMjRmYnhkdzllTWY1?=
 =?utf-8?B?M2d5Y09DZlZLYTIwZXZFRC83TlNGMzh6STZ0cDlYVk5ZR0J6Ymg1VzIyMlV2?=
 =?utf-8?B?VVVrdVhhZEhlSFJRaTBLcGRnZzAwamRyTjBXdDNsWVVXL0k5QThhN28xaGh5?=
 =?utf-8?B?MCsyVFJNR0pia0YyaHQ3V0tpL2JaU05sYnVnanlnSHdOcFU4amhHalJNc3dh?=
 =?utf-8?Q?MapMjR?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(34020700016)(1800799024)(82310400026)(7053199007)(12100799066);DIR:OUT;SFP:1501;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:41:37.2445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6dba8a-b8ac-4e92-0611-08de1aef79a5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8420

On 11/3/25 6:47 AM, Parvathi Pudi wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> PRU-ICSS instance consists of two PRU cores along with various
> peripherals such as the Interrupt Controller (PRU_INTC), the Industrial
> Ethernet Peripheral(IEP), the Real Time Media Independent Interface
> controller (MII_RT), and the Enhanced Capture (eCAP) event module.
> 
> The TI Sitara AM335x ICE-V2 consists of single PRU-ICSS instance,
> This patch adds the new device tree source file in-order to use
> PRU-ICSS instance, along with makefile changes to add the new DTS
> file for PRUSS.
> 
> The TI Sitara AM437x series of devices consists of 2 PRU-ICSS instances
> (PRU-ICSS0 and PRU-ICSS1). This patch adds the device tree nodes for the
> PRU-ICSS1 instance to support DUAL-MAC mode of operation. Support for
> Ethernet over PRU is available only for ICSS1 instance.
> 
> am33xx-l4.dtsi, am4372.dtsi - Adds IEP and eCAP peripheral as child nodes
> of the PRUSS subsystem node.
> 
> am335x-icev2-prueth.dts, am437x-idk-evm.dts - Adds PRU-ICSS
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
>   arch/arm/boot/dts/ti/omap/Makefile            |   1 +
>   .../boot/dts/ti/omap/am335x-icev2-prueth.dts  | 533 ++++++++++++++++++
>   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |  11 +
>   arch/arm/boot/dts/ti/omap/am4372.dtsi         |  11 +
>   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts  | 137 ++++-
>   5 files changed, 692 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dts
> 
> diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
> index 1aef60eef671..d06dd31d0bb6 100644
> --- a/arch/arm/boot/dts/ti/omap/Makefile
> +++ b/arch/arm/boot/dts/ti/omap/Makefile
> @@ -100,6 +100,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
>   	am335x-evmsk.dtb \
>   	am335x-guardian.dtb \
>   	am335x-icev2.dtb \
> +	am335x-icev2-prueth.dtb \

This new DTB looks to be almost identical to the regular am335x-icev2.dtb, to
add an optional node to an existing board use DT overlay, do not clone the
whole board DT just to add a node. Maybe that is how we hacked around this
in our evil vendor tree back in 2018 but do not take our old hacks and push
them upstream as-is.

Andrew

>   	am335x-lxm.dtb \
>   	am335x-moxa-uc-2101.dtb \
>   	am335x-moxa-uc-8100-me-t.dtb \
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dts b/arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dts
> new file mode 100644
> index 000000000000..c41c40297b22
> --- /dev/null
> +++ b/arch/arm/boot/dts/ti/omap/am335x-icev2-prueth.dts
> @@ -0,0 +1,533 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +/*
> + * AM335x ICE V2 board
> + * http://www.ti.com/tool/tmdsice3359
> + */
> +
> +/dts-v1/;
> +
> +#include "am33xx.dtsi"
> +
> +/ {
> +	model = "TI AM3359 ICE-V2 - dual PRUETH";
> +	compatible = "ti,am3359-icev2", "ti,am33xx";
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x10000000>; /* 256 MB */
> +	};
> +
> +	chosen {
> +		stdout-path = &uart3;
> +	};
> +
> +	vbat: fixedregulator0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vbat";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +	};
> +
> +	vtt_fixed: fixedregulator1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vtt";
> +		regulator-min-microvolt = <1500000>;
> +		regulator-max-microvolt = <1500000>;
> +		gpio = <&gpio0 18 GPIO_ACTIVE_HIGH>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		enable-active-high;
> +	};
> +
> +	/* Tricolor status LEDs */
> +	leds1 {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&user_leds>;
> +
> +		led0 {
> +			label = "status0:red:cpu0";
> +			gpios = <&gpio0 17 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +			linux,default-trigger = "cpu0";
> +		};
> +
> +		led1 {
> +			label = "status0:green:usr";
> +			gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led2 {
> +			label = "status0:yellow:usr";
> +			gpios = <&gpio3 9 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led3 {
> +			label = "status1:red:mmc0";
> +			gpios = <&gpio1 30 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +			linux,default-trigger = "mmc0";
> +		};
> +
> +		led4 {
> +			label = "status1:green:usr";
> +			gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led5 {
> +			label = "status1:yellow:usr";
> +			gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +	};
> +
> +	gpio-decoder {
> +		compatible = "gpio-decoder";
> +		gpios = <&pca9536 3 GPIO_ACTIVE_HIGH>,
> +			<&pca9536 2 GPIO_ACTIVE_HIGH>,
> +			<&pca9536 1 GPIO_ACTIVE_HIGH>,
> +			<&pca9536 0 GPIO_ACTIVE_HIGH>;
> +		linux,axis = <0>; /* ABS_X */
> +		decoder-max-value = <9>;
> +	};
> +
> +	/* Dual-MAC Ethernet application node on PRU-ICSS */
> +	pruss_eth: pruss-eth {
> +		compatible = "ti,am3359-prueth";
> +		ti,prus = <&pru0>, <&pru1>;
> +		sram = <&ocmcram>;
> +		ti,mii-rt = <&pruss_mii_rt>;
> +		ti,iep = <&pruss_iep>;
> +		ti,ecap = <&pruss_ecap>;
> +		interrupts = <20 2 2>, <21 3 3>;
> +		interrupt-names = "rx_hp", "rx_lp";
> +		interrupt-parent = <&pruss_intc>;
> +
> +		pinctrl-0 = <&pruss_eth_default>;
> +		pinctrl-names = "default";
> +
> +		ethernet-ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			pruss_emac0: ethernet-port@0 {
> +				reg = <0>;
> +				phy-handle = <&pruss_eth0_phy>;
> +				phy-mode = "mii";
> +				interrupts = <20 2 2>, <26 6 6>, <23 6 6>;
> +				interrupt-names = "rx", "emac_ptp_tx",
> +						  "hsr_ptp_tx";
> +				/* Filled in by bootloader */
> +				local-mac-address = [00 00 00 00 00 00];
> +			};
> +
> +			pruss_emac1: ethernet-port@1 {
> +				reg = <1>;
> +				phy-handle = <&pruss_eth1_phy>;
> +				phy-mode = "mii";
> +				interrupts = <21 3 3>, <27 9 7>, <24 9 7>;
> +				interrupt-names = "rx", "emac_ptp_tx",
> +						  "hsr_ptp_tx";
> +				/* Filled in by bootloader */
> +				local-mac-address = [00 00 00 00 00 00];
> +			};
> +		};
> +	};
> +};
> +
> +&am33xx_pinmux {
> +    user_leds: user-leds-pins {
> +		pinctrl-single,pins = <
> +			/* (J18) gmii1_txd3.gpio0[16] */
> +			AM33XX_PADCONF(AM335X_PIN_MII1_TXD3, PIN_OUTPUT,
> +				       MUX_MODE7)
> +			 /* (K15) gmii1_txd2.gpio0[17] */
> +			AM33XX_PADCONF(AM335X_PIN_MII1_TXD2, PIN_OUTPUT,
> +				       MUX_MODE7)
> +			/* (A15) xdma_event_intr0.gpio0[19] */
> +			AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR0, PIN_OUTPUT,
> +				       MUX_MODE7)
> +			/* (D14) xdma_event_intr1.gpio0[20] */
> +			AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR1, PIN_OUTPUT,
> +				       MUX_MODE7)
> +			/* (U9) gpmc_csn1.gpio1[30] */
> +			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN1, PIN_OUTPUT,
> +				       MUX_MODE7)
> +			/* (K18) gmii1_txclk.gpio3[9] */
> +			AM33XX_PADCONF(AM335X_PIN_MII1_TX_CLK, PIN_OUTPUT,
> +				       MUX_MODE7)
> +		>;
> +	};
> +
> +	mmc0_pins_default: mmc0-default-pins {
> +		pinctrl-single,pins = <
> +			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT3, PIN_INPUT_PULLUP,
> +				       MUX_MODE0)
> +			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT2, PIN_INPUT_PULLUP,
> +				       MUX_MODE0)
> +			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT1, PIN_INPUT_PULLUP,
> +				       MUX_MODE0)
> +			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT0, PIN_INPUT_PULLUP,
> +				       MUX_MODE0)
> +			AM33XX_PADCONF(AM335X_PIN_MMC0_CLK, PIN_INPUT_PULLUP,
> +				       MUX_MODE0)
> +			AM33XX_PADCONF(AM335X_PIN_MMC0_CMD, PIN_INPUT_PULLUP,
> +				       MUX_MODE0)
> +		>;
> +	};
> +
> +	i2c0_pins_default: i2c0-default-pins {
> +		pinctrl-single,pins = <
> +			AM33XX_PADCONF(AM335X_PIN_I2C0_SDA, PIN_INPUT,
> +				       MUX_MODE0)
> +			AM33XX_PADCONF(AM335X_PIN_I2C0_SCL, PIN_INPUT,
> +				       MUX_MODE0)
> +		>;
> +	};
> +
> +	spi0_pins_default: spi0-default-pins {
> +		pinctrl-single,pins = <
> +			AM33XX_PADCONF(AM335X_PIN_SPI0_SCLK, PIN_INPUT_PULLUP,
> +				       MUX_MODE0)
> +			AM33XX_PADCONF(AM335X_PIN_SPI0_D0, PIN_INPUT_PULLUP,
> +				       MUX_MODE0)
> +			AM33XX_PADCONF(AM335X_PIN_SPI0_D1, PIN_INPUT_PULLUP,
> +				       MUX_MODE0)
> +			AM33XX_PADCONF(AM335X_PIN_SPI0_CS0, PIN_INPUT_PULLUP,
> +				       MUX_MODE0)
> +			AM33XX_PADCONF(AM335X_PIN_SPI0_CS1, PIN_INPUT_PULLUP,
> +				       MUX_MODE0)
> +			/* (B12) mcasp0_aclkr.gpio3[18] */
> +			AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKR,
> +				       PIN_INPUT_PULLUP,
> +				       MUX_MODE7)
> +		>;
> +	};
> +
> +	uart3_pins_default: uart3-default-pins {
> +		pinctrl-single,pins = <
> +			/* (L17) gmii1_rxd3.uart3_rxd */
> +			AM33XX_PADCONF(AM335X_PIN_MII1_RXD3, PIN_INPUT_PULLUP,
> +				       MUX_MODE1)
> +			/* (L16) gmii1_rxd2.uart3_txd */
> +			AM33XX_PADCONF(AM335X_PIN_MII1_RXD2, PIN_OUTPUT_PULLUP,
> +				       MUX_MODE1)
> +		>;
> +	};
> +
> +	pruss_mdio_default: pruss_mdio_default {
> +		pinctrl-single,pins = <
> +			/* gpmc_clk.pr1_mdio_mdclk */
> +			AM33XX_PADCONF(0x88c, PIN_OUTPUT, MUX_MODE5)
> +			/* gpmc_csn3.pr1_mdio_data */
> +			AM33XX_PADCONF(0x888, PIN_INPUT, MUX_MODE5)
> +			/* gpmc_ben0_cle.gpio2_5 */
> +			AM33XX_PADCONF(0x89c, PIN_INPUT_PULLUP, MUX_MODE7)
> +			/* disable CPSW MDIO */
> +			/* mdio_data.gpio0_0 */
> +			AM33XX_PADCONF(0x948, PIN_INPUT_PULLUP, MUX_MODE7)
> +			/* mdio_clk.gpio0_1 */
> +			AM33XX_PADCONF(0x94c, PIN_INPUT_PULLUP, MUX_MODE7)
> +		>;
> +	};
> +
> +	pruss_eth_default: pruss_eth_default {
> +		pinctrl-single,pins = <
> +			/* dss_data0.pr1_mii_mt0_clk */
> +			AM33XX_PADCONF(0x8a0, PIN_INPUT,   MUX_MODE2)
> +			/* dss_data5.pr1_mii0_txd0 */
> +			AM33XX_PADCONF(0x8b4, PIN_OUTPUT,  MUX_MODE2)
> +			/* dss_data4.pr1_mii0_txd1 */
> +			AM33XX_PADCONF(0x8b0, PIN_OUTPUT,  MUX_MODE2)
> +			/* dss_data3.pr1_mii0_txd2 */
> +			AM33XX_PADCONF(0x8ac, PIN_OUTPUT,  MUX_MODE2)
> +			/* dss_data2.pr1_mii0_txd3 */
> +			AM33XX_PADCONF(0x8a8, PIN_OUTPUT,  MUX_MODE2)
> +			/* dss_data11.pr1_mii0_rxd0 */
> +			AM33XX_PADCONF(0x8cc, PIN_INPUT,   MUX_MODE5)
> +			/* dss_data10.pr1_mii0_rxd1 */
> +			AM33XX_PADCONF(0x8c8, PIN_INPUT,   MUX_MODE5)
> +			/* dss_data9.pr1_mii0_rxd2 */
> +			AM33XX_PADCONF(0x8c4, PIN_INPUT,   MUX_MODE5)
> +			/* dss_data8.pr1_mii0_rxd3 */
> +			AM33XX_PADCONF(0x8c0, PIN_INPUT,   MUX_MODE5)
> +			/* dss_data1.pr1_mii0_txen */
> +			AM33XX_PADCONF(0x8a4, PIN_OUTPUT,  MUX_MODE2)
> +			/* dss_data14.pr1_mii_mr0_clk */
> +			AM33XX_PADCONF(0x8d8, PIN_INPUT,   MUX_MODE5)
> +			/* dss_data15.pr1_mii0_rxdv */
> +			AM33XX_PADCONF(0x8dc, PIN_INPUT,   MUX_MODE5)
> +			/* dss_data13.pr1_mii0_rxer */
> +			AM33XX_PADCONF(0x8d4, PIN_INPUT,   MUX_MODE5)
> +			/* dss_data12.pr1_mii0_rxlink */
> +			AM33XX_PADCONF(0x8d0, PIN_INPUT,   MUX_MODE5)
> +			/* dss_pclk.pr1_mii0_crs */
> +			AM33XX_PADCONF(0x8e8, PIN_INPUT,   MUX_MODE2)
> +
> +			/* gpmc_a0.pr1_mii_mt1_clk */
> +			AM33XX_PADCONF(0x840, PIN_INPUT,   MUX_MODE5)
> +			/* gpmc_a4.pr1_mii1_txd0 */
> +			AM33XX_PADCONF(0x850, PIN_OUTPUT,  MUX_MODE5)
> +			/* gpmc_a3.pr1_mii1_txd1 */
> +			AM33XX_PADCONF(0x84c, PIN_OUTPUT,  MUX_MODE5)
> +			/* gpmc_a2.pr1_mii1_txd2 */
> +			AM33XX_PADCONF(0x848, PIN_OUTPUT,  MUX_MODE5)
> +			/* gpmc_a1.pr1_mii1_txd3 */
> +			AM33XX_PADCONF(0x844, PIN_OUTPUT,  MUX_MODE5)
> +			/* gpmc_a8.pr1_mii1_rxd0 */
> +			AM33XX_PADCONF(0x860, PIN_INPUT,   MUX_MODE5)
> +			/* gpmc_a7.pr1_mii1_rxd1 */
> +			AM33XX_PADCONF(0x85c, PIN_INPUT,   MUX_MODE5)
> +			/* gpmc_a6.pr1_mii1_rxd2 */
> +			AM33XX_PADCONF(0x858, PIN_INPUT,   MUX_MODE5)
> +			/* gpmc_a5.pr1_mii1_rxd3 */
> +			AM33XX_PADCONF(0x854, PIN_INPUT,   MUX_MODE5)
> +			/* gpmc_wpn.pr1_mii1_txen */
> +			AM33XX_PADCONF(0x874, PIN_OUTPUT,  MUX_MODE5)
> +			/* gpmc_a9.pr1_mii_mr1_clk */
> +			AM33XX_PADCONF(0x864, PIN_INPUT,   MUX_MODE5)
> +			/* gpmc_a10.pr1_mii1_rxdv */
> +			AM33XX_PADCONF(0x868, PIN_INPUT,   MUX_MODE5)
> +			/* gpmc_a11.pr1_mii1_rxer */
> +			AM33XX_PADCONF(0x86c, PIN_INPUT,   MUX_MODE5)
> +			/* gpmc_ben1.pr1_mii1_rxlink */
> +			AM33XX_PADCONF(0x878, PIN_INPUT,   MUX_MODE5)
> +			/* lcd_ac_bias_en.pr1_mii1_crs */
> +			AM33XX_PADCONF(0x8ec, PIN_INPUT,   MUX_MODE2)
> +			/* gpmc_wait0.pr1_mii1_col */
> +			AM33XX_PADCONF(0x870, PIN_INPUT,   MUX_MODE5)
> +		>;
> +	};
> +
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins_default>;
> +
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	tps: power-controller@2d {
> +		reg = <0x2d>;
> +	};
> +
> +	tpic2810: gpio@60 {
> +		compatible = "ti,tpic2810";
> +		reg = <0x60>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +
> +	pca9536: gpio@41 {
> +		compatible = "ti,pca9536";
> +		reg = <0x41>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +
> +};
> +
> +&spi0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi0_pins_default>;
> +
> +	sn65hvs882@1 {
> +		compatible = "pisosr-gpio";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		load-gpios = <&gpio3 18 GPIO_ACTIVE_LOW>;
> +
> +		reg = <1>;
> +		spi-max-frequency = <1000000>;
> +		spi-cpol;
> +	};
> +
> +	spi_nor: flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "winbond, w25q64", "jedec,spi-nor";
> +		spi-max-frequency = <80000000>;
> +		m25p,fast-read;
> +		reg = <0>;
> +
> +		partition@0 {
> +			label = "u-boot-spl";
> +			reg = <0x0 0x80000>;
> +			read-only;
> +		};
> +
> +		partition@1 {
> +			label = "u-boot";
> +			reg = <0x80000 0x100000>;
> +			read-only;
> +		};
> +
> +		partition@2 {
> +			label = "u-boot-env";
> +			reg = <0x180000 0x20000>;
> +			read-only;
> +		};
> +
> +		partition@3 {
> +			label = "misc";
> +			reg = <0x1A0000 0x660000>;
> +		};
> +	};
> +
> +};
> +
> +&tscadc {
> +	status = "okay";
> +	adc {
> +		ti,adc-channels = <1 2 3 4 5 6 7>;
> +	};
> +};
> +
> +#include "../../tps65910.dtsi"
> +
> +&tps {
> +	vcc1-supply = <&vbat>;
> +	vcc2-supply = <&vbat>;
> +	vcc3-supply = <&vbat>;
> +	vcc4-supply = <&vbat>;
> +	vcc5-supply = <&vbat>;
> +	vcc6-supply = <&vbat>;
> +	vcc7-supply = <&vbat>;
> +	vccio-supply = <&vbat>;
> +
> +	regulators {
> +		vrtc_reg: regulator@0 {
> +			regulator-always-on;
> +		};
> +
> +		vio_reg: regulator@1 {
> +			regulator-always-on;
> +		};
> +
> +		vdd1_reg: regulator@2 {
> +			regulator-name = "vdd_mpu";
> +			regulator-min-microvolt = <912500>;
> +			regulator-max-microvolt = <1326000>;
> +			regulator-boot-on;
> +			regulator-always-on;
> +		};
> +
> +		vdd2_reg: regulator@3 {
> +			regulator-name = "vdd_core";
> +			regulator-min-microvolt = <912500>;
> +			regulator-max-microvolt = <1144000>;
> +			regulator-boot-on;
> +			regulator-always-on;
> +		};
> +
> +		vdd3_reg: regulator@4 {
> +			regulator-always-on;
> +		};
> +
> +		vdig1_reg: regulator@5 {
> +			regulator-always-on;
> +		};
> +
> +		vdig2_reg: regulator@6 {
> +			regulator-always-on;
> +		};
> +
> +		vpll_reg: regulator@7 {
> +			regulator-always-on;
> +		};
> +
> +		vdac_reg: regulator@8 {
> +			regulator-always-on;
> +		};
> +
> +		vaux1_reg: regulator@9 {
> +			regulator-always-on;
> +		};
> +
> +		vaux2_reg: regulator@10 {
> +			regulator-always-on;
> +		};
> +
> +		vaux33_reg: regulator@11 {
> +			regulator-always-on;
> +		};
> +
> +		vmmc_reg: regulator@12 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-always-on;
> +		};
> +	};
> +};
> +
> +&mmc1 {
> +	status = "okay";
> +	vmmc-supply = <&vmmc_reg>;
> +	bus-width = <4>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_pins_default>;
> +};
> +
> +&gpio0_target {
> +	/* Do not idle the GPIO used for holding the VTT regulator */
> +	ti,no-reset-on-init;
> +	ti,no-idle-on-init;
> +};
> +
> +&uart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart3_pins_default>;
> +	status = "okay";
> +};
> +
> +&gpio3 {
> +	pr1-mii-ctl-hog {
> +		gpio-hog;
> +		gpios = <4 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "PR1_MII_CTRL";
> +	};
> +
> +	mux-mii-hog {
> +		gpio-hog;
> +		gpios = <10 GPIO_ACTIVE_HIGH>;
> +		/* ETH1 mux: Low for MII-PRU, high for RMII-CPSW */
> +		output-low;
> +		line-name = "MUX_MII_CTL1";
> +	};
> +};
> +
> +&pruss_tm {
> +	status = "okay";
> +};
> +
> +&pruss_mdio {
> +	pinctrl-0 = <&pruss_mdio_default>;
> +	pinctrl-names = "default";
> +	reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
> +	reset-delay-us = <2>; /* PHY datasheet states 1uS min */
> +	status = "okay";
> +
> +	pruss_eth0_phy: ethernet-phy@1 {
> +		 reg = <1>;
> +	};
> +
> +	pruss_eth1_phy: ethernet-phy@3 {
> +		 reg = <3>;
> +	};
> +};
> +
> +&rtc {
> +	system-power-controller;
> +};
> diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> index 18ad52e93955..498bda321b75 100644
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
> index 0a1df30f2818..7836aca7f954 100644
> --- a/arch/arm/boot/dts/ti/omap/am4372.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/am4372.dtsi
> @@ -477,6 +477,17 @@ pruss1_mii_rt: mii-rt@32000 {
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


