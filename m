Return-Path: <linux-omap+bounces-3443-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FF3A685B7
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 08:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45C66881B67
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 07:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A142D211A28;
	Wed, 19 Mar 2025 07:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="F3yt8KZl"
X-Original-To: linux-omap@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013042.outbound.protection.outlook.com [52.101.67.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4475D2AEE3;
	Wed, 19 Mar 2025 07:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742368731; cv=fail; b=exmsY4JMNS6qvaZmdrmnez7QyAYxFPG7P8yn3fwwdD4vKO4sRcDvFrrde0o5951Og7R89iI6Q22e/60VPgZduV1pGBmFVTFmVsYnV0J+tJhLWVUi1JxiEM1FH9LqLLPGeXmnLmjxC90Tlz970X0jsQRYx6hpV8wm00k73MtLRIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742368731; c=relaxed/simple;
	bh=wzft9ijR2F+RxQvSB7X6dUplV3xoDcG1EA3+MPJzhlI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C+pEsUuVQ991t4TRPLnBvePgq8c7Crt9viMp6V1hfVtl9dvVVZGj3spyWwwh35RPutvqlIpO9nD0JMQj61RPf2bdpKfSfH5LwOg4Z7QdjOoYPQAPz0bZ2xNvOg8Pw8F2uTQNdMFfd9/+yNEl/tX+godbys9N9Ecnigjes33jc+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=F3yt8KZl; arc=fail smtp.client-ip=52.101.67.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwG2BXeRDXtozxp7Sw0rEaMkMSBP96uy/yhdncl48YsrDwOF8LErJQTwf960aptNTJmmZup2L56SjtLOkGtldo1skFbuMpStnP8UnMLkwjxOq/HE6TSLNayA6daf7s7JV59w7h6kZR+I2t+hdO226DoFXml52UwasJtR6/H/2yMeA/8P3NEF+LzkJLIPrcKp5w/RsUnH+quv41uXj9CeCWw6hHSaxRTK9iMud9Nlz55Vyx0L2JnulKv6jxLPKSb55RGW9wPIS59s4XE2Fp4zFN3jcJkMzPcfC+upH4HEvlY4Aq0Xtorw1mXPJWWd+3MgURDe8jRlxJAfwQyR4tsKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzft9ijR2F+RxQvSB7X6dUplV3xoDcG1EA3+MPJzhlI=;
 b=WHPPjJCchzfgOd6fAd1wYDWYhJb13arPmHjXqZOWvKlCShmeeVXZlTHmTvL9y32DX90gjP/WY2NxedI8lwsHw5T7j6vXH9WQURw01KMneJRnxL4e5awtVi3Tk9/RYBhx9aB8+LurUFRbr/V1X9yAUaRVcICen15ftaWJBkirvI9wnafKR7wo2YzWrgw6cdy449yE7zJOAkydI1Yhi80eru+n9oiYl5HRo+pSF05ojebdzKlOooykAsIWeKcolau8mliOAkKtkJaplziGqmjAL0u7a7ikjr+RAuaABfO+qT8b+Bv0gF31wcaSyFpOcrcIfxe2msAubOiWHupTdA3Cvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzft9ijR2F+RxQvSB7X6dUplV3xoDcG1EA3+MPJzhlI=;
 b=F3yt8KZla9splQNgfJZxn3pbOJqiTtfn1Tybb9F1L/ByT1UWXnt0qzF8FUG7UbonQezYq7nRTtWuUxDhocMvyLIsuoc2V8+lBWzBo8iv8TOfmKIPO6Hc6Tf/UmR8SumLPHAgMb2ZFiJubrqNq7zamb3aBEs2BJftMDzd7OKz6WjJg0IkijbEB16XTtluhyCJznJxzLBsLZmLaYo0yB8rtxUU2JvMCg0+U9FWKhCvO/qn4Hu6L0cCYO8AnQjfs6gjwnvRRizyFjw8nVmmho9uyUZedWwdA8aw6iMhS8MkuxgExSTI0ef5k8sxeka4WlFDNOnLrnf87l4VdYz/2MtKAA==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PAWPR10MB8282.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:388::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 07:18:46 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 07:18:45 +0000
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
Thread-Index: AQHbk/znYu6FpepAZ06TMJZ5wavTxbNxckSAgAAWmQCAABYxAIAIPqYAgAA4n4A=
Date: Wed, 19 Mar 2025 07:18:45 +0000
Message-ID: <54d8461660c0910398b8bc5695f28446f8318ebd.camel@siemens.com>
References: <20250313094708.1003092-1-alexander.sverdlin@siemens.com>
	 <20250313202129.0dcfc44e@akair>
	 <6348326299702a12ed4faa6ea25ee8bbe5e232aa.camel@siemens.com>
	 <20250313230148.792f224b@akair> <20250319035606.GA4957@atomide.com>
In-Reply-To: <20250319035606.GA4957@atomide.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PAWPR10MB8282:EE_
x-ms-office365-filtering-correlation-id: 08fe3c62-4f08-47ad-c7c9-08dd66b64969
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L1ZETkxFQlNSNWF6WmtmclVEdHlucnZnd3lvUCt1M0kxRHkrVnJBYTBCTzNZ?=
 =?utf-8?B?SFVUVjFpRGU4Z21NUDFaa2YwQUQvRExpdzRBeENpSVpjdGRnQTFudzBJWTA1?=
 =?utf-8?B?S2FCVzhITGtGNEcxNDM5dUE5elZzdXhlMXgxbXdSUk9sSUlWVGVYR1Nxa0Fm?=
 =?utf-8?B?ektPN250emp6UGkybWZwbEZDdGFHeHJ1K0pjUWpHMzRtaStEbCs0dmtZdmN4?=
 =?utf-8?B?MXdXMG83VmlhOVgxZnc3QTg0TDZkdkN4N2xiV0VVRDRmQVhQeCtRc2k3WTlJ?=
 =?utf-8?B?a3h3YUUxMEYwYXlvWkZNalZkcVRUM2h6NUI0eFVDZUNsNkpvVVlWN0FkdzZT?=
 =?utf-8?B?cCtyZCs1WE9GcVNEc1VIbTRHMlA1andvU3ZRT2hoWDRiSHNtdlNzbUxqYTVN?=
 =?utf-8?B?MnMwcjMzckZFaHRYOE1HS2Z0Uk5ocDF3TjAwK0h4MVJsVzZGd0c0OEJUR0pt?=
 =?utf-8?B?NDlrNk5iQjZ4azJqQU03Q0MvQXg3T0FzVGJzK2FHbC8vR1ZtNlllclRsR09x?=
 =?utf-8?B?NzRiUlVnUHdHYjRGTXNnMGVsT1U1OUozdXc4YVB5ZndoTnVXWkZQdFA0SnlY?=
 =?utf-8?B?aXVUMDNzS3Nhb0duMVFjMmpTaG1Wc200TEMwN2lOQkZPTVFPRDNGVzVJVUk0?=
 =?utf-8?B?NnZqNTN3cXBEdlQ4cTRWVTl0ZGErWExnUDk2YUMvSEtuZkhtY3I4eUpGdmVN?=
 =?utf-8?B?ZmZkelphVGxpSVV3Q09TNlRZcmZsT0NnalJ5V2NHZTM4MXdKTmRaM1gvMkcz?=
 =?utf-8?B?Zks5UkhFOGVLcTQ5dEtLWExycXlpMTlvemE2QjJ1WGNjMWUwRUc1MU5FZ0Zy?=
 =?utf-8?B?YWZSRkFyTXIzWi9GYjBjaVBMRE1IcHVJYWNXeUFHempvNFN3S0ZEZU5vbFpB?=
 =?utf-8?B?bFkvSTFUblBqSkwzVGVCTEZOcFgvQ2hqQi85MFdRSTVKSHJqRnUyTi9zb3JL?=
 =?utf-8?B?aVJWa3BONFEydXFCNUZRT3RNMy9QQVI3a3l4NkJRMGhRNkh1dUg4L241Vk96?=
 =?utf-8?B?OHJ2bWFmclF0ZklDcmxOL2FsZDdRR2FNRFl4c1NqeHA2ZDBUUDNUVGxYQmpr?=
 =?utf-8?B?N0NvbXBoQXJBaFBndktKbW5vSU9YSDZ1QUxnRnB1NmhSeUpCU2hTN2FDVDNw?=
 =?utf-8?B?RlVMUTNzY0xMSUtuMXNnams4THZwNjRSLy9XV1pRZW1qVit1ZFhjWmtxNUdH?=
 =?utf-8?B?UHdoSUozVUdVWHROUlA3Z2NNTEs3ZU1PTHAwK0txR0lLd0l4WE12WUpBS2xN?=
 =?utf-8?B?TjlNNjFNVXVJaWNYWU1VVGE3MFdjNFRJQkw4aTgzV3RMV1B4ekRTNEZudXpv?=
 =?utf-8?B?V0FNb21ScTU3MTZnR0VpSVdpbkwvWTRaYUtsTk1ldEFtR1lrS3pNdHdlNzM0?=
 =?utf-8?B?SlpMSGEzYngyL1Q1L1l2dDJxTWdCUmJnTlAzdng1VERhT2NmV3VqYjNidENJ?=
 =?utf-8?B?cjdJM0ErVS9FemJ3dFZvaGphVllQS2VHTUhZaklvUWpxcHZ4NUJxU25PUDBL?=
 =?utf-8?B?ZnhjWnZ3d1BvaVdjRjRuUlRrNlNoTEFsUStaVFZEUGJ6V1FJd1JBMzZnd3k2?=
 =?utf-8?B?MWxvNmd1WG5selNiMGthZnBPU0lHSEp2V1pYWTBYYmdobUpsTDlTTkMwYk11?=
 =?utf-8?B?RnpJWXpRVGhLanpIQUpwdjFkVGd1bzlsdUlESjQxSXJacmtKeDJmSkdUOENa?=
 =?utf-8?B?UmZxTnplcUU5OUw4WXZKcmt4RnhrNklqQkYwS25aVHVQaVl3N1d6UGlscTFp?=
 =?utf-8?B?VTVoMzIybkZldHZ6VzJnaWVYS1ljWEhXb2swSXZXT0ZVTjE1VFc3bnFvSU4x?=
 =?utf-8?B?Sk5wRm1DdktSdjZXMjJVbDVURzVybXl5VE1DZnJ0c1p6WlArSkMrL0NiVVBs?=
 =?utf-8?B?NzduUDlucyswZHkyUmFXRjV3T25JRlZINkdrbjVlM2prbVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cjRoUklRai8yY3JMY2tOUnVneU10OE1pRWpENWNuVUd4bTlnQkJyMy9CcFZT?=
 =?utf-8?B?TVNpY25HUG03VVpPemtYMFBCQlNMYnNrSEhsSTZDOW4wUGxieEVURlp4YTFv?=
 =?utf-8?B?SXpIcStMVmdkZzJnQ1dpMWFuOUhwSzBJY3RObjBGZVBPVUFDWTNlaEFHcjR6?=
 =?utf-8?B?UmZqS1ZkcjNCdDBKYUcwNi8zTlNCM3N3NlBnNkp0NE56YVlDQ3BwNkVjVWM2?=
 =?utf-8?B?cDhMeGVTYzN6T01JbHVZWDQ4bTRSd2hsdFk0OFRBMlNWVzZCYzJaZVpjQURn?=
 =?utf-8?B?T0JZMGZaTGpvZlhOUVYwbE9yVmdsa2xNMWV0eE5aQVMzc2gyWTczcFV5SWFx?=
 =?utf-8?B?aHVkWmVhbzRBYVNNaGV6SkRBVmhJa05wVUhHUlU2RjUvVjRhMk5UQ2xIenQ1?=
 =?utf-8?B?VXcvUmdWWmVsNmhoSEFTKzZQQ1VWeHByVElBWG40a2ZjcjNLTTYvcjRqN0hr?=
 =?utf-8?B?eS9aYUZUVmw2VUloNEx3SGRCWmVZSmVHZCtiMnJHaGNYM1dnYkNOVXo0ZGw4?=
 =?utf-8?B?Q095RmljUUVOclM3bzczSWVwWStWdGhVNllkdmJGdEhUQ3YyMlliNTBpektU?=
 =?utf-8?B?RFJOWnJ3QlViNjNHZlBNdGNsTVpablBvT3AyM08veEhVSzc2MjZzT3RtSmI1?=
 =?utf-8?B?SDh5VEVQUnM5YnNGZGc2Rk5GblRnYnNpNkhmRnVCeGIveVQvM0pHNXpLbGpK?=
 =?utf-8?B?ZklGU2dUdjVxa0ZTQytmSDBUT3I5U09TVSt6K2tWUDRlUWtwRDRuOFJqTHlw?=
 =?utf-8?B?SWh6bU9FUEVrdk1HcXlTWU9lbmU1aUNoREZpYm9wTXJEQngzd3pNVWtXd0ty?=
 =?utf-8?B?QU90RVJPaEtYK1Q3OVhGbGRTbWFOS3hqUDNla0UzM0dETHI3TStKaHo0Q3hH?=
 =?utf-8?B?VkJRQnlvNHlrTjM4RmxRU1p2STZYbXdCQUtCbGZ4N1FZbks0TEFzckFKVzFr?=
 =?utf-8?B?YlZGZFBmbS9wQmgrVjJKdHI5STBNN21sbFVTMEdyV254UUV1Q2lDRkI3VStX?=
 =?utf-8?B?c2U2dk9sVG1BR0wwVlY5QWxJVjVOa1VyYkpndDc2ZGdDNWFldkdCelJIVFEr?=
 =?utf-8?B?RnB1dWs1ZTM5NFUzamowYnNCdWRHeFdoeEFuWTNIYzF5TCtVbWs2QmR1ZmtT?=
 =?utf-8?B?bnhEbFhvQms2dHYwTTllRHFrYVM4U09GcVpkbTU2Nkp6T2lBMGJ5VHdyL3dU?=
 =?utf-8?B?T3dRTDVUdHdvdXpYcnVxT2xvNG9GUEUrUWpkeHZSKzJGVkNyYWlHS0RLSXJY?=
 =?utf-8?B?NEVnMVVFckc4Z1lvdjZOdVpjUURpSHA0MDhZczBIQWJXSW9ZK244TUlUVEZz?=
 =?utf-8?B?dVRLYmxleU9KYXlseVpxMWJMbmZKN0hQaEdMb0xoRTZ2ai9lVURrM3pwQVIz?=
 =?utf-8?B?VGx0eW5tLzFZQWkxNXdwTDZZelFLanpqdHM0SjNFd3hudjZoTTRIdkVtWTh1?=
 =?utf-8?B?cWtCeE5WSk8yOTg0Ti9PYVA3eVhTOHdjY3V2T0E2K1l6OUxWN2VKcmJEbFRh?=
 =?utf-8?B?VGVTeDFyaFZtd3JGczA3VHNlNmpVOHpMaittcDRlbzA2T1F6UElFbVoxd1pO?=
 =?utf-8?B?TTZmNWhoUkoxeERXc0pScFhmQTlWRHB1RUEvSXNvbGNtcGRyOGdXRmVVdy9Z?=
 =?utf-8?B?NFFFN0JhM2pjSU13WXhIeURrZUlwRjd2UEZueVUvRkRTT2pMRW92SitSOGJL?=
 =?utf-8?B?ZVlISWdRR3UzNFJBelJNVXJNN1IvTGhWZ1B4aC9mbTJkOVFlK0pjM2tCYVU0?=
 =?utf-8?B?ZnV4N3ZOV0M2ZHVqRUtrNHFJamtqdkVxdVBCdG5CT3JraVNXajlGU3BZMmlN?=
 =?utf-8?B?TGtqcS82UmVoOEJmQ1FwL0dKYkFCUEZiTFVFdkUrVXdrRHJjS3F2SVNMZW9M?=
 =?utf-8?B?dmpzU0N0aS9yNytmUkV6MldaWjdFaGNsNjV3R0d2Y0QzTnVHc3VGSWplNFJi?=
 =?utf-8?B?dlhRNkNOTWhRVTJ2dWNRbElJczFZUVZURC8xZHJvbTFTdlZlQ1ppMFg3Tk82?=
 =?utf-8?B?TjFwVG1CZy93SThRVVNFNnVScVFMUjA0ZDZrMWFMV2hNWGdUT0hsVVhobkFj?=
 =?utf-8?B?RE9KZEFHUUpCN3kzelFaT3NKWmtTZkt5cmluT3VwK1M0Q09saXlYNGFrSFlz?=
 =?utf-8?B?M2R3cEIvRVA3aW90eEE5Qlk4M2huSUJWOXg4aTBYZjJnUGpmdkpHRTZlSWhn?=
 =?utf-8?Q?KRJoWyEsLrIjY6Ecp3ldAiQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6486E550DC74814D9B940741AB1F8A17@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fe3c62-4f08-47ad-c7c9-08dd66b64969
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 07:18:45.7832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I5TZsXuQzED48ITSe3uMHWjneuEUOMlN5NtV0v/t7gdjSPNhA+gE7NoiAXpHDbF6gYWRRm1Nm9+pb7R03H85Qq8KzKDP3jwmqC9KfdkGEwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8282

SGkgVG9ueSwNCg0KT24gV2VkLCAyMDI1LTAzLTE5IGF0IDA1OjU2ICswMjAwLCBUb255IExpbmRn
cmVuIHdyb3RlOg0KPiA+ID4gPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgNDcwMGEwMDc1NWZiNWE0
YmI1MTA5MTI4Mjk3ZDZmZDJkMTI3MmVlNi4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJdCBicmFr
ZXMgdGFyZ2V0LW1vZHVsZUAyYjMwMDA1MCAoInRpLHN5c2Mtb21hcDIiKSBwcm9iZSBvbiBBTTYy
eCBpbiBhIGNhc2UNCj4gPiA+ID4gPiB3aGVuIG1pbmltYWxseS1jb25maWd1cmVkIHN5c3RlbSB0
cmllcyB0byBuZXR3b3JrLWJvb3Q6DQo+ID4gPiA+ID4gwqDCoCANCj4gPiA+ID4gYnJha2VzIG9y
IGJyZWFrcz8gVG8gdW50ZXJzdGFuZCB0aGUgc2V2ZXJpdHkgb2YgdGhlIGlzc3VlLi4uwqAgDQo+
ID4gPiANCj4gPiA+IFRoYW5rcyBmb3IgdGhlIGNvcnJlY3Rpb24sIGl0IHNob3VsZCBoYXZlIGJl
ZW4gImJyZWFrcyIuLi4NCj4gPiA+IA0KPiA+ID4gPiA+IFvCoMKgwqAgNi44ODg3NzZdIHByb2Jl
IG9mIDJiMzAwMDUwLnRhcmdldC1tb2R1bGUgcmV0dXJuZWQgNTE3IGFmdGVyIDI1OCB1c2Vjcw0K
PiA+ID4gPiA+IFvCoMKgIDE3LjEyOTYzN10gcHJvYmUgb2YgMmIzMDAwNTAudGFyZ2V0LW1vZHVs
ZSByZXR1cm5lZCA1MTcgYWZ0ZXIgNzA4IHVzZWNzDQo+ID4gPiA+ID4gW8KgwqAgMTcuMTM3Mzk3
XSBwbGF0Zm9ybSAyYjMwMDA1MC50YXJnZXQtbW9kdWxlOiBkZWZlcnJlZCBwcm9iZSBwZW5kaW5n
OiAocmVhc29uIHVua25vd24pDQo+ID4gPiA+ID4gW8KgwqAgMjYuODc4NDcxXSBXYWl0aW5nIHVw
IHRvIDEwMCBtb3JlIHNlY29uZHMgZm9yIG5ldHdvcmsuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
QXJiaXRyYXJ5IDEwIGRlZmVycmFscyBpcyByZWFsbHkgbm90IGEgc29sdXRpb24gdG8gYW55IHBy
b2JsZW0uwqAgDQoNCi4uLg0KDQo+IFJldmVydGluZyB0aGUgY29tbWl0IGRvZXMgbm90IHJlYWxs
eSBmaXggdGhlIHJvb3QgY2F1c2UuIEl0IGp1c3QgaWdub3Jlcw0KPiB0aGUgcHJvYmxlbSBvZiB0
aGUgaGllcmFyY2h5IG9mIHRoZSBpbnRlcmNvbm5lY3QgaW5zdGFuY2VzLiBTb21lIG9mIHRoZQ0K
PiBpbnRlcmNvbm5lY3QgaW5zdGFuY2VzIGFyZSBhbHdheXMtb24sIGFuZCBjb250YWluIGRldmlj
ZXMgcHJvdmlkaW5nDQo+IHJlc291cmNlcyBmb3IgdGhlIG90aGVyIGludGVyY29ubmVjdCBkZXZp
Y2VzLiBTbyBJIHdvdWxkIG5vdCBjb25zaWRlcg0KPiBwYXRjaGluZyBNTUMgYWxpYXNlcyBhbGwg
b3ZlciB0aGUgcGxhY2UgYXMgYW4gYWx0ZXJuYXRpdmUgdG8gZml4aW5nIHRoZQ0KPiByZWFsIHBy
b2JsZW0gOikNCg0KSSBzdXBwb3NlIHlvdSBzdGlsbCBoYXZlIHRoZSB0ZXN0IGNhc2Ugd2hpY2gg
ZGlkbid0IHdvcmsgZm9yIHlvdSBiYWNrIHRoZW4/DQpCZWNhdXNlIGluIHRoaXMgY2FzZSBJIGNv
dWxkIGhlbHAgeW91IHdpdGggcHJvcGVyIG1tYyBhbGlhc2VzLg0KDQotLSANCkFsZXhhbmRlciBT
dmVyZGxpbg0KU2llbWVucyBBRw0Kd3d3LnNpZW1lbnMuY29tDQo=

