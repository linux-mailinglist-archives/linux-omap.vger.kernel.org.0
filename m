Return-Path: <linux-omap+bounces-3068-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0B0A08564
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 03:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68A09188A7FF
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 02:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74B41E25F8;
	Fri, 10 Jan 2025 02:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mOFvI38B";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EVTXwZrY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="R8mvLjk0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B65114286;
	Fri, 10 Jan 2025 02:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736476698; cv=fail; b=bk7MPsmNbg4QIbz6cSndszNTjMDtEtzbvV5ttb/1SKpCy5L2XTIx8Q+hed0mt1aYMGXyL1Y4z5D/0fKNRQBnrCOtBBGFiR5GTpmYqAX8ntzKz52EECUhJktncivdEKQwSFyp83zs8RaJWyn29aLhryRRN7TNpLETq/XexGT3vMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736476698; c=relaxed/simple;
	bh=95/KgMLgv+SMdd7R4Dglh6hMY/RM/HL4RW1+QjvxCUg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Irc8DoclF0kVZeVdtJigh6FE0KrEy8t/hLdtKapFA3fRCsAUxxcxcn5ypOGTVjeD/yO0AlcO130ON25u0JGKqR83U7SWBQQ/6EtanlONqcUbnAqW9lmwgPAlXHiKwgb/0mr2+a9z5/h59clTdY+xLos5f04K2A8k9oqVy/TtJJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=mOFvI38B; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EVTXwZrY; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=R8mvLjk0 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509LpfKX003895;
	Thu, 9 Jan 2025 18:38:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=95/KgMLgv+SMdd7R4Dglh6hMY/RM/HL4RW1+QjvxCUg=; b=
	mOFvI38B/8cRV0jaRBgfUKNAQgI+9SiwAz4hWXXsefgRJmihl7MsmkFdf+NcdU3E
	Va0To/FWE8Xtv+bUsFuJLHYaFRmKxoe6NhKWW5Y7kFPCoVQxsxBtuV4lolvCkXWC
	AbLRH4HYuoFohnGtm81pX4mQqSslMUFiHhsBBfu9//5NG8g13qYF5eJvOzyt3Ghg
	8ot89bqW+I0PFb77QC06NNEihFc4BhtUfbpIxyAtvt1eTgRbDawizaE3JU5f996U
	MXGPc7FIFlVX7JiKPNaQKJMKGvAb9czRKaqWNAhuKsduRjJqkfVWOBqX0OAUjDuX
	QZ1IA9yBNXUGtfx3SSHV2A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 442pra11gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 18:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1736476682; bh=95/KgMLgv+SMdd7R4Dglh6hMY/RM/HL4RW1+QjvxCUg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=EVTXwZrYK0EYyEpDATV6ddYgTax71WQLETSismkxT49O/wvyNbdhniJ+t8YdIX4ku
	 4uy3aPzhldyYc8QqPCKbA21c3vJDhY0OQhZekWqopWm8o/L5ABJGmIvPvOT7XrNvyP
	 mwsrYIPO7TzmYJY3JaZ/o5izYg0qwmxre/N2iGOlR8HGSheamoXAntYk3Yr03kpGFK
	 gi/RXaDs6P3eHlHc/RWfBlPrF5MCNq3yowzt3+Sn/QIuMKBZ53fc+uJ4M803HCnf2R
	 odtQDYU5RmkCiZnh9kxzZ9jbo1SAu8HI7gLuJHOFBVJUA0oK/QBj/tDm8X0F2Gl0Dw
	 lftlD9VBxYFdA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7254940126;
	Fri, 10 Jan 2025 02:38:02 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 21678A0072;
	Fri, 10 Jan 2025 02:38:02 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=R8mvLjk0;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 783AB405AD;
	Fri, 10 Jan 2025 02:38:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHWLT5EAd86JD6tiCAtTI62GNHHzvm+G7kGO1p1SqrVCtImItmZYrXYAShHONKH/9b210V+FVSg775gMhZ5tWUxqNlhkvEfEFpJZeerfak233Na8uevFCHxPkTt2ZZQufo7QK3D3pXez0/tVG/Wzpg+MSpay1A740sZCXpqLOrN0uVuAGV4QRWztWfM4goGuHr3rhA3RoypRTJzLqALLlwbxnlYgagbxqDSr1RlTc+f+6Nr19UJ9SgXbNW1pPD8tGZG8LueJK3ytH9qfPwiJaVhUYto+VmihUmzmDEFVCDi8d6fi0K0oDQPtyiFty3DHXRSVfrUTLMD7VV8QXjoC4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95/KgMLgv+SMdd7R4Dglh6hMY/RM/HL4RW1+QjvxCUg=;
 b=LDDVcqYQRofkMene6E5zIgoZws5KPlVJQvlnewoc80/sTFcsIDuAoFBMLVQK/DKZnbDcQJRakDZkBETAzX7/99GTVlB6WIYW6mnHsrFtphXTyGffE3wuJvuQSvDkL3689DEG8TMF6fvDa6gtgixFF3gC/ZI0PYHpZda3XEPY0CmYSu2wsJhAed2hXWV7saZPFCDtYffL3eyF2ed/NV99ni+qK+YCufOiwEtohQNmZ/lt31IMYBF04KHLVuiDoVDWQ+MvAwyQfv5yMBMuDYsydaKg+xbZmQ0C9H8XRjw3gfJmM/xxCdy+07vOtZDrKRs5dcrtJLNzeesDqYxZ2awvwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95/KgMLgv+SMdd7R4Dglh6hMY/RM/HL4RW1+QjvxCUg=;
 b=R8mvLjk005+gw1Wpq4WfR+bSC12iHnD6uykQhHsO6j+xvN2K//Bxtxsb28DHmFbHFc7fzpRkxPJeuVAY1hLwISXHBPUFXJylO/eDy9xeBjRVp/IBLr9rrHVhawUxssCmg4VRnFWn+t017uqJHkjPJDzFdpblsjH9EWUJ/r0jxpg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB5783.namprd12.prod.outlook.com (2603:10b6:510:1d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 02:37:58 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 02:37:58 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: omap: Fix devm_regulator_get_optional() error
 handling
