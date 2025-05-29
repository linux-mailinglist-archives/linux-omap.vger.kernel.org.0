Return-Path: <linux-omap+bounces-3744-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72482AC7B9A
	for <lists+linux-omap@lfdr.de>; Thu, 29 May 2025 12:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C8071BC77D8
	for <lists+linux-omap@lfdr.de>; Thu, 29 May 2025 10:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345BF28D8EE;
	Thu, 29 May 2025 10:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YQ8si+tk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kw1Xic62"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A2EA55;
	Thu, 29 May 2025 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748513338; cv=fail; b=MJ843ijk4H34EOFbyFQsLy1v8gCrOPOfFtL2t/KBsBm/uaseY9qZDX7njUkmmjzb0nUOtHu5BUmqhwcS8pahg530t9saseQuhRLK2Q+sw55G4459+HR+BkAVvtBa48bFqynj0iiC0EHJAOEd0vIlttJpFjhwu5Zvi8c5qvuVYIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748513338; c=relaxed/simple;
	bh=tpmFB1zdB0EODpBu4crGvOjD4PzV8jjtAq9NrJNqGHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmdQZf0noeoQB6KQv/STm/nMuzTL12bxUFKkr9FPo4owvE4+1laB7nH35b/l5P/RzhNW2N/+DUUw9uVIxdlUwDXEWtnhlXWh1TrpdzdXHboz22xFMxpak+WUVy2Sx4lIHf2AsoSTZil+AB1RrJ1nYBuvD4S6usunLsAvvdh6uHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YQ8si+tk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kw1Xic62; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T4xMVk023726;
	Thu, 29 May 2025 05:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=l3eCFf0RMXTEPBZbpj
	48JGMP6UinD2Uj8gzAqvP2ThY=; b=YQ8si+tk2bG1aZsBSB508Nbi64/eLaWqsm
	xtF2/WPlVa+Anb8yYTrrGg63dLrKcK/QLWuhX7/MoiYxhdaz6mjU6nmoahU/FWBG
	bu5eXp4zLfh4bXiVmeauu1qAV5V8CwWEI2+NdyRD+KhiVqJ/W9zD+2gztUxq5rKZ
	B8i3/9SiWhON2gyhSmkZVqfNVihnBqKe0jRonITlNVHuufYr9SKKKm/BY97LOrV+
	P1BXlJjLx/rMJKvVXwsqLlizdzp5VbSpjpaqIJDMT0dm8gqgWSw/eAD8EYS0DVXr
	C/CpdyXLzOHPymZIsxiGUGugd/R6itx7s+HJXKWn98Hc6R3Z/yFA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2090.outbound.protection.outlook.com [40.107.94.90])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46x3mssj1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 05:08:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FncFcZLtznpSiPIwidkHOXoGp7V5LV6J4g2w/LktycJknQ9ki1VpX+T/fMBgStJNjSZBgiHoY3XijYcicJ9BrNpVbix8DvYkmQgVi8YoKCdTvX4Db4t+v5Jg3SVJmvqJClN01gqBJ2inso2mknhQ/KZIKrxwPQKqqavsi0SS6admsqvpWv5Veo/RcnHWTripPPg+n9AOa9n0c7yZhIj6Y6Iw9X1YiYpTvorRmM5FS8LBPsmDjp9Jj0oBqEw0qe7WjBjS8DgPX9IyCXRUX6hV5IiPSdlsOYMuHKj2PJg6Z5R2S3/taJQaC4A4GTPzT3yWK/mHmr+KXCyg5tQOR/oBgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3eCFf0RMXTEPBZbpj48JGMP6UinD2Uj8gzAqvP2ThY=;
 b=KO7zpCLxF0nvKWr6mrEuruXPmU8LHB85nkX60HCvp3sT6Wmy/BXLAysU+pFqa6T/+LkIwKtgGBazGiTX/GMg9xIijcCQFpASdh1+t1D5kjTVYOU3DLMNyHwA5TGmVWRyOx2q7G1xBIL4V8oSdKMYb4hzib5nswtsDpRF3DOarCEsiTrol4xamOnumM0+RkX3CuHDM7rJb66KOsEOcIFkA5ZCncbLuwvSq13EIdscuU37u8dEBPCzaTc1sJONZ71hjdiBAQTBlfIhkgE9+hsfo8vwE8SW6Cghx6faJFxTz80XJ8IB5Z/Pl1gnXA9yVT6rCTg6/5wEfVubJh4lJ4nkOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=atomide.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3eCFf0RMXTEPBZbpj48JGMP6UinD2Uj8gzAqvP2ThY=;
 b=kw1Xic62z+UFXAE6EUkc84ps1cqhlQpW4n0RkYB0jWDvW0/athWIE+xCJg+SzOKuoF+zr7B4/ympGcwtbc4kAf0ZUHovBAWImouS1Dpk7bbOepReGv1vEkrIHQpamb460Q44PamLs6agA0MO6Ohqv4ntRqvhFptQSCIlHUMFb2Q=
