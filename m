Return-Path: <linux-omap+bounces-2696-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8899CDC0B
	for <lists+linux-omap@lfdr.de>; Fri, 15 Nov 2024 11:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06F59B25A0C
	for <lists+linux-omap@lfdr.de>; Fri, 15 Nov 2024 10:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7811D1B0F06;
	Fri, 15 Nov 2024 10:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="oLc3NEjG"
X-Original-To: linux-omap@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2067.outbound.protection.outlook.com [40.107.241.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC016188012;
	Fri, 15 Nov 2024 10:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731664995; cv=fail; b=g34PlFlyH7k/1MvaCV4d3I/l/r+ERy5rBUyouM4V6PX4IFFMDLYdgLDX1Rjrh37TCIgDsBtouFsqH5QGioI+vjwXmho/RgCL1WwzcHnEaaQBE5qWenL505MehDt69PMmUQcIiMi8OcQ+bfO4eWNaJEB1Dps0EC+90uTt9R+TlXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731664995; c=relaxed/simple;
	bh=rJhzcEKw+O+vkFRrLgSNXwEBSbuhLuzC4TKtJBV/lsg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qMJT37vQCvIexouSBOeY9EivrTphjvo49VB9R2PirNUh14ohyAs+hgrXmcq/oYbxIaMb+xuKVVCAFzoAXYBP5rApHTsvLlKwp0tVG/SOyyjB06f9iF3Byl1qyL5w1Hl2L6vwNjfY36Qv68O56+RPRu/ZL3O42fc+Aks5TKehgio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=oLc3NEjG; arc=fail smtp.client-ip=40.107.241.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukH3KajpPLlKi8S3blRtcJ7t85nEGzHybzzs0aCR+h8j3h9iRRltE7Z7478cGatLxllyMb7Y8/K/6Qb//YxWOzsL8e0HHYQMbXJvPFQQYID6/OzIUQV752BG1Vi546Wvdza2iSu1sXIwVOaXW1bPvNMvaFyMqz/dDVrFEu7W35zYneFnrWKjL5N3LlmfrgVf8kcGD+4BP670ZVo6ibsRqZYx6xb/Ev1ZW59esWcgyArWEctmDvFnCONZQsTrG+m6+J+eL7uxLGNlGviNNhEcHc4oWd0bpHwcElvk1pNazXHPQ/vsnMx2VuJ0Q8XugVMl2gL19pw4/HJtx+Ej1VkpDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJhzcEKw+O+vkFRrLgSNXwEBSbuhLuzC4TKtJBV/lsg=;
 b=sFJCjTsH+WXQLgPvpzrLJmAt0sOrLK/Q2NaPkqYdDuYrwIbkNc+8toutUush3b3+csuWgXqZvWji7W2LdANiXqQ5XIrZwfBBg9o+/IXT5HvVCVUpwCqpoJ3F2sJwPnhCYsMBmsZLycLr/NC4WvpN4fR5nP9EJpXspucwtYrpTSqNc0Qs63kbUYY/5KCYX1CYYD2NfxpDHH8SmfP5V84iEoNcvYZ6JxEhyM9bXxwNxxy4zJucZxU+yjujVJjY9gf/yx71QSk+s0fFXNU5gLuoce/lVAkQykcxrP+N/oAt7YUs3o4ddb9FESQTBgwBvjUtxLO3dImYL7urNESYe8QDyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJhzcEKw+O+vkFRrLgSNXwEBSbuhLuzC4TKtJBV/lsg=;
 b=oLc3NEjGfvPfpaGk9x81Nf7unn3OntbYPAIZ8HBtxEZeOI4tiHEiyuNzIsc1MP3jXA4aAamffp8i1ENmGP8RMQLrWMd6uhtaroeqILOrDudGzZDW2ms+wp68AMaOjder8OCslBfBngaEa5yZDk+ja2zE3jipVn3O26eTLnS+0j6c87XiUxCgpLbE/wJ6voxlBnr4Bvdc7p7wiW/pkS17YtWsEBGJFTCDU+TXrj9smzolWWEZbUT2y/+tbDn/VE0EF6clw2MTRxo0oKiHLIpJK4KjVR+8SwLNEvPJcANfVP+uUkPpiaZSuXiZFlVmizWhY2gxf8MV1l6NraxLHAcLPw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DB8PR10MB3958.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:161::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 10:03:08 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 10:03:08 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "lee@kernel.org" <lee@kernel.org>, "tony@atomide.com" <tony@atomide.com>,
	"jneanne@baylibre.com" <jneanne@baylibre.com>
CC: "nm@ti.com" <nm@ti.com>, "msp@baylibre.com" <msp@baylibre.com>,
	"afd@ti.com" <afd@ti.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "khilman@baylibre.com" <khilman@baylibre.com>
Subject: Re: [RESEND PATCH v3] mfd: tps65219: Add support for soft shutdown
 via sys-off API
Thread-Topic: [RESEND PATCH v3] mfd: tps65219: Add support for soft shutdown
 via sys-off API
Thread-Index: AQHbNzXSBB0oRhKE60SDQsqEuOJmXrK3/sOAgAAd9IA=
Date: Fri, 15 Nov 2024 10:03:08 +0000
Message-ID: <0a0faa2b1f9ee02d86823ba0fe9faab7577ac426.camel@siemens.com>
References: <20230608071947.3467751-1-jneanne@baylibre.com>
	 <cf051fe221d0d455b3d45c5610e1e31fea560c47.camel@siemens.com>
In-Reply-To: <cf051fe221d0d455b3d45c5610e1e31fea560c47.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DB8PR10MB3958:EE_
x-ms-office365-filtering-correlation-id: 98224ac8-2b19-48c8-ff7f-08dd055cb4ba
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eEpsekgvbGJFbkF3VGJ1cmUvcExNYkdzeDFEWjU3bE04anFDSFo5aXJ4eFdR?=
 =?utf-8?B?NEplcnlBK0dHbjNDK212U0srTFlRUE9mcm1HamduREVhSXVMeG8vMGtPTkdx?=
 =?utf-8?B?V2pIWDNuaTZlMjRIK0hQbDNWZVpQTmVRNjJCY2JRV3l1eVZ4UlltZHdvbXR2?=
 =?utf-8?B?aGo1NXk4Q2Rzd1gvYlpEbkJVNTIzckY5cXZLTWRkaDIrT1phcWVMNlJVb0ds?=
 =?utf-8?B?Q3k0OXVhWWgvR1g5QStGbTlnRFNYRDlCRmtKWWlPb3A3aEJoR2M0ZUZzaVJr?=
 =?utf-8?B?bkYxeWUrSjd6am0yOXZKOHJKM2V0c1hzaG1taGZOQm1IZlU5cGgrbHpFR2VR?=
 =?utf-8?B?OEtPMjJINWw0QzR3dnMzY2UxVUNYTG12K2VpVGxOa1F3R1E0TjJkbGtXQndB?=
 =?utf-8?B?SGJJL1lOUjJ1elpqOTNkQW4raXBzTEhHVytEOHNNNnVPbFRYMlVWS3dCY0xm?=
 =?utf-8?B?a0d4QUF6d3BaYjZxdXBOK1hwdmJ0c0lYS3o1K2hYWUllZmN3OHdXcU5GNHZV?=
 =?utf-8?B?TU0rLzBoYXZSS0NNZ2tTcFVncllJREZ5TUlqVzlXTzJhOXd3SDA1U0NtaVNI?=
 =?utf-8?B?UmdFV3dIQVgxR3ZKUXJHN21DbldXYkR3bGhZanhtWm9ydENvR0g2MDE0QjFD?=
 =?utf-8?B?cksrZ09aeXZxMisyWVVwYklsMmpmbUNhU2s1QldCZjh1OVN3MVhqWEhrR0JG?=
 =?utf-8?B?cUFUZkZ6N0FNbmV1OWR0TEoyUXd4amNzSEhmVzZqSXlqbG5nYWY5UVp0TjZE?=
 =?utf-8?B?aUg0cDkzTFVLeVV6MGtkV1gveHVLSy9HME5Qd295NXNCTWVpRUY4c1dseGlS?=
 =?utf-8?B?eEZ0Zk1uZ1ZwcjZ0V3pZZ0U2dlVuU2xZVUo5UVVVNGZEZUt3YU1PWmhnT3Jr?=
 =?utf-8?B?RWtwL1ozZXNScUtWeEZIQTBMTHRsemNac00yUXNZaDMzV3U1ekxlbktHUEtu?=
 =?utf-8?B?UmxSaVpBZHJqUzVPWTF4eUs1bFIvKzRvMG5IOXVwYjB2Q1l6Zkg5OVF2V3FI?=
 =?utf-8?B?bjN6dDRqSE16TTZjN2ppelVydDNWT2V0WVp2SVV2TUMrRUM2alQrVkpBM0J4?=
 =?utf-8?B?eW13a1ErWjBvVlpOQTYyU3hWS2tMdWs1NklZYUJISmNsZFd5emN1V1VzM0l1?=
 =?utf-8?B?TjlwVmtOR21PRytsbHVoOTRrekROQjNpcWgrUFY3bWNMQ3FLeDVNb2d4cldW?=
 =?utf-8?B?TVlJdjZseVVUQkJNZmZranN6aXpQcFdoeFgwUWg3TkMzWHcrenRscC9UeVdD?=
 =?utf-8?B?bVE4d2FLdDBkSDFHRjFkQzVTR1dmNnRQbkhmWjB2Ni9MRmM0VXk1R09rMVNa?=
 =?utf-8?B?TkZkY0ovelNaeFpvQzZSdmNPMkFvMFlyMVhseWhXUGQ4WHNuRENEVEpoQzNE?=
 =?utf-8?B?L3hDOXdmNFU1L2RyVjIxWWxTN051Kzlpc2Y0QnYxbkQzTFpoNjFPNzhGaTlD?=
 =?utf-8?B?WkRvZ09pRjNxU084VytaZXRFeHZpY2RZb1llN2s5S0pXZ2dmQU5EMDgxQzE0?=
 =?utf-8?B?OGFXMWlzampYcVg4VVFCTE02Q2dCeFdRUzhvbml1dUpqSWVvRlAwc2ZjQzdQ?=
 =?utf-8?B?REpiK2hBRmlzamtXTytlSzEzQ1h5TXhBeW9ZMnJXOUtrUE1YNTNJbXlFNk40?=
 =?utf-8?B?Rk5ZN3JYU0M0aXJ0SFlRUkdzYzFUbHRyWUlMUjNKU012U1BKRGhnVmw4L0R3?=
 =?utf-8?B?S1lUcjdtTytDbmU0UC9BUHJXbWl2Z3NmKzc1WlhiUmx0a2JpUGZCUGpQR1JW?=
 =?utf-8?Q?2+GGImlEDeiczl3RPfuArykgOIuvAmmGoDsbmmJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?blRqUWcvWENZSHc1T3BTVTd0NXE1ajh2KzBhckx0Sm1JYjN6MFVpdEoxYThT?=
 =?utf-8?B?b3BLczN2T0FBaHhkSEdDM09aSVRkc0R3QWZTS2JBdnRFK0FKQ2RuQzNzbHpM?=
 =?utf-8?B?a242UkpQYm91ZnVMdlNxeHcyS1laQjN4em9vaVFFcmdoTnE3b0dUblBNOUtH?=
 =?utf-8?B?WmFFbG0zV0RrK0ZhYUpvdzJESkFjK1IwSUJQZXVHcUxUVFBYdUJzbXl5Qk81?=
 =?utf-8?B?UldKTjBQcVcxczNkWC9BQkt0dVUrdzY0TzVKMFcrT1BDb2hMQzJ6bGpENmIw?=
 =?utf-8?B?RC9SdldzUDBWTVcyQ0VjYWZtWHpGWktWVjZabDBkTU05eEpKOW1TVitMWUo3?=
 =?utf-8?B?VmttUEpLMXdKU3ZHSVpVdWdrVEFRWkZ5aWZKYUFFYlcrSnJCRlMzMVRGbUM5?=
 =?utf-8?B?Zm1WVUxQOVRwaXFUanViYmRmeXhjLzFjVjhScTFyZ3hUUjJEcTgxdjNuOFN4?=
 =?utf-8?B?TFdueFI3bXI1cE5MTzBTcWx1cDQzUmdZSVVGaWZpWTIzVlhQS3NPblI0U0xr?=
 =?utf-8?B?d2ZOd3NFY2EvUnhiTVA0VEtRYlQ5QUJqc2ovcFhOdmE3a21TL2d4bmtjb2tu?=
 =?utf-8?B?QS9YNE1reW5nQm1Oa1k5anpYaXdkdm8wNjBZV2d2TTRheE1BYmdCK1IxNnlO?=
 =?utf-8?B?Z3RGSmhnYmk3YVdUZXY5K05NVUljS2NxalAzeDQrdGJxR3pVNUJzUFU4MDdE?=
 =?utf-8?B?Y09PM2RPekRXNTdQQlBMcVY5dFVXc1ZRUStBYXJBNzNCdWZ6RzYvTFJQME5B?=
 =?utf-8?B?NXYwMFlONnhxOG5aQlUzN3pBUkdCZWtlQVd6bS8zVnFKcS94QlFnVi9mU2x2?=
 =?utf-8?B?ckltdHExcUNhTkswMGZBUGZtSEREeFBoYWdUMEx6MmhRUHJhZG9pdG9TbzJt?=
 =?utf-8?B?SmpQU1JYb0dQU092UmJHR1FWKy9IcEx0VWYxTko1QklhNHlSZXlnaGlHVzRE?=
 =?utf-8?B?ZXBTRzVzeWEwQ2hIelk4UWdGSFdwa3djaTdoQlc2bXluaXhKM3IrRUFVOGF5?=
 =?utf-8?B?Y3dZRTgyTE5MMkpLK0dVcktZR0RYcWtNVnhPWG5PWEVWVSt4RWpiK0gxMitV?=
 =?utf-8?B?dnhoV3YwL1dyeHhvVkZPVHVWYk1MUE91TFhLZmhoSTBrZDhxeko2Yklnemti?=
 =?utf-8?B?blY4UG9yRGJlSW5YMytKQUdKNkFocGg2eHdrMjd5ZFNiYUIwQzQvREFxdEds?=
 =?utf-8?B?a3dxd0srWHFEcHQzcStTSUc5R0MvRDdBN0RjMWZsSlNZRGVvV2o3WHZ2YWpn?=
 =?utf-8?B?dy9iSExacExia21nbFNMNTV3SHk0enVnMzRETFEyY05McmlXaDN0Rmd2bGNw?=
 =?utf-8?B?RnU1YWptR3Y3ZG1TYk91NWFIUkp5eGlRRXNSbFRUOVZneENydEN3aEpiRXlU?=
 =?utf-8?B?eTVWbVVlQmJ1U0RxblZpMFppRFBGemlvNFQxUXJ1TWltQXVkbG9oNjRZUnl1?=
 =?utf-8?B?MWZmK1FjU2QzbllBVm9SS3lvYnVTNEw3Rm5rcnBGNUdKR2J2TDlTZTZXTTdk?=
 =?utf-8?B?TmZkRkU4L0dVTVRPSHBOczdxQjBDNjJCQm1OaUNVNkM0eXdyd1VBbitxbEc4?=
 =?utf-8?B?SXpIdVNmSnNBUml4cm96QjByZC94VkQ4T0k4QllTNmUwa1hyUFJRT0ErMWNu?=
 =?utf-8?B?TmxSbEp0bUJ2cXRudE5sYTh6L1Q1ZHVWdmFBcVJEUXFVR3QvMzhZcy9sWkxC?=
 =?utf-8?B?R3VwNnRReU1mN3NzR3p1SFVzZy82QzNnUExSN1dZMUM0NktUZXFKdk91Q3Q5?=
 =?utf-8?B?d2FpSW9vekgwbktaYkdrbktSOW1uS2RWbFdUc2xhemd2R0N5TjlwVEJKUU1C?=
 =?utf-8?B?OVhNMml5clJLVnI1VEp4QkViU1BkVGY4VHRXc085RHorSVgvVzBjdnRKdTZU?=
 =?utf-8?B?RXAxdjdETDZ4d0F2Q2cvWE1SMHgzWERYZnFXS1dJZE9TTW5DSitOUFN0Vk1k?=
 =?utf-8?B?aHBlWFA1dHl6Z3VCQVJ4dE1TUVRXc1g4TitYc2tjaHo5blhsRE0rTEJMNGM5?=
 =?utf-8?B?UHZ2Yk5qZ2lNSmFSeTRLb2hrOVhJdW5INVIxbUcwYTBRazFVNUhUVm1Obm1l?=
 =?utf-8?B?YjBkUVRJeVdTNFFXaWdmY2VvdEQyNHhlUmUwaU0yWCtQYWlXeEU5QUUzZHZv?=
 =?utf-8?B?K01XNVJwTC9JbEFnNXQ5dEUySTcvQ2dKYU5SdHJuVWRTOCtDeEhROWx1cVU2?=
 =?utf-8?Q?G0xKZe63zfy7krWdatnDkVc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B37699F36D59C34A8A120493EA1A06D6@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 98224ac8-2b19-48c8-ff7f-08dd055cb4ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2024 10:03:08.3389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WzNM2tVwPXugdMlQylr7rgkXSBHSeuP0qwt6L3he/VhEkRUTC78iUgUoyRsC7fOenq7BydQ26/JbtIE+ZriBDzTO7TfZAz1Dt9e5BwMAnXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3958

SGVsbG8gYWxsLA0KDQphbmQgc29ycnkgZm9yIHNwYW0sDQoNCk9uIEZyaSwgMjAyNC0xMS0xNSBh
dCAwOToxNSArMDEwMCwgQWxleGFuZGVyIFN2ZXJkbGluIHdyb3RlOg0KPiA+IFVzZSBuZXcgQVBJ
IGZvciBwb3dlci1vZmYgbW9kZSBzdXBwb3J0Og0KPiA+IExpbms6IGh0dHBzOi8vbHduLm5ldC9B
cnRpY2xlcy84OTQ1MTEvDQo+ID4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzdo
ZnNlcWE3bDAuZnNmQGJheWxpYnJlLmNvbS8NCj4gPiANCj4gPiBzeXMtb2ZmIEFQSSBhbGxvd3Mg
c3VwcG9ydCBvZiBzaHV0ZG93biBoYW5kbGVyIGFuZCByZXN0YXJ0IGhhbmRsZXIuDQo+ID4gDQo+
ID4gU2h1dGRvd24gd2FzIG5vdCBzdXBwb3J0ZWQgYmVmb3JlIHRoYXQgZW5oYW5jZW1lbnQuDQo+
ID4gVGhpcyBpcyByZXF1aXJlZCBmb3IgcGxhdGZvcm0gdGhhdCBhcmUgbm90IHVzaW5nIFBTQ0ku
DQo+ID4gDQo+ID4gVGVzdDoNCj4gPiAtIHJlc3RhcnQ6DQo+ID4gwqAgIyByZWJvb3QNCj4gPiDC
oCBEZWZhdWx0IGlzIGNvbGQgcmVzZXQ6DQo+ID4gwqAgIyBjYXQgL3N5cy9rZXJuZWwvcmVib290
L21vZGUNCj4gPiDCoCBTd2l0Y2ggYm9vdCBtb2RlIHRvIHdhcm0gcmVzZXQ6DQo+ID4gwqAgIyBl
Y2hvIHdhcm0gPiAvc3lzL2tlcm5lbC9yZWJvb3QvbW9kZQ0KPiA+IC0gcG93ZXItb2ZmOg0KPiA+
IMKgICMgaGFsdA0KPiA+IA0KPiA+IFRlc3RlZCBvbiBBTTYyLUxQLVNLIGJvYXJkLg0KPiA+IA0K
PiA+IFNpZ25lZC1vZmYtYnk6IEplcm9tZSBOZWFubmUgPGpuZWFubmVAYmF5bGlicmUuY29tPg0K
PiA+IFN1Z2dlc3RlZC1ieTogQW5kcmV3IERhdmlzIDxhZmRAdGkuY29tPg0KPiA+IFJldmlld2Vk
LWJ5OiBBbmRyZXcgRGF2aXMgPGFmZEB0aS5jb20+DQo+ID4gLS0tDQo+ID4gDQo+ID4gTm90ZXM6
DQo+ID4gwqDCoMKgIENoYW5nZS1sb2cgdjMgdG8gdjINCj4gPiDCoMKgwqAgdjI6IExpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzA1MTExMjIxMDAuMjIyNTQxNy0xLWpuZWFu
bmVAYmF5bGlicmUuY29tLw0KPiA+IMKgwqDCoCBMZWUgSm9uZXMgUmV2aWV3Og0KPiA+IMKgwqDC
oCBuaXRzOiBybSBub3QgbmVlZGVkIGxpbmUgd3JhcHMgYW5kIHJlc3RvcmUgYSBjciBkZWxldGVk
IG5vdCByZWxhdGVkIHdpdGggdGhlIHBhdGNoLg0KPiA+IMKgwqDCoCANCj4gPiDCoMKgwqAgQ2hh
bmdlLWxvZyB2MiB0byB2MQ0KPiA+IMKgwqDCoCB2MTogTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjMwMjAzMTQwMTUwLjEzMDcxLTEtam5lYW5uZUBiYXlsaWJyZS5jb20vDQo+
ID4gwqDCoMKgIEFuZHJldyBEYXZpcyBSZXZpZXc6DQo+ID4gwqDCoMKgIC0gVXNlIG5ldyBoZWxw
ZXJzIGRldm1fcmVnaXN0ZXJfcmVzdGFydF9oYW5kbGVyIGFuZCBkZXZtX3JlZ2lzdGVyX3Bvd2Vy
X29mZl9oYW5kbGVyDQo+ID4gwqDCoMKgIFZpZ25lc2ggUmFnaGF2ZW5kcmE6DQo+ID4gwqDCoMKg
IC0gRml4IHR5cG8gb24gYm9hcmQgbmFtZSBpbiBjb21taXQgbWVzc2FnZQ0KPiA+IA0KPiA+IMKg
ZHJpdmVycy9tZmQvdHBzNjUyMTkuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMTAgZGVs
ZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL3RwczY1MjE5LmMg
Yi9kcml2ZXJzL21mZC90cHM2NTIxOS5jDQo+ID4gaW5kZXggMGU0MDJmZGEyMDZiLi4zZDkxNjQ0
OTFlMjAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZmQvdHBzNjUyMTkuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvbWZkL3RwczY1MjE5LmMNCj4gPiBAQCAtMjUsMTMgKzI1LDIxIEBAIHN0YXRpYyBp
bnQgdHBzNjUyMTlfY29sZF9yZXNldChzdHJ1Y3QgdHBzNjUyMTkgKnRwcykNCj4gPiDCoAkJCQnC
oCBUUFM2NTIxOV9NRlBfQ09MRF9SRVNFVF9JMkNfQ1RSTF9NQVNLKTsNCj4gPiDCoH0NCj4gPiDC
oA0KPiA+IC1zdGF0aWMgaW50IHRwczY1MjE5X3Jlc3RhcnQoc3RydWN0IG5vdGlmaWVyX2Jsb2Nr
ICp0aGlzLA0KPiA+IC0JCQnCoMKgwqAgdW5zaWduZWQgbG9uZyByZWJvb3RfbW9kZSwgdm9pZCAq
Y21kKQ0KPiA+ICtzdGF0aWMgaW50IHRwczY1MjE5X3NvZnRfc2h1dGRvd24oc3RydWN0IHRwczY1
MjE5ICp0cHMpDQo+ID4gwqB7DQo+ID4gLQlzdHJ1Y3QgdHBzNjUyMTkgKnRwczsNCj4gPiArCXJl
dHVybiByZWdtYXBfdXBkYXRlX2JpdHModHBzLT5yZWdtYXAsIFRQUzY1MjE5X1JFR19NRlBfQ1RS
TCwNCj4gPiArCQkJCcKgIFRQUzY1MjE5X01GUF9JMkNfT0ZGX1JFUV9NQVNLLA0KPiA+ICsJCQkJ
wqAgVFBTNjUyMTlfTUZQX0kyQ19PRkZfUkVRX01BU0spOw0KPiANCj4gSSBzdXBwb3NlIHRoaXMg
aXMgSTJDIGFjY2VzcyBhbmQgaXMgdGhlcmVmb3JlIGEgW3BvdGVudGlhbGx5XSBzbGVlcGluZyBj
YWxsPw0KPiBDb3VsZCB0aGlzIGJlIGFuIGlzc3VlLCBzZWUgYmVsb3cuLi4NCg0KSSB0b3RhbGx5
IG1pc3NlZCBtYXN0ZXJfeGZlcl9hdG9taWMgPSBvbWFwX2kyY194ZmVyX3BvbGxpbmcgaW4gaTJj
LW9tYXAuYyENCk5vIGlzc3VlcyBoZXJlLCBJJ20gc29ycnkhDQoNCj4gPiArfQ0KPiA+IMKgDQo+
ID4gLQl0cHMgPSBjb250YWluZXJfb2YodGhpcywgc3RydWN0IHRwczY1MjE5LCBuYik7DQo+ID4g
K3N0YXRpYyBpbnQgdHBzNjUyMTlfcG93ZXJfb2ZmX2hhbmRsZXIoc3RydWN0IHN5c19vZmZfZGF0
YSAqZGF0YSkNCj4gPiArew0KPiA+ICsJdHBzNjUyMTlfc29mdF9zaHV0ZG93bihkYXRhLT5jYl9k
YXRhKTsNCj4gPiArCXJldHVybiBOT1RJRllfRE9ORTsNCj4gPiArfQ0KPiA+IMKgDQo+ID4gK3N0
YXRpYyBpbnQgdHBzNjUyMTlfcmVzdGFydChzdHJ1Y3QgdHBzNjUyMTkgKnRwcywgdW5zaWduZWQg
bG9uZyByZWJvb3RfbW9kZSkNCj4gPiArew0KPiA+IMKgCWlmIChyZWJvb3RfbW9kZSA9PSBSRUJP
T1RfV0FSTSkNCj4gPiDCoAkJdHBzNjUyMTlfd2FybV9yZXNldCh0cHMpOw0KPiA+IMKgCWVsc2UN
Cj4gPiBAQCAtNDAsMTAgKzQ4LDExIEBAIHN0YXRpYyBpbnQgdHBzNjUyMTlfcmVzdGFydChzdHJ1
Y3Qgbm90aWZpZXJfYmxvY2sgKnRoaXMsDQo+ID4gwqAJcmV0dXJuIE5PVElGWV9ET05FOw0KPiA+
IMKgfQ0KPiA+IMKgDQo+ID4gLXN0YXRpYyBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgcG1pY19yc3Rf
cmVzdGFydF9uYiA9IHsNCj4gPiAtCS5ub3RpZmllcl9jYWxsID0gdHBzNjUyMTlfcmVzdGFydCwN
Cj4gPiAtCS5wcmlvcml0eSA9IDIwMCwNCj4gPiAtfTsNCj4gPiArc3RhdGljIGludCB0cHM2NTIx
OV9yZXN0YXJ0X2hhbmRsZXIoc3RydWN0IHN5c19vZmZfZGF0YSAqZGF0YSkNCj4gPiArew0KPiA+
ICsJdHBzNjUyMTlfcmVzdGFydChkYXRhLT5jYl9kYXRhLCBkYXRhLT5tb2RlKTsNCj4gPiArCXJl
dHVybiBOT1RJRllfRE9ORTsNCj4gPiArfQ0KPiA+IMKgDQo+ID4gwqBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHJlc291cmNlIHRwczY1MjE5X3B3cmJ1dHRvbl9yZXNvdXJjZXNbXSA9IHsNCj4gPiDCoAlE
RUZJTkVfUkVTX0lSUV9OQU1FRChUUFM2NTIxOV9JTlRfUEJfRkFMTElOR19FREdFX0RFVEVDVCwg
ImZhbGxpbmciKSwNCj4gPiBAQCAtMjY5LDEzICsyNzgsMjIgQEAgc3RhdGljIGludCB0cHM2NTIx
OV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiA+IMKgCQl9DQo+ID4gwqAJfQ0K
PiA+IMKgDQo+ID4gLQl0cHMtPm5iID0gcG1pY19yc3RfcmVzdGFydF9uYjsNCj4gPiAtCXJldCA9
IHJlZ2lzdGVyX3Jlc3RhcnRfaGFuZGxlcigmdHBzLT5uYik7DQo+ID4gKwlyZXQgPSBkZXZtX3Jl
Z2lzdGVyX3Jlc3RhcnRfaGFuZGxlcih0cHMtPmRldiwNCj4gPiArCQkJCQnCoMKgwqAgdHBzNjUy
MTlfcmVzdGFydF9oYW5kbGVyLA0KPiA+ICsJCQkJCcKgwqDCoCB0cHMpOw0KPiA+ICsNCj4gPiDC
oAlpZiAocmV0KSB7DQo+ID4gwqAJCWRldl9lcnIodHBzLT5kZXYsICJjYW5ub3QgcmVnaXN0ZXIg
cmVzdGFydCBoYW5kbGVyLCAlZFxuIiwgcmV0KTsNCj4gPiDCoAkJcmV0dXJuIHJldDsNCj4gPiDC
oAl9DQo+ID4gwqANCj4gPiArCXJldCA9IGRldm1fcmVnaXN0ZXJfcG93ZXJfb2ZmX2hhbmRsZXIo
dHBzLT5kZXYsDQo+ID4gKwkJCQkJwqDCoMKgwqDCoCB0cHM2NTIxOV9wb3dlcl9vZmZfaGFuZGxl
ciwNCj4gPiArCQkJCQnCoMKgwqDCoMKgIHRwcyk7DQo+IA0KPiAuLi4gd2hpbGUgdGhpcyB0cmFu
c2xhdGVzIHRvDQo+ICAgICAgICAgcmV0dXJuIGRldm1fcmVnaXN0ZXJfc3lzX29mZl9oYW5kbGVy
KGRldiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1lT
X09GRl9NT0RFX1BPV0VSX09GRiwNCj4gLi4uIG1pZ2h0IHRoaXMgYmUgYW4gaXNzdWU/DQo+IA0K
PiBlbnVtIHN5c19vZmZfbW9kZSB7DQo+IA0KPiBbXQ0KPiAgICAgICAgIC8qKg0KPiAgICAgICAg
ICAqIEBTWVNfT0ZGX01PREVfUE9XRVJfT0ZGOg0KPiAgICAgICAgICAqDQo+ICAgICAgICAgICog
SGFuZGxlcnMgcG93ZXItb2ZmIHN5c3RlbS4gSGFuZGxlcnMgYXJlIGRpc2FsbG93ZWQgdG8gc2xl
ZXAuDQo+ICAgICAgICAgICovDQo+ICAgICAgICAgU1lTX09GRl9NT0RFX1BPV0VSX09GRiwNCj4g
DQo+IA0KPiA+ICsJaWYgKHJldCkgew0KPiA+ICsJCWRldl9lcnIodHBzLT5kZXYsICJmYWlsZWQg
dG8gcmVnaXN0ZXIgcG93ZXItb2ZmIGhhbmRsZXI6ICVkXG4iLCByZXQpOw0KPiA+ICsJCXJldHVy
biByZXQ7DQo+ID4gKwl9DQo+ID4gwqAJcmV0dXJuIDA7DQo+ID4gwqB9DQo+IA0KDQotLSANCkFs
ZXhhbmRlciBTdmVyZGxpbg0KU2llbWVucyBBRw0Kd3d3LnNpZW1lbnMuY29tDQo=