Thread-Topic: [PATCH] usb: dwc3: omap: Fix devm_regulator_get_optional() error
 handling
Thread-Index: AQHbYrkLHT7XsGQoJke3PmsmSvBJfLMPS90A
Date: Fri, 10 Jan 2025 02:37:58 +0000
Message-ID: <20250110023756.shkrjhvoka5h2td3@synopsys.com>
References: <20250109170748.3852439-1-robh@kernel.org>
In-Reply-To: <20250109170748.3852439-1-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB5783:EE_
x-ms-office365-filtering-correlation-id: 4de2b0b9-e251-440e-479d-08dd311fcba7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UUxTc2lMeFRZc2RnZUgyR2dTUVU4RDloTEpkbjlDaUN5RDR2NStxMXhoRTB6?=
 =?utf-8?B?N0VOVG5QQWx4R3RSYkh0L0VFT01jM0xGV2JxWmg5V0taZkhOcS9CQTlHNkVk?=
 =?utf-8?B?S0hNMEt2V2F0R3Uza1o2SnVmNUJVY3dwNHdwczFLb1JONTVzQWM4S1hsTWIx?=
 =?utf-8?B?anhad09kNzNZOWVUcW5Wa0RUclRBbU5kczNoakZyWElDMmFzQ3QrbENibHVa?=
 =?utf-8?B?b2NDeVFKT1BDV0pCWUk2S0duWU90QWJJR2RlOFlDazBFTlFBN2UrQXZjOXpt?=
 =?utf-8?B?djhHZEZqT3NGQnZ3WjJRdXN6MXdma01xVjdDT2NnNW4zMzNpdFZCRURDQXZ0?=
 =?utf-8?B?T1RsdGdGbXlrRUdNN0ZFTnVucG01MVBIbzJqUVNNZnMrV205V29sbVNDS1d5?=
 =?utf-8?B?MFQ3SDhJR2t1WTRMR1dXeUsrZHJnZVQ3MTEzejczK0htNEVtMXhBczIxdjdJ?=
 =?utf-8?B?dWFWVHdsYzVDa2RaZTh1cjZKUnJQelpuVXhwa2dIVzNWbWx1S0VyQWhEU3pT?=
 =?utf-8?B?RUVIR1dtdE84S3MwVmI5SGhpUFJwUlRNZ29nMFU3SlZSemFtUW0xUGVRME9h?=
 =?utf-8?B?NGM2eWZnQzJheHNORDFucEgvWjNhQ1lYY2V6MzFiRS8zZTc5SEE0dlJ0VmpG?=
 =?utf-8?B?Z0YweU5pUzc5WXY5dFBXTTgwVFU3d3ZzSFRpQXBNckhOWVF2QWVjRjFOR3dq?=
 =?utf-8?B?K3BJc3RXTXN6aUY2RExuSGpLa1pab1VIMCtLMis4NmR3NjduSEJZZjMzK1Bz?=
 =?utf-8?B?ckw1K3U0WFQ3S3UyWksvNlZrQTU1MFBlVFZmY2g0S1lsWXh6SHczQnhycTFr?=
 =?utf-8?B?YlQ0ckVjVE93RDM5dUR1Wjk2b3VEMTFVSGgxSlVpUExvSHR5MWVDSDREUjdQ?=
 =?utf-8?B?b0w2NlF0UTdXMTJEQjBFYkw0a2VoOXNHTHhhbE8wZGNDNElDUldQQmk0S0p5?=
 =?utf-8?B?bS9yMmwxeldQbzdlNVIzZUJTeG5OdWJaWWRGQ01CaEdsT0x5RmhUVmxVYVZC?=
 =?utf-8?B?WVdTS2dKYlF0TzlKcWpUa05vL25BSy9nc0dOUkJoaEI0VnRkdUhRTTRyd0JJ?=
 =?utf-8?B?TTZMQUlBbDVhUG1LMFRKblhJOUtxQWRBWjBEZDgzZXY0QkV5N0tZWWw2T3Nr?=
 =?utf-8?B?M3BxRDFENUJNeExyNTJDZGxaLzNLS3orQThibmFpTEl6cEREWFlzWG52NGV0?=
 =?utf-8?B?bFQ1UDVXL05KR3NmMExMeTZuQzRWMXU2L1MrZE9NM2tuODJaeHNiTzlmb3Z3?=
 =?utf-8?B?RmdoL3p5aXJzR3pBZzRYTzBiR2hCajlyZC9QeHVxdFYxVkhBek52ejhHRW5D?=
 =?utf-8?B?YUVjTXhzODdKM3o2amF3Q3YrcFpIU0NBY2ducWVXd1QrT3lGbEpGN0FXUUJH?=
 =?utf-8?B?bFpxR0hUQ1lvQlZ1VTArMXgydHE5NGdJa2dWdG9QU0I0WjM0U3dvNjNjNHR0?=
 =?utf-8?B?a01uRjRNU2QxamF0YXZzbWNsQVppelowb2Z1Wk5mVDREUEFEVUI4ZFdOdjJw?=
 =?utf-8?B?bmd4K2NGa1E3TDljSUtQSjZDTC9KQUFsK1pLQnFjY01aTFRXc2grSkNJMkFx?=
 =?utf-8?B?aXUzcktsMVlKRVZsWFowLy9vZVpCSTZRSDM3TXY0UEVMU2VGTjlBOTNpQkZO?=
 =?utf-8?B?MnV1eEZBcFZpRzdLV3czWE9yeSszRTR5SnMxZk9xQnkvdU5tSlVjS0FDYm04?=
 =?utf-8?B?cktDdnN0UE0way9sVG12NWNneTE4MElTMUhGaXc0d21wYnprNG1wVDZPb2pO?=
 =?utf-8?B?V200YTVUZmhPSWRMcDk0dzNtSnBjMkVnTW0xaHNKTFQ0Ump4dVpIYno4WXV6?=
 =?utf-8?B?aXBuRGM2TkdyM015VzlwUEVhZW1JcGJMMHFFa0t4MTdEbThDOWFtRlBBM0g4?=
 =?utf-8?B?MUNuQWVsSGhITllvUzA3Zm9JVEZmVURWK05LZzN1RkI0MWRuYUtNSE1Wa2ZR?=
 =?utf-8?Q?+mnue0uMcccD1vzoAlCAFHX1Oq1qu+1U?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TDhYWnJ6SDZ0YldnTGg5ZkZJWnloUjFhUUIwUGlETnlWSW43K3o5Rk5iRWJu?=
 =?utf-8?B?SG5IWXpLZU0wTmNIUUFVOFc4djJoSnFWVkJlR0kvS0I5Qm9rcUMybTU5Y1dk?=
 =?utf-8?B?aHozbHN6OE5hc3lFenVLZitFd3h1UjYwV05yOS9EOXhiaS9HVDZHcDA5NkxL?=
 =?utf-8?B?R0g5aWlaQUx5UWxpWnhjZEVhblpoSmRxbzZhU2dJbGMrYlJpdWZyemRXaXN5?=
 =?utf-8?B?ZWxDWFNWdUY1YVJjQW5hQ0I1OG1uNzV4TitGc0NXdmw0TnpBaWQyc1BGUzJI?=
 =?utf-8?B?THBFUEIvRGhBSlVMZVVpQXREMmVNMkpXNVVTbUtkMkFVSVhCSlRVdnFwYnky?=
 =?utf-8?B?Vm91MElkL2s1RHFpWlVuMDUxaFdtQ2Ewd1JIckxUUVRwMW9MQm9UL1Y0eEY3?=
 =?utf-8?B?ejluWGI1T1VQUHBhZ3pYMjhlZjBMeDRac3RicXRFaVlQSkV0OXVtaGhZckxh?=
 =?utf-8?B?SU5GN284UXpMOFNxNC9vRXE2amFKY1RnQ0dIN2pya0JDWVhhNUI2QWE2N1pO?=
 =?utf-8?B?R0h3SlIyQkcyUkZDRVE0eXNPZXJtNkhvY1E4WFhZVFgxM1B2aVVtWlNiSjJS?=
 =?utf-8?B?bU1PZlJ2dFN6WXU0RGc5cmZQUUFrayt4Y212NllIVHhnQ0hkbEcrNXZkU0Jq?=
 =?utf-8?B?MUE4U2UwZWEzdjV6VW0xWUYwTGFhRkVPUGNJWXJVTFFnSVpkS0k3R2lrb1E2?=
 =?utf-8?B?NFBwb3FFU1MyekV0VFM3SDd5eHFVbXJ6MEw2VGQzUUFEKzhLQnZCdks4T0xO?=
 =?utf-8?B?a3NUMVJzQVF3WGEzaEUrdExRQzZ1SlhaeHdoVXlVeXArQUtpcEk2Y294eVRW?=
 =?utf-8?B?dE9Oai91MEppMmNCTnp3WVZIdkF0UGVqdWdxQ3krREVrUndhUS95U3JRNlNs?=
 =?utf-8?B?MkF1VGtOSWwxZldGS2ZMWHEvUkN6UTZIQXg1QUtVNjRKVGtJQThaWHExYmE5?=
 =?utf-8?B?QkU4MFJUQW90WTZsazVFRldwWGNiQ3loRzNmMGJWR3cwbUt0R2RnNlEzT25s?=
 =?utf-8?B?a1VTWlFyWktnVU5ldndWUldoNVdMZXdoakdpZnhXWVlXR0FhOVB5c0RGUTNo?=
 =?utf-8?B?TlgyUW5jeUdrN3BMck54ZlI4K2NTZGpjaGFwNVNoN0VWejFpNW5TaFBRSW4r?=
 =?utf-8?B?Ymo2QzhBaEVwSVQvRjdpemhoV09wbmdpYWtFd04rL09Xa2xYVWlkUWZyWVRO?=
 =?utf-8?B?UU9QSkozbDZ6dkpzTHFreFN1bWorR0J3elo0NjluQllGbGZMSG5tbkxidy9J?=
 =?utf-8?B?VXJ6N3Rydi9OZmtnZ1pjZjNGNkR2VXpnaEZxeVc5ZzhMaDlvSWVWaklJa2Zm?=
 =?utf-8?B?eWhqYUVUb0RLUFRGUno0Yk5UL0hLRXFCa2pVK2x5QkxxMVFubDJaMDNrenZM?=
 =?utf-8?B?MjZRMGJuM0NJZFFiZy8xdTU1SHlFK0NNQ1oxWHk4SzBnWUNHM1VFZUVrSndl?=
 =?utf-8?B?MldYMjJTWXc1bU5wSVIwQjJ2MEZpSGZOdTc2N3NRSlUyYy9PZWkvWjJGdFpj?=
 =?utf-8?B?WFU0WmxlcW4rcjBTbEFFMXZtc0FnK2p3MVoyNzlOa2NLV1ExQzMwMEwvaTcv?=
 =?utf-8?B?NVc1Q0hydVVFOWgwSmdtYTVCUnliVmlRUkd1NVY4MC9oaHFER25CY1VtVmxE?=
 =?utf-8?B?enh5cXlpNnNGMDYyWlBsa2RNcGdDZGIyQ0tHTlF0MmRaZi9OdnVyTGt1bnc4?=
 =?utf-8?B?dVc5NndHK3NVdFoySDVRdVAvL2FwMTRDWXNxVzBHaWg4RmRNZUJsTjJTbGZq?=
 =?utf-8?B?ckxMUmFOVXkrZzZqR1NYK0RSaW5HN09HUFduNy81OVFjUTB2czdDQlJmbTV3?=
 =?utf-8?B?cjNFVDNZVFpjUUZjUkVkbTNYVmp6eVlwbkNVcFFTa2JsRC92NFVjT0pLQVoz?=
 =?utf-8?B?WWtHbzA4ZDZuNmVESWxrYTBaREt5Qy8zU2NybHdhWHZEUUpaUEpiTE1nUUF0?=
 =?utf-8?B?NDIzbEpreU1paWFWeXJweHRTRHVmUEhjdWJvKzlpajJhcEV0ODRhZjdQRUNO?=
 =?utf-8?B?V3IyU2ZPZkNuVS9GWDl5T0dXSHkveDBNWHkvM1ZZN1duUzBCTThORjVBS3Nw?=
 =?utf-8?B?VUJYVHRoTTI5bEFvcitFTTdZQjFZdkQ4bjkwQThzVlFxMEw4bFlISHJ6MUhK?=
 =?utf-8?Q?rVlbGIRULbYfyoXEv0x+nyNn3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <343AB02D0940BB4C834546F5E8DEAC26@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	haXAydixR3qziceUsVTukU52OEx44+Qh8FeqUgdlPMXazCfUeSj3/UATHhx9kofwVqcBL+qIyaY9jWjuCzYoMKVsgXFkZI6cuyrTMSCphMTdUAOvcI1JO0cP//Kl6qLXiLfwXgIA0G3efnsYxM+S/Vum8jDIrVKnWbsavKP2X3UMQf2NkpgwT9fGzl3IJZZubtoSDKNWfKc9rxrJVWBIEKGTWgSSzX8H0dnerdn5fGnMELf2EkLJmJvpiIsfAi6idMYF9vEAZYIhU5AOpJ/k4O3OqVqAZC9Csktxrrjde8k9r1L9cOP2mR9deqRGVJZU8kSrOmcVMBRJ0cIBfMZxwuXgHQaGiEk2LNNmDxiq2XPCfTvYXW0H7WVxWrpZjpWThhAHwF47+CHRwVuTjcp/b9OS6ItqwBhYAA9a4A3o/HY0A5fZa2RgkKWIXC0KhfE7sgs1+FBh6cPITlCaZqdvh9/06xjDlJ1WFYCiTDmKzakpA/rxwLVIBqVsqJz1XJMFPgipMw30ah9dw3TUYZ10uPI4YFyvbKGzvz+6s9fJa6ek4a5aUrDO9viHl8iuYTjfmFRveMECDNwmv3xrezAw1RWkIYhnS+lpNYakXaTSbddx9ukQtyvjBVmmAioGrECk6+E/ceO2i0WtQWNaMeanXA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de2b0b9-e251-440e-479d-08dd311fcba7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 02:37:58.6474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J+Z5JpCh7/qv/3ML5eQH64dn9xWp9cWOOSPTE/h2g47kd7lMsfI2+3+Fr0w2yEctBZI0hD6A0jE1rZE022nSSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5783
