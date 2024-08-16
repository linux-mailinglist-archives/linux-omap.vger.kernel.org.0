Return-Path: <linux-omap+bounces-1920-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 430E8955354
	for <lists+linux-omap@lfdr.de>; Sat, 17 Aug 2024 00:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6347B223A4
	for <lists+linux-omap@lfdr.de>; Fri, 16 Aug 2024 22:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D52145FE8;
	Fri, 16 Aug 2024 22:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qsLHitC/";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UwrjfRze";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Rb4qA7iJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63EF12C478;
	Fri, 16 Aug 2024 22:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723847606; cv=fail; b=DvE0S26E38KW7os+IPTiVpOiOM6cM1s6FaZ2lFB3FWwBoBQGzXhR9Od0NMKUK4CxU1KuInV8sRbVEZni5y0Nq9XkF/AQgXb4C9XfzzOdd/oYnj1IMfO2NIeTWk3XAzSJQkbi7qS/XoUZa3VDVk30v2menUWmHiEfUFbEJEkjV3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723847606; c=relaxed/simple;
	bh=mg5jJ0jgbLLwbuqPHTZWLFTCHjSe6QqB8upkZ5h4eCc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bq3ZM5+tZuxYxbjJ/bfumlGwYF0CDAKocjCeQ1BIzxacq41PsRjXCeYD8JXJh7gEuZMZHcAbsv9k63WOi6uccFqxsyBGmDPwY4EuLvbOE+4gGiEVpVKOo2NICw79Ye1w1JCpazug4N0GpFF8Ez+zym+eeXo3kYQpWPa13eTHGh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qsLHitC/; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UwrjfRze; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Rb4qA7iJ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47GJ26rg009913;
	Fri, 16 Aug 2024 15:33:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=mg5jJ0jgbLLwbuqPHTZWLFTCHjSe6QqB8upkZ5h4eCc=; b=
	qsLHitC/K0DGX3YvaNACQubt4etWsXalMbnZq+JFZ3j6RUUsU+Sk/jQFYhUweZ5F
	bkmbgAqnOUn3wV/UHu9Upaz9bkHE+bDcs/+mbkdIgsH70arEi6jtZzmOkfu+iMjx
	z5HCyMK/xjZWXKc1oCkEDJR88Su5PnlpZlthpzaterbEV8pPKe27w1qtj/7ZVsu/
	CxAf3/Kwld03MewiDgozwytB+oHwX4fvZNcz2i1DW81kWGd0VfsDib6OXrvT9VuI
	Ch1npS0otXjnsx6jUHfPhs0Rj90y6SiL27hYZFqCEokrRYG1oUCO9GmF82kyfU/R
	I/MKDvp/DN4LImFMdYVwXw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4111fhtjdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 15:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1723847584; bh=mg5jJ0jgbLLwbuqPHTZWLFTCHjSe6QqB8upkZ5h4eCc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=UwrjfRzeyVZt+UaqrIFN1YZgHTybaU86W9sWNuAbvgAUbb/ShWPfmHM4OLDlOtMBs
	 qPHEVUdbyt0o3Q56IKdTGtdWaQeYKQvDcxpC09THnEUJwD/57KvmupOiiU1B6FJVov
	 LD1tCI5WKrwZE3676kpeouKOsD+QDwVJ10xIJ6NGJozZPxImNzjP+zlZiQu9FjR5Ec
	 75j/6JKaaJDoigQSf9QccF6yPGDi98fety5z7isKqDaPW1pAEKC5QrvHAq+falO1f8
	 kQduS11Tfz+EMJtOcokuznwRjNtM88H+UB6HE7cCnxVmDIjXKtpwDINB7C+eCZ7kzB
	 pgikrR5R5KW/Q==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C7D8B40354;
	Fri, 16 Aug 2024 22:33:02 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E1431A00C8;
	Fri, 16 Aug 2024 22:33:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Rb4qA7iJ;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 31D4040356;
	Fri, 16 Aug 2024 22:32:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tn9BCHZAyAAUR60Wf+7lOS7KnTEjjJzwCF1PbPs77VfEjWwUbBh3jTpvv5QtmNd3lqkiSdj06jPNN9B97fz5AmPcjw4cphPQFm15D6VpPJJqoPlTTjXJq342lo5nHpfeCP0M4ox8E2H0NYm9+n8ytqEtuUJNYN/AmMGkBW9I0mQBPLoBWaznwDOppV7YgFZFlbmo/Q06su0fHYT3lVr7fIFK2aWR2iMf1dzQv/nwikKqM56+oLDe83pZObJ2BRsQaEYw6IPOAjSIIs5a7wIAvmqHHUGtbo70wQw0Qbm23+bo8/CST+WCCVViwZnbhsMr0zfpQcW9Mvccj0xeylmk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mg5jJ0jgbLLwbuqPHTZWLFTCHjSe6QqB8upkZ5h4eCc=;
 b=sUzKJqvA1HFCcyBPm5Z9fw79ocFAuJoBcZGz8HSzPfz8Gm6oI+duu4a9IihTSKbNqdUMZuR9VX7vutY7KhdKZCgBX5fM7+ZSrVP1e/G30sJcNjCSx6PF9eps1Y1CnBsX1DD4DyqrzqUT6Lu0RMBFMop8gSqWEcRIR4AVhAf8jSnGm0zciZJk1XpAHmQ0jrV1P9tkozy1H+K2A0robDGiMGAz5uYwMvl9tYLgJuodlCWRguiCQ0/aSP8CPvwUxXFk50wpZMZMpSV3/IypeeVmpUMWGOgQt7x5DAXXKvsxXfiwApQ70K8dJjYw/eClhuIOgSUVtTc+sW2woO0vdVBosg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mg5jJ0jgbLLwbuqPHTZWLFTCHjSe6QqB8upkZ5h4eCc=;
 b=Rb4qA7iJ9nHTHfZum3lkmxOyx6SpD/FYuozJMDY3gCa2zRaZNwPOCZijXFOa1fy+YmueIdwvdZ8Sz/Z5rGrqNGuLemql9Mg15P0ie729RbOsceEEWTVUQJ5PUm7lB9LpxQkC1cNKooVCxvDEQ5fWVGrplDYPoQamE59eeLmsPI8=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB9061.namprd12.prod.outlook.com (2603:10b6:208:3ab::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Fri, 16 Aug
 2024 22:32:54 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 22:32:54 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michal Simek <michal.simek@amd.com>, Vignesh R <vigneshr@ti.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Piyush Mehta <piyush.mehta@amd.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] usb: dwc3: xilinx: add missing depopulate in probe
 error path
