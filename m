Return-Path: <linux-omap+bounces-2580-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9D19BC1B2
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2024 00:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7237E1F213BC
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2024 23:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6DE1FE0F0;
	Mon,  4 Nov 2024 23:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CisLYoJc";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Y2zP5gTh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EzClJCSA"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106D418C015;
	Mon,  4 Nov 2024 23:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730764472; cv=fail; b=phkxPYWSuS1gtY2HBnV2dxdGAKNkOurctTuh8ZZeqze4x8qwYYFzYACOg8gi7llSHDU5j67JWaZyJft8MiiOpVXmqbN2MtNXwTazMclO+CJ9x9aOu282n0GmZtFxZcN25g9gsStZazGOK7jN/5JzfsTwh3yTs/g30l90/W4k6Ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730764472; c=relaxed/simple;
	bh=mOjNnv1VUYfJ6YJXj5XMJNWayziKYYvi9KOqSfIInzU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Pe/OPKlxA5p6H+HM8H/DNCct0GOrF1hPhBU+uaPLAVPXEzdymLAK0rrH9t+qYEeyEIbBAqBVB0Coco64/U6l/fOxwaE2LBq4H6s1pGu1uec2J+cD22fBCkisLetMkbqvhqxoKYNtg6aD2+Cpv4q8B+W4KK94GFiwul4p/oqIueI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=CisLYoJc; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Y2zP5gTh; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EzClJCSA reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4HVZoq007284;
	Mon, 4 Nov 2024 15:54:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=mOjNnv1VUYfJ6YJXj5XMJNWayziKYYvi9KOqSfIInzU=; b=
	CisLYoJcu41Oigyxz7gbbHnHxK3/sUNrimCR8FBNZt6XkHL8RYLUVf09FxwqtJtc
	fBnvXWLY32YD+p7H4I8nlslGmA2aP5dazbfBJPBpKjjuNLvNDb64965AT7pBoGuP
	zzzI10EHY/Bj1LTHN6a1khRSjSo2Krh2gsa5X4YyftutQ7br4fhmxwEXQ7bhJpec
	tWA+wjMvuj/cwI5P3VmEqw9/Wa8GPFMWtbaVbIyoy8b3MlURMCSmTE2o/GZeT7r5
	jGgxuvckLDDsqBo2aZuYazxyaTb4oemUciA4PDLgJxhGEXlH+DRW8QAJMwQNJ5Ud
	2NvWU7lBlM2kOouze/wa3g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 42njqetn7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 15:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1730764453; bh=mOjNnv1VUYfJ6YJXj5XMJNWayziKYYvi9KOqSfIInzU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Y2zP5gThKfo+EP2t5uFN1Gs+Que36XKOJbUdERNOSd6Lr3m6aXELjKw9dcuwdXCv5
	 EiV7M5HRvBTO06rOXuqOBF7mnOgi7ThHLG1BcfD7A95EsL07wfqSqZrZl0GXE/ftw3
	 bauCI/fvlHY63OGp2Ppg07+i8Z01UK2mGYG26qUL2WORxlwevXRlZs+mZpvyJhFsPS
	 oOVI37KnBK2BUwc8/BJ92CGOauWLHsHZ9i5INd+jOS9bZkHEUkJUiAqOyrC/Qzd3Km
	 jiSa5UO+GYBZE/CqsBHJBZLnJCqDlwLB69OPKg7mUVQ7nV3qT+zBzZoLe52iLWoLue
	 BQkTfJDLXH3/w==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 58ADD4012B;
	Mon,  4 Nov 2024 23:54:12 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 0C067A0092;
	Mon,  4 Nov 2024 23:54:12 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=EzClJCSA;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E9A7B40110;
	Mon,  4 Nov 2024 23:54:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liy9qu2paV8tHahKUoErk0d4vbz7t6xSeULvOOpkq73MnfaBlkqhHODDHg5+eBU7NhKInCaDCNqFFcdMIV0v4gJzncSx7EQkCAlhOnok6S+0NBxQZa1w47xu1iwqWFLHks1JIwvan3yZRgQAbVqcsLeUy+hdnttLmn30kG2IoS2NGDGQvFvSJxz8DUbIXwOTZjlwAuEnydPVA3BTXV0Oo6foCL4HSx9FNF34QEhZpW7NQmnoJJolTTozAK4atE7lHpgJJamDm6zUOALULtZ/dvJbq20PicsMAWJGmEpg/Qmn0R1xAGm6trN1lf/YqlC9snpOfamR1FyFh3vK/blfWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOjNnv1VUYfJ6YJXj5XMJNWayziKYYvi9KOqSfIInzU=;
 b=m7V20HPcSUcJ5FlVwBPTjwb8aMHrRugXJnwF+CXmXKozVkNSvvVV/LFqgGLpOmqx5n8sdP/9VJ5BeUi+Te4VJ7ws3MsKYe0P9o2/03o8yyWs+nGvKltudf/kRsar4z2iLU5ubVJfqtYhzNMN6IPiMq+YTj63bfE24AyCoPnNLg0QrS/y6AlfE3J2gsGNCUrxDPUnzYWtA/IHpZ41IZGlGyQcgNwGqOc1XI4VwOdQneVDtxGK25nhO69jTTsbHhnl9WAjN24PuHxOXa2duGPIP7X2gP74kZGReDiXpIKNXlMLwQQlGXnorx7GXQBpV3Y3kQvjn2IgMXXbY9WCqNVNCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOjNnv1VUYfJ6YJXj5XMJNWayziKYYvi9KOqSfIInzU=;
 b=EzClJCSAdNuDjpDKvttJhEnwTxa6vWkeCeM1Sn1KBmejE8kbNJI4CAn5XVnrDfWNISMpo8ATr0owDLKM8jIYjBuemIbSVAKXuDlHNdptzmLNNyrS/QOk6R4fdAGk/ga3HqIvAHDbBpoXPgc2rvPirhM26biCQDCTMShpOq6ZLXs=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB8709.namprd12.prod.outlook.com (2603:10b6:610:17c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Mon, 4 Nov
 2024 23:54:06 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 23:54:04 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] usb: Use (of|device)_property_present() for non-boolean
 properties
