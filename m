Return-Path: <linux-omap+bounces-3389-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C49A602E0
	for <lists+linux-omap@lfdr.de>; Thu, 13 Mar 2025 21:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 559AE19C20F8
	for <lists+linux-omap@lfdr.de>; Thu, 13 Mar 2025 20:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DA41F4622;
	Thu, 13 Mar 2025 20:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="L+/EB4rY"
X-Original-To: linux-omap@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2057.outbound.protection.outlook.com [40.107.104.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C08042AA9;
	Thu, 13 Mar 2025 20:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741898548; cv=fail; b=dFv9eqUn4KsNhyLDl8BCEq1KqzTo65zpmm+zcpZzDyvGgb+oX+cNyVAuJ29lBFlUPfQtTP4NXL5ZdX6AIGvEEvOPZd6gvZ2z9srxhzNMSrJUHsmXWEguqTqs/kea8Mb+AsHSYm/IuvR9MPxZPnt+LaPKN606L6NU2fR/c6R1BlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741898548; c=relaxed/simple;
	bh=HjFU8a5QHCj23Au+WzxBlrBVDL18vAtRf8vdemjcXSg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kw3bjBdOz0AjJZTW3oCiyebkTiVv1s/QGWBa4gYA9/SRMSmmkbdsXt9/nGYnupQIN7P47KSdpzvq6eL/1euoX/GeMk7zR1l90Ljb3nkoufZz3oR/bjY32J5o4EhPqFkmUfo1tZkYKbNMiAL0OmRIb+t6UfKfIxzcmkg56F1MW1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=L+/EB4rY; arc=fail smtp.client-ip=40.107.104.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNkxSToBcA40Cwh+BNZKPJEyN38Cb+s2GFIUrKUaLTjFTlTByuhLdTJP1uq2goBsCuwfV0I90os6hozsq/H05p+0jcEUI9bCICI1kSj64WXnkqI/NjSNtJK11nmXss932YwjGF5PHR8kOUWIVMWP/kd1T63Kw7hSXMskStzt1YGB/tsUFWvLgkeL64kZY0JomzKVxdfl/vX42erJVg6cXiU0Lq9twv2aCPkU1eZ6arwnOW37LyDT798+xc0BGbDfLqKSUKeygImozxRjnYZC9k/01DMgeKaoCnq460PY509hkVWw36192+KAIWBiaSvczSMPsduSNYl+exbyhP61HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjFU8a5QHCj23Au+WzxBlrBVDL18vAtRf8vdemjcXSg=;
 b=N410Fi7Q2ras2N5zzaO9VDD5aDM59LjwrbuGDuJeL5gFjums4pNLDplDBBKnrl3oUxj/bPqyIWBR0dqM2Tc5QpPG4JXPfd82qz1yb9wXxhXRsPfhLfL6g9l1dhOmfwE0ytPLWVp2QcenbtYMwp96vmOfwmnISQkYSCN+n3P0s9Tp4XrVDrjdGa+GZrlpRlKdXU5Zroo7rfIcDDDdZTRHp2O5LcSKKKea7RMKp5aLGv/7hINZRj5mC6TXyiCWnWRWoQ8MAl2a0KzrpyuQAXMPsTHtoMI97kxI4+XohfB8m3ZDtFLVe/6s0X5gH9/dCqudr0yIwApcB1Ld5mnDoxIF2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjFU8a5QHCj23Au+WzxBlrBVDL18vAtRf8vdemjcXSg=;
 b=L+/EB4rYw40zFE+EAdNptWzdHfUeYyTfKOYovNBrZ+rgLaGK/QX3jPxBCpgS8DAp4wyeaGpWAiw7UGp9vrZbmIRecQ9fV6MBDQD6eVgkeDs2zgpAXv+KIXESJNsax7yegX4r+BQKXbsxUzLz5Cheu+uFF/JzeiGKPvH5kGxxcWqOAS3PGN0fF8D3E7k7TlAsVdvlFudvescdNmbamczzejLukV8nbSmLG/kFirY4jUI0ekPPywlVQg9ewwqYLNuWSQaExLuz1kTgk15JrMVY3tLiv1rt4iXrhUg6RfBu1gYW8A3cUiVe1S1dHztJgKa9th9gX+E06376frcSOH1FNQ==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PAXPR10MB5206.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:276::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 20:42:23 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8534.024; Thu, 13 Mar 2025
 20:42:23 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "andreas@kemnade.info" <andreas@kemnade.info>
CC: "rogerq@kernel.org" <rogerq@kernel.org>, "tony@atomide.com"
	<tony@atomide.com>, "aaro.koskinen@iki.fi" <aaro.koskinen@iki.fi>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>
Subject: Re: [PATCH] Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg
 interconnect devices first"
Thread-Topic: [PATCH] Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg
 interconnect devices first"
Thread-Index: AQHbk/znYu6FpepAZ06TMJZ5wavTxbNxckSAgAAWmQA=
Date: Thu, 13 Mar 2025 20:42:23 +0000
Message-ID: <6348326299702a12ed4faa6ea25ee8bbe5e232aa.camel@siemens.com>
References: <20250313094708.1003092-1-alexander.sverdlin@siemens.com>
	 <20250313202129.0dcfc44e@akair>
In-Reply-To: <20250313202129.0dcfc44e@akair>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PAXPR10MB5206:EE_
x-ms-office365-filtering-correlation-id: f6fa105b-72ae-4906-5aef-08dd626f8efa
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RzRZSUJoMmt0bTFoNU0yMXBhZnMxSExaOGJwY0RuUUZsVnQwNzZ1Uzl4bTQ1?=
 =?utf-8?B?UkljTm5TQmVTemtma3oxNCtBWGFVa2RXSXVOR3BZLzA3YXJseDFGWTRKeHFF?=
 =?utf-8?B?YVJobnVBb25aY2xOWDB2U1JGN04yR2FyaThCSTV4K0oxeGczT1FLRFZQZ2Nz?=
 =?utf-8?B?SU9maHcxTUxxbXJNaGlCRXc4eG5zWkM5eFlwWFE2R3lOVHVsYzRiS2RwN3lR?=
 =?utf-8?B?T1BzM2ZFVytrNXdEd0w4aFhoQ2s3UkdPdEtaMk9UdjRjYWFZODcwa1F3bE4y?=
 =?utf-8?B?VXdLbm4xcUdEaFRvVHIxQ1M3Y3d1WWEzWHE3d0lvd0VQVEVDbWQ2bU9jN3N4?=
 =?utf-8?B?VndBZmNhL1FWNmQwZ1dYNEI5SkpTbjNUKzN0TVJLYnlZdWxLOUFubVlvSVVj?=
 =?utf-8?B?OStRQkNSYzRCQ3Q1VUt5MGM0SE0zbUdpckVlYitMSHJSQVBpdjV4c25QYWlG?=
 =?utf-8?B?azB5VUY2ZTJ6Nlh5ek54aGRHKzVsZFRRcWFsSm14anFrWHVyaEZwRzBPbGsx?=
 =?utf-8?B?ZDQ4YmRaakpEVzJ6WmZkQlk1N1hpaTIvZk1lTDRlK2RBeXA2am9lckNHdmR1?=
 =?utf-8?B?R2hOTjJrMVRYMUpvMzdieW9EQUJWcEREL0tESzA2VUoyUnpqYUh0TU5oTCtE?=
 =?utf-8?B?eFhiQTE0TUZtRURWVjMxUXNOSGhuWG5LMTd6VmJUaFl5UzRDdi9aQVVyc2RF?=
 =?utf-8?B?Mi9WRG9hWlRGcVRnenRmOFNFaGl2ZFIybUFrZzh6RnhZTmVzRWJMckxUWVVn?=
 =?utf-8?B?UVNNOE1BNTNRcWlHUlpWMzhlOEIwYVdPM0krdHk1WHBCZVdQMEtmQXl2TitS?=
 =?utf-8?B?NUdzaXBONGt0djBsTG5BN1BOZzRoZmZXaTBkbXlGdUg1RW4xMFZLOGFqTDBQ?=
 =?utf-8?B?SWh2MWJWdEZQVGdHem5EMTVlTnRkR3h1NzFuRVc5dm1wQnlJZDh2cVB4WWVS?=
 =?utf-8?B?c0FWdkhBVnQ2dWtSbHZDL3BKclJwVjROTFJHRlFyaFVUMUFqaU5YK3RHM1hz?=
 =?utf-8?B?dENiVG93VHNsUmJQazNOWGUvMHNnVTdzemFVbEhnZzVZTnQxMWs5MzNoSStU?=
 =?utf-8?B?TUxzb2tXdlp2MWJmbnlsODV4RDZldGtxblhpbVNqNGlnYnpTWGVhbVN0clRI?=
 =?utf-8?B?Z3hxNUJvVkdkSUt3LzUxalB3WmhOa1dHYjcyUGQya2gyNElqYXB6SHIyNVh3?=
 =?utf-8?B?WkJYRXR5dFpnVnhKeGNkZitXNGFTSmtROVRRWkx6OUZpSVY4VGJ6KzNQZkFl?=
 =?utf-8?B?eHo5eGJRVG0wMjU5VURYdHZpS2IzQ1NwUWdxU0VYdzhlUTZ2S0MrRElGaktP?=
 =?utf-8?B?WWYrV2EvcHRtS2tHNUQzZ1NhbFAzdnZVbTFWK29UMTRnL0ZmNi9FTGJTNytY?=
 =?utf-8?B?YlEvbFAwOVkyUWhvMUxob2ppSmxKdHlxQkdKaHlLNExiR2xtdzNLQkJaVXJX?=
 =?utf-8?B?dWxIL0ZJNjhJTjVlMXc5RTNVYzd1Nk93UG9YdTd6YkpOMnJYM0ErLzJmS0I3?=
 =?utf-8?B?OG9qeWt3STRDejkwLzF0RXNTZ3dLMTkyWkpwSEF5bkFNekYrV2JWMEI4YTB2?=
 =?utf-8?B?VjU1Ukt4YUpHMGhmZGtHbnBWK0E0dnVqYkpYZEJBTU9YelRLb01TRGdyc3g5?=
 =?utf-8?B?TjMyTi9NNXJGZElwVVNCU215cm41OFVCU08vSmltT0xVb0NWN083UGt1Tmo5?=
 =?utf-8?B?NG1KWmR0b3VqdVZQVlpzdjM4bFI4ekFnbS9jRlFrQWxiRXU0Z053RkZ2OHkx?=
 =?utf-8?B?WC9BNjZaNHE5OUZkYmlITjV2Wmo3ZTN4dFc1a05YaWIzT3NhUGxGN1dRN0dp?=
 =?utf-8?B?R21DMFhtOEtpVXB3LzJ0aUJiblV0dk1xMXZPZ0RDSjRYc3pUeE1rem1QRmM1?=
 =?utf-8?Q?Zz+AsDOb6r63X?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T1IxTE01cVRhbTlOL3kyN1QydVlZRE5jUjVGeU4rVEYyTUhOdmV1WkVSY1B2?=
 =?utf-8?B?NlA1U1czQ0NWNmlNU2JoVFl6djFLVjV1RFBRRTJHRzZGclhoNFBDMlFqb1ZD?=
 =?utf-8?B?emwyMUlOTDBveXFPUzhqemtOOEhxMWJMV0hMSmk2VzZvbmM3ekFyS3FIdUxl?=
 =?utf-8?B?Q21wSVFHTnBXZDU5bjBlNTNoZWtxaXRYSFJRV25nTUZxVDFCWHNxYWxtMC9W?=
 =?utf-8?B?YjFSNXZscTlPcWsxcS9vTE9XTUNIVzNPNXRobFl3N1djNEpyREhuRXlUNmdJ?=
 =?utf-8?B?ZTlCdnViRndoaDdpNVIyVUExbnJBTHNJNjJ3cFFrdEgwR2h3UTBrd29HQ3c0?=
 =?utf-8?B?WTl0WFI0QmcyRXJLVmpPcFhPZDlvUnFJdWRaZEtxZ3I2UVlzNGhSYkkxK1J6?=
 =?utf-8?B?NWcwRjBiUmlTZVJEdFo0N1NMempqTnpvTjgxSGxEc2ZMVlpqWDU0QURHeENF?=
 =?utf-8?B?MlhPTktNQjdjc3FjLzA3dWpVSXhRRWJuWFZKVVFobExSaGhvWGN1WjhIR3E2?=
 =?utf-8?B?WVVXZ2lkdlpCNTNmcWlKNGRLcThMSVE5YjN2UGtHYkVReW0zVVZ5cmtKbXNO?=
 =?utf-8?B?eTdRdys3M1l3UWpVZU5KNFNCdUVhYWI5cVVJakRsNkZpSVExMzNKdWo3eVA2?=
 =?utf-8?B?NmtnakZ6dGYwSzBMR2F3RHlNMVNKQ2YvZGR6VXFVR05WOWEyNFNudEtaY2c0?=
 =?utf-8?B?Uy9oV2hXd3VRNU9MWlRZUWNjbTZsbGZXMGcwQ3A2UGF0ZmcwN1J6RzM5bkdM?=
 =?utf-8?B?K0dxSm9pcTFxMXM0QUt4U2gxRmRidEJGV3hhODloME10WlJSZWlGYlBsdTFO?=
 =?utf-8?B?MENUbXJhdldEcjZSbXM0OWxDMG5nVnJibDIxK0dFZ3hSOFp2blR6MmNKaEp1?=
 =?utf-8?B?Z3lxclVlUXVaWEVLOThIcWZnVXQ4eldzWENnTzVSV01xbGxWRXJ4TVptTUlz?=
 =?utf-8?B?b255K1lqZjJ3dUR4OEZSN0VteHJJZ1pCWElTVXJlaHFnbEcrQStCWG5sT0U1?=
 =?utf-8?B?UEt2MjU1MDBuYkR0ZjRlZExLSitLdzRENlF1R0JheVFQRU1YNm9DWTlIYm93?=
 =?utf-8?B?TmU1OGJDZ2g3UWtmNU1ra2JXL0NydW1Bb3ZPSTN1alBaTWF3c1Q2NDBtb1Ns?=
 =?utf-8?B?NWNnZlJkRUJGL0E1VkF4ZXhqMnIzMGkvR0lxcjI1bnM0cEZGY3NrM1Y1OEFD?=
 =?utf-8?B?M08vNHhwNzNYMUovTHJLUUxvcjFUQWNkRHlVbFYxM0g0SjJCVUVQWXRuSXM5?=
 =?utf-8?B?R0xtMnYvRXhPZWdKYzUxTGhzSHFYdHJXMjVLbk0wWEFMa1F1ejRrM3RZaVZ4?=
 =?utf-8?B?Qjkzcml6Q3BsQkJtT0xxbjVwQm5IdGY5VnJRMHVHditnYlJncW5qcnYva0Jw?=
 =?utf-8?B?ODZpcWpvY2k4YkdlR01CNFJJK1BrSjkzc0NvbW9XcHM5cDJFRC9MRjcvdWhs?=
 =?utf-8?B?OUdCYVJZK0lMVDE2a0xDaHlFMDN5WVFzcFljWG54SGlSN2R0OHpoV3YvYlFC?=
 =?utf-8?B?cjErRVlSTFhTV1ZyekNNN1I5VGwwSGt3Um5pWEJBcEZjbXExS3F6UUxSNlNv?=
 =?utf-8?B?eHcvOVR6STN1MVd2RnQvTnNuQWhSUnVYbGY1WEZ3cXdUTUM1SnVZWWtGU3dF?=
 =?utf-8?B?NERDMVhFQ3RqRUsrYlZ2RmlGaUhaM2xia1UwTWRFZEVyak9WUmRXWEMrZzRK?=
 =?utf-8?B?K0Y1Y3BjaHZpUXV1ODBDN3lnZDNoam05bW9zVldFMTEvakU3T0plN016NFFE?=
 =?utf-8?B?Nk5KdlNKbmRnb3pYVUNqaFhtY0kyRi9uc2gxVlRSeXJMRzcrdURKelp3dDdG?=
 =?utf-8?B?UGo4V0dzVEJIYWJLbzVUSnYwTWdOVExXeTgraHhWNkVlS2RXUVpPMThSdjJW?=
 =?utf-8?B?b3huWUxGUzhiU0EzV0xGMzJYMXpVVE04MUNJV1F1VStHTFp1amNHczZ2TVVr?=
 =?utf-8?B?U3BtYlcxOGJNeVVyaTdmbnRLdHpBMkQvL1VJbW9sL0p4VTkvQzRjb0JsZmw1?=
 =?utf-8?B?VklJdUw2ZTd0NXpDWEpIeFJoaW5oVWFmNUJLL3BnOEQ1TnI1NWdkQTU5aFZ4?=
 =?utf-8?B?VTFpV1JodWdtSERsTTNmMUtWWTMxdTZTeXd1TEJJajNrelRSbE80dXlPYnFP?=
 =?utf-8?B?cXpoWTN6Ti9hOTl4YWR4OHFHSXpPOU01dEU2SWcyQmNKMXdSRGxsNURVa093?=
 =?utf-8?Q?toDYLQR+sVV4PaRRkIOLIig=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <193B1252E2FD8B4496E55141AF66F755@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f6fa105b-72ae-4906-5aef-08dd626f8efa
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2025 20:42:23.5766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zCAxuF0e1EhylByLFhDUiI7QFuoGf8ysP0iQ87jxobEj19CPZJJt+a5D43pUTiBcFN0ZM9D+/hHR1S0TxxCVlLOtfi67/Ll01LcfO/wKgVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5206

SGkgQW5kcmVhcyENCg0KT24gVGh1LCAyMDI1LTAzLTEzIGF0IDIwOjIxICswMTAwLCBBbmRyZWFz
IEtlbW5hZGUgd3JvdGU6DQo+ID4gVGhpcyByZXZlcnRzIGNvbW1pdCA0NzAwYTAwNzU1ZmI1YTRi
YjUxMDkxMjgyOTdkNmZkMmQxMjcyZWU2Lg0KPiA+IA0KPiA+IEl0IGJyYWtlcyB0YXJnZXQtbW9k
dWxlQDJiMzAwMDUwICgidGksc3lzYy1vbWFwMiIpIHByb2JlIG9uIEFNNjJ4IGluIGEgY2FzZQ0K
PiA+IHdoZW4gbWluaW1hbGx5LWNvbmZpZ3VyZWQgc3lzdGVtIHRyaWVzIHRvIG5ldHdvcmstYm9v
dDoNCj4gPiANCj4gYnJha2VzIG9yIGJyZWFrcz8gVG8gdW50ZXJzdGFuZCB0aGUgc2V2ZXJpdHkg
b2YgdGhlIGlzc3VlLi4uDQoNClRoYW5rcyBmb3IgdGhlIGNvcnJlY3Rpb24sIGl0IHNob3VsZCBo
YXZlIGJlZW4gImJyZWFrcyIuLi4NCg0KPiA+IFvCoMKgwqAgNi44ODg3NzZdIHByb2JlIG9mIDJi
MzAwMDUwLnRhcmdldC1tb2R1bGUgcmV0dXJuZWQgNTE3IGFmdGVyIDI1OCB1c2Vjcw0KPiA+IFvC
oMKgIDE3LjEyOTYzN10gcHJvYmUgb2YgMmIzMDAwNTAudGFyZ2V0LW1vZHVsZSByZXR1cm5lZCA1
MTcgYWZ0ZXIgNzA4IHVzZWNzDQo+ID4gW8KgwqAgMTcuMTM3Mzk3XSBwbGF0Zm9ybSAyYjMwMDA1
MC50YXJnZXQtbW9kdWxlOiBkZWZlcnJlZCBwcm9iZSBwZW5kaW5nOiAocmVhc29uIHVua25vd24p
DQo+ID4gW8KgwqAgMjYuODc4NDcxXSBXYWl0aW5nIHVwIHRvIDEwMCBtb3JlIHNlY29uZHMgZm9y
IG5ldHdvcmsuDQo+ID4gDQo+ID4gQXJiaXRyYXJ5IDEwIGRlZmVycmFscyBpcyByZWFsbHkgbm90
IGEgc29sdXRpb24gdG8gYW55IHByb2JsZW0uDQo+IA0KPiBTbyB0aGVyZSBpcyBhIHBvaW50IHdo
ZXJlIG5vIG1vcmUgcHJvYmUgb2YgYW55dGhpbmcgcGVuZGluZyBhcmUNCj4gdHJpZ2dlcmVkIGFu
ZCB0aGVyZWZvcmUgdGhpbmdzIGFyZSBub3QgcHJvYmVkPw0KDQpCZWNhdXNlIHRoZXJlIGlzIGEg
cG9pbnQgaW5kZWVkIChpZiB3ZSBjb25maWd1cmUgcXVpdGUgbWluaW1hbCBzZXQgb2YgZHJpdmVy
cyBqdXN0DQplbm91Z2ggdG8gbW91bnQgTkZTKSB3aGVuIGRlZmVycmVkIHByb2JlcyBhcmUgbm90
IHRyaWdnZXJlZCBhbnkgbG9uZ2VyLg0KDQo+ID4gU3RhYmxlIG1tYyBlbnVtZXJhdGlvbiBjYW4g
YmUgYWNoaWV2ZXIgYnkgZmlsbGluZyAvYWxpYXNlcyBub2RlIHByb3Blcmx5DQo+ID4gKDQ3MDBh
MDA3NTVmYiBjb21taXQncyByYXRpb25hbGUpLg0KPiA+IA0KPiB5ZXMsIGl0IGRvZXMgbm90IGxv
b2sgbGlrZSBhIGNsZWFuIHNvbHV0aW9uLiBBbmQgd2UgaGF2ZSB0aGUNCj4gcHJvcGVyIGFsaWFz
ZXMgbm9kZSBpbiBtYW55IHBsYWNlcy4gV2hhdCBJIGFtIGEgYml0IHdvbmRlcmluZyBhYm91dCBp
cw0KPiB3aGF0IGtpbmQgb2Ygc2xlZXBpbmcgZG9ncyB3ZSBhcmUgZ29pbmcgdG8gd2FrZSB1cCBi
eSB0aGlzIHJldmVydC4gU28gSQ0KPiB0aGluayB0aGlzIHNob3VsZCBiZSB0ZXN0ZWQgYSBsb3Qg
ZXNwLiBhYm91dCBwb3NzaWJsZSBwbSBpc3N1ZXMuDQo+IA0KPiBOb3QgZXZlcnkgZGVwZW5kZW5j
eSBpbiB0aGUgc3lzYyBwcm9iZSBhcmVhIGlzIHByb3Blcmx5IGRlZmluZWQuDQoNCkJ1dCB0aGUg
cGF0Y2ggSSBwcm9wb3NlIHRvIHJldmVydCBpcyByZWFsbHkgbm90IGEgc29sdXRpb24gZm9yIG1p
c3NpbmcNCmRlcGVuZGVuY2llcyBvbiBzeXNjb25zLiBJJ20gZmluZSB3aXRoIG5vdCBwcm9wYWdh
dGluZyB0aGlzIHRvIHN0YWJsZSwNCmJ1dCByZXZlcnRpbmcgaW4gbWFzdGVyIHNob3VsZCBnaXZl
IGVub3VnaCB0aW1lIGZvciBvbGRlciBTb0NzIHRvIHRlc3QsDQpXRFlUPw0KDQotLSANCkFsZXhh
bmRlciBTdmVyZGxpbg0KU2llbWVucyBBRw0Kd3d3LnNpZW1lbnMuY29tDQo=

