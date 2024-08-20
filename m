Return-Path: <linux-omap+bounces-1959-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D20C5958A8D
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 17:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 545531F24148
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 15:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CFD51917FA;
	Tue, 20 Aug 2024 14:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="b2mGO7HM";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="b2mGO7HM"
X-Original-To: linux-omap@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2055.outbound.protection.outlook.com [40.107.241.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D6E18E37F;
	Tue, 20 Aug 2024 14:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.55
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724165953; cv=fail; b=X2TmVUOl6RJc88/Dx8NiHhTvm4AmH98IIVW2xYOsKrc90iZ2n6sAcx1+68YY5hBhs34S+TmX3o3Ce+pAiUKN3anqArZmdFprkLb+M/c4ZHCM/SYixa0UVNEyvPU2HlqvSnFVen2AMZFnTcJ0JvE+TzlZqXZ4DNIken4FSYPBTBY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724165953; c=relaxed/simple;
	bh=gIMEqKl/CKP+HGQ1dZW3Ew7LmoPEWxa1VCk4TskzYFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UBWh9lxJbGjgt6W35j0Qa0B5FaITetEcgStUHdCUznOGIuq73ytPWPttkVxRFhLBiUwBstjRgKnTb5agBDIUdDyrjOZJA/yUUlkiOieKcTMFWCGnrJw6KEDF0f8FTyh4Lu6IU/xmd1HGfpV3u1FL7gSswZV+OH2rTHE4qj/ooTk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=b2mGO7HM; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=b2mGO7HM; arc=fail smtp.client-ip=40.107.241.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xGLOrM5aYbhwiQdn0/8fUDXjUks73PC60W2UYfVI4MZNeWTDyNwsF8bm1OPSReepBDOHV0tf/uX8jf/NxqEIi7987exiOVX1gQ1tJMR+bU8wITqluN+6HgLSmdxkFJNXI1VgS8BDDEzrG+lqb7WFTm+jrJCaLcDCD1E07dnCcRDKJnfphQfi0QwCvrkpygrZRdgP0aW/M9tXeCNoWeIaQ7fYrcaRPSNz1ow0rW/RjUpBg+j6V1uxBOQYWifey7GsRjUzDuOVOWkleK+anOV8kTCWe2A4BfGn0CcNECynOJCOjNjZ4ah5TaQWAQECXQ3mHskq8ndLCk1UhPenKB4fdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4USdbMZ0Fh27nNYCWcbL0/jqUPubzf//N1O4wV3hwA=;
 b=QMMB0wtafeLgPcTpWe1EYsUdjQl1q/rrKhPyVXKJ+NzbicWPKaRFLbW03GAKNurISKcTjrHQWGeSNygrfrOlLes4aqFUgAGvRbbihokOSx5I2hMJzDlWxrrNZQ4tYbKVodehhpZWTWsFO/xARz7fNumwu1OpkwTtmS9y/Baa9vpwZfejBMvvIuZ6y5IZL9LurWrTzUUZuSxMI9IXTmK56BrcrFJtiYg97htNbxfkicJpMc/A4oxeCVKgYWgdPYRiFGEDzZ2MHAoQB2VgnmMGSA/xnggjzAxREHsGzOow+BLZtKjEVoCnco++9uvLJ/I2j5RjEtNOtXyrzA2Gd5LA1Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4USdbMZ0Fh27nNYCWcbL0/jqUPubzf//N1O4wV3hwA=;
 b=b2mGO7HM5IsAjhjHMbc94qd1aurf684NB+Gp+Z0cRzN2BmHF2HpmJEBNZfJ+idb+C2jmak9L9frBfjh0X1Lw1T3XoYlJvhQDpeKdZEdjsUlvZIJisNuhsrZ7zSA28GCsYgFtZxQQodeXg/YKbehSvZ+QB22QIijzso08ZCte5Hg=
Received: from AM8P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::16)
 by DU0PR08MB8980.eurprd08.prod.outlook.com (2603:10a6:10:471::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Tue, 20 Aug
 2024 14:59:03 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:20b:21a:cafe::db) by AM8P191CA0011.outlook.office365.com
 (2603:10a6:20b:21a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16 via Frontend
 Transport; Tue, 20 Aug 2024 14:59:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7897.11
 via Frontend Transport; Tue, 20 Aug 2024 14:59:03 +0000
Received: ("Tessian outbound 6063493ec672:v403"); Tue, 20 Aug 2024 14:59:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 32a840a00b2506bd
X-CR-MTA-TID: 64aa7808
Received: from Lcd7966ea69c1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7C461940-9523-42AF-94FB-EA9A77B3F651.1;
	Tue, 20 Aug 2024 14:58:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lcd7966ea69c1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 20 Aug 2024 14:58:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABwdzH/Ipkq32OGl2+stHLgYUJ4SUgOMbHArV5ilF/O86HWduiSIJAtLZol5F7N8hbkxt0046jD8tE7RKYqbS8+sqq2vJGldTAk9ihFe6dX0uM1y+BeAk3KIxyder3ak8h1KDkrAcy9ddrwYfbe+dTYcsVdmR/VlhIbZQjCE53zvZ2tHxVvLMJyMaKdgP5Rl6T2hVh8CqXs2dxWiJ2LcrZq+AYdouW1rYHyhzRWBYSVE6NIhBpi6i2hgDclUIuRe/XTXrs5V0qMCE+ayYpVoRY1d+RNh2yQdOMWD1r0LSu7Ua5cAUjY8aUF6nFDCPS/AftC5Blz6I+f8mXnmnUpTCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4USdbMZ0Fh27nNYCWcbL0/jqUPubzf//N1O4wV3hwA=;
 b=HCoV/S5PSCffM1NHCdETNX8g6+klfuF/yImSA0KvlDkzJYBws3OWRCWWRWgEqt1zR/1ZtYeL1x6/UOfTWp63gDkGSudBnzpux5Y9ulzGdn5HgTbipBmd7nZ8CdXPSkpb0LEP/OqWoJHpdh44BEm4PjqEg7q4w0QsEdkxTCrsE6N5wpGLsfvQ8uSF5XlJha/Ak8F7loM99ykcDQeAW8HfxcS4CAT5SIsq+6w+CB3ZL7Ginz6/butIAd2g5oBgo0kGyHtORtn4b30H4fnSm5zu2Wnj2ZAcUQS8/gs/JLgrTKyG5NpF8oEGvONdGbEL7AAqFdAqjw/f7ox/a4V9ZTVTJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=arndb.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4USdbMZ0Fh27nNYCWcbL0/jqUPubzf//N1O4wV3hwA=;
 b=b2mGO7HM5IsAjhjHMbc94qd1aurf684NB+Gp+Z0cRzN2BmHF2HpmJEBNZfJ+idb+C2jmak9L9frBfjh0X1Lw1T3XoYlJvhQDpeKdZEdjsUlvZIJisNuhsrZ7zSA28GCsYgFtZxQQodeXg/YKbehSvZ+QB22QIijzso08ZCte5Hg=
Received: from AS9PR04CA0034.eurprd04.prod.outlook.com (2603:10a6:20b:46a::16)
 by PAVPR08MB9626.eurprd08.prod.outlook.com (2603:10a6:102:31a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Tue, 20 Aug
 2024 14:58:53 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:20b:46a:cafe::b9) by AS9PR04CA0034.outlook.office365.com
 (2603:10a6:20b:46a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25 via Frontend
 Transport; Tue, 20 Aug 2024 14:58:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 14:58:53 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 14:58:52 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 14:58:52 +0000
Received: from [10.2.78.57] (10.2.78.57) by mail.arm.com (10.251.24.31) with
 Microsoft SMTP Server id 15.1.2507.39 via Frontend Transport; Tue, 20 Aug
 2024 14:58:51 +0000
Message-ID: <5c7f9469-78ad-4092-8e93-bfb41028ca34@arm.com>
Date: Tue, 20 Aug 2024 15:58:51 +0100
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
	Nicolas Pitre <nico@fluxnic.net>, Krzysztof Kozlowski <krzk@kernel.org>, Mark
 Brown <broonie@kernel.org>, Kristoffer Ericson
	<kristoffer.ericson@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Linux-OMAP <linux-omap@vger.kernel.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	<linux-samsung-soc@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, "Sebastian
 Hesselbarth" <sebastian.hesselbarth@gmail.com>, Gregory Clement
	<gregory.clement@bootlin.com>, "Jeremy J. Peper" <jeremy@jeremypeper.com>,
	<debian-arm@lists.debian.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
 <e19821dc-01b8-4801-88ce-4c33d1a9fd63@arm.com>
 <8f8c07c6-d138-491c-9ca0-72f82779b2d2@app.fastmail.com>
From: Richard Earnshaw <Richard.Earnshaw@arm.com>
Content-Language: en-GB
In-Reply-To: <8f8c07c6-d138-491c-9ca0-72f82779b2d2@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AMS0EPF0000019C:EE_|PAVPR08MB9626:EE_|AMS1EPF0000004B:EE_|DU0PR08MB8980:EE_
X-MS-Office365-Filtering-Correlation-Id: c825e939-2b31-4aea-89cc-08dcc128a1bd
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013|41080700001;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RERURHB6V3NlM3V4aDExR2ZuRUs4RjZXQUVQY3NiZU92M0dxWFA3dFhVeS9n?=
 =?utf-8?B?MmVCMzZQZzl2QnRYMXJQL3A2K1BxVkJOeVNiNWdOSTh5RXk0NGNHWTBBUjZp?=
 =?utf-8?B?bmxHemJXaStkRUI4ZXJmYmhoMEt5aHBYa0tpelc1d25oNlo0d2FQTks1RGdk?=
 =?utf-8?B?cFhhVXI0aER5bjB6dGc4OHQ5VDNCazFsajB4dWtoVXh4Njc0QTdHY0Z1SC9i?=
 =?utf-8?B?VStkejFQTHN1ZFMreGFGSVJ4MXBVMWJBSUprb283REFkaEJuYUliUFRwYXpQ?=
 =?utf-8?B?TWFiWmwyemgrL2NUbzV1c2E1L0RPRGplaXg3bFlZMVhHR2NNZE1nb1BBYldq?=
 =?utf-8?B?RGFueDFIU2JMUDZTdzV3TjhYamJBdjN4S0hqazFiSmc3NU9kNmlQd1J2M3pX?=
 =?utf-8?B?Ym9FQ2xYVHV3VHBtQm1FTzVZLzlZVVJUcWRod3YzZWl0ZFZIaWx0Z1FzQk5z?=
 =?utf-8?B?VGZxY0syMGxRaHVMUGFGaEsvK1NlTE9NazFlc3FwaEVWenFGWTBZTFZDUEkr?=
 =?utf-8?B?em1FRzMxV0s5VVBsdXFQZ2U4clNWV1owUTh0V0lrWWhUMEFnQWJ1YlRGNVY4?=
 =?utf-8?B?MTZLT0c1ZGpqbFdNV2JZSktaQnZlM3o0Sjc0RWRMK3J6WTZlTHVNK1JZTWky?=
 =?utf-8?B?YnBES2c1Nmk3K0t3Tk1EQ29oMm9pNWQ1Qlk0eHJFOTViNmtCOTVsbDBOdERF?=
 =?utf-8?B?NlpqajlsMmlGVzBKcWxhSTVPNG9DSVBVV2tOOHoveTNxQlJ2QkUzaWlKY2kw?=
 =?utf-8?B?cGxwdUxoZG5pQ3liTUlyT2w1QUJ6OGtEeW1kQWYwU2pITTRFdEg2TmtmS3Bp?=
 =?utf-8?B?a0s4WW5pcXdFWUNOS0prNTliWW9TOEtiUDkwSnE0UmJ2VjFDakxrL0dhTkRL?=
 =?utf-8?B?V3ZZblJtaXVtVFhxM1N6YXFHWm9yNlByTTVpb0tLRm1jUnhhV0puSGhETXcx?=
 =?utf-8?B?QUpRNnRPLzBTbGUwNjV2OUs3UXhzN1ZQQThaUDJRVkpFMUF5QzVnSlhuVGxG?=
 =?utf-8?B?SUgwTmF2YlR6REpVbXd5bGpYTVJFYlRIY3h2S0ZtOWFIdTNWV1pQMGNTNlJF?=
 =?utf-8?B?dFltUjlxR3d4cHZ4TEw2eWdWWEtSbEVLL244NGUwVk11U05DelhaMyswUWk0?=
 =?utf-8?B?R21BZFB5TlVFYnFXdmpmK05kcmRBN1ZlK1MvYkVDN0hrOEJEdFE2djMrMU02?=
 =?utf-8?B?amRxUWYvS0xCTW1Ja1JuOEdaOEpWZnBtMFNDdkhueUJjVFllODdNWWpWMis2?=
 =?utf-8?B?REw2VUltMDZnSXFiWktsTzgrSE96M1BEV3crOEo1V094bTczdkpVN1BtMllR?=
 =?utf-8?B?N3RodTc4K1NvbWRXbVg3Z1ZSYStabXJuZ21UVHpWYnNlTHRlc2tHWVo2ZDRP?=
 =?utf-8?B?cWxvdE5na2JORktzTHRhVjVPbk9nV1Rhdzl2SWcyd2NicTlTU09ua2NDdnVK?=
 =?utf-8?B?MGRRTVdJaDk3eVEwNUVTSVpvSzE5Z2Vxb2RPOElkV0JUVytRSmdIcHE4b2NX?=
 =?utf-8?B?T1N0TzRmWFBOZ24waU9tQ3I5VmhMSTAwanllaW0rK2tLU1AyNC83Mys2YitW?=
 =?utf-8?B?cUVlMG1ZZkJzR0tSdWRxVk1iTnJjOVpCdTN5bE4rdDJXOG1lMkNhZUZidDNn?=
 =?utf-8?B?Y0dWT1NVcFVPbE9qNzJ1TzIxQXhjcjkzeVR1MTU3Z2hpS2ZPV1BiSTBDM04x?=
 =?utf-8?B?eld2MHB6UTFCSytmY1d0VmZQR2hxUnNDRlRuN1RDeGJKRWozUVhXS3FBYXdw?=
 =?utf-8?B?T085QVQxeGswYzlkWVNMYWp5YUUwcHFuaGhiQURDVkE0eEdQcmV5b1lXbmhX?=
 =?utf-8?B?bWJpY3hhc0QwdW1wQzFLc2E3NzRKZVg3Qk8wbC8ralJTMUZlOGNKYUh2OEVC?=
 =?utf-8?B?ODB1c2dkVFgwdzFwZnMxeStLNml6TWViemNZcHg0UVBLS3Mra29QNDNXZ2FF?=
 =?utf-8?B?SDFicUJhVTZ4aEJuVkQyN095RWxKc3NxamJOMi93dDl1NVhZd1V0a3UycFJl?=
 =?utf-8?B?Rkc0TWJVVGZ3PT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9626
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:20b:46a::16];domain=AS9PR04CA0034.eurprd04.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	059662b2-8dfe-4bf8-0296-08dcc1289baf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWtJbWlONFVkWm5xdEx3YUZON3JmU1BlZzVhZ2hSc3JXUnVTQWM0QStpaUFV?=
 =?utf-8?B?RnRnem1aZk5kaXhKMjZEdSsyV2tXZVc4anJocmVDV3h5VEYwbVo4eXVVYlBk?=
 =?utf-8?B?WEszT0wxTVhaaHlFR1c2WDQwUHVJQUxUZVNvZTc3MVNJZDZ1NW9BakNQb0Qv?=
 =?utf-8?B?eWVKU0lVT0tFQ21CRWVtYTI5aTlGVTdsWmxaRG9WZ3NVazA2UEJOS3BMWXZB?=
 =?utf-8?B?THNvSjV1anlpM1dMdS9scExsbldnMTRCRzNsUk16c3JVR2tEUDlDdS9BUnJT?=
 =?utf-8?B?RFE4MXgyNFpvd29ZL3d4UlI2VlF1NjZzaXRWZjlMY2VibHNFb3ArRDZLaGNF?=
 =?utf-8?B?ZDZxSnBZdU9IeEVmYlhhYy9mRVYybGtjUWZ6ME1ZK2VZZlMwbU1WNHB3b1J2?=
 =?utf-8?B?Y25saHFhZlhTVzNISFBKWUV0Vy9aalJKdWJjU0NNQkxma293Ri9ZSFR0NWZ0?=
 =?utf-8?B?cmpMVnVicndOclVzajg0c1E5OFpvSFl6WFFKZjJhaUxka1VxSVdHeHdOQTVs?=
 =?utf-8?B?b0pYL0Ezc2htdDBPcGYwWnBZNDRUNmI3WkN4dkgyS2JodkpGenJUY3p1UVBL?=
 =?utf-8?B?MGFXZEFoblduaW1iaVRUVEROSG1hdER6S3lWRStYV09QQXAvMjhEdnhJMTY2?=
 =?utf-8?B?QzJCdFpiOWRJUWtHaEZ5UG40NkRmQ0pKTzVIUkQ5RDJsZjQxQjZUZ054UlZu?=
 =?utf-8?B?UGNSVXplZkg2bEsxOTdOYmhVMHBNN1Vpb2xFRmZqRFRHQmFZRVRocjBkd1c2?=
 =?utf-8?B?Z3VVQ2RPcUlDLy85bFhIRnZJd0N5azRrL01PYVEvN0JKdGF5VUJqdXlmSDNF?=
 =?utf-8?B?Nk40T1UycDU4dytVOUZlRWRYd0s4Mzc3ck5CYUhrR2lnT1cwMWRRWmRIai9n?=
 =?utf-8?B?cTZYNE1WMDZhRnNOK0g0QVFKeW1aeXk1Y2hFU2NvOVo1ZitPL1VQSytLN2k2?=
 =?utf-8?B?a2Z6MGVPc2kzU1l0WGdIU0FaTXo2WUk5UWU2aGd2aFdRZGtuVEN0L09RK2lr?=
 =?utf-8?B?OERxaFVRdmRwTG93VlhaQklXaEhHQzNXNTMySndBaUxoV0pUbVBNZ0Zlcmhu?=
 =?utf-8?B?M2F1VU5rNUhHeTdhSmNNSzJKSmI5UmwwYng3MktYS0Z3TFU1Tk14Zy9heSt1?=
 =?utf-8?B?a2Rld0U0VWJFbVA4NmNacWtZUWNhYkVmWEtERUdabDlVR2lILyszMnh4akFh?=
 =?utf-8?B?QTgvZlZjT0xlRWoyaDBpNHlZRVQ2NFcrdndFdk5uVUFWeGZzWjNYeFBZRmpQ?=
 =?utf-8?B?S3k1OFEwcWpJUG5yVGVvQS84UUtMZVBjbGpmdElWMWk1S0hyUmpqaG5yeGJC?=
 =?utf-8?B?VWRleEdwZzVoSTF6YUhnRlZDUmIzSjRlVnl1MHBpMWg3ejhHZkU3SE1NNytz?=
 =?utf-8?B?cHRnY1djaGYzRnk3MWlTVW52VDcyT0V1dEF6dFRDYjBOTnN1dkp3MTh6SCtr?=
 =?utf-8?B?U2FJVTdtNDg1SVF6RXdQZ04zNGx2VHpZQ25wa1I1amdYeTNGeHptQUxvSlFu?=
 =?utf-8?B?N3ZFNDhtbjlxSEtEby84alZ4VWswYVFLRDhkZDNta3lwaWZZNWczeExwcSs2?=
 =?utf-8?B?S0NXZnlyTndMN010UWNqRGxGZXMvNHFSNFdWUTVVNU1tTVhpSzdVSUcvc2lZ?=
 =?utf-8?B?VElFWnNnd1FIcWcrS2RJYng4VVZCeEpLL1BXbDVyR0d6ZDNFVlRVaDdQWEZ2?=
 =?utf-8?B?S2VXTUZJbndjQ0ZFYmpEUGVRYTUxbEZ4cVMwcEhNRWN5RUQ2OURBQm9POUlk?=
 =?utf-8?B?L3BDSC91MUJXMGdSQUZYKzVQWnhGNThaTlVTLzFaOExTcFJnTmFQUmdWWHRq?=
 =?utf-8?B?MjZsMlNESnBzaU1NQXk1YmYrYi9yaExQT3JTVDR6WjFKcGFmOXlmOTh1aGIw?=
 =?utf-8?B?ZExoL1FqeFJkOWJ1Ri9sY1RhMzB3T0UyV0lqMWZ0L0gyQUg5MXZVRk8wUFFj?=
 =?utf-8?Q?mg8ciCKwvzZ8Vyf4NyzxH5nSd9RrCeN6?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 14:59:03.5236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c825e939-2b31-4aea-89cc-08dcc128a1bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8980



On 02/08/2024 16:12, Arnd Bergmann wrote:
> On Thu, Aug 1, 2024, at 16:15, Richard Earnshaw wrote:
>> On 31/07/2024 18:29, Arnd Bergmann wrote:
>>>   This is used for both StrongARM and FA526 CPUs, which are still
>>>   used on a small number of boards. Even the newest chips (moxa
>>>   art, ) are close to 20 years olds but were still in use a few years
>>>   ago. The last Debian release for these was Lenny (5.0).
>>>
>>>   Dropping compiler support now would be appropriate IMHO, and
>>>   we can drop kernel support in a few years.
>>
>> This is good to know.  The lack of Thumb (particularly the lack of BX) on these
>> CPUs is a major wart we still have to handle in the compiler.
> 
> See also my (too long) reply to Linus Walleij. He thinks we may
> want to support ARMv4 a little longer, but hopefully we can reach
> a consensus about how long exactly.
> 
>>> === iWMMXt ===
>>>
>>> I'm not aware of any remaining users for iWMMXt, and we dropped
>>> support for ARMv7 PJ4 CPUs (MMP2, Berlin) already, so the
>>> only supported hardware that even has this is Intel/Marvell
>>> PXA and MMP1.
>>>
>>> Dropping support from gcc is probably a good idea now,
>>> it is already unsupported in clang.
>>
>> We marked iWMMXt as deprecated in gcc-14 and will likely remove support 
>> in GCC-15.  We expect to continue supporting these as Armv5T cores, but 
>> not the iwmmxt (or other XScale) extensions.  
> 
> Ok, good to know. The kernel doesn't actually have a build
> time dependency on gcc's xscale or iwmmxt support aside from the
> one assembly file we build with gcc -march=xscale.

I think you mean -mcpu=xscale (-march=xscale isn't recognized), or perhaps you mean -march=iwmmxt?  Either way, if this is an assembly file, then you can just add the appropriate '.arch' (and/or .cpu) directives to the source file and then the command line options can be dropped.

> 
>>> === big-endian ARMv7 (BE8) kernel ===
>>>
>>> This is very different from BE32 mode in making more sense
>>> from a kernel point of view. In theory any ARMv7 hardware
>>> should work, though a lot of drivers are buggy. I am not
>>> aware of any actual use cases, though in theory it can be
>>> helpful for testing big-endian userspace when one has
>>> access to Arm hardware but no other big-endian machine.
>>>
>>> We should probably keep this a few more years in both
>>> toolchain and kernel, unless it starts causing actual
>>> problems. I don't think anyone is testing it any more
>>> though.
>>>
>>> Side-note: netbsd has a armv7+be8 variant, so clang will
>>> likely keep supporting be8 even if gcc ends up dropping it
>>> in the future.
> 
> Do you have any comments on BE8 support? I would imagine
> that having two (mostly) unused big-endian targets in
> the compiler still complicates things a bit.

The compiler/assembler largely treat BE8 and BE32 the same; the linker then byte-swaps the BE8 instructions during linking to generate BE8 images (this is mostly why we need mapping symbols).  That won't really change if we drop BE32 support.  So I don't think we gain much from this.

> 
>>> I would propose to leave the feature in the kernel but
>>> make it harder to enable by accident, changing the default
>>> for all targets to EABI and adding a dependency on
>>> 'CPU_32v4 || EXPERT'.
>>>
>>> For the compiler, I think removing support for -mabi=apcs
>>> makes sense, unless there are non-Linux targets that still
>>> use this.
>>
>> Gas 2.43 (finally) drops support for the FPA and Maverick. gas 2.44 
>> may well drop support for OABI binaries (arm-none-elf, as opposed to 
>> arm-none-eabi).  Support for these is probably buggy now and it is 
>> certainly making maintenance more difficult.
> 
> Ok. I can certainly confirm that we regularly run into
> build problems with -mabi=apcs in the kernel, usually
> because of the incompatible structure alignment rules.
> If binutils are dropping support, that also means we will
> eventually stop supporting it in the kernel.

This is primarily about the arm-elf (as opposed to arm-eabi) object file format, -mabi=apcs doesn't change that.  There are some options in gcc relating to the old APCS that I'd really like to get rid of (in particular -mapcs-frame (aka -mapcs)), but that's a separate issue.

> 
>>> === NWFPE ===
>>>
>>> Russell had a patch set to remove this 11 years ago,
>>> but ended up keeping it. This is fundamentally tied
>>> to OABI userland, so we'll likely need to keep it for
>>> as long as either OABI or OABI_COMPAT remains.
>>
>> See above re FPA removal from GAS.  GCC removed FPA support in 2012!
> 
> Right, for us this is clearly only done for legacy user
> binaries. It is still possible to run an OABI Debian-5.0
> or older rootfs with a new kernel, but there are not a lot
> of reasons to do so, other than ARMv4 (StrongARM)
> hardware. The only times I ever tried using it were
> to test kernel changes that impact OABI syscall handling.
> 

That's what I'd expect by this point.  The main difficulty would come in reconstructing test-cases for this (if you have any), since the tools will no-longer be able to do that.

R.

