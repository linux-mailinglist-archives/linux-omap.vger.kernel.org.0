Return-Path: <linux-omap+bounces-3523-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B07CA774E9
	for <lists+linux-omap@lfdr.de>; Tue,  1 Apr 2025 09:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C17983AA3A4
	for <lists+linux-omap@lfdr.de>; Tue,  1 Apr 2025 07:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A541E5B7E;
	Tue,  1 Apr 2025 07:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="L9f2KzIk"
X-Original-To: linux-omap@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2050.outbound.protection.outlook.com [40.107.103.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA042111;
	Tue,  1 Apr 2025 07:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743491188; cv=fail; b=pIP+EpXv4asSRzUpbrKWTyfTWJyJbS1oDmnm4naLwyCZJ4Z8fsxL3fixXobaVyYkok+9RQJjwkl5Ancvhz9ZiREPkGhfG0NSdjypY8crhDx4xDeXOrXAb99PUhHOApXwZXAldlwP6Vkn05we9sdOVew/dhz2ZJgljQx7QJIH+f4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743491188; c=relaxed/simple;
	bh=2unR3Nx0657iQanx5IgoOjwqxgVrw1DQ7PibQ08RrM8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mqaNpXZMXIJdVhAH1ODxS7X6hRyrPJ7b0sxL420BQCCROw3Pm1HbDH+aW4LhF75vkA5LjH28DlCwclky18EQ+EbdrGH/WtGHsjIVQCDhIBFvgay8xSUw5b91RfbfSVH+GnLv71JQZxFPUM4es7nLf8QEsrAuK6u7YRbyRjVXP6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=L9f2KzIk; arc=fail smtp.client-ip=40.107.103.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYZKr1DjAx1QIZUtuFBBAPe0k0U0YQCgasjDD/PgSCcFVoy6WKpKkkchbP1PM+uM9qCTy/xZFYkipxRznVMbqmCdKpVBm3Hi9XJVEo7hUIAhIamX4mMV6gfwTO4TlBSLLGDKvGCdDigLb3WrSPxMxc1QBEyRYGKIX+JMGyF/0qVxpQV8GzzokZR/9DuloHpHQps2OFqfmY0CNu22MPXfqSysvhIwwJxFaaQjajLtUyQh7hz83DjQ/nGvjEbpBMR+Zmdz43XfSzeks0y5EZcACQlBdTjCez7kaGxY9gEPEwDb7nKwTFKNAwrfUw8Rf4fHRGydp2iMJVvjzb3GUMKOaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2unR3Nx0657iQanx5IgoOjwqxgVrw1DQ7PibQ08RrM8=;
 b=cwHTrLsGZErAiNj+8oCDK/XTPRxd3moXSgNBidlZJjMLcmC2EuZAQio/RjGbNezJGwLjzrYix1uZ73mphBUaXMVG7nwMJ032H2AOn6vE79uAB6C0zoVQHMJdb3B6cZcGkAMy6vAzKwo3wmkWBNXvhUhwHIAfFYPvV+7Ako2Iiab1ov0WtJOgzErIB/DoLM3n+HGuHw1tuujbZLJ4BmdnuIZEKA6U6jWhs+bYEbVj3Ts/FRfPy3ZbKRH0WOFbnYqCPGImOY7R7T6MOZyaVES8x4Wf64Yv6eQ4C8Y1mz44Y1rzK6Q1STSkNib32hLKdcvkdHD6IDdoN/r+9hEaCeSPZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2unR3Nx0657iQanx5IgoOjwqxgVrw1DQ7PibQ08RrM8=;
 b=L9f2KzIkj9rM7FJbS3pV1NkShpt2nlgP46cIj39mwsUXMvScnnHNLhh+zMsXLg9SDWNuDqw+sLNVuW/bm8d5v36J+ANL6DSNbq3jVIaOr3drQQ8lohO3+tpe3BcqiXJRrPAtReuflrZoqg/0pg5dV//+ATRJrD98cBBVEAS6Gjtn3qjkcjde0sHjK1wdQhUmpre+ETfR3xsvSTRP7TNNQfqcjFAwtTbmmHwfAwRotPNzzOVU98bNVs2kVrv9hKux19NsAKpEybTuqWLgOxlysvlqF2BofXFuuv/H//8qIu1LPVuca4qoDVdkJy4hBRgGuoh9awYahKCoxwAOXk+C0Q==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DB9PR10MB8213.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Tue, 1 Apr
 2025 07:06:22 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%4]) with mapi id 15.20.8583.038; Tue, 1 Apr 2025
 07:06:22 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "tony@atomide.com" <tony@atomide.com>, "andreas@kemnade.info"
	<andreas@kemnade.info>