Thread-Topic: [PATCH] usb: Use (of|device)_property_present() for non-boolean
 properties
Thread-Index: AQHbLuz1G3IsNyw6Q0y89s78a5g6pbKny7mA
Date: Mon, 4 Nov 2024 23:54:04 +0000
Message-ID: <20241104235347.sybl6gvcxmcwse3m@synopsys.com>
References: <20241104190820.277702-1-robh@kernel.org>
In-Reply-To: <20241104190820.277702-1-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB8709:EE_
x-ms-office365-filtering-correlation-id: 8c0f64f9-b803-48e5-6002-08dcfd2bf6e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N2VyWFo2MXJaOHRXY1FjbHc1eTMvdW1GcVgvZldyS0JFVnQybFdmTzROOUpj?=
 =?utf-8?B?aUlmREpOSStEbWFTVWVPajBVdnppU3V2dnFtU2ZzbytuZDZmdFFHaXJyanBx?=
 =?utf-8?B?NG15WnU1N25xUWVpYkxneGRxNDdLRUFmem9WL3ptYi9KNkN0Z2l5eGs1cWoz?=
 =?utf-8?B?MWRnMVNiMzAvUjdUWm1wd0pJYzNFUmFYUEd1Nk40Wk5UNHlDV0Q2MTY0ZFAv?=
 =?utf-8?B?WTFQL0RJakpCa3lXcCtlZksrTDVNMG5SV3lqWXVCcE8xREZRcHEvK3ZXTE11?=
 =?utf-8?B?MElCL0JXOHpQdE1ZZ1lsWjFubUpwbGN0eTdJR0YvRnQrZXZqQktnVmRVcDVH?=
 =?utf-8?B?cmxqSnZwZFRBMkVMbHV5TFBOcEczZHpJM2I1eWZVaWhFYmtMcTBSTmV6b0ow?=
 =?utf-8?B?aEhoV2xEclZHeFcrYTlUbkJUUzJMSjcrUWpDL25xTjY3ajBvbmljT1Y2T20w?=
 =?utf-8?B?bE93WXM2VEo5TndUdlhzTk5Ob3VWTG1iYUxabTJlbXh2U2hQcXZUbXZJUUxH?=
 =?utf-8?B?aksyR3k4YnI5V3E0WlBpQXZFNGcrdjNnc0R0OWFyNVdMdW80QStsaXBtbGcr?=
 =?utf-8?B?dzZhRTRUYXZjbWttUStwbGJYdHJvYjFXVjR0Um9RQmJtLzF6R1RndUtNMlhX?=
 =?utf-8?B?QjY4OUc2QWpkbDQzcmJRUmVSSXErWFl3L2RWRzFCMm5UUmdFMjNaYWtoSzlO?=
 =?utf-8?B?Z2xFMXNEYjUzOUNUK2k5WmN5cnIrQXpybkVrTjIwNCtHUDE4Qlh0R3JpbGRN?=
 =?utf-8?B?Q0ZydzVaOVU5MG9ESG93eGtxSEVONzBRcE1jMGswT1grZy9HQWYrZEtvdWV1?=
 =?utf-8?B?bGV0UGwwRWlKUUtsL0lCanN0MlZDS3hibjh3QVhIYllVaU8xSng3SXVXcUpt?=
 =?utf-8?B?WDNmb1F1c3dHTE1ucjJhMFVBUkRENGZTV3dUdVdrRGJxSnUxUzhSVE50WFhT?=
 =?utf-8?B?T0NVREdsUnF0RjUwWWpVZzhSYUdiMU1YWEE2a3NmYWxmWExmbjR0SE5nZU9I?=
 =?utf-8?B?MXIwenBacmlsRUJXcnpkb2hqd0JCTjAvZGFWbmRZVnhNNGR6eVZpVzdQcVla?=
 =?utf-8?B?ZWVrcVp4YU94SDhzdWt1YUJlNW5WNmVnUWprWmwwNmVHRjN1WWtpL0t5VHF2?=
 =?utf-8?B?SlQ0NSt6VmgzbDFNeDdPYU9ndVVPV0hzZE16ZDN3TGsyMy9zVnl0dnN6dlFK?=
 =?utf-8?B?NWhHeXFtZWdRYzZIcUdPTE10cU5RaitoNTFsVk5QWUpRSnQ4cEp0T21OWCtv?=
 =?utf-8?B?MWxLZ0Z5NjRzOEtuVFROVlVueEFZbksza3RaRHNta2M1Ym9jNWdGMEVBRjNR?=
 =?utf-8?B?dUNIOEIxQ1NpTklyUVBNWEJOVlF3UkFLQlA4c3AzY2NQQVhPS3pjVnNlZzFC?=
 =?utf-8?B?QVNTb0NzbTY1eWxMQ1V3MWVyWXNBTEV0OWx2VWpTU2tGSGMvanFIY2NGUUo2?=
 =?utf-8?B?L2cwVnpqNTJySUQ5L3hwTlBGLzZma2QwQ2pNVU1iNFh3ZWpxeGdZNnh0VjdJ?=
 =?utf-8?B?dnRpaDREaWEyZjc1VThFQ3A2Zi9zaStyY1NwWlNHbDE3bURvS0pKbldkclVl?=
 =?utf-8?B?QzlqR28vZnAxVVl0WWNPem9zZ3gwT1RPdVRSZXBsU1U1ay9jS1llQmF6WHBI?=
 =?utf-8?B?eVFNVGliY2ZMVHZlZyt0N0Y0TWRHMWExR3lhWmp2eGlYRGNFOUt6eC9rV3Zh?=
 =?utf-8?B?YnhaZnJCUGgvdG1JWTJXWm1oeEhzUXl4ZGQwSG1QSDIyR0hwVHNSbTFCNTJa?=
 =?utf-8?B?T0dEaFVLVktrcnp2OWRRS3BFdzRZNzNPSDZVTXNxblhPdkpTTUg4aTlwU2M5?=
 =?utf-8?Q?Z6xrk/S6FMEOZJS7RKS0xWKfWEhMEebXj3Zrg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QjhiTm04RTZOR2pJUjdPWEh0aGJqNkVlaUVSVmNvOG4zREhFSWxuZDcyZ2kr?=
 =?utf-8?B?Mm5FY2hhaDRMcldKZVd2Q2hObnA0eVI4Z3V3VmdtN1hlaWpLUCtKOVV1d3B5?=
 =?utf-8?B?eFdjdG9ib0c0WlpRTWNISVo4RWZJNGIzN3RFM0laZktETnlRVllDdTAzbHBo?=
 =?utf-8?B?MldIM0NYSG5VL2FoV3JzNzlBYStmQUM2Y21FMUgzNFg2UjRLVUZrSkVPdUh6?=
 =?utf-8?B?T0wxYTFYcEhPQ3p6b2w2SXovUmppaU0rcnhEd28xbmtKRUxXZ3JHWjF2dEVu?=
 =?utf-8?B?a3hlZE5JL1pZWThFQnJQcG9yNExlTzNIdGpabU1wNEwwTDQ0WDZFa2J0YkJv?=
 =?utf-8?B?V3pxL0x3RFFCZDFJdmRKM1IyaWI4NlJUczhMUEFGMlNXNEJkZ2Y1NkJKMXNh?=
 =?utf-8?B?WmZMbm5KUnpVV3BseGRLcmF5MzVpMkZ3c2pCTE9YTVR2L3lBOHA5Qld2MTZH?=
 =?utf-8?B?clpJcGZHQjY2d0dESlh2V2tQbjA0RTd2Ylh6K0Z0ZlJzUWlldGFMV1ZlbTBx?=
 =?utf-8?B?YlloZ0xVVWJ2bDl1aFNmeGRIR0xqQWFBYmU2RWZiY0dKWTZXWmlEcEFkUm5X?=
 =?utf-8?B?Q29KWGRzNHFESkpWWnAya1Q1L0h5WTRFVlJOTm9OZ2FscVRxZFpEME14ODFi?=
 =?utf-8?B?Q3VTNFJybVZtNmo1ZEx0R0lyMDl1amN0bDZzU0l3TlR0K3cwNS96ZDJRWUll?=
 =?utf-8?B?cEhWWnpPZHFMVFZJcVVXYzlONzJNTncwUEJOQVVoQnQ0OVRGZk1LL2QwaGxr?=
 =?utf-8?B?Ulg2a0VXYzhtd01rWlplblFzMFZwY1huRTB1OE90SE5USFNGWVlpbWRBNUZ5?=
 =?utf-8?B?dkM3ekdHYTRFZEZrTElPSXd1QmcydUJ0SkJoM042RXhwM3ZlM3U3VllzZUNl?=
 =?utf-8?B?QjNxaFFOU1lhUHN1ODE3TUwzYUoyazdteVo2QlVtLzdDRUdmNk9rMkpHK2Jj?=
 =?utf-8?B?WmFZbjc4NVVoTlJlTG9sRGIrQ292NG9zQWl1aW1ob0thK1A4ZjRkdy91NzZX?=
 =?utf-8?B?eWsxbEM1aWhJY0s2ZUxUK1RLazh4VWVYamZYdmZxQWxOZkhCWSswdFhCRmRz?=
 =?utf-8?B?V0lWcjNXUGI3WUlPZDEwS3BTM1AvYVkvNXJxbUhTUEFnRXdlZE1FVlVsUDl2?=
 =?utf-8?B?eElRK1QxWmRobjVaYjl1OUZpeHNJazNkbnZBd3dCeEwwdWp1Z05aZTJjWFFR?=
 =?utf-8?B?aG9GYW5lL3hqR2F5dWZJMzlRcFdGazJjNFUraCsvNHpuRExuZExockk1a1E4?=
 =?utf-8?B?Z0NZdzhyQjJYK00weFN4RjlCM3oySzlsa1VOQjhTcEFMNWdJWHgyeGVtRUE5?=
 =?utf-8?B?NWVSVjYvbm9vSkdPWDk2WFB0QXVIS0FQelRONXVqMktWUUUzYnR6Vlc5OFZD?=
 =?utf-8?B?dWdveUlPNGx1aFc2VVlTZklBY2o0dmZwdnpkV0xaTldtaTFLUzVMaXg2RkJ0?=
 =?utf-8?B?Y2NxdjNvNmozWXdtWmVucHZhaVVFRXZJMUlUOWFTQzI1TndqQVNiajNQanNs?=
 =?utf-8?B?Q0xYdUR3Ris0WUhld2kxVSs5RlkrZnc2Y3ZuYWo1K05PT1BNTTZEdUl1UEpj?=
 =?utf-8?B?TVBHVHpGNUo0MGIzSS9vM1lIOWJyU0FvbW5mVnVJVVVGQStOK0t6a21qRFJF?=
 =?utf-8?B?L1QxQ3JNbVU2aUQ3WjEwMWxZT2JjOXFzcDNRSlAyYjVFeFVSSGZpZlU5clIz?=
 =?utf-8?B?QWFxdGlXdmMycmhPMDl1YVk4STN0Um11Y2hsTEtmazFPNEprZW9QTk1yM1V6?=
 =?utf-8?B?R0tZdjladjE4dzZPeStHV3dQYkthOHFGWGpsb3VJS25nMUJQOCtqVmFtd3pS?=
 =?utf-8?B?ek5veGI3LzNxUk5nQWhzN09aWTRLY01pNC93MXYvK0hRM2cweFcyWlp3NVhW?=
 =?utf-8?B?dDlMM2lWZ1RsSldaZjVtRHMwTHJ1bE5sUVB5RG1WUVJ2cm4xMmJUOEsrSHVm?=
 =?utf-8?B?ODMyTlBEbWxJODYxcStuWDdQRWRlSXZyVEQzTlF3b3FZM0dBNHJoN2l0SGZ1?=
 =?utf-8?B?ZFB6V1FOZGhwa0RSeTROdDN4M2FLQ1NET203NGhsK2VmSUlkWW9IZk5HbG5B?=
 =?utf-8?B?ZnZEMzRJVCtuRGc3NDBNY2JzeEhHY3NjZEJBL0xsczI4bTRlRzJoNG1VN1NX?=
 =?utf-8?Q?UeHdEIJByA+FvzHlpGi0AMoiB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7DD0DD92FE17924499F98B5E771A6656@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tsrZCxp4ykFgagxcU1fPfVNnd9EI8jYEl2qpzwALS3jGMqGnp/47pjsdVvHHR6lBNf47hi8kZYip7XrIWp/o2xHzgHPP0lLfykfrZlK5tPqAf6ErGuv7RRTRCjuYXTB1DtmovgyAYHCyjT/hoc2VSvEQgRxseup9jQ6S4YPX7efZVK36/KEjLxSAS8VJ9hCyqM6oleMa4mHOimgzXzPRXGzrhg6VFxUWBR7ZN4aTFGKZVytpolrEGCrXzK1V6n+MFn0Jy/702r40O0jAau8WJJVgE9gx2LBQuZxJr/0qJHakXIkXN6zj8qVhcI836SO4ysWJMOFRI4jrt1n4EOqxElWAEj+U+QsLpyP8K4DA+26nfEMRx+Tvg8I5N4OVz+2aU8+KrvwE765+BoyY4hqpzXNCnn/wPEXWcuvUZKblghIYJN9IKzGPp4QaZgB0SI4bprBmPadhzPiDrNXrP0s6WjI2r4nw1N+YFhh2z9YTAJ4mW55OiR7fHNvHRNmkGlLuqFwQxd/dgJTH/H9JbU2U9W4jPq6edU2YZjrZoCvecS+wCJpDqGo5bRd3yr5kNOLdmLIWtD/XfvThyiUJ+LJfKcvB0bdA0163kMUmx8yMxmYs/MND6q/Af5qpfjjKHIFDbGWJNJcaSQCGB2C1IHQwBw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0f64f9-b803-48e5-6002-08dcfd2bf6e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 23:54:04.7021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4EUD7idWxwIG8jhvtBe1sM9bZWKlm8qUfwTZhN/CpdQ5yUKPow3Jpcyz4JWpfN37jIFY5IeVyF2Bn3qMu2rQZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8709