Received: from MN2PR03CA0015.namprd03.prod.outlook.com (2603:10b6:208:23a::20)
 by MN2PR19MB3838.namprd19.prod.outlook.com (2603:10b6:208:1ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 29 May
 2025 10:08:22 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:208:23a:cafe::3b) by MN2PR03CA0015.outlook.office365.com
 (2603:10b6:208:23a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Thu,
 29 May 2025 10:08:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 29 May 2025 10:08:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 71AC0406545;
	Thu, 29 May 2025 10:08:20 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 5137E820258;
	Thu, 29 May 2025 10:08:20 +0000 (UTC)
Date: Thu, 29 May 2025 11:08:19 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
        Fred Treven <fred.treven@cirrus.com>,
        Ben Bright <ben.bright@cirrus.com>, Lee Jones <lee@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] mfd: Constify reg_sequence and regmap_irq
Message-ID: <aDgyEzasBUfzAPj0@opensource.cirrus.com>
References: <20250528194416.567127-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528194416.567127-2-krzysztof.kozlowski@linaro.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|MN2PR19MB3838:EE_
X-MS-Office365-Filtering-Correlation-Id: d873cd6d-b4d6-4b72-0f6a-08dd9e98bdf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v238qsQ9AQT+ISMl+RpFEFjXf4PRvtAl15urijYGpFbRkuioAqF6AuR8RlTl?=
 =?us-ascii?Q?Z17rVlDkDzZM+Cq5af0UoPLQkEiCYuNlqhLKjwptbphQy1N+RJjZpABOV1BE?=
 =?us-ascii?Q?HXuZdEY9TMVAz3Yi5w2cslb3wnOJxmzvir2RYdCpfExsGStOv/PggRwZWZ9S?=
 =?us-ascii?Q?s28h12FDb4mMrMYlHvpYEikIRdbVA8JgKGISEwPrGHgP5DlR3+2aH12ZazQ6?=
 =?us-ascii?Q?zjU60cITIImXQbYRjfYJtZqnqiqcHW8W+bNoxBeYhutVUtRqMQsgQYvCDw6G?=
 =?us-ascii?Q?T0OwEXJLhU9B2BsnabihJLgAbAvnMRTzEePaRGzVPKzTBZAzZ4jMT2l7c2PM?=
 =?us-ascii?Q?crTV570oHtXAb+Msu65K0izsdoBQJ++CL952qFyCR7Gf/fStsfqwmEktFOXu?=
 =?us-ascii?Q?fiAs5p3AQAWK3C9c3yrZq4QUP6j4jv7APoE1A2GZNEB2ZjjipE6PVy0543g5?=
 =?us-ascii?Q?y4NNvWTD4SPUiCp23yxEZE8vLKApGwpBN+dLw2K4bZyDQeHcWgp+YJKphAGy?=
 =?us-ascii?Q?lPTx9DXxWXH2gGIRF8R7HIP2s9kBjbjJylHWgCinjVc5kJqs0Gu+6dzpvolW?=
 =?us-ascii?Q?U3gqYVhtrW0Fq6URXgxGoY+UmjbRBuM/1tlArotIH9FZD90w6K01KiCr2HzB?=
 =?us-ascii?Q?tjN46/JApZkpozg5J9S8okCS92MzghQfO9Ut2KbvZzB7bRQRrSoE8nvS93ah?=
 =?us-ascii?Q?8u5wp//Ig7v2CI1eeYYEyLOuc4WUb6yiwuoSHTW+aRVBHucixYslojzK506w?=
 =?us-ascii?Q?FQpo/5WwlFbmYKEIQ/nzYSrN25gR6w+VjhgGF4iSJ0xwm60s7dmvY6M0Ap2N?=
 =?us-ascii?Q?5Nw9rkrfpCCatlOGRL/plvtaEQa2f8vGaZK53US2kVHLRRhG4LcRA4YnrKaM?=
 =?us-ascii?Q?HLz2624JuqWeXHxUyxfvlf2nHexxjmkIOwzltSPgwqVcKuwsFihvFDOejtTv?=
 =?us-ascii?Q?DvYk6qaIrI6iSzplkPgcybJFazkItVLxl0tLTe39Gv71Tor9NO0ruXrR6PuV?=
 =?us-ascii?Q?rwos4+GnapOVCmGvwgaPCeJ7GYGiUVm5aTxZcoVuMLUWgsux2saHFSuuKbvc?=
 =?us-ascii?Q?1sPXIQeHG7+3D8SyVTf+8MXuaqALtf3yhmPHSip/ejT6Pz9Dy8ijPtGOFlpC?=
 =?us-ascii?Q?71dqaweenyEbu7gtuH3LmK7riHWktbl+xT7MYyqD3zwduXcXV1lDq8UH+iIA?=
 =?us-ascii?Q?15S24CjRyKpP5xoEXTWaw8e9Uvx+cWHzv3CANjMMWmqdFeIwG9DUKa0dI8RD?=
 =?us-ascii?Q?TuSRvRCHzrN5iWcCdLE7t0BmIIlq5g+z4WrzwNoPSOu+RVk3tfeWH97eodua?=
 =?us-ascii?Q?jCZDGV5yZn7Z/D82wat4gYI+frUeQxuM8dRjR+QHmxKp9UF587Mzux0Vm2bq?=
 =?us-ascii?Q?BMG93kPz30982MClXMVjEzTAKlWRlW66x5GCmIBrCNstk3XJQfcDFwFmLZ8W?=
 =?us-ascii?Q?ccSUgMsNOkxv5TkTi1ERT7oBmHTeSdu7Hzhj3cmPt4wpHYfpABMjpeokMR5b?=
 =?us-ascii?Q?Bs3uUlfHoKmLsHQdy0ODWrO9Hg3N9eVE8PUY?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 10:08:21.3414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d873cd6d-b4d6-4b72-0f6a-08dd9e98bdf4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB3838
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5OCBTYWx0ZWRfX3YBI7LlzTWrJ S0m7EKPlHpiTMctiypXKSWKrdWPaBoEj+j7Um3i8HJe/CiS+KImu1dMgGavI77H4isGLY89IA6j urRx0CPMxIvrPuHl/bLll99fz4z9DAN7r56TACmpCw6ksn0lBS0F9Rlg7cW8BtkWQ4Cdt5RZoZq
 sMOE98LsuN1nTJkLCF674y/RzXEKOnw95UWxOhMVi3+Vdpz7O67lYWHO2LAGaQQcky5v2Pr+ICd LmzMAjd6cWk3BRPXdUTFUaP3o8nWArOc30EyTddYEVML1z5vL+p0UPueyowxZ5U5oI/KDQai22E kyVhvcs+MqkKP5WMLSBhAor61zLerfKKlMt7OxjOFuLKI7v9Suh5SALfZr48FU7JBiiNI5POrgI
 x+VIM0XhR0K9LszDz53AevrmUh3XTAzArJQKP/X31Kk3klTIwkg278qYKV5jIThSICLEvX/4
X-Authority-Analysis: v=2.4 cv=Qohe3Uyd c=1 sm=1 tr=0 ts=6838321a cx=c_pps a=aK0lWSFyTQY9KTcR+53xQQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=fpGMRaiSp_kTxiBFetMA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: urHotAKFeUntqWUwWn876lpriVQ649TG
X-Proofpoint-ORIG-GUID: urHotAKFeUntqWUwWn876lpriVQ649TG
X-Proofpoint-Spam-Reason: safe

On Wed, May 28, 2025 at 09:44:17PM +0200, Krzysztof Kozlowski wrote:
> Static 'struct reg_sequence' array, 'struct regmap_irq_sub_irq_map' and
> 'struct regmap_irq_chip ' are not modified so can be changed to const
> for more safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/mfd/cs40l50-core.c | 2 +-
>
> -static struct regmap_irq_chip cs40l50_irq_chip = {
> +static const struct regmap_irq_chip cs40l50_irq_chip = {
>  	.name =		"cs40l50",
>  	.status_base =	CS40L50_IRQ1_INT_1,
>  	.mask_base =	CS40L50_IRQ1_MASK_1,

For the cs40l50:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