Thread-Topic: [PATCH v2 2/2] usb: dwc3: xilinx: add missing depopulate in
 probe error path
Thread-Index: AQHa77GCM8Fzwf9poUObEpPS7vbC/rIqeQ+A
Date: Fri, 16 Aug 2024 22:32:54 +0000
Message-ID: <20240816223249.is333ijscyc5ipto@synopsys.com>
References: <20240816075409.23080-1-krzysztof.kozlowski@linaro.org>
 <20240816075409.23080-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240816075409.23080-2-krzysztof.kozlowski@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB9061:EE_
x-ms-office365-filtering-correlation-id: 3867b816-be75-43ff-9230-08dcbe435eec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VkZJZzA0M2NZOWd2bXRQMUxDQnozUE1SR2ZsQ2VTZjFUS3h1NlM4aGc0bVk5?=
 =?utf-8?B?ejFRRVQ0dkRxK0NJenU1SElXQmFHc3pmR1BHR2NDd2xzbjlGdldJRFkvUUhD?=
 =?utf-8?B?S2xPczVERmdiOGxhWEtvQUZ1dk93RjhJOUMzbGlUUUNQV2N4WHkvWTBGT1gw?=
 =?utf-8?B?QUtwRjdibHFzSHlZcjBOaDJvSVcwZEFFb0NGT2F1L2QrZk9mZjZUbC9WT0xz?=
 =?utf-8?B?SUhsZGkvRUJQK0JraDRjWUtuOHNRS1BtN2w5VnJaWnArdGhQK2ZQeDJ4UklQ?=
 =?utf-8?B?akc5MzVlOEgvNU53NzNvNCtyYU9BN21LSjNHSkRVbXR3UXVFWWs1WWI4dk5a?=
 =?utf-8?B?UDBKTU90VU1rOHk2Vm9FQU1yNG0xVUNXQmh6Z0ZzWG9BZXpMY0lDQ0QxazBH?=
 =?utf-8?B?bU1HTlRYS2paOHoyeDJkNWpBVW9hdE1iRm9YMHhXTVl5Tnh3UStmYUJ2YVFw?=
 =?utf-8?B?VEdRbDlvdHp3RHFGVVFIU2ozWGhwS1Q2cjhPOWpIN3hxUUZET1pxVVY2cS95?=
 =?utf-8?B?dTRscFNwNWdkTVlwR3h3TG5JUEpPVUxIUEwwZ2VxcWFRdmJlRFBVc2RMcE9Y?=
 =?utf-8?B?UjJJdWViNUpVRVhrU0YxUkdWUE04TlZybjUza2dTQUREUUx2dUx1SlBsMzJU?=
 =?utf-8?B?VmtKb0RDNFA1SGxadHhrK3RLWTBYTlExMGFKVEIzSGs5bFBEWERqTVdJcmds?=
 =?utf-8?B?SUREc2o3cGJjeTlHeVF4OEY4dkpPWXE0cER5ZkpjQjB1QU9HREVCRGJqWFNp?=
 =?utf-8?B?U2ZXbEFkZnA5dlN2KytzWWZaVG5MSEEyMHRmcU5pM3hMbDZJd1prRFcwdm12?=
 =?utf-8?B?YUp6bTIyVjBKVmxOa3NZNk92TkFRMnN4ZEk2UFN1TnlXMFBQYmhmZzNiMFZm?=
 =?utf-8?B?dmY1bnhHM1phUkQrb25DZXVrSHVCb1N3U2l3TVY3b1BNZlIrdzFJVVJTUWZo?=
 =?utf-8?B?eXNTcXpHN0J2NGxFSFBveER3Y3Z5STQydjJ2TW1wWmllN3hka0lmNkFOWTcz?=
 =?utf-8?B?NEZQYlNBK3RHbjloakFxQm1MeGNrYTNNTHFWWTZZKzB6ZG5QZnFpVFRKaDlE?=
 =?utf-8?B?bTg4SDJNMTMyOEM0Z0xtZ1VXek0xV1RpaUJVQndxNVdWRngrS1hXMzUzM29v?=
 =?utf-8?B?MDA2YVZQTk9ZcC91Q3hidzhsUHNvb0hUM0RqRDh6UWI1eldJMW44dzBYalBW?=
 =?utf-8?B?RXRMS24yblJsemZ5NVRoRHkxcUhvQWpqSm44NWp1bG91MnY3aDlGaVNpeGo3?=
 =?utf-8?B?TU9lV3NWdWQzQ0tRRTBIYVYybkg0WkNTS2xGSzJXbEEyVnBpaHRqdi90cGh0?=
 =?utf-8?B?dk1iMnF1UjJweXcyWjlVRjlLbE9HalY2bVRVWXZqNTZWQTVvYlhleW4zYWcw?=
 =?utf-8?B?YW1CQkRsbjBCTkFhZnBpZGZ3V3Q5MHdUUk9oM1lLdFM5SDRCTkxBMmp3dVdH?=
 =?utf-8?B?NURmTHNqM1FiSDdDZy9mSUcxQW02VEZCdERBUFRkQW5PQlJpcFNHYTY2MDZU?=
 =?utf-8?B?RnlrNkNaZmcvSUlVVHpwRnlYRGVQV3FKMmlFZ0ltQ0VEQU4rNmNNZ1Z3Qmpw?=
 =?utf-8?B?U2hqSUVTU2R6WU02U1hVUm5YWGZCam1OVk1HVTFYNER0NjNUbnA1ZXkyME9n?=
 =?utf-8?B?UU5yZFZXbnoxV01ycDZHRndNUjhFdjdoeUIvUDE3L1dXRzRpR2JKZ1FKbVcx?=
 =?utf-8?B?VVRFOWFBd3VDZkFZMENFYXE2dTFhT3hmbW9NR0phZW45SHl2RkdOTlJIN2ZD?=
 =?utf-8?B?TlBZTzJiWFQ1SC9Zc1dla3pVZVcwZFFDOFNWMzFJTWh1REEzSkpuYlc4eHJD?=
 =?utf-8?B?RGVkcjVKbU1ONDNKWnh2dnAxR3ZKRHNOOXloOGx3UUg2K3VueXJKMExTd0dK?=
 =?utf-8?B?cEhtS0l5NUFWVWQzUUgwdjZxcVVxaS9UUGFQc2VDOFVVM3c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QmQ4Z0FpSElpTXJTK0FxNS9OT1FQcU5MRWNNNmU4TFppVDdJMFQrd1l0bzh6?=
 =?utf-8?B?MFcxQ3FqNGc4U2wzdFh0aVFUb2hoL082ci9KaWwwWnVnSkJtQi9mKzZtR2xB?=
 =?utf-8?B?ay9LbGtBZEMwUjdJQ2pEQS9xZ2hmQkhpcXZ1TmQ3NjR2c1JvUmpjanlEZkVU?=
 =?utf-8?B?aERnRllPc2J0VUV4dGR1R3lyRUVkV0pIRFRhbElCVkJiMG5RaGkzQXlZcTVi?=
 =?utf-8?B?R2xaUlBuVjNzRjVYcjhVdFRmYUYrU3orRG5yVEYxUHkrZWZWcTNTL3BYUTZ5?=
 =?utf-8?B?L1hqR2NvK3BON0lPaWpXaHJaUkZNWkQ2aW1kKzgxTU9mbFAzMU5mcmhHblVo?=
 =?utf-8?B?eTRLZE8ySFcvQzROOUNwdmNkdkNTMFZlb2dqTVJvOFdJaTlUbllTcGovb1g0?=
 =?utf-8?B?TDdwbkZnajJUcWxvNTJTRjVPTVV2KzJWUVRVMk9xNGhaSVpXRGpUc2JSV1Br?=
 =?utf-8?B?T2ZBUnhyeEpndWVRUzBMcHQveEdYZFpwT1BtSXFLalQ4TDVqejN1R3hpOFI0?=
 =?utf-8?B?Vm45YVNQaUpLaVovMUdkVlpLWFNoQnNvVS8wSnZNZkcxM0dIUXRMQ0l2VkRJ?=
 =?utf-8?B?eHc5L0hLUExzMHVIdmduUmt3TW9ZRHNSVnBJQks5R1NrUTZ0Zk40WnptNTdN?=
 =?utf-8?B?anBJZzZiam5RL2dCMkVQVFpteWtVWk04YmVuSktNaVliWWdRejZtTzU4dk15?=
 =?utf-8?B?QUFrQmZ5bmtpUG1oVEpsUW1nSFlVOHZHWnBjMGZGN2ZXTDVQNDN1cnJha29h?=
 =?utf-8?B?Nkl4T2thdFJlOVpURktSeW1CNGZWTGNZN1F1Sjd0NVNVYWZlQU94d050UERu?=
 =?utf-8?B?UnpCOW5nSGNVVE1xUGxKYkRvZTRISHQvaTNhNUc0cEZwSzRYM3MzQXdGUFRT?=
 =?utf-8?B?cE9RTTFMZDJJQmhaZzRTQXpXUy9YUk9icXN2a3I1VjZuN053OVo4MlNmeDhR?=
 =?utf-8?B?MEhwbGlFaDR2QUtLbkZ1RTU5MUZKaUtxQXdaekJlamI0eW5tdWx1MGtlV005?=
 =?utf-8?B?akNsekFmVG9aSG1GamxFaTdKMW9Vc1hXTGorY2tWN0JCM3p2SHI4Q1VPdWVO?=
 =?utf-8?B?aENGcThiSTNJVUFyNERvN0JkcW10RytTdzZia2lrNGV0RzFaeWJxQ1p5bklh?=
 =?utf-8?B?ZUN6UCtvMGI3VGU3R05nUFpmaGhDS245NllUK1R3Wkg3YlR6R0RrT2NqaG80?=
 =?utf-8?B?NlpLSGhDcEQyT2FibFVXdjlCdDNMdktlOWNmQnIrY3E3ZDQzV2NlOXNMcXlv?=
 =?utf-8?B?RmhEekMvaW9IVWtDYjdHTWkyNTZHRVBYMFFud2JqcnpncVRlSzlTdXVyOGhH?=
 =?utf-8?B?RURobTRCbnd6RFhKS0UrNzU1R3hKenl2TGg4RnBaMnY2c2VMNDJoMTBCQlNM?=
 =?utf-8?B?NklBd0dqUXBxT1JaeG4wdzJ3WjFUaVVIS3NSWFZzWjZaZjN1RE5DUC9OSExJ?=
 =?utf-8?B?SCtiVzNyRU8xSU02bVhOUG0wNEsvNVp3MGNveU1vSXdLbG9VR2Q5YkN6VW04?=
 =?utf-8?B?SVgzbEZteURLQU5NS0VJRzJkZXIwNUtqcDIvUWFxT0pQc2pkK2srQVEyMTUr?=
 =?utf-8?B?QStQWXQyVDJYSmRxcTB5YllJejJwc2FVN2lRWG9BVDBCVWYxVmZoR0UwZzR3?=
 =?utf-8?B?SVdYZy9CQkNmeDNyQUxVUi9GTVdJb3kxZkJRYjI1TkVjbVN2RnpyM0htc2h6?=
 =?utf-8?B?WEg1NzZ2L091eldSbkNpUGRjekJsY2lFQXArYnVsc1Bzb2M1MHJ1eWhqOXdH?=
 =?utf-8?B?Qms1NjZNbjNUMEs5blR5K0JwRVBYUWV3TGIreDZKbUxxL2xZLzg4YndGcDMx?=
 =?utf-8?B?amwzOEdzQjlDS2N4TENBY1QxMWFSOWhIQkEwU1did1U3NW5DeHNINTgyelor?=
 =?utf-8?B?K0t6dG5CcUt4a1Z6ekpDdURqenVYcFhqSG1yUUJBTEZBT0Q4bDlWMDR2UERW?=
 =?utf-8?B?elkvaUdEWVBrU1JrV0hXZHh0WmdlRXZOWWRKN29zTjhUQ1VmamxRZ0RCNWRm?=
 =?utf-8?B?ekRxOFJrcTBPR1hrdjE4YVhXYlVPWlJ6VnJsV3FtUUM4ZUZ3VUF4YTN3RkpX?=
 =?utf-8?B?OGsrQ3BYS2w4aWRpakIyVXVIOXE5djE4Z0dhdEh5a0dMSkprdTU5L1BEeXlk?=
 =?utf-8?B?anBqQTkvMkxkS0tPUXpZUTh4U0F0UmZtcXNWYlBwR3paaWg3UVdpa0ZOaXAx?=
 =?utf-8?B?NWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BAF89E1404A1DD4C94CAA1D942693753@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lquvfPQ+yjy0Xh7qBZPt9MnAfDSGIr9jd4dZgg44bqO9h4uQqFoewUvhdqVxCVu1oDumRp0tQ578teiC/6vDUQMgVZGFLLPn/6WgE3aqzvJrDNPlGgx4UA9CTAxQDZsxhtH3LL6CL19X5AcpDQrEhY/4RCTOSpC/CL6CKLQlSoiktvDz76/OTmw1w0YVWO9KX7yARiX5nf+XD8JtGvqdLf3VGVtmhQHE6XPpzb7kVTd2hu8DzvkIDYy4krpailChi0r3E9bZcwI0+V6v9bppWvfpHREBYcxKgcfUYNP6dmL50r9tT8FTcjBOJv8TGhPVakGJ0x0lf1UbJCzb6aq0vJFCU6IvxXFcNmfO5gTxSJAW4lFK43p7R/2+UXr+Yom3QtNzxDNtSwu3S+zWsGZRO5SS8GpmZ4DxBdyNvATvWxGmQH1aYxC4Kd50hD6v2eDfNo7qfozwnbC7Ciu3W+BNwqoPhIvq6bEVUFyLrtlfFTH6d7x9RoMpJk02hb93zo3VMmHRUEmGSJhux5cg+ai4PWqLHdhgfMR5emX0twB51GfIv6f6sCdrEQl0XjmJbKnoF5H+esbGcRJQOA7xp/mAunyD1tXzedsgpTNAaE5YkhBMx+c0DebS90KwoH+hJHiXpEvbRm5nJBk4JwVX72JMNA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3867b816-be75-43ff-9230-08dcbe435eec
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 22:32:54.3965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h1q81fvyYek4rAP9GNyHQrT7uf2N8qH/3KmBknpvUH+PLHr8/AIOpJf6ICZ/buCgGF00yJh+coKUI87DMEgoLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9061
X-Proofpoint-GUID: z87q5sSEqvj7zD9Dkhf6keoyBTIdVoeh
X-Proofpoint-ORIG-GUID: z87q5sSEqvj7zD9Dkhf6keoyBTIdVoeh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_16,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 malwarescore=0 mlxlogscore=993 mlxscore=0 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408160161

