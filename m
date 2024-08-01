Return-Path: <linux-omap+bounces-1824-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43904944DBF
	for <lists+linux-omap@lfdr.de>; Thu,  1 Aug 2024 16:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA1261F24FD0
	for <lists+linux-omap@lfdr.de>; Thu,  1 Aug 2024 14:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917D71A4867;
	Thu,  1 Aug 2024 14:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DiwArGS2";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DiwArGS2"
X-Original-To: linux-omap@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F477189BA9;
	Thu,  1 Aug 2024 14:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.54
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722521767; cv=fail; b=f1lw5f03wKHME963JYBR1XIKjEulFtvO+y3EJ+wHgeSqoT6C1rg5dBcnmQOyVcmq6SQJZHyroF0ZtN5qCSTyw5Lj7iGiSJAzxyYnhFOMZTh5MRPl0u73rmU8qjheeQud4jpLqvUQRLaKGV0Ta4oeTz9Q7aCcXc4kMErCxO2pibQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722521767; c=relaxed/simple;
	bh=fyLlt+GLSNJCF7Xz98lKdenAAuIJy6okKQwBn9aLPUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JIr/J4cyHFDMqMDhB01lvbVx9CC56KP+kgruvsMcbUBzJH/tSDocm5TNfvm8tVsfr8Iv0R1QVNbpwMWfe9IVmNZ314BqwQjdfcvg9wot4aHvDF4zD+CPM9Tbs4MMeYu8psTrabKm582+2pHZWxFLyCx+/mxzVwWqGCM83skpG5Q=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DiwArGS2; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DiwArGS2; arc=fail smtp.client-ip=40.107.22.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kShDAWMFcp8nMF8fy+vwDXV8V4sR2hZQnXR0Aw3tU0Klww8jktKyTQaJj/XUJVNCzVElmX/mN0Zay0ro3sMsLVd+e7pzsm8wUcYs1bjwHSU/W4GOuf9dZv/2Qm7sUWVDfVSkFQXrH1ZXoujXsyol3w0SYA9mBUPcr8E1ZWSLDJVWt+uPYIlSCg756yHZ0F/dtPIxyMLCzoIJnJbM3CflotIVP1GoPs102L7RZJ5MR65J5pmjPPSpPSmStnVSga7+L7/msVF4UGlF31CChfsKGDpAsw+hXTTRJ2z2tXnnPZ+rrCc96XYeJeCK+I858r1GwIBSiB0WlqwOtz8CfR1PVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNmj8dRYuLuD9jwKmwVOx0RTJTfgv/Ri8uU1MHY226Q=;
 b=ZJ4XFAJfkt0w8yF8SJRoTJkPN47pZ9mDGVKG0W7SPTB51LO1N1LQfpUsEFzguPgqaOmX1AmCU/K6KPURc0auet0JYCUwvR01b4z2Xl8AN2oi7wjFs639ANgyUC4b021p6e2Km0nH+Uuenb1Md5I65UHt5+rX6U9WZ4tNWX8v7KDRngSvAQWc3OkKv9XRsvK5hNBG8R2KFU1PzcbnB+rPv2wjm5WgQPlW3oNlZZYH14H0UgegUdRlFFDkKCagqQdLUNfPp4vepNwU9b+TmBZOUhh4nBpETuYLox8yUx2/Ns2jBSa7/A/37nX83taFG0wol/GZBhSBwp8ET9MleSsXwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNmj8dRYuLuD9jwKmwVOx0RTJTfgv/Ri8uU1MHY226Q=;
 b=DiwArGS2F11mq8plpHnRUi5kJV53TAkiR1ulS+YIwel3A+2qRHmN0FRqvln9zS0DPvJXexi20VB2Hhb+z8kWHSwjKkPi29FweXTwrooocyTrMdBauf24FN6PbwxzYzlLvJierIQBJTSu/rkTOYjppusP/aKrJkksmb/j+aAAKB4=