CC: "rogerq@kernel.org" <rogerq@kernel.org>, "aaro.koskinen@iki.fi"
	<aaro.koskinen@iki.fi>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "khilman@baylibre.com" <khilman@baylibre.com>
Subject: Re: [PATCH] Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg
 interconnect devices first"
Thread-Topic: [PATCH] Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg
 interconnect devices first"
Thread-Index: AQHbk/znYu6FpepAZ06TMJZ5wavTxbONDquAgAE9zoCAADSwAA==
Date: Tue, 1 Apr 2025 07:06:22 +0000
Message-ID: <34dc1291866a2035e5827e7ff3e267b90c6b121e.camel@siemens.com>
References: <20250313094708.1003092-1-alexander.sverdlin@siemens.com>
	 <20250331110017.2b0aa9ae@akair> <20250401035745.GG4957@atomide.com>
In-Reply-To: <20250401035745.GG4957@atomide.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DB9PR10MB8213:EE_
x-ms-office365-filtering-correlation-id: 4b2b2922-9f3f-4cf6-61df-08dd70ebb586
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TUE0NFg5L1o4R2l0bWZQUGVaN2hsT091U1NXNjdvcnVNbVdmMFYwQXE5YzNv?=
 =?utf-8?B?MDdQOW9wdWVhdmhFTTQ3M3RkdUoraVpoZ2FjRUplWU9CaFBXeURoSkI5Smhj?=
 =?utf-8?B?ak9CWGpCYVI4WjVkSUFuMkMwVUdTL3FrdVlwZ0tucER1UU9WY3M3aUhoZ3p0?=
 =?utf-8?B?VEhhQnpINGtWMlpTaitEMGs0eHV3NWhuajRFRHNpejI1R2EzOTBxRTZoMTdZ?=
 =?utf-8?B?bEdxWTBnMFpJS3kvWVhDanhJeG1pU0dvdnpBZXVZblc1VnlKNkdLVTdua1R5?=
 =?utf-8?B?a0pHV2lnMUxKbE0xZTVDSWVjMytpOW1tLzZHRjlXaHEzdjJiMzdpZ3pIb2JP?=
 =?utf-8?B?SlhJbzIvcU1FSDgyN2pnSCtjcmhxNGZKS3MvcThmZVJKK3NIR2MzV1hQU2NZ?=
 =?utf-8?B?WXFTV1pWWEI5ZTliNlJkZ1hVQXdCRXdic1RjOXhvc2xxODE1UlBkamlWTE5v?=
 =?utf-8?B?WHlEaWZheDNGWUZuQU1RZzR5c0MzcWRRMnRaZGdadjZDWlhYSjJKRWxIZVNr?=
 =?utf-8?B?U0E4eXpPaFhNZzlwWEVBV2YxRTZLMkJ4NmliS3A3am8wVjIzN0psdFhGcEo2?=
 =?utf-8?B?dWtwNGtFTThUZGs5NUYyVjFwMWZuMlNTUjhFdFU1a3Brd05nWFB3eG1UVW9R?=
 =?utf-8?B?L3NHbmthOG9IQ3JUUFB4OWh1STF0V25KL0EvaTd5RTlhY28rZWZnaEJVdWo0?=
 =?utf-8?B?cXNPNEw5UkxBNlc3ZnVvSXB4MXRyMEo1blNuR0V0bnNSRWFBZS8wb3orRFBG?=
 =?utf-8?B?dURZYjY3RmxWTVpCSUNEOTBJMWJPNFRQdEpYRjkrYlI4ZkR1WFo1WnBobTg5?=
 =?utf-8?B?YkNDcG9yVUtUMXBDWnhOTkNWWCs1a1NYZDdaL2R1YlVPZENsS09paGRDcW9J?=
 =?utf-8?B?VkFJNHJDTkppYmVCSG5EaVlvYjdXemZQL0xHSFlTMkp1QVJLV1RqR2d2c3Iw?=
 =?utf-8?B?Q25NLzdBNlVuaytiRTk2S2V3eGxlQVc5L0RrVGMzTmdIcTNnY05MUFpuTnZw?=
 =?utf-8?B?bkY2VGh1V1RsWmp4aUVQbmt2K011cXBVcXNnV1ptSHIveE5LeWxSUkRaQlZE?=
 =?utf-8?B?VzhHMzVTcVVaSUNHU0lyVWZodXBWZFJkRjdNN1VKbWh2WHBYVEJES3JoNGdo?=
 =?utf-8?B?SlhOdlVoYUtHcGI5WWJXUmZvSXVvaHRFcGNZV2Z0SS9ZVVN1aTV2VFd4bmdS?=
 =?utf-8?B?dVoyb0svRnVYcEJ0YzVYNDIvMnRySnd5eEZETStqZ2ZHbEVpNzQ4b2I5dFlL?=
 =?utf-8?B?K2pvS05nUTBoS0FXZW9DRFoxYStnVDNSUFArWkNNV1hRSzhOMmFtYVErZjhC?=
 =?utf-8?B?WGsxYnF3V1ZSOEdOMHFPdzVuaG5oNFZYWERlWXVzZXp1aFAvZEc4L285dUl0?=
 =?utf-8?B?cG5EY2FqSjkxdGFwZ2xwbS9VMWc5Y0lKcUFEcFp6K2xFTHBpTzgzNlhyTU1n?=
 =?utf-8?B?dFJaZk4xOUx3dDRhanhMUjVqdm9UejhKSHNwc0t0b0dJREZ6UFpuWEp1WDRB?=
 =?utf-8?B?cnBLZnEzS1NIaXJYTHhFVTU0ZjBUUExodmE5akxHVVFiS2VFYjRYM25lM1pH?=
 =?utf-8?B?VDRrd3FXdmQxN2RhRGw5bFNYUVBRWU5vZUtYZmRJaldIQksxaTd1TStaOTVN?=
 =?utf-8?B?aG8vMzNsaGZrWFpHUWQ1TGdHYTZlTFNzRUcvQVVWaGtKWmZNbDd1UnhvNmdr?=
 =?utf-8?B?TnpoVWFzbXNuZ3JuMFZ3MXNFQ1E0aXhtYjA5RktmNlAwT3JsYWlmSUJ2YktU?=
 =?utf-8?B?R3M1MzJnemJwRlBwSnZ5SGNqTkpEY1UzbEZWQWprVzJDTllqZndPNlZlUlI1?=
 =?utf-8?B?VE5KRUk5ZVBmRlBkMFMwTXFZc1pTSTdUWXJ2T3dnQW9YcEFFUVB5bnFCKzk5?=
 =?utf-8?Q?+I4Ke5cEkM8Pd?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?KzdZN1c3dzN6V1N5bVVLTHZlWmhHVktFYi9YYmZ2RzhKZk5JUlgxMDBSejB4?=
 =?utf-8?B?bHZGOElxYm5iRWk5dEVFNnhZd3FNV1N5STNKajlZa2JrbHdUWDhsMU5MeUpN?=
 =?utf-8?B?RlkvTHc2elV6VFdRcjVNcnlqQWFTcDBFTFhQbk5URGkzUmhKTjRMRVhUQXhR?=
 =?utf-8?B?dXorc0plaUU5SHc0NzFvN01LV1UvWGpGdWdKc01ncUhxK0JNbTBVS2JqTmdm?=
 =?utf-8?B?d3psZXhtVEgyWTdJOStIZkdEYXMrbENBeTQ3TWZoR0NUY3VSeHdtd1M3djIw?=
 =?utf-8?B?dFN0WXZJdlVSdERRQjNackZoeHlsWnFPSElUeStkRFlkVC9iRkYvUGIvTVFC?=
 =?utf-8?B?cXJkMitJRmJDRXI4Z3JmT1FMaENCdENnUWZtWUZqTHdFTXBwMml2M1hhK0xH?=
 =?utf-8?B?a1dEQTRYVlh2WUhwVTFMQnNaamVtb0pRbWVHZE1oeWpMY1VWR2V0c3dCeEE1?=
 =?utf-8?B?SkNNOXhaWU1jT3dVOHZlbUZyOXVZNytDT24rU1dQcXZqMG1qdFUzdU9jekpt?=
 =?utf-8?B?eWJMSDdFWnlRL1BCYWpZUHNXZWt1Um5LU0FKN0dRZkpFUkNSTHdFajJjMjB2?=
 =?utf-8?B?eXdtYktjNEZRbE5IV1JlSjZLbjZXNnBsTUpNcVBRMkpZaHFzOVZDYzBWK1pK?=
 =?utf-8?B?TFZjLy8zNVdFZkZHVXh5VGkxZmZySEVyWitjT0FIaHBCUzN2OTBtUjlva3RR?=
 =?utf-8?B?anI2djVVYkc2WGRocDNUTW1oLzk1dytJb1htMHhnTjFsa3ZFYkNBQVJ3VmQ3?=
 =?utf-8?B?cytISDZLb0V4bVdVUk9YSmtvOGVONVVGemd1UjBWbkU4VUZubFEzRXE3eWdx?=
 =?utf-8?B?aFJabnduS2VUb2tkcXdmbDV4OG9vSFBCM2Fpcmc1cXdCWEEyNDhDSWV4Sks0?=
 =?utf-8?B?OUprS2EzNEpzSllYNjVCeDZod2RWbUtZRVEvUGZ1TkNXV1ZzSkpmZ0s4Nkoz?=
 =?utf-8?B?VlAyOTVDU1RCMW1kUzAvTWFJc3NOM2tKT2JHMllHWWl0WmZnTmY0NUdMREhV?=
 =?utf-8?B?OW9LQllBK253TkNabHJiTGJ2Tkt3M3hzSWtGbHVYVlZBWUREMGxaMWNvdTIy?=
 =?utf-8?B?UW5pYy82QnpkMU96VCtTVE5IVGZpOGFDNU5SS2tHZ1FGeEIxeDhOVE8rVUtr?=
 =?utf-8?B?MmlpZ1E1M25oMVVVRU9YR0NxdmMyaEptVVNkRnB0T3dib2hsTjNFcGFxN1ZX?=
 =?utf-8?B?VTFkTVZlZGpXTFZJb04waDRySnExSnc5QUlRMnAxS2wyYlZrNFIwUnFRUlc2?=
 =?utf-8?B?SnhrYmk4T20rZ2krK2t6Y05GeFhlNjk1SFlnT0RUcmRBNExjNVlTWXdKWUtF?=
 =?utf-8?B?dVp3Zm5Ednd4bTZuam9aQ0VkVjcrSEEybDFtRHNPVGJ4NktPL09WOU54c09s?=
 =?utf-8?B?azR3Qk9tUkpOYWpmT2VORE5BaENIeVVZOCtacldXVW9kdmJWMUI2eUpxVXNZ?=
 =?utf-8?B?V3VuVTI5RDBiLzI4aTlRdm1aVzNpdmR1d0VYVWxUQmZZNlo2eFJaejJKcnJz?=
 =?utf-8?B?YmNEY3B3NnloRmZKbDFXMktCTDRzMkpoejJYbXVPTkswc2w4OVRyRmFGZmdl?=
 =?utf-8?B?NUlsc2IzT0ZXVzR4VlAxSXJlQ1BrdUQwcVQ1UTlrODU4RUY2b3g4bkNIcEhX?=
 =?utf-8?B?aVROaHZtUUpFcTNhYjNseENLaC9ObElhY2dpeFR0bkJqQXlJSTIxZE1kaE5H?=
 =?utf-8?B?UVppNDFGajVRNHA5M296Z2JIa2srSUFjMTc2aFk1U3RDRHFSWFVwMWN2VVpw?=
 =?utf-8?B?RnVFMzlmc0lVSjYxNHN2UW8zQjgwNGhOUE84Q2lUWUJEOGxmcnM5RTVRY1V2?=
 =?utf-8?B?b3lwckhTM0ZIaXVHRUFGZERWN1JaRDQ5Y0VYVlRjS1I4aHNveGltUGg0MUY5?=
 =?utf-8?B?NmdGSENXM1NGem9QdVNPc3pSMnhoWHNkYzlybWpMZ2lYaVFtelFqcjI2bFI3?=
 =?utf-8?B?eGlsNVliYms1V21idmtydWVLcVh1bGNtaFhJL1hRRTB3cE1DbzlvcmxuMzJT?=
 =?utf-8?B?ekxjT1R1N3V3V3dpeDRESGg3YnNkcFQ1YkhibVhVZjQvQURBbFhlc2FtTHJP?=
 =?utf-8?B?S09VQ3ZiVDN4cU9QclZyM1Y0NUlzdjYrd01hbStReVFKVksrcnJuRkZGWkM1?=
 =?utf-8?B?MVBod1pQZUNva2ZSZ2hhaHF2dHFjZFE0UnlOYkFmVEQ3eU9oLzdSNy9lNEM2?=
 =?utf-8?Q?SMt/Ww0eJkd1xOUya2QuBUQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <42FE450DDC64D649B2C693DF1485CE2C@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2b2922-9f3f-4cf6-61df-08dd70ebb586
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 07:06:22.1532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: avm3bDizYIh/q7VQe4Y3uGmodY00k0o79gNr422/Rq51U2CKtDMe0N99RTdyvpBq4umYKPyWinPs1L4qYRRXPRv281g+xR0/x9KrARbdQfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8213