X-Proofpoint-GUID: htVRj5OLoRZX_WwV55jaGjSg_wrW_RAl
X-Proofpoint-ORIG-GUID: htVRj5OLoRZX_WwV55jaGjSg_wrW_RAl
X-Authority-Analysis: v=2.4 cv=T5reTOKQ c=1 sm=1 tr=0 ts=67295ea6 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=nEwiWwFL_bsA:10
 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8 a=G54nGU-1IwTxQiG81aEA:9 a=QEXdDO2ut3YA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 clxscore=1011 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411040191

T24gTW9uLCBOb3YgMDQsIDIwMjQsIFJvYiBIZXJyaW5nIChBcm0pIHdyb3RlOg0KPiBUaGUgdXNl
IG9mIChvZnxkZXZpY2UpX3Byb3BlcnR5X3JlYWRfYm9vbCgpIGZvciBub24tYm9vbGVhbiBwcm9w
ZXJ0aWVzDQo+IGlzIGRlcHJlY2F0ZWQgaW4gZmF2b3Igb2Ygb2ZfcHJvcGVydHlfcHJlc2VudCgp
IHdoZW4gdGVzdGluZyBmb3INCj4gcHJvcGVydHkgcHJlc2VuY2UuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPg0KPiAtLS0NCj4gIGRyaXZl
cnMvdXNiL2NoaXBpZGVhL2NvcmUuYyAgICAgICAgfCAyICstDQo+ICBkcml2ZXJzL3VzYi9kd2Mz
L2NvcmUuYyAgICAgICAgICAgIHwgMiArLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLW9tYXAu
YyAgICAgICB8IDIgKy0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMgICAgICAgfCAy
ICstDQo+ICBkcml2ZXJzL3VzYi9tdHUzL210dTNfcGxhdC5jICAgICAgIHwgMiArLQ0KPiAgZHJp
dmVycy91c2IvcGh5L3BoeS5jICAgICAgICAgICAgICB8IDIgKy0NCj4gIGRyaXZlcnMvdXNiL3Jl
bmVzYXNfdXNiaHMvY29tbW9uLmMgfCAyICstDQo+ICA3IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9j
aGlwaWRlYS9jb3JlLmMgYi9kcml2ZXJzL3VzYi9jaGlwaWRlYS9jb3JlLmMNCj4gaW5kZXggODM1
YmYyNDI4ZGM2Li4xOGVjZmNjMDhiOTcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2NoaXBp
ZGVhL2NvcmUuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9jaGlwaWRlYS9jb3JlLmMNCj4gQEAgLTc2
NSw3ICs3NjUsNyBAQCBzdGF0aWMgaW50IGNpX2dldF9wbGF0ZGF0YShzdHJ1Y3QgZGV2aWNlICpk
ZXYsDQo+ICANCj4gIAlleHRfaWQgPSBFUlJfUFRSKC1FTk9ERVYpOw0KPiAgCWV4dF92YnVzID0g
RVJSX1BUUigtRU5PREVWKTsNCj4gLQlpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKGRldi0+b2Zf
bm9kZSwgImV4dGNvbiIpKSB7DQo+ICsJaWYgKG9mX3Byb3BlcnR5X3ByZXNlbnQoZGV2LT5vZl9u
b2RlLCAiZXh0Y29uIikpIHsNCj4gIAkJLyogRWFjaCBvbmUgb2YgdGhlbSBpcyBub3QgbWFuZGF0
b3J5ICovDQo+ICAJCWV4dF92YnVzID0gZXh0Y29uX2dldF9lZGV2X2J5X3BoYW5kbGUoZGV2LCAw
KTsNCj4gIAkJaWYgKElTX0VSUihleHRfdmJ1cykgJiYgUFRSX0VSUihleHRfdmJ1cykgIT0gLUVO
T0RFVikNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91
c2IvZHdjMy9jb3JlLmMNCj4gaW5kZXggOWViMDg1ZjM1OWNlLi5lMWJlYjc2MGU5MTMgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3
YzMvY29yZS5jDQo+IEBAIC0xOTM1LDcgKzE5MzUsNyBAQCBzdGF0aWMgc3RydWN0IGV4dGNvbl9k
ZXYgKmR3YzNfZ2V0X2V4dGNvbihzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgCXN0cnVjdCBleHRjb25f
ZGV2ICplZGV2ID0gTlVMTDsNCj4gIAljb25zdCBjaGFyICpuYW1lOw0KPiAgDQo+IC0JaWYgKGRl
dmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LCAiZXh0Y29uIikpDQo+ICsJaWYgKGRldmljZV9w
cm9wZXJ0eV9wcmVzZW50KGRldiwgImV4dGNvbiIpKQ0KPiAgCQlyZXR1cm4gZXh0Y29uX2dldF9l
ZGV2X2J5X3BoYW5kbGUoZGV2LCAwKTsNCj4gIA0KPiAgCS8qDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtb21hcC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLW9tYXAuYw0K
PiBpbmRleCAyYTExZmMwZWU4NGYuLmMyZDc1ODJjMTUxYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLW9tYXAuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb21h
cC5jDQo+IEBAIC00MTYsNyArNDE2LDcgQEAgc3RhdGljIGludCBkd2MzX29tYXBfZXh0Y29uX3Jl
Z2lzdGVyKHN0cnVjdCBkd2MzX29tYXAgKm9tYXApDQo+ICAJc3RydWN0IGRldmljZV9ub2RlCSpu
b2RlID0gb21hcC0+ZGV2LT5vZl9ub2RlOw0KPiAgCXN0cnVjdCBleHRjb25fZGV2CSplZGV2Ow0K
PiAgDQo+IC0JaWYgKG9mX3Byb3BlcnR5X3JlYWRfYm9vbChub2RlLCAiZXh0Y29uIikpIHsNCj4g
KwlpZiAob2ZfcHJvcGVydHlfcHJlc2VudChub2RlLCAiZXh0Y29uIikpIHsNCj4gIAkJZWRldiA9
IGV4dGNvbl9nZXRfZWRldl9ieV9waGFuZGxlKG9tYXAtPmRldiwgMCk7DQo+ICAJCWlmIChJU19F
UlIoZWRldikpIHsNCj4gIAkJCWRldl92ZGJnKG9tYXAtPmRldiwgImNvdWxkbid0IGdldCBleHRj
b24gZGV2aWNlXG4iKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29t
LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+IGluZGV4IGMxZDRiNTJmMjViMC4u
NjQ5MTY2ZTJhOGI4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5j
DQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gQEAgLTE2MSw3ICsxNjEs
NyBAQCBzdGF0aWMgaW50IGR3YzNfcWNvbV9yZWdpc3Rlcl9leHRjb24oc3RydWN0IGR3YzNfcWNv
bSAqcWNvbSkNCj4gIAlzdHJ1Y3QgZXh0Y29uX2RldgkqaG9zdF9lZGV2Ow0KPiAgCWludAkJCXJl
dDsNCj4gIA0KPiAtCWlmICghb2ZfcHJvcGVydHlfcmVhZF9ib29sKGRldi0+b2Zfbm9kZSwgImV4
dGNvbiIpKQ0KPiArCWlmICghb2ZfcHJvcGVydHlfcHJlc2VudChkZXYtPm9mX25vZGUsICJleHRj
b24iKSkNCj4gIAkJcmV0dXJuIDA7DQo+ICANCj4gIAlxY29tLT5lZGV2ID0gZXh0Y29uX2dldF9l
ZGV2X2J5X3BoYW5kbGUoZGV2LCAwKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL210dTMv
bXR1M19wbGF0LmMgYi9kcml2ZXJzL3VzYi9tdHUzL210dTNfcGxhdC5jDQo+IGluZGV4IDY4NThl
ZDlmYzNiMi4uMjM4MDU1MjAyNWU0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9tdHUzL210
dTNfcGxhdC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL210dTMvbXR1M19wbGF0LmMNCj4gQEAgLTMw
Nyw3ICszMDcsNyBAQCBzdGF0aWMgaW50IGdldF9zc3VzYl9yc2NzKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYsIHN0cnVjdCBzc3VzYl9tdGsgKnNzdXNiKQ0KPiAgCWlmIChvdGdfc3gtPnJv
bGVfc3dfdXNlZCB8fCBvdGdfc3gtPm1hbnVhbF9kcmRfZW5hYmxlZCkNCj4gIAkJZ290byBvdXQ7
DQo+ICANCj4gLQlpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5vZGUsICJleHRjb24iKSkgew0K
PiArCWlmIChvZl9wcm9wZXJ0eV9wcmVzZW50KG5vZGUsICJleHRjb24iKSkgew0KPiAgCQlvdGdf
c3gtPmVkZXYgPSBleHRjb25fZ2V0X2VkZXZfYnlfcGhhbmRsZShzc3VzYi0+ZGV2LCAwKTsNCj4g
IAkJaWYgKElTX0VSUihvdGdfc3gtPmVkZXYpKSB7DQo+ICAJCQlyZXR1cm4gZGV2X2Vycl9wcm9i
ZShkZXYsIFBUUl9FUlIob3RnX3N4LT5lZGV2KSwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L3BoeS9waHkuYyBiL2RyaXZlcnMvdXNiL3BoeS9waHkuYw0KPiBpbmRleCAwNmUwZmIyMzU2NmMu
LjEzMGY4NmEwNDNhZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvcGh5L3BoeS5jDQo+ICsr
KyBiL2RyaXZlcnMvdXNiL3BoeS9waHkuYw0KPiBAQCAtMzY1LDcgKzM2NSw3IEBAIHN0YXRpYyBp
bnQgdXNiX2FkZF9leHRjb24oc3RydWN0IHVzYl9waHkgKngpDQo+ICB7DQo+ICAJaW50IHJldDsN
Cj4gIA0KPiAtCWlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jvb2woeC0+ZGV2LT5vZl9ub2RlLCAiZXh0
Y29uIikpIHsNCj4gKwlpZiAob2ZfcHJvcGVydHlfcHJlc2VudCh4LT5kZXYtPm9mX25vZGUsICJl
eHRjb24iKSkgew0KPiAgCQl4LT5lZGV2ID0gZXh0Y29uX2dldF9lZGV2X2J5X3BoYW5kbGUoeC0+
ZGV2LCAwKTsNCj4gIAkJaWYgKElTX0VSUih4LT5lZGV2KSkNCj4gIAkJCXJldHVybiBQVFJfRVJS
KHgtPmVkZXYpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvcmVuZXNhc191c2Jocy9jb21t
b24uYyBiL2RyaXZlcnMvdXNiL3JlbmVzYXNfdXNiaHMvY29tbW9uLmMNCj4gaW5kZXggZWRjNDNm
MTY5ZDQ5Li5lNGFkZmU2OTIxNjQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL3JlbmVzYXNf
dXNiaHMvY29tbW9uLmMNCj4gKysrIGIvZHJpdmVycy91c2IvcmVuZXNhc191c2Jocy9jb21tb24u
Yw0KPiBAQCAtNjMyLDcgKzYzMiw3IEBAIHN0YXRpYyBpbnQgdXNiaHNfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlpZiAoSVNfRVJSKHByaXYtPmJhc2UpKQ0KPiAgCQly
ZXR1cm4gUFRSX0VSUihwcml2LT5iYXNlKTsNCj4gIA0KPiAtCWlmIChvZl9wcm9wZXJ0eV9yZWFk
X2Jvb2woZGV2X29mX25vZGUoZGV2KSwgImV4dGNvbiIpKSB7DQo+ICsJaWYgKG9mX3Byb3BlcnR5
X3ByZXNlbnQoZGV2X29mX25vZGUoZGV2KSwgImV4dGNvbiIpKSB7DQo+ICAJCXByaXYtPmVkZXYg
PSBleHRjb25fZ2V0X2VkZXZfYnlfcGhhbmRsZShkZXYsIDApOw0KPiAgCQlpZiAoSVNfRVJSKHBy
aXYtPmVkZXYpKQ0KPiAgCQkJcmV0dXJuIFBUUl9FUlIocHJpdi0+ZWRldik7DQo+IC0tIA0KPiAy
LjQ1LjINCj4gDQoNCkZvciBkd2MzIHJlbGF0ZWQgY2hhbmdlczoNCg0KQWNrZWQtYnk6IFRoaW5o
IE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=

