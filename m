Return-Path: <linux-omap+bounces-2694-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 988299CDA4A
	for <lists+linux-omap@lfdr.de>; Fri, 15 Nov 2024 09:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EED1CB22CBB
	for <lists+linux-omap@lfdr.de>; Fri, 15 Nov 2024 08:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61566188920;
	Fri, 15 Nov 2024 08:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="SNvtCreu"
X-Original-To: linux-omap@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2057.outbound.protection.outlook.com [40.107.241.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224B92B9B7;
	Fri, 15 Nov 2024 08:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731658565; cv=fail; b=QkQ6tMi88np9C1WZZH+hGi7cXlfVA5YOTJVptX9/CQOpVWZNc/Ci625w+wamA0E1XV7R2NLlp5jnUcmXIbrs5uJrHQTkGDoV50TxBmezuwiBEXqcTx+vIIRysZG3rHp2vJWzoY/wypZ6E62aefSPVscf7cLSZwj8k2TXoOAbl4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731658565; c=relaxed/simple;
	bh=SJjUvM/r/hc5marOmm86lbol/OSxP9cY6k82XGI5W7s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F5ELggyvb1rHWKw3SFH+/mh8rR+NxRxLm7AhmozQO5iEZWa5xTPkL55B8lNMFU2MsJL9QCRDSFqfBDmLs6ksKDmq09uSiDfvTUw9Zlflk1YhkZ12J1T/imUAODnz9+m9ZojKdrCD/fJO0va7kYPgswYc5YWepz9gTve+Wq/6jxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=SNvtCreu; arc=fail smtp.client-ip=40.107.241.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZUb/DYzM07NqsMhHAJEz6KF+9cgF8Q3XG44pnPqt+2xDCcHpZDc57Igjx/UIPDAvfKi6wxbfuopoRi+xT5CKXD+oVp9taeXmndgRTAozb9HvqNvuFD7lH6c1JVmj3FTwVUOt6zunjFXa0CDC7Yb8Q6Yhvq2gQu2GsA5JebVwK0Kre3G3tkKoJpOLVUR0Z4GiBPL91pdkJ4LyUL5B66kAzeuMq3rchI1ZdnZCTQjcjCR0dY+TR+YM9XVemPWqw21T3fJQp4iiLLb0PqKNfxKmvsZtC5K/LiONJiQzWeycALLIzPle6pK4Frk9xZRBoySCF60V0e7ejVStCa94V/cSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJjUvM/r/hc5marOmm86lbol/OSxP9cY6k82XGI5W7s=;
 b=e5Yqt+KHkQ8lHi8iv5EXM8ducpEG158aoH8boJBqK8xTDijvcGQ4zNQ3GJZWtuZGL3QYdo1A1R1BDg2OfVuC7KCC8/MJGcXIgP4tp8uZI8Yfbah43bibwz34I3zU+cQibZUj/rUol1kB7IKuiDT5wEx6qWtykld3W17azOmb1VNyLaTA2yyqxyuiSJl867mWwek48XhPaaM9HfRJ49QJF0yr+mpm6IKYpUG7ScInhz7xZtFobePpSinHzDPJzm5KEldTq5T7QsslBcYd680Qiu8QyJR1C/dboFO9UGqtXPkBZl76bkU+9nagy0mogEceMYf8Llv+ADp8cTLRWHrRaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJjUvM/r/hc5marOmm86lbol/OSxP9cY6k82XGI5W7s=;
 b=SNvtCreuwkr2044CnU/i4H87UwMeF3BxMFddwgqWM+2n7XSnYfJeaUpr6cMsfivnSP6iIymUB6e8o5PIdKMtIwvRLiuf0rc3ACfm09heNRMcSf+TD7GdSQDjj1wPRB63WjZWFcV5lFBVWp+WATXBjqKaiP2Epw0KrHX9Flwt7S5MqWQnxJmUxLk6khUGYiMVOJLAz1r1AxBntWGZbsnLot2qJYJxl9gm+MlC8PlccvUpvuFZ47Q5ID7uiiV8lu53azQIEIKI57XPnqj3ON8BWKj46aypY7/OLHq0HKRoRWpO/H5u+v5iW/41ijVi+cyxH5GNWdM7gCEeR99lsaetcw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GVXPR10MB8584.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1df::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 08:15:56 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 08:15:56 +0000
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
Thread-Index: AQHbNzXSBB0oRhKE60SDQsqEuOJmXrK3/sOA
Date: Fri, 15 Nov 2024 08:15:56 +0000
Message-ID: <cf051fe221d0d455b3d45c5610e1e31fea560c47.camel@siemens.com>
References: <20230608071947.3467751-1-jneanne@baylibre.com>
In-Reply-To: <20230608071947.3467751-1-jneanne@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GVXPR10MB8584:EE_
x-ms-office365-filtering-correlation-id: a3dae4bd-7a9c-4e4d-31dc-08dd054dbae8
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L2Y2K0hPZEJ5TVBTYTBVcEQwWUZWempOMjVyWlVNaEpYNmRvZ2wvdWVnTmls?=
 =?utf-8?B?QTEvRkgyS05XOWNYQmV5Q3Q0cVRGb0FsK2daRlZZUkJUbnVsMWM1dWpGcTdZ?=
 =?utf-8?B?djc3UU1tV1p1MGthTlRFd3EvR1ltbE9tdzJDTjN4QmRYY3JnQUt0bGFTV3cr?=
 =?utf-8?B?OVZUK09ZNzRqRHBKQzNoNUVKVUxJVUtOYXNsSENjdWloTmVXdmZvcjJNSHdD?=
 =?utf-8?B?cXVwMjg3SzlnR1BCMXdPeHlXQk9CT3Q0cmJmWFpnZkdxeUhoV1pNLy9jVE5v?=
 =?utf-8?B?WUxMSnNWeWkvNjV5UGpVaTBqNjZqYzdjKzdHMHlNNUtwOWtoeXMwMmhVWmtm?=
 =?utf-8?B?M05zMTVVRXBQZ0VIayszeERuREdRZlpMNHZhdnlWUk1qK1J5S1ZHTG1GU1ps?=
 =?utf-8?B?aS82cmR6ZmlpVnN4enFMaXkyKzEzdGZ1aTZVUlpQSFFBRnpGQm1lNzBTVENz?=
 =?utf-8?B?dDNZTkxsSVBpMzBDdjc4Yjd5TTFXSFpUdU1yeThOeWJxSVBvRFo2NFdBM2Q5?=
 =?utf-8?B?aTMxUHd2YlRWK1ltQUNMR25jUVI3TWgvUFRXN0I4WlFjUjBEeFJ5c0tlbWhE?=
 =?utf-8?B?RWtqQkt1bFljdE43Sms2WXI3Mm9GVW1MODgrSjQ3SEJzUzFkbWQ1VklUSHdq?=
 =?utf-8?B?ejdGVTZQRnNIWTFQRGc0UnczSGxmK3BvZFEzMks4ZmJhVHYvM2ZSaHFJSUdi?=
 =?utf-8?B?WjA5OHB6RS9YNWU0b3dZYkVVWTV1NWR3UmM3dVR1UHA2eGd1TW50SUpzcWw3?=
 =?utf-8?B?V0VxWEJkbVYySjROd3JjaSsvMmV5aENwcTRBblFYbUdEVEZWdGc5RjR5MnJO?=
 =?utf-8?B?cyt2eEFka2ovOFp2OU5YVTZyL3ZXUjBCY2IrdHpHM1BYTE1yZmZydzRSOElM?=
 =?utf-8?B?dUtFNFdkSXFxaCtvaGowQS84ZmprZ3JMWC9RNzJUNkJtOFlVdjNyNUEyNE4v?=
 =?utf-8?B?ZFBWSE1FeUlzZ0lLYW1UaEkzOER3eWhQRENUL3dQcVpTWGtsLzFVNXZ5TEpV?=
 =?utf-8?B?YTdTQ2xiMjhoKzBFY0dvR1hTWStnOXJpMW9MbDZQSjgzRlBJQjZZVkxBZXli?=
 =?utf-8?B?VVpFM1hKQVd2L2pyVlFJYkhNd3JFdEFDVXVXZXJBNmxHb2ptMFhsbzI0WVFl?=
 =?utf-8?B?UTgvdGlvdUMwYzQzYVlGNHpGMkw1NGo3Q25uayszMHdoMU9yTkdUOWpoMzdk?=
 =?utf-8?B?aGZOUHlGUSs5ZVRaYUZUVzR4NEIzc2dCNUR1akpLeWRwNFJ1VkM5TDhqRXIx?=
 =?utf-8?B?VGNKNWVoektiVXowOHJwdllWV3ZWWDcvTFprQWtQUnlKdGpKUStIR0FEOExZ?=
 =?utf-8?B?Yk1hbkY1YVNac254NFNIYU9XQmJxM09jSFo3bWNpbWNmcXlFNncwNWhYVmpt?=
 =?utf-8?B?NU1mM01Cc3NGcFFtbG9GaWpHNUhPL2JXbkJYUkc4Mm1yc01YZWhZZHYrNWZQ?=
 =?utf-8?B?S0VyVVRISjB0cVJsRm1OZEE5LzVLVDk1dDYxTXM4T2w3R3lyLzcrVHJtOTJu?=
 =?utf-8?B?YjVYSllUVDZ3NEw5WnpGcDJxbTdqeUdac1lQWUJpRHRQUFFwMzhaTkh6VXd0?=
 =?utf-8?B?TXRraUlRcW1EVzMvOE45QUpwSXlaSGhJZ1lHZG1jbU4yYk9RbVdoSldVRVpY?=
 =?utf-8?B?aEVKZU9ZaGlLb0swZHJQaE4rb1FGbFdPNG5ZMnhySkNpRURwckk5djR4YWJ1?=
 =?utf-8?B?c0FlemFLaFdqYTN3RTh6cnJnVEtJSVRwSldYK0dHVDdkUW5JVXJwWmtGMmNW?=
 =?utf-8?Q?5lYoTKL+cBQK/B3c0j8js9pAUTp+JHU/CXUxfLc?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MDkxYmxFc1kzSktSRmozRTI4dW50TVhld3dmYUpRcmRSOFB1RmFrTkFzRE9m?=
 =?utf-8?B?STVkWGlwTXVUNVJCVlRROFA4MzdhMFJ1WFZ6QW5pdC9vd0J5bGdCNThiMk5m?=
 =?utf-8?B?TFZYVUw3aFJLeDYwTUNaUWRoaUVIbVlrTHprMnp1WFFBcUpWRnNMNk16VmdT?=
 =?utf-8?B?cHAvK3VEeVhXb0d2SUIwMDhDaXd5dE9hQVB5YTBSOUZXckJ0bU1FQlRtaWRx?=
 =?utf-8?B?ZDBBV3hodll0SnBXaEJDbDlMMGJWNW5QUUdnckFLWmJlNVJHeERWOVI2L1hB?=
 =?utf-8?B?KytYUUdZdDhlNGtMMWZCZHM5cEl4UTY1ekVsY1BTVGwxMkEwOG4vRERKTklT?=
 =?utf-8?B?bFptVlZ3VUxrR012NVpUWmwyWmNRaWJjOUZWd3hUQXNMbitQdDhOK2taVjY1?=
 =?utf-8?B?Ulk1andjZ0dXdU9teTVMQ3VSVENVQXNMMlF4V1JvY3VIMkZtNVV1c3RIM1gx?=
 =?utf-8?B?Q0JZUDYycmNLTSs4WlRpcnVjMmY2Z0ZWL0ExWGkvMTZ3KzlvNjhibnJ5djkr?=
 =?utf-8?B?a3Mwblh1TkZpMUNTd0tma2VySTV4UDZiSGw5dWZVUFRUV1hZTXBLTGpKbUEw?=
 =?utf-8?B?Q29STjBZajdFcHFTZG9TdFVWNGFYbGNTSDhBZzlKckhyQ09PK3ZCT2lBbnA3?=
 =?utf-8?B?YWMxMEczQzVVa1NnMWN0Z2RrSFZ6RHplMFU2UlI4K1kxRWpHTDZvQ29wQTNU?=
 =?utf-8?B?N0xra2o3TXJXeEpJbStIQlMxc2VaS0daaEdweUFncysydHpwMm5JRmNtTWV6?=
 =?utf-8?B?c1RsY3FlZFYwbWw4QnlIWWlsUEp0L09wQmtybmZTaG1sYUUreU41V0FiUHZh?=
 =?utf-8?B?bFRjNEhwdjVSQ250SDl1T2Z5NFdjQ3hVellidk5NVldBOFZ1NzNtUncxTUhi?=
 =?utf-8?B?U3c1bjV3b0xveG4rOFNFVGNxRFEwSkpIVlV3M0ZrOVpLdUxhaEhWSHIyTFZV?=
 =?utf-8?B?aC9TRVZVS2t2U0cyVXVxL2ZIMHVDcS9PQ3dHQzQ3M09kVDQycFNkMERyd04z?=
 =?utf-8?B?YTVSWVlWTGp0Vk14dHRaUUNlcFZybStHOE5iTGJ5MmQ0SlFRKzNZQmhJRVZJ?=
 =?utf-8?B?QW9vaW1ZSWpabmJpSks5RFVhbThSVlRrYURMZyttT2t3LzMrblJPbWt3T2xE?=
 =?utf-8?B?cElkckxHdk80bXFiRW1YMmFNVzJXTFVYVWJCOEw3MGlRZjFXN2Q1R1Z5NkV5?=
 =?utf-8?B?WCtDUFVmaTBKSFZNT0RSREthdHRYdEhGb2c3QWgza0lGM2tpMGhKL1JkN3RO?=
 =?utf-8?B?cngyR1BRVTNJamV1d2ZqZDVqUk12STk5ajhoQ0ZOSnA5anJNKzNrNVhFTFk0?=
 =?utf-8?B?eU5Sb1IwN0JWZlpKMENTckdWNEYvRmtIYXdGV3h1T2NieUNlU0tENFA1Zlpk?=
 =?utf-8?B?ZTZZQWxlL1RVcHViNFVHNy9wVWV3bU9nNFNjejZGTTQ3ak9UaFdrQWwxaEcz?=
 =?utf-8?B?MEtRbXpmamZobmt2Vi8vTlVEbitCb0x6NEN5VkxxaTA5dzUwcXJHaUQ4K2xW?=
 =?utf-8?B?NTNNTU5VNStZSno5RWFpckJnZ3RjK3kzV3pvT2w4bFNIUEN4ZFNHbzI0T2k5?=
 =?utf-8?B?MTNlRkxxR3VXVU9KNkl5N3llSHZGaDJyMjZSS25taVdCWGJQbUpQcVB3SlFV?=
 =?utf-8?B?RDVSb2dsUXZnbjRuOEU0MmtaTnZrQkhxdHI1Zmg1N3NFTHJnTFZmY28ybHBQ?=
 =?utf-8?B?b29QclNCRHFaWFhsajRreFlnYXRjYkZ1OGZyTU5BQkhXWkF2SVRUekw0d00z?=
 =?utf-8?B?R0prdlNUQzZVK1ZHb2cxKzBJdUlKL2s2enVTL1RqNWxLNWhxTjdxTUlWRXpj?=
 =?utf-8?B?alM0YnRlMnBsR1pXcDZrQU9XT3pBR2FMQ2UvbG1QVUtSSVRMZlZkQ1h4UThD?=
 =?utf-8?B?S0F3UjlHMkhhTnFNVWJvMWszdFBLNzVNMlZicjQ4cFdFK1U1UUJzdTNTWmsv?=
 =?utf-8?B?bVZrNmtvR2s1MC9oNHJwQWJXeE5BOXoyK2VObVBZaHNrK2dQY0NBU2Y4TGRv?=
 =?utf-8?B?QmVMNkhvbTZ3S21BZkNxSDU2TnBVaDZKQlBFOE9hU25RTmhWUGRjVGVwVC9U?=
 =?utf-8?B?SVZya1BVU294VnppNVlBWHV6Wm5CODFUQWRVVjRpeUxZRkFKUUlZSXZCUHB2?=
 =?utf-8?B?cTBzN0J2NlFkRTRFVUphRTRiUExBRmxzTm1FdnRrUVVQS0ZHaFQvcExybENO?=
 =?utf-8?Q?kAa4WmSo3kZS7cSsXUyOARs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93F077E5D1FFEE4CB9053EF9FF1B6EA9@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a3dae4bd-7a9c-4e4d-31dc-08dd054dbae8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2024 08:15:56.2355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WOf62Mxz14ldo6CJJBPZZTYl8ujaUloN+Is/2gLigDeBMuBHtbJ6buSLyD76k99SKTb7vqxWuMMq6s8TR9LtVRu/AGLo/zPTs14LqYniMr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8584

SGkgSmVyb21lLA0KDQpPbiBUaHUsIDIwMjMtMDYtMDggYXQgMDk6MTkgKzAyMDAsIEplcm9tZSBO
ZWFubmUgd3JvdGU6DQo+IFVzZSBuZXcgQVBJIGZvciBwb3dlci1vZmYgbW9kZSBzdXBwb3J0Og0K
PiBMaW5rOiBodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvODk0NTExLw0KPiBMaW5rOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvN2hmc2VxYTdsMC5mc2ZAYmF5bGlicmUuY29tLw0KPiANCj4g
c3lzLW9mZiBBUEkgYWxsb3dzIHN1cHBvcnQgb2Ygc2h1dGRvd24gaGFuZGxlciBhbmQgcmVzdGFy
dCBoYW5kbGVyLg0KPiANCj4gU2h1dGRvd24gd2FzIG5vdCBzdXBwb3J0ZWQgYmVmb3JlIHRoYXQg
ZW5oYW5jZW1lbnQuDQo+IFRoaXMgaXMgcmVxdWlyZWQgZm9yIHBsYXRmb3JtIHRoYXQgYXJlIG5v
dCB1c2luZyBQU0NJLg0KPiANCj4gVGVzdDoNCj4gLSByZXN0YXJ0Og0KPiDCoCAjIHJlYm9vdA0K
PiDCoCBEZWZhdWx0IGlzIGNvbGQgcmVzZXQ6DQo+IMKgICMgY2F0IC9zeXMva2VybmVsL3JlYm9v
dC9tb2RlDQo+IMKgIFN3aXRjaCBib290IG1vZGUgdG8gd2FybSByZXNldDoNCj4gwqAgIyBlY2hv
IHdhcm0gPiAvc3lzL2tlcm5lbC9yZWJvb3QvbW9kZQ0KPiAtIHBvd2VyLW9mZjoNCj4gwqAgIyBo
YWx0DQo+IA0KPiBUZXN0ZWQgb24gQU02Mi1MUC1TSyBib2FyZC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEplcm9tZSBOZWFubmUgPGpuZWFubmVAYmF5bGlicmUuY29tPg0KPiBTdWdnZXN0ZWQtYnk6
IEFuZHJldyBEYXZpcyA8YWZkQHRpLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBEYXZpcyA8
YWZkQHRpLmNvbT4NCj4gLS0tDQo+IA0KPiBOb3RlczoNCj4gwqDCoMKgIENoYW5nZS1sb2cgdjMg
dG8gdjINCj4gwqDCoMKgIHYyOiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIw
MjMwNTExMTIyMTAwLjIyMjU0MTctMS1qbmVhbm5lQGJheWxpYnJlLmNvbS8NCj4gwqDCoMKgIExl
ZSBKb25lcyBSZXZpZXc6DQo+IMKgwqDCoCBuaXRzOiBybSBub3QgbmVlZGVkIGxpbmUgd3JhcHMg
YW5kIHJlc3RvcmUgYSBjciBkZWxldGVkIG5vdCByZWxhdGVkIHdpdGggdGhlIHBhdGNoLg0KPiDC
oMKgwqAgDQo+IMKgwqDCoCBDaGFuZ2UtbG9nIHYyIHRvIHYxDQo+IMKgwqDCoCB2MTogTGluazog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwMjAzMTQwMTUwLjEzMDcxLTEtam5lYW5u
ZUBiYXlsaWJyZS5jb20vDQo+IMKgwqDCoCBBbmRyZXcgRGF2aXMgUmV2aWV3Og0KPiDCoMKgwqAg
LSBVc2UgbmV3IGhlbHBlcnMgZGV2bV9yZWdpc3Rlcl9yZXN0YXJ0X2hhbmRsZXIgYW5kIGRldm1f
cmVnaXN0ZXJfcG93ZXJfb2ZmX2hhbmRsZXINCj4gwqDCoMKgIFZpZ25lc2ggUmFnaGF2ZW5kcmE6
DQo+IMKgwqDCoCAtIEZpeCB0eXBvIG9uIGJvYXJkIG5hbWUgaW4gY29tbWl0IG1lc3NhZ2UNCj4g
DQo+IMKgZHJpdmVycy9tZmQvdHBzNjUyMTkuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL3RwczY1MjE5LmMg
Yi9kcml2ZXJzL21mZC90cHM2NTIxOS5jDQo+IGluZGV4IDBlNDAyZmRhMjA2Yi4uM2Q5MTY0NDkx
ZTIwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21mZC90cHM2NTIxOS5jDQo+ICsrKyBiL2RyaXZl
cnMvbWZkL3RwczY1MjE5LmMNCj4gQEAgLTI1LDEzICsyNSwyMSBAQCBzdGF0aWMgaW50IHRwczY1
MjE5X2NvbGRfcmVzZXQoc3RydWN0IHRwczY1MjE5ICp0cHMpDQo+IMKgCQkJCcKgIFRQUzY1MjE5
X01GUF9DT0xEX1JFU0VUX0kyQ19DVFJMX01BU0spOw0KPiDCoH0NCj4gwqANCj4gLXN0YXRpYyBp
bnQgdHBzNjUyMTlfcmVzdGFydChzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKnRoaXMsDQo+IC0JCQnC
oMKgwqAgdW5zaWduZWQgbG9uZyByZWJvb3RfbW9kZSwgdm9pZCAqY21kKQ0KPiArc3RhdGljIGlu
dCB0cHM2NTIxOV9zb2Z0X3NodXRkb3duKHN0cnVjdCB0cHM2NTIxOSAqdHBzKQ0KPiDCoHsNCj4g
LQlzdHJ1Y3QgdHBzNjUyMTkgKnRwczsNCj4gKwlyZXR1cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKHRw
cy0+cmVnbWFwLCBUUFM2NTIxOV9SRUdfTUZQX0NUUkwsDQo+ICsJCQkJwqAgVFBTNjUyMTlfTUZQ
X0kyQ19PRkZfUkVRX01BU0ssDQo+ICsJCQkJwqAgVFBTNjUyMTlfTUZQX0kyQ19PRkZfUkVRX01B
U0spOw0KDQpJIHN1cHBvc2UgdGhpcyBpcyBJMkMgYWNjZXNzIGFuZCBpcyB0aGVyZWZvcmUgYSBb
cG90ZW50aWFsbHldIHNsZWVwaW5nIGNhbGw/DQpDb3VsZCB0aGlzIGJlIGFuIGlzc3VlLCBzZWUg
YmVsb3cuLi4NCg0KPiArfQ0KPiDCoA0KPiAtCXRwcyA9IGNvbnRhaW5lcl9vZih0aGlzLCBzdHJ1
Y3QgdHBzNjUyMTksIG5iKTsNCj4gK3N0YXRpYyBpbnQgdHBzNjUyMTlfcG93ZXJfb2ZmX2hhbmRs
ZXIoc3RydWN0IHN5c19vZmZfZGF0YSAqZGF0YSkNCj4gK3sNCj4gKwl0cHM2NTIxOV9zb2Z0X3No
dXRkb3duKGRhdGEtPmNiX2RhdGEpOw0KPiArCXJldHVybiBOT1RJRllfRE9ORTsNCj4gK30NCj4g
wqANCj4gK3N0YXRpYyBpbnQgdHBzNjUyMTlfcmVzdGFydChzdHJ1Y3QgdHBzNjUyMTkgKnRwcywg
dW5zaWduZWQgbG9uZyByZWJvb3RfbW9kZSkNCj4gK3sNCj4gwqAJaWYgKHJlYm9vdF9tb2RlID09
IFJFQk9PVF9XQVJNKQ0KPiDCoAkJdHBzNjUyMTlfd2FybV9yZXNldCh0cHMpOw0KPiDCoAllbHNl
DQo+IEBAIC00MCwxMCArNDgsMTEgQEAgc3RhdGljIGludCB0cHM2NTIxOV9yZXN0YXJ0KHN0cnVj
dCBub3RpZmllcl9ibG9jayAqdGhpcywNCj4gwqAJcmV0dXJuIE5PVElGWV9ET05FOw0KPiDCoH0N
Cj4gwqANCj4gLXN0YXRpYyBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgcG1pY19yc3RfcmVzdGFydF9u
YiA9IHsNCj4gLQkubm90aWZpZXJfY2FsbCA9IHRwczY1MjE5X3Jlc3RhcnQsDQo+IC0JLnByaW9y
aXR5ID0gMjAwLA0KPiAtfTsNCj4gK3N0YXRpYyBpbnQgdHBzNjUyMTlfcmVzdGFydF9oYW5kbGVy
KHN0cnVjdCBzeXNfb2ZmX2RhdGEgKmRhdGEpDQo+ICt7DQo+ICsJdHBzNjUyMTlfcmVzdGFydChk
YXRhLT5jYl9kYXRhLCBkYXRhLT5tb2RlKTsNCj4gKwlyZXR1cm4gTk9USUZZX0RPTkU7DQo+ICt9
DQo+IMKgDQo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCByZXNvdXJjZSB0cHM2NTIxOV9wd3JidXR0
b25fcmVzb3VyY2VzW10gPSB7DQo+IMKgCURFRklORV9SRVNfSVJRX05BTUVEKFRQUzY1MjE5X0lO
VF9QQl9GQUxMSU5HX0VER0VfREVURUNULCAiZmFsbGluZyIpLA0KPiBAQCAtMjY5LDEzICsyNzgs
MjIgQEAgc3RhdGljIGludCB0cHM2NTIxOV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50
KQ0KPiDCoAkJfQ0KPiDCoAl9DQo+IMKgDQo+IC0JdHBzLT5uYiA9IHBtaWNfcnN0X3Jlc3RhcnRf
bmI7DQo+IC0JcmV0ID0gcmVnaXN0ZXJfcmVzdGFydF9oYW5kbGVyKCZ0cHMtPm5iKTsNCj4gKwly
ZXQgPSBkZXZtX3JlZ2lzdGVyX3Jlc3RhcnRfaGFuZGxlcih0cHMtPmRldiwNCj4gKwkJCQkJwqDC
oMKgIHRwczY1MjE5X3Jlc3RhcnRfaGFuZGxlciwNCj4gKwkJCQkJwqDCoMKgIHRwcyk7DQo+ICsN
Cj4gwqAJaWYgKHJldCkgew0KPiDCoAkJZGV2X2Vycih0cHMtPmRldiwgImNhbm5vdCByZWdpc3Rl
ciByZXN0YXJ0IGhhbmRsZXIsICVkXG4iLCByZXQpOw0KPiDCoAkJcmV0dXJuIHJldDsNCj4gwqAJ
fQ0KPiDCoA0KPiArCXJldCA9IGRldm1fcmVnaXN0ZXJfcG93ZXJfb2ZmX2hhbmRsZXIodHBzLT5k
ZXYsDQo+ICsJCQkJCcKgwqDCoMKgwqAgdHBzNjUyMTlfcG93ZXJfb2ZmX2hhbmRsZXIsDQo+ICsJ
CQkJCcKgwqDCoMKgwqAgdHBzKTsNCg0KLi4uIHdoaWxlIHRoaXMgdHJhbnNsYXRlcyB0bw0KICAg
ICAgICByZXR1cm4gZGV2bV9yZWdpc3Rlcl9zeXNfb2ZmX2hhbmRsZXIoZGV2LA0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1lTX09GRl9NT0RFX1BPV0VSX09G
RiwNCi4uLiBtaWdodCB0aGlzIGJlIGFuIGlzc3VlPw0KDQplbnVtIHN5c19vZmZfbW9kZSB7DQoN
CltdDQogICAgICAgIC8qKg0KICAgICAgICAgKiBAU1lTX09GRl9NT0RFX1BPV0VSX09GRjoNCiAg
ICAgICAgICoNCiAgICAgICAgICogSGFuZGxlcnMgcG93ZXItb2ZmIHN5c3RlbS4gSGFuZGxlcnMg
YXJlIGRpc2FsbG93ZWQgdG8gc2xlZXAuDQogICAgICAgICAqLw0KICAgICAgICBTWVNfT0ZGX01P
REVfUE9XRVJfT0ZGLA0KDQoNCj4gKwlpZiAocmV0KSB7DQo+ICsJCWRldl9lcnIodHBzLT5kZXYs
ICJmYWlsZWQgdG8gcmVnaXN0ZXIgcG93ZXItb2ZmIGhhbmRsZXI6ICVkXG4iLCByZXQpOw0KPiAr
CQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4gwqAJcmV0dXJuIDA7DQo+IMKgfQ0KDQotLSANCkFsZXhh
bmRlciBTdmVyZGxpbg0KU2llbWVucyBBRw0Kd3d3LnNpZW1lbnMuY29tDQo=