T24gRnJpLCBBdWcgMTYsIDIwMjQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IERlcG9w
dWxhdGUgZGV2aWNlIGluIHByb2JlIGVycm9yIHBhdGhzIHRvIGZpeCBsZWFrIG9mIGNoaWxkcmVu
DQo+IHJlc291cmNlcy4NCj4gDQo+IEZpeGVzOiA1M2I1ZmY4M2Q4OTMgKCJ1c2I6IGR3YzM6IHhp
bGlueDogaW1wcm92ZSBlcnJvciBoYW5kbGluZyBmb3IgUE0gQVBJcyIpDQo+IENjOiBzdGFibGVA
dmdlci5rZXJuZWwub3JnDQo+IFJldmlld2VkLWJ5OiBSYWRoZXkgU2h5YW0gUGFuZGV5IDxyYWRo
ZXkuc2h5YW0ucGFuZGV5QGFtZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3ps
b3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gDQo+IC0tLQ0KPiANCj4g
Q2hhbmdlcyBpbiB2MjoNCj4gMS4gQWRkIGdvdG8gYWxzbyBvbiBwbV9ydW50aW1lX3Jlc3VtZV9h
bmRfZ2V0KCkgZmFpbHVyZSAoVGhpbmgpDQo+IDIuIEFkZCBSYiB0YWcuDQo+IC0tLQ0KPiAgZHJp
dmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jIHwgNyArKysrKystDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlu
eC5jDQo+IGluZGV4IGJiNGQ4OTRjMTZlOS4uZjEyOThiMWI0Zjg0IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9k
d2MzLXhpbGlueC5jDQo+IEBAIC0zMjcsOSArMzI3LDE0IEBAIHN0YXRpYyBpbnQgZHdjM194bG54
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJCWdvdG8gZXJyX3BtX3Nl
dF9zdXNwZW5kZWQ7DQo+ICANCj4gIAlwbV9zdXNwZW5kX2lnbm9yZV9jaGlsZHJlbihkZXYsIGZh
bHNlKTsNCj4gLQlyZXR1cm4gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChkZXYpOw0KPiArCXJl
dCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoZGV2KTsNCj4gKwlpZiAocmV0IDwgMCkNCj4g
KwkJZ290byBlcnJfcG1fc2V0X3N1c3BlbmRlZDsNCj4gKw0KPiArCXJldHVybiAwOw0KPiAgDQo+
ICBlcnJfcG1fc2V0X3N1c3BlbmRlZDoNCj4gKwlvZl9wbGF0Zm9ybV9kZXBvcHVsYXRlKGRldik7
DQo+ICAJcG1fcnVudGltZV9zZXRfc3VzcGVuZGVkKGRldik7DQo+ICANCj4gIGVycl9jbGtfcHV0
Og0KPiAtLSANCj4gMi40My4wDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5O
Z3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==