Received: from AS4P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::11)
 by PA4PR08MB6093.eurprd08.prod.outlook.com (2603:10a6:102:e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 14:15:59 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::f7) by AS4P195CA0006.outlook.office365.com
 (2603:10a6:20b:5e2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 14:15:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7828.19
 via Frontend Transport; Thu, 1 Aug 2024 14:15:59 +0000
Received: ("Tessian outbound 5d408e9476c7:v365"); Thu, 01 Aug 2024 14:15:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f16ff77deeec8541
X-CR-MTA-TID: 64aa7808
Received: from L062637750bdb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 95064BCC-2195-452C-A346-77013C10F625.1;
	Thu, 01 Aug 2024 14:15:50 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L062637750bdb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 01 Aug 2024 14:15:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FANxZ9VR4E0ntDgZormwp6iLzaUE0+pGTQc19RJVkSVGqe2y1A75tFTUckuE9xmhlos3hxM9Ye9sBW35zzIFcDqUMTBMjynBoz3QUa+I9yFEu1LiulEDQQkzzW82beJnoy0fdjrWdwI56emgFdre9CvNJFLZqHf5XDAHTXZ7K+Cczi5YbI7Ilj/V0A2a4w0VrEwEnFSkZdDUNjMeyjepN8EXD8oMpftsogw6n/ewKscnJ9UCRpARF/wkGdd/RGUZJpnMFF7PQqCCRon1B1E8+aInO3y3zlxAAFEJDQqNI8fi5XCiFxzhxXxWpAlVt18zKE0DAUbLIiBjQBwP9FNVIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNmj8dRYuLuD9jwKmwVOx0RTJTfgv/Ri8uU1MHY226Q=;
 b=JJkRMo8PhJ+7FXmdQFMgctnU1xy1X5TAreYT1QsiVwm7OLzo3HGKOuWX8TC1NpYhghQHkjcd859AwBl5u5Ksbyiz5xMhG2MJiUJnsLlFUGE08vEJdLOcVuRfPNVySHLsvVQmGBeNgmxUvj0rJId21tKtkaAU78R2G52fG1Bsv0Ks5KVN3NdgfRd6iw+6Dzk8b/o5Z0Rn2brc6IykeFTrxg0/9sRCyrEEL74QZZN8+Vb6lX3htF3vIwKXkmfL3GZXjN5SNllZRvAYDJOK90xNQMSs1kB+gdM+cKmNqdIBejCl0AvQbJqksjKZ1niS/vfiP+QNu4y7EES5NsEkMbdK+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=arndb.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNmj8dRYuLuD9jwKmwVOx0RTJTfgv/Ri8uU1MHY226Q=;
 b=DiwArGS2F11mq8plpHnRUi5kJV53TAkiR1ulS+YIwel3A+2qRHmN0FRqvln9zS0DPvJXexi20VB2Hhb+z8kWHSwjKkPi29FweXTwrooocyTrMdBauf24FN6PbwxzYzlLvJierIQBJTSu/rkTOYjppusP/aKrJkksmb/j+aAAKB4=
Received: from DU2PR04CA0159.eurprd04.prod.outlook.com (2603:10a6:10:2b0::14)
 by PA6PR08MB10420.eurprd08.prod.outlook.com (2603:10a6:102:3d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 14:15:48 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::f5) by DU2PR04CA0159.outlook.office365.com
 (2603:10a6:10:2b0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Thu, 1 Aug 2024 14:15:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 1 Aug 2024 14:15:47 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 14:15:47 +0000
Received: from [10.2.78.57] (10.2.78.57) by mail.arm.com (10.251.24.31) with
 Microsoft SMTP Server id 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024
 14:15:46 +0000
Message-ID: <e19821dc-01b8-4801-88ce-4c33d1a9fd63@arm.com>
Date: Thu, 1 Aug 2024 15:15:46 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
To: Arnd Bergmann <arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>, Richard Sandiford
	<richard.sandiford@arm.com>, Ramana Radhakrishnan <ramanara@nvidia.com>,
	Nicolas Pitre <nico@fluxnic.net>, Krzysztof Kozlowski <krzk@kernel.org>,
	"Mark Brown" <broonie@kernel.org>, Kristoffer Ericson
	<kristoffer.ericson@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
	"Aaro Koskinen" <aaro.koskinen@iki.fi>, Janusz Krzysztofik
	<jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
	<linux-omap@vger.kernel.org>, Nikita Shubin <nikita.shubin@maquefel.me>,
	<linux-samsung-soc@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement
	<gregory.clement@bootlin.com>, "Jeremy J. Peper" <jeremy@jeremypeper.com>,
	<debian-arm@lists.debian.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
From: Richard Earnshaw <Richard.Earnshaw@arm.com>
Content-Language: en-GB
In-Reply-To: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DB1PEPF000509FE:EE_|PA6PR08MB10420:EE_|AM4PEPF00027A63:EE_|PA4PR08MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e6b174-9ad8-4be8-5489-08dcb2347786
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|36860700013|82310400026|7416014|1800799024|41080700001;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?L0M0MzdIZ2pqVC83UklhMURlS3hRY0QraFhVak94VW5jQmtEbnF6dmNMVlZN?=
 =?utf-8?B?Z0ZBQmdqNmVwakhMaDhCL0czeHNiRFl5SlVJOWdmTFdWeU9ZaDczajFrdmE1?=
 =?utf-8?B?WS9hcTl4OTdKVDlwQzhWYXR0Z0x0V2ZmV3M5aXBnZmpuWVlVTGw2dlp1cndv?=
 =?utf-8?B?VnJYazNHMzY0Q3hKZkpaMnhuUHUxbzNqT2thZS9GaFF6NFJPbGNtbDlTMURB?=
 =?utf-8?B?QnZFYXlzWFZiM1RGTUpHNk5KNEF5d3JrUDhlRVhRT0QyYUF6TStmc2htZzJ6?=
 =?utf-8?B?amdNMTRuMEJrSm94WjNGSDFpZkdVRllVZWlIM1NrTzUzS2ZKQ3FrdnB5L1Jt?=
 =?utf-8?B?elA3amprQUpScHZwR3gyMEU5VWhuUXY0T0w5Ty9MaTY0S1hTWnR1eE5aaitn?=
 =?utf-8?B?aVhWaER2MWlBYnJ4TUtyemZ0alJNZW9iZGZILzJiWm5jbkpNUWdRZUV6RTZu?=
 =?utf-8?B?UzZuRi8yWUdXNUhWTDU3Wktjci9mcUk2SHpta21UdUY3K3c1RG5KUVJ3RnE5?=
 =?utf-8?B?UnFWc1Urcy9FM0h0YnFuQkRWbXBqSGZNL3M1L0tVRG1aaGRNVzIrM0VGMjF5?=
 =?utf-8?B?NXVLRktXMEtLRFlyN1R1VnBINHBpTGdvTS9MM1JTcURMTk9yMDZMRWFGRTMw?=
 =?utf-8?B?K2JRSHVOdjdTcVBmbGdIMHdIWE5JQ1lvZWQvb0JUUFpJSjhNeXVUMDNGbmdI?=
 =?utf-8?B?bWxtL001MkhzWnMvMmFWV0xMUFdkcTZwcjdMNVQwOHFZNzQ1enlvK29tV3JN?=
 =?utf-8?B?bjZBenk2VUpuZWxFZFl5UXZ0NUVQOXorK25vMHIxN2wra2RPWTQ3aXpIZU9I?=
 =?utf-8?B?Rk81RG5WTW4rdGc5WEJBVE91b2g5cUk3REVMWDIwODZpY2p0MVpyc0YvZThH?=
 =?utf-8?B?VHN3KzNaMHNmSmJFZXdNTEd4MS8vOFQzbW45UU9KY05MbzJBME5xb0h0Zk56?=
 =?utf-8?B?NmJkM3hSbFZ5d0Job2N4MXkxWkx6VHJUTWU4OTVHb3BjejVPcmUrQVl0M2kv?=
 =?utf-8?B?Q0ZuVElMakpBbjFqL0RzN0JWaFRBVmdZRmNjNld5OUxWcERrak1BS0RCdHo1?=
 =?utf-8?B?b1l1L1h6emdZVzhvMGU4NVFGaGdZaWdDZ2JRdVFtdEZ5SktUcTZtY3QyampT?=
 =?utf-8?B?S25xVEFVWEp2VzVFMzkwUm1JY2FHTSt4RmkyTnhnQ0RTMVhIR3RWWmllT0J2?=
 =?utf-8?B?Y01ZeGkxc21iOUM0eVhFZFM4U3VRUE5HOUsxODVmTVpCVTdZQXJVYkYwRDhS?=
 =?utf-8?B?aERsL2tOK09LUW01N1Y4eDArd3FvdnpRU2lMUGlPYjRJRFdpZkNMY3U4dkhv?=
 =?utf-8?B?Mi85R2EyUHUyeVBWdXRIVnRwOVFYdlpRUHB2dGJYUGc3YnU0djROSElDak90?=
 =?utf-8?B?REQ0ZHpLejVVbFJtUXhRVUtGK1ROYm1HKzFOOXRQUzlndk9oVFBRb3ZMZWpH?=
 =?utf-8?B?WUluM20xTWJod1NvcGVzcEJtRmRyd0NoSkd0VFNJWWUrTGR6cjJjQ3d2OUc3?=
 =?utf-8?B?QXFtdC96d2NYQkU1b0F6WWVQa21XWkFpZmVkZ05jQnVvc2pOSzFWeVpMcnJq?=
 =?utf-8?B?VHBhb1hqOHRyN2JjRnZBNk00SzZmQnYvWk1FMmg2UGM4R21WWWJFRG03cm9G?=
 =?utf-8?B?eWVkb3dnU1JQc3FuQmdMTFpFVkFZaWZDcGtvY1grMVF6ZkI0VEcwTmJWTUtu?=
 =?utf-8?B?Wml3Um1xd3dQRDBQdDVXdWNCNHhJQ1dZWjlnQXZYWDRQKzAvSzFTWDJjZjls?=
 =?utf-8?B?NkF6QkNTS2lmeUFtemtjTEdSVzFGSXo4eExLUDk3bHRhWmpaWkV6MFROWmpO?=
 =?utf-8?B?V2hWWVJGUEw1akZOanVPenkrU1hScllyclNwZzFObmRjQWtPcjZxZ00xNFph?=
 =?utf-8?B?dFBHL2NSWXB5YThIZjlFaDFLOEdJMktoUFJOV3RnSnI2UFlLZTN0TUw2cjhV?=
 =?utf-8?Q?77tyJGp3w6k=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(7416014)(1800799024)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10420
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:2b0::14];domain=DU2PR04CA0159.eurprd04.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eaf831c4-9351-4533-0a17-08dcb23470ba
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlFBTmxLWktIam5peU1PMUN6TC9xNUoraEZQWFBMWUsxdllqU0dhTkdjQWxS?=
 =?utf-8?B?c2dzcFM5VjRwd1pKTVZ2ejJiWmRkUCsvWTl2aEh5NEtscElXc0t6K01wUFZj?=
 =?utf-8?B?d1JyMW1oTXo5bTJvYmJpa3hsQzlMbDNURGpmd2xhVXhTOUNuWHc5eVA0UUt4?=
 =?utf-8?B?UkNlZjdUdGZtYUFPWEQ3NFYyMEJ5eW9MdmNnRkNKdFZCeHF5SXpNZWlONzBG?=
 =?utf-8?B?a2JjcVlEK3N2bTBLRVphajJ1d0ZmUGF6YmFOai9KbDJGeFMyeGd1K0RwdkUr?=
 =?utf-8?B?RStjV1M3SWtEc2QwdHRvd0RmMnZpSUUyZWNDTnV4OTdXT1dFZ09mVElPMlJM?=
 =?utf-8?B?V0ZBZWtuLzVaL0JBMUpPeE04OXRSRmpsSDlkRmFBWnhMaUJvNU12TG0wTllP?=
 =?utf-8?B?K1NNNnloelY1Zk5jK2VBbWc3OXlNUmkxUmZFMUdqTmVsejltRmtsdG5KdjB2?=
 =?utf-8?B?R3ErNERRcFFjRDZhaDZkNFI5L0N5ZnRta09YNkhIaXljOFAyNEY1ODhRdWtu?=
 =?utf-8?B?VnBRem8yZCt4ZlRaWjZJK0d4Q3Z0NmcxUENNRXhMZkEvRytkR05yN3Jyd3dL?=
 =?utf-8?B?clRtZy84WjVoUURzQmlCTWcxL2VaNGI1blk0eFY3RzFXenhnMjAyT3JYZloy?=
 =?utf-8?B?aGlxMWRiS2ZuQnhLYnQ1bHh2dnN5WnpUZk9YYUgzdWdXVHJJZWROWFBDY2FS?=
 =?utf-8?B?czVVbmdRVHZLeE9waHlRVlArbDJnYklpZi8vTkE4azFEOGR0Ulg2ckhQanV0?=
 =?utf-8?B?QWJVYVpzVXNjS2NTdVppRkVCOFNaZ0QxOUtNMWl4VUNIelhQejhkMUgxL291?=
 =?utf-8?B?aHhQOWYwLzFBNzZGa0t1bXAwTTkrTGxBRDZzNjBDNGt1TlVOWjJPM3l4dGw2?=
 =?utf-8?B?eXdXdXh1bjNaMStFbmhoYmhTOWhRSEdMK2ZPbkxOZTJHMExTRFlWMmdJQm5M?=
 =?utf-8?B?S014VWJtQUNubW9hVEZaaEZaL0hSTkdiY2pjNm91WHl4bnNTc0phSEs1VVR5?=
 =?utf-8?B?WEpDd09EbTB5Qk00aG9nL1ZCdnFaZXQybVNPazgzc0o1WUFJZXVBZ1ZlRjhZ?=
 =?utf-8?B?VVU1b1RwWSt2VzNRbzF0N2Mrc2NlNlNaQU1pekF0SFJtdm9EWkZ1WTNua3hv?=
 =?utf-8?B?bjVUQzF4Q2Z2SHZrdmZjZkxDMlRkU1duRDFrTjkrZFZNZ0UrS25sTnJUL1ZX?=
 =?utf-8?B?em9sTHRrMDdrbHNZcms3bjZRSHpldGtuNGtYb2JtL3dFM2dXZUV3U29uZ05n?=
 =?utf-8?B?dVdqZUpQc3RTdDM1NkpJSGM2aFFFZ3FXVlNMYWV2Q0s0aUI4K29jcm0rZDBZ?=
 =?utf-8?B?NmUxeGdpVDN0aXoydFFmWUxpbGNnZlZJdnpMT2c4TGZTWVRZeGVjUGt5SU4r?=
 =?utf-8?B?OU12cEpkRE9NZVVNRUI0Smo2c3QzVEJZWEx2RDAyem9uVXE0Z3NDY0EzWTVL?=
 =?utf-8?B?MWMrZ0lDQmltQ0J2YUlmeXZ5WkpYa096MjM1OVVUeGR0WW90WHJ5SVNBZHNJ?=
 =?utf-8?B?MUFFdlFkVG5vSkxDZW5qU1FwS3drK3l1WDRNd2t6Z0lseEsvMU5FVVFOczFp?=
 =?utf-8?B?dXpXTGp0aHkvQ3hUd1NXUXZPemZ0WFBpVWZHMHpvV2hkTEtHeEZ2YzhRT2hV?=
 =?utf-8?B?aEZOWG1Nczl6am8rSTZYbDQxam5FY0drZFpPMURpZVV5SFc4RE9xSEVmNnFs?=
 =?utf-8?B?REoyMkMyQXZZSktndGVxOFExOWhNT1BLVW5mT2I3VDJNYmJNYVVwa0pkMmNE?=
 =?utf-8?B?dkMzRmk0YU1BcjBWWitFTEF2cUhpM0M0RU1DTDZQL0ltVjJYc3d2ZTBhdExq?=
 =?utf-8?B?YmtGa1dZYU9oc1JHS01CTGgyNG83MlhyMG1sOGdNNFo0ZnNWR1NkRE8xVFA5?=
 =?utf-8?B?eVFhck9BYUliZGgvNUJSaEdOQVBXWnRYbkFVOGpITTY4cHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 14:15:59.2009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e6b174-9ad8-4be8-5489-08dcb2347786
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6093



On 31/07/2024 18:29, Arnd Bergmann wrote:
> We removed a lot of the unused board files at the beginning of
> 2023, and I'd like to plan ahead for other hardware and feature
> support that can be removed after the next stable kernel
> (linux-6.12).
> 
> TL;DR: I think we can deprecate toolchain support for ARMv4
> (pre-thumb), iWMMXt, BE32 and OABI (-mabi=apcs-gnu) *if* that
> helps gcc-15, as we'll likely not need those any more after
> gcc-14 will be too old to build new kernels (ca. 2030).
> 
> I hope we can keep reducing the number of non-DT board files a
> lot further, but I still expect this to take several more years
> before it is DT-only. Please reply here if you are using any
> of them so we can spare them once more.

Thanks for putting this all together Arnd, it will be very useful for planning purposes.

I've added a few notes below.

> 
> 
> == Architectural features ==
> 
> These are features that require support from gcc, which in
> turn may benefit from dropping it.
> 
> === ARMv3 ===
> 
> This was removed in gcc-9, so it will eventually get removed
> from the kernel as we raise the minimum compiler versions.
> Only RiscPC relies on building with -march=armv3, despite using
> an ARMv4 StrongARM CPU.

Yes, this was due to architectural restrictions from the way the StrongArm CPU was plugged into the RiscPC system bus - the bus was designed before StrongArm and couldn't handle the half-word memory accesses that Armv4 introduced.

> 
> === ARMv4 ===
> 
> This is used for both StrongARM and FA526 CPUs, which are still
> used on a small number of boards. Even the newest chips (moxa
> art, ) are close to 20 years olds but were still in use a few years
> ago. The last Debian release for these was Lenny (5.0).
> 
> Dropping compiler support now would be appropriate IMHO, and
> we can drop kernel support in a few years.

This is good to know.  The lack of Thumb (particularly the lack of BX) on these CPUs is a major wart we still have to handle in the compiler.

> 
> === ARMv4T ===
> 
> We still support six SoC families with ARMv4T cores (ARM720T,
> ARM920T and ARM922T). These are equally old to the ARMv4 ones,
> but have more users and developers working on them than the
> ARMv4 ones. Debian Stretch (9.0) last supported these.
> EP93xx in particular is used in some products with long
> support cycles, so we may end up supporting these in the
> kernel as long as ARMv5.

I don't expect Armv4T support to disappear any time soon.  But these days maintenance for CPUs this old is pretty minimal - we try to keep it working, but you might be better off with older tools.

> 
> === ARMv5 ===
> 
> About one third of all supported platforms use ARMv5,
> but most of these are near their end of support. Notably
> there are still new SAM9 variants from Microchip that are
> meant as backward-compatible replacements for their
> older variants.
> 
> Debian still supports these, but the lack of FPU and
> atomics makes this harder, so I expect this to become
> an unofficial port in the future.
> 
> === early ARMv6 ===
> 
> This is the ARM1136r0p in NXP i.MX31 and OMAP24xx, which in
> practice means just the Nokia N8xx tablet.
> It causes a lot of pain to support in the kernel since it
> requires special hacks to support in SMP-enabled kernels.
> I have a patch series that moves ARMv6 from being ARMv7
> compatible to being ARMv5 compatible inside the kernel,
> which should help, but that needs more work.
> 
> === ARMv6K ===
> 
> We dropped ARM11MPcore support last year, but still
> support ARM1176 (Raspberry Pi 1, AST2500) and ARM1136r1.
> These are easy to keep supporting in the kernel.
> Distro support is getting harder since they are slightly
> too old for the common armv7-a+vfpv3-d16 level.
> 
> === ARMv7-M ===
> 
> Cortex-M3/M4/M7 are the only cores we support without an
> MMU, currently on 5 microcontroller platforms. Upstream work
> on NOMMU kernels has pretty much stopped in 2017 when everyone
> moved to open-source RTOS variants like Zephyr. I expect that
> we can drop support ten years later in 2027, but gcc will
> still have to support them on other operating systems.
> 
> === iWMMXt ===
> 
> I'm not aware of any remaining users for iWMMXt, and we dropped
> support for ARMv7 PJ4 CPUs (MMP2, Berlin) already, so the
> only supported hardware that even has this is Intel/Marvell
> PXA and MMP1.
> 
> Dropping support from gcc is probably a good idea now,
> it is already unsupported in clang.

We marked iWMMXt as deprecated in gcc-14 and will likely remove support in GCC-15.  We expect to continue supporting these as Armv5T cores, but not the iwmmxt (or other XScale) extensions.  

> 
> === big endian ARMv5 (BE32) kernel ===
> 
> There is one SoC that uses this, the Intel IXP4xx. Older versions
> of Debian supported this chip in little-endian mode, but the device
> drivers are known to be broken for LE now and would require someone
> to spend time on fixing them.
> 
> I would suggest dropping support from gcc, which still gives
> us a few years to fix the ixp4xx support, or drop it when
> gcc-14 support is dropped from the kernel. Curiously, support
> was added in clang not long ago.
> 
> === big-endian ARMv7 (BE8) kernel ===
> 
> This is very different from BE32 mode in making more sense
> from a kernel point of view. In theory any ARMv7 hardware
> should work, though a lot of drivers are buggy. I am not
> aware of any actual use cases, though in theory it can be
> helpful for testing big-endian userspace when one has
> access to Arm hardware but no other big-endian machine.
> 
> We should probably keep this a few more years in both
> toolchain and kernel, unless it starts causing actual
> problems. I don't think anyone is testing it any more
> though.
> 
> Side-note: netbsd has a armv7+be8 variant, so clang will
> likely keep supporting be8 even if gcc ends up dropping it
> in the future.
> 
> 
> 
> == Kernel features ==
> 
> === pre-ATAGS param_struct ===
> 
> This was deprecated in 2001, to be removed in "5 years
> from now", which was a while ago. We can probably
> remove it now, or keep it around until the two platforms
> using it (RiscPC and Footbridge) are gone.
> 
> === ATAGS based board files ===
> 
> After the previous cleanup, there are board 29 files in
> 10 SoC platforms remaining. I would hope we can reduce this
> significantly again, but need to go through the platforms
> individually. ep93xx is getting converted to DT, but the
> others have made no progress towards that.
> 
> === OABI kernels ===
> 
> Practically everyone uses EABI today, and OABI support was
> dropped as a userspace target in gcc-4.8. The kernel still
> however allows being built as OABI by passing "-mabi=apcs-gnu",
> and this is used as the default for armv4/armv5 kernels.
> 
> This is a frequent source for bugs as driver writers are
> unaware of the unusual struct padding, alignment and enum
> usage. I've stopped testing it in my randconfig builds
> a while ago because of random bugs.
> 
> I would propose to leave the feature in the kernel but
> make it harder to enable by accident, changing the default
> for all targets to EABI and adding a dependency on
> 'CPU_32v4 || EXPERT'.
> 
> For the compiler, I think removing support for -mabi=apcs
> makes sense, unless there are non-Linux targets that still
> use this.

Gas 2.43 (finally) drops support for the FPA and Maverick.  gas 2.44 may well drop support for OABI binaries (arm-none-elf, as opposed to arm-none-eabi).  Support for these is probably buggy now and it is certainly making maintenance more difficult.

> 
> === OABI compat mode ===
> 
> This is the other way of running OABI binaries, using a
> normal EABI kernel. It suffers from a different set of
> bugs, as the kernel itself is fine, but driver specific
> structure layouts with user interfaces (usually ioctl)
> may be incompatible.
> 
> The maintenance cost in the kernel is much lower than
> native OABI kernels, but I suspect there are even
> fewer users.
> 
> Since there was never an EABI desktop distro for
> ARMv4, we probably want to keep at least one of the
> two (OABI or OABI_COMPAT) around as long as we
> support StrongARM machines.
> 
> === NWFPE ===
> 
> Russell had a patch set to remove this 11 years ago,
> but ended up keeping it. This is fundamentally tied
> to OABI userland, so we'll likely need to keep it for
> as long as either OABI or OABI_COMPAT remains.

See above re FPA removal from GAS.  GCC removed FPA support in 2012!

> 
> See the discussion at https://lore.kernel.org/linux-arm-kernel/20130410191206.GM14496@n2100.arm.linux.org.uk/
> 
> === Highmem ===
> 
> Most Arm machines are fine without highmem support and can
> use something like CONFIG_VMSPLIT_2GB to address up to 2GB
> of physical memory. Machines larger than only popped up
> around the time of the Cortex-A15 in 2012 and for the most
> part got replaced by 64-bit chips within a short time.
> In addition, there are also a handful of Cortex-A9 and
> Marvell CPU based machines that have either more than 2GB
> of RAM or a very sparse memory map that requires highmem
> support.
> 
> Linus Walleij has done some work towards being able to use
> up to 4GB of RAM with LPAE (Cortex-A7/A15 and later)
> machines, which I think still needs to be finished before
> we can remove support for highmem.
> 
> === Sparsemem ===
> 
> There is a new discussion about removing support for
> traditional sparsemem support, see
> https://lwn.net/Articles/974517/.
> 
> This also relates to machines that currently need highmem
> support in order to use all of their RAM even if the
> total size would fit into the lowmem area, e.g. on
> Renesas R-Car SoCs. In theory it should  be possible to
> move the indirection layer from __page_to_pfn() to
> __pfn_to_phys() and support discontiguous lowmem
> that way, but I don't think anyone is working on that,
> and I don't know if that addresses the concerns with
> today's sparsemem implementation.
> 
> 
> 
> == Platform support ==
> 
> === RiscPC ===
> 
> This is the oldest supported platform, and it will
> eventually have to get removed as it no longer works
> with gcc-9 or higher because of the ARMv3 removal.
> 
> As far as I know, nobody aside from Russell has booted
> this machine in many years, so if he's stops upgrading
> his kernels, we could also remove it earlier.
> 
> === SA1100, Footbridge ===
> 
> These are the other StrongARM based platforms, which
> like RiscPC are only relevant for nostalgia. When we
> removed the board files for 6.3, a couple of StrongARM
> machines were left that someone said they were interested
> in getting working again, and converting to DT. I don't
> think there has been any progress on this, so it seems
> unlikely to happen in the future. The last StrongARM
> machine that got added and that is still supported was
> the ipaq h3600 in linux-2.4.13.
> 
> There are also machines that Russell is (was?) using:
> sa1100/assabet, footbridge/netwinder and footbridge/ebsa285.
> 
> Being able to remove these would get rid of a lot of
> complexity both from the hardware being unusual and
> from them not using DT.
> 
> Need input from Russell.
> 
> === Gemini, Moxart ===
> 
> These both use the Faraday FA526 CPU core that like
> StrongARM implements ARMv4 rather than ARMv4T with thumb.
> 
> The chips are also over 20 years old, but the kernel
> code has been updated and is not a maintenance burden
> by itself, so there is no value in removing these
> machines until StrongARM is also gone.
> 
> On the other hand, removing both FA526 and StrongARM
> platforms means we can probably remove ARMv4 (non-T),
> OABI and NWFPE support more quickly if we want, or
> we can wait until a few years after gcc drops ARMv4.
> 
> OpenWRT lists the gemini platform as supported in
> https://openwrt.org/docs/techref/targets/gemini, but
> none of the individual machines have builds for the
> current release.
> 
> Need input from Linus Walleij.
> 
> === PXA board files ===
> 
> There are two board files left in the PXA code that
> we did not remove two years ago, in the hope that this
> would help the DT conversion.  Nothing happened
> since then, though qemu removed support for their
> releases.
> 
> Unless someone has specific plans to work on them,
> I would remove these in early 2025.
> 
> There is also DT support for some PXA boards, which
> would likely stay around.
> 
> === OMAP1 ===
> 
> This is now the only ARMv4T/ARMv5 platform with no
> DT support, making it a target for removal at some
> point. Unlike PXA, there are still users, but it seems
> there are no current plans for a DT conversion.
> 
> I would suggest going through the five boards
> individually to see which ones we can remove in 2025
> and keep the remaining ones for the moment.
> 
> === Nspire, AT91RM9200, CLPS711X, EP93xx, iMX1 ===
> 
> These are the other ARMv4T targets. Nikita is in
> the process of finishing up the DT support for EP93xx,
> after that these are very cheap to maintain in the
> kernel since the platform code is all up to date.
> 
> Unless there is a specific reason to drop these, I
> expect them to stay around as long as ARMv5, probably
> to the end of this decade.
> 
> === OMAP24xx ===
> 
> This is the one ARMv6 (non-K) platform that has active
> users. The platform support is fine, so it depends on
> what we do with arm1136r0 CPU support. If my patch
> for armv6 support in the armv5 kernel works out, we
> can treat it as a v5 variant and keep it as long as
> v5 itself, otherwise it would be nice to remove the
> kernel complexity by dropping arm1136r0 support like
> we did with arm11mpcore.
> 
> === iMX31, realview/integrator with 1136r0 ===
> 
> I'm not aware of any users, but these don't get in
> the way as long as OMAP2 is there. Whatever we do
> with OMAP2 can also happen with these.
> 
> === S3C64xx (Cragganmore) ===
> 
> This is the only ARMv6K board without devicetree
> support, and the board file contains about a similar
> amount of complexity as all other board files
> combined.
> 
> arch/arm/mach-s3c/Kconfig.s3c64xx lists it as scheduled
> for removal early next year, which would allow a large
> amount of cleanup in platform and driver infrastructure.
> 
> However, Mark Brown is actively using this machine
> as a testbed for audio codecs, which is what it was
> designed for by Wolfson (now Cirrus).
> 
> There is no satisfying outcome of this that I see,
> my best idea is to delay the removal until Mark has
> moved on to something else.
> 
> TODO: find out if Cirrus have a replacement that
> Mark can migrate to.
> 
> === Orion5x, mv78xx0, dove board files ===
> 
> Like PXA, these were left behind in the hope that there
> would be progress towards DT conversion, but none of that
> happened aside from a small set of mv78xx0 bugfixes.
> On the contrary, Debian has now dropped the
> orion5x kernel binary citing lack of users, so it seems
> much less likely to ever complete. Out of the machines
> about half the orion5x ones have DT support, mv78xx0
> has none, and dove DT support exists but is less
> complete than the board file.
> 
> There is still a community around running Debian
> on some of these devices at
> https://github.com/1000001101000/Debian_on_Buffalo/wiki
> 
> I would suggest removing all these board files in early
> 2025 to still allow building a 3rd-party kernel using
> the Debian 13 release sources. The orion5x DT support
> can get merged into mach-mvebu then.
> 
> === iMX35, WM8750, AST2500, BCM2835 ===
> 
> These four are all ARMv6K platforms and fairly well
> supported, though only AST2500 and BCM2835 have an
> active user base. Support for ARMv6K is likely to
> stay around at last as long as ARMv5, so there are
> no plans for removing these.
> 
> Most distros that had Raspberry Pi 1 armv6k-hardfloat
> support have dropped that now, but some minor ones
> still exist, while Debian and others runs ARMv5-softfloat
> userspace on them.
> 
> === stm32f4/f7/h7 microcontrollers ===
> 
> These are the only MMU-less Arm chips that see any
> continued development, as ST keeps supporting their
> existing customers. There are also newer MCUs based
> on Cortex-M33 and up, but those don't run Linux
> as far as I know. Let's keep until at least 2026
> before we start discussing deprecation.
> 
> All other MCUs (IMXRT, SAMV7, LPC18xx, MPS2) are
> used much less than STM32F and can probably follow
> the same path once they get in the way of dropping
> v7m support.