X-Authority-Analysis: v=2.4 cv=fbFXy1QF c=1 sm=1 tr=0 ts=6780880b cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8 a=Sw2nIUGqNhJahELqx2oA:9 a=QEXdDO2ut3YA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: pSOUEOeNOYPHhNFukgt9CAO3nuToDGtb
X-Proofpoint-GUID: pSOUEOeNOYPHhNFukgt9CAO3nuToDGtb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501100019

T24gVGh1LCBKYW4gMDksIDIwMjUsIFJvYiBIZXJyaW5nIChBcm0pIHdyb3RlOg0KPiBDb21taXQg
NTMzNTYxYThhYWQ1ICgidXNiOiBkd2MzOiBvbWFwOiBVc2UNCj4gZGV2bV9yZWd1bGF0b3JfZ2V0
X29wdGlvbmFsKCkiKSBhc3N1bWVkIE5VTEwgd2FzIHJldHVybmVkLCBidXQNCj4gZGV2bV9yZWd1
bGF0b3JfZ2V0X29wdGlvbmFsKCkgcmV0dXJucyAtRU5PREVWIHJhdGhlciB0aGFuIE5VTEwgbGlr
ZQ0KPiBvdGhlciAqX2dldF9vcHRpb25hbCgpIGZ1bmN0aW9ucy4NCj4gDQo+IEZpeGVzOiA1MzM1
NjFhOGFhZDUgKCJ1c2I6IGR3YzM6IG9tYXA6IFVzZSBkZXZtX3JlZ3VsYXRvcl9nZXRfb3B0aW9u
YWwoKSIpDQo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5v
cmc+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLW9tYXAuYyB8IDcgKysrKystLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb21hcC5jIGIvZHJpdmVycy91c2Iv
ZHdjMy9kd2MzLW9tYXAuYw0KPiBpbmRleCA5YjFkMTBhYzMzYzEuLmZlNzRkMTFiYjYyOSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLW9tYXAuYw0KPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtb21hcC5jDQo+IEBAIC00ODQsOCArNDg0LDExIEBAIHN0YXRpYyBpbnQg
ZHdjM19vbWFwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJCXJldHVy
biBQVFJfRVJSKGJhc2UpOw0KPiAgDQo+ICAJdmJ1c19yZWcgPSBkZXZtX3JlZ3VsYXRvcl9nZXRf
b3B0aW9uYWwoZGV2LCAidmJ1cyIpOw0KPiAtCWlmIChJU19FUlIodmJ1c19yZWcpKQ0KPiAtCQly
ZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIodmJ1c19yZWcpLCAidmJ1cyBpbml0IGZh
aWxlZFxuIik7DQo+ICsJaWYgKElTX0VSUih2YnVzX3JlZykpIHsNCj4gKwkJaWYgKFBUUl9FUlIo
dmJ1c19yZWcpICE9IC1FTk9ERVYpDQo+ICsJCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBU
Ul9FUlIodmJ1c19yZWcpLCAidmJ1cyBpbml0IGZhaWxlZFxuIik7DQo+ICsJCXZidXNfcmVnID0g
TlVMTDsNCj4gKwl9DQo+ICANCj4gIAlvbWFwLT5kZXYJPSBkZXY7DQo+ICAJb21hcC0+aXJxCT0g
aXJxOw0KPiAtLSANCj4gMi40NS4yDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGlu
aC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==