VGhhbmtzIGZvciByZXZpZXcsIFRvbnkhDQoNCk9uIFR1ZSwgMjAyNS0wNC0wMSBhdCAwNjo1NyAr
MDMwMCwgVG9ueSBMaW5kZ3JlbiB3cm90ZToNCj4gPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgNDcw
MGEwMDc1NWZiNWE0YmI1MTA5MTI4Mjk3ZDZmZDJkMTI3MmVlNi4NCj4gPiA+IA0KPiA+ID4gSXQg
YnJha2VzIHRhcmdldC1tb2R1bGVAMmIzMDAwNTAgKCJ0aSxzeXNjLW9tYXAyIikgcHJvYmUgb24g
QU02MnggaW4gYSBjYXNlDQo+ID4gPiB3aGVuIG1pbmltYWxseS1jb25maWd1cmVkIHN5c3RlbSB0
cmllcyB0byBuZXR3b3JrLWJvb3Q6DQo+ID4gPiANCj4gPiA+IFvCoMKgwqAgNi44ODg3NzZdIHBy
b2JlIG9mIDJiMzAwMDUwLnRhcmdldC1tb2R1bGUgcmV0dXJuZWQgNTE3IGFmdGVyIDI1OCB1c2Vj
cw0KPiA+ID4gW8KgwqAgMTcuMTI5NjM3XSBwcm9iZSBvZiAyYjMwMDA1MC50YXJnZXQtbW9kdWxl
IHJldHVybmVkIDUxNyBhZnRlciA3MDggdXNlY3MNCj4gPiA+IFvCoMKgIDE3LjEzNzM5N10gcGxh
dGZvcm0gMmIzMDAwNTAudGFyZ2V0LW1vZHVsZTogZGVmZXJyZWQgcHJvYmUgcGVuZGluZzogKHJl
YXNvbiB1bmtub3duKQ0KPiA+ID4gW8KgwqAgMjYuODc4NDcxXSBXYWl0aW5nIHVwIHRvIDEwMCBt
b3JlIHNlY29uZHMgZm9yIG5ldHdvcmsuDQo+ID4gPiANCj4gPiA+IEFyYml0cmFyeSAxMCBkZWZl
cnJhbHMgaXMgcmVhbGx5IG5vdCBhIHNvbHV0aW9uIHRvIGFueSBwcm9ibGVtLg0KPiA+ID4gU3Rh
YmxlIG1tYyBlbnVtZXJhdGlvbiBjYW4gYmUgYWNoaWV2ZXIgYnkgZmlsbGluZyAvYWxpYXNlcyBu
b2RlIHByb3Blcmx5DQo+ID4gPiAoNDcwMGEwMDc1NWZiIGNvbW1pdCdzIHJhdGlvbmFsZSkuDQo+
IA0KPiBXb3VsZCBiZSBuaWNlIHRvIHVwZGF0ZSB0aGUgZGVzY3JpcHRpb24gdG8gbWFrZSBpdCBj
bGVhciBpdCBicmVha3MgaW4gYWxsDQo+IGNhc2VzIGlmIHRoZXJlIGFyZSBub3QgZW5vdWdoIGRl
dmljZXMuDQoNCkknbGwgcmUtc3BpbiB3aXRoIG1vcmUgY2xlYXIgZGVzY3JpcHRpb24hDQoNCi0t
IA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20NCg==

