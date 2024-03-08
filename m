Return-Path: <linux-omap+bounces-846-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE835875F2F
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 09:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D62C1C20F84
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 08:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD30BD29E;
	Fri,  8 Mar 2024 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="VF2RzTFV"
X-Original-To: linux-omap@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2040.outbound.protection.outlook.com [40.107.105.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E786E1D699
	for <linux-omap@vger.kernel.org>; Fri,  8 Mar 2024 08:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709885534; cv=fail; b=oY239WcZyEz//rF/R+LV5Jk00rb5mlyuZ0sWJaJyOSXMNRiU7W6Of3PnYYafYOdw/fdr+99NT+CEon6LVvfyxdTEZuddTlFann376Q1mpEmwRcAvCp4aMx53yym7D5hXwFW6qzBwbjJMd5XU7HLdjO3LC4MDK2qJqvgwmpweA0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709885534; c=relaxed/simple;
	bh=lbmgZ0NmdFH3sEcA7r5vv3RViEABhbVId5SG9k1mq9c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jj246qVVBq/qonXuLNccdRnJTHTVbX2GLcUyS9oXflBlMMBb+08lI1+OUx4JhhltiyKF0dSv8neJp7hrp2eIK12G/HueEVnRf2nQMJOmbX4aG8UrwSYMGkyhzWI5VITs/u2cRJTkaQ846LnGcSDypG8JV7IN/GtCeyZFfnPeHMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=VF2RzTFV; arc=fail smtp.client-ip=40.107.105.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYf41PvxYPTJCpQt6ndn/Gs0gMMYyM3X8KBrsOABxIqvHN6elFaYrp1BVDDxUYgk7YF2NTTyUioumwSzsFzgrAh2sUlNrd/KPvhWP4cy/zuRoOHeYWoM/wU+p758NAEr1FsZRGwEvJfZvMuAlqhgbk61oNnuLTl+35wuXeCPtCeIdUE4QP5nlHp9d/bMPvCOtqxiAG+K09Fk2jcHkZJGrRnonICYP4wQ6Dc97IgfZ/eTNx4gjHt8XdKEuRK6DwUadxeKs3qhEq4MCp2ODCfquJddtQj1H3Ad+EfwQqTu+FjtvPi7OY+Jv09tD/f9s0/Xsmoze0M7ATer/LFa7VprzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbmgZ0NmdFH3sEcA7r5vv3RViEABhbVId5SG9k1mq9c=;
 b=bjCaBCxIq8RmZp0PtIjBDXFnLNZWr/eJ+0ZWDPkM2GsSmC43vP4Y9pMLAC8LNgWIvh26W0ZwyfJxyjhz+jOyHKPIK7sp5E9MFsvPfhAqPl03d28478vnbva4Lgds9D/T17123671Wh9mrSHOuItT4PGIHx71PcgURroGtFi3n3Bd4Pf8wG5847qLZasrCatnqCsNelHnDki2N8Z6EVoGPE0/TPwkU4qvZVyaqIqj+2EJ3VQF1dZJbFXZaSiU9TEwGfaVDrrNxjtI3uyOqK5WbrMeAPfTzQPrvVIdujIF4hklVqMTlK2bh5awOf28fBmrM8rj/wO/uSwBbxLNadyxaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbmgZ0NmdFH3sEcA7r5vv3RViEABhbVId5SG9k1mq9c=;
 b=VF2RzTFVoIVFyiqdD3nRoSwl9AKEgOWJsFqDVC0uhrSlcXoAMrrP/TaYSFlIWBQlIAc5so4vmIH9VTwggDJalvRjzE3HzXDpVzrad3F24nrQD3TAaLDX6lu2ZpwYLqysQhDIMYWFOHrIRnxpdIeDM7OGUMhUDsPfFSfW7ka8S/NhUSLQSXn2GW5sVD/YTogjFnK8zJAaoo+8i1DFBb8VdU4cTL4ezgseWGdhYG3zRHAyc9p575aWhZIOfRYTgtjwNeaYB7qozsF+Xc/BEhyt9be//XPE0rFAR20oPICQYg8YEeW2i4jwxmEepQpzbInjeichBSMLgxMBuCwxiL4BwA==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:135::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.28; Fri, 8 Mar
 2024 08:12:06 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ab67:6d35:16b1:81c8]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ab67:6d35:16b1:81c8%3]) with mapi id 15.20.7362.019; Fri, 8 Mar 2024
 08:12:06 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "tony@atomide.com" <tony@atomide.com>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "rdunlap@infradead.org"
	<rdunlap@infradead.org>, "Michel, Matthias" <matthias.michel@siemens.com>
Subject: Re: [PATCH] ARM: OMAP2+: prm33xx.c: Fix kerneldoc warnings
Thread-Topic: [PATCH] ARM: OMAP2+: prm33xx.c: Fix kerneldoc warnings
Thread-Index: AQHacSssTa6RjWJk+kWolG5EpMmnQ7EtfkcA
Date: Fri, 8 Mar 2024 08:12:06 +0000
Message-ID: <76858ea8f840cf32aa43b7c9fa5d1ea5ed431d27.camel@siemens.com>
References: <20240308073501.3699-1-tony@atomide.com>
In-Reply-To: <20240308073501.3699-1-tony@atomide.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AM7PR10MB3640:EE_
x-ms-office365-filtering-correlation-id: 08d3a29c-98d6-4ad9-43c3-08dc3f47720f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vyxPO83m3UroADJqmLjs2Ad8/cRUcYMRO4g6imtCwjerUsAOuzwAVx3hu9dIfrKmcf0ydH2/qKjAby6ALrsuwyLUe6/Y7/LcmJBbEehh/GrdiD8mm+Ni/nx5AzMWoVf4VsBe4UomY+v11eB18qWS/BSVkJrWyZBvM/1HMzRMhPYhrSsRJzo3CE2xFgURcj7DmHYN3JmGJTkct/FLol42DXfIrIeXuBzOtwXzrpTXFfvAWq2dz8emHWlUJzAuBim6iELq6XH/hUuYC+DSM/P3ihX9hksa87KQ+1FV5RZoRObXLoB3fnniQbLhi7gpUWl5+n2MPSd/3pzlX+dqX25AA8E1VlBvxXuaPwx6AJCCaQ0HoQ7L1TdxNPUHQYwqfvSMfiXQiq4tV0P3vTW07YE7ySMPdOM8yeK4P47MK5kX6FyO/Ud0/KFjNuQRgqMWuhv62dCIgXEvxTOP1Kgv3fb5ikOZbFuOzVKPR1UfZKWkWDYEtyy8BuI2CdEWLQThT/J2RUsA1buGXoRjhrlp6f9XoG4u7ApxX9E3Zaf68JK2foyei8D3YT0pTs0vnKJKw4HC65viRndYwob/OL6lYJu5YNGViZADaW9DEMr70228SXWVcomCUQtn5sJDsz0R1BHJblV1skmh4Fz+IWZFZjexdKVLNCidggvlu7iF2xCUAWg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHB2Z3pwNk9TVHFaT3ROVzJWSnk1UUNQbTk4UDdVSnhDM2xuSWRMdFFpOEtn?=
 =?utf-8?B?SkxSZk4zUUtVQ2N3RThEb0twbVl1cElLZWpHNzhtSFlMLzIvdVBiMk9tR1hX?=
 =?utf-8?B?VWl4YkhzazZ2TzY4eVRwY1RhaTQxZFc1UHliZTdybHBjSU90MmRIQnBHY1BS?=
 =?utf-8?B?SGdjemsyRmVrUmV3NjBsL084NXo2TmJuL01TRzh5VnhQVDI0OWJtcVgzK2sx?=
 =?utf-8?B?Vy9Yei9WelNTWXl2UEFOcUVuN01zOXhWZlUrVC9wN0xvYmFCTzIraC8vdVR0?=
 =?utf-8?B?czBJcVIzRFZ2M3FuYkFubHVCMjRGZzJHTWY5KzQvVFllTHBsSlpHL21NTXpC?=
 =?utf-8?B?d3pZZUh2UGJzN2EvZnR3UUpzZTVaMERjZm1rc0xaZXZkazdwank1VkZGTCsx?=
 =?utf-8?B?WmVMZ3U5Vm5rWXlkU2hWRkJGc2RNRkRnazdTTWd3MjZxWUpKNXg5Z1gyaG5o?=
 =?utf-8?B?ekQ0UnJjWjFUd0JBek0yVU5NMnMxYTJmV1J1ckNSWCs0U25YRzdnNW43V05s?=
 =?utf-8?B?NmRndzlGODlZZ3JYQ2V5dHpkS05ZdUFJeG5kY2NXaG0wYU40aXlVL2UwRE1q?=
 =?utf-8?B?cDkzL2tXak1veHVPOFJ0eHduNmVoT1VBYXFoTzFsNkdsbkcwZkE0NUREaHB3?=
 =?utf-8?B?aFBsTGdyY09xSzFXalRyYjZMSjlwaElUMzUvcFkvcm1XMFNIUlJEZjllSnhn?=
 =?utf-8?B?T2szcUc3dFI0OWpGNEtxQjRZSVV6UitLTG8yaG1QYnV6dkhHdm1GaEdMZDZj?=
 =?utf-8?B?ZjNzeXhoQ2d2K1VxQUxhb1B3MDdFTWZvWk55aWEvTDdSdi9ZdDI2RWM1NjAr?=
 =?utf-8?B?QVJXUldvZjYyZmg4eUtqTVdlZGhpR2hPUEJ1eDQ4RXpFakZmeFNEaFJuVUlT?=
 =?utf-8?B?NnFhcDF6T1ZGTjNhdk1ldkFiQWdFUVlmVGlna3pZM2hSRjM2ZG14eFhyMHVX?=
 =?utf-8?B?cE1rRWk4U0ZnYi9NRzRVeTJNeFpOc1Zab2RDQTFkZXRrNlVMSkRMblNPUE9h?=
 =?utf-8?B?YUZobi9oZDhiSnhOSFFjcTdtZ2I5NzUwRzRKUTU2TWI4MnlMTloxbnVWUlUr?=
 =?utf-8?B?eFdkd3ZEN2VRM2E2bzVQSGhPT2VRSmN1S0pIdFFFZ3FqWDVyMmlTYm9uT09U?=
 =?utf-8?B?Ti9BRmtjSU0ycW13ZVE3Tk5tUkxyaENaNVpBQ2xxeFJRS2RHdzRJanlSYTcw?=
 =?utf-8?B?cDFrVFE5RHU0ZEJQMzdmVjhpRit1SS9tMHFhWG1hcDgzaWNIUnNpWWdjT0p5?=
 =?utf-8?B?QUFFTHA1cHlMYkZkYkYvTHYyS2V2ODNOR2pnYWYyZXRsQk9UUGhxR2ZqTHdo?=
 =?utf-8?B?eDlWWGVZRFgxZmZOR0JINmJtTk1teVErc1FPaEd3aFhVbWVqTXlMWXJJY1VZ?=
 =?utf-8?B?cjI2QVJQRjdyc0RVOCtoc1oxZ1hLaDF1VlpPY2JKY0VtUU1qNWZnS2QxSEhj?=
 =?utf-8?B?VEJUQ2wwbmRhQThRR25hUmtBRzdac0MwVzQvVmhYUlFBRC9ES09PSnA5dGRQ?=
 =?utf-8?B?bVN5M0NlV2ZFTlhEZFFtZHpER3M3eFNBR2lpTEhnanc2N2tlVUhrTmVDdFJW?=
 =?utf-8?B?RnpzWVZQa2JHVzdUbFBJNEwvL1YvZk5WR3ZGOXV4eWpOZGwzMVNnQXZUNVNw?=
 =?utf-8?B?V0JDSlhWbm1xZllmeWs2OStqWm4zU0VENWpFcnphT2NGTjRTMGtGOHpmMmJL?=
 =?utf-8?B?cEtLb1FjTnZMaHVkTzFPcnM2bWtLdlJWeW1nWTY5YVoxRHJLWTNxSC94eWRF?=
 =?utf-8?B?ZkN2bFpOdXNIY0ZycWVJcHdwUExmQU1lSXFmYWFxZVhuWGtJSVJrcXBvcXpC?=
 =?utf-8?B?OTZvSWRVNzhRQ2Z1Ymd3c1pIc3FmSGh4TmNQOHNjUGZlbEp0ajlOYnZSS1FW?=
 =?utf-8?B?ZTA3amdES2Q1NW9NMS9UY0U0a2FtYWYzZW9mTjBCQm5IWXRxQndrQ2NUS0I5?=
 =?utf-8?B?djY1NEhkb1kxRzF5ZlJsRkNWZVVlRmxVRzhobTdYNkdia2pMbnI1NTRIcEZa?=
 =?utf-8?B?aGUxeHVraHdrYUljUWFwcEpBYlZNR295V0gvakg1U1N1ejVYbE5JeTZWbnBC?=
 =?utf-8?B?azh5Zjkram1jL0VWMW8xRnBZM3R4V1lxYnhJZVdJMUs2NGlvRngrQzJkeDFo?=
 =?utf-8?B?c2JzajNxd25HSm1BYVhBaDhBY1JzVncrTXZsVkZmKzk1Qnl4UlpwU01mOEJ1?=
 =?utf-8?B?RmFLVk5TbnVobnpiaWR0bmhHWXFIQ25hR0tMeU9NTzVlRjJoYWJNaFMrb21s?=
 =?utf-8?Q?7ccfR5/Jh31IfuKaqrHJ/TPKfTSaU2hyF8Je63SHuk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <16CDA525C678CE4AA405101CC3012968@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d3a29c-98d6-4ad9-43c3-08dc3f47720f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 08:12:06.8246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1A7fV+Bh8BWqQVVVk5FjrEMTW9NzwzY6THQeEqLd68Uexa2rXcktO59n69YmrYM+rLr43YYJot6xlGI9yweEP1n7xRhTl/bpPeY6fA8NidM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3640

SGkgVG9ueSENCg0KT24gRnJpLCAyMDI0LTAzLTA4IGF0IDA5OjM1ICswMjAwLCBUb255IExpbmRn
cmVuIHdyb3RlOg0KPiBDb21taXQgNjUyMWY2YTE5NWM3ICgiQVJNOiBBTTMzeHg6IFBSTTogSW1w
bGVtZW50IFJFQk9PVF9DT0xEIikNCj4gYWRkZWQgYSBuZXcga2VybmVsZG9jIHdhcm5pbmcgYXMg
dGhlIGZ1bmN0aW9uIG5hbWUgY2hhbmdlZDoNCj4gDQo+IHdhcm5pbmc6IGV4cGVjdGluZyBwcm90
b3R5cGUgZm9yIGFtMzN4eF9wcm1fZ2xvYmFsX3dhcm1fc3dfcmVzZXQoKS4NCj4gUHJvdG90eXBl
IHdhcyBmb3IgYW0zM3h4X3BybV9nbG9iYWxfc3dfcmVzZXQoKSBpbnN0ZWFkDQo+IA0KPiBUdXJu
cyBvdXQgcHJtMzN4eC5jIHByb2R1Y2VzIGEgZmV3IG90aGVyIGtlcm5lbGRvYyB3YXJuaW5ncyBz
byBsZXQncw0KPiBmaXggdGhlbSBhbGwuDQo+IA0KPiBGaXhlczogNjUyMWY2YTE5NWM3ICgiQVJN
OiBBTTMzeHg6IFBSTTogSW1wbGVtZW50IFJFQk9PVF9DT0xEIikNCj4gQ2M6IEFsZXhhbmRlciBT
dmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQHNpZW1lbnMuY29tPg0KPiBDYzogTWF0dGhpYXMg
TWljaGVsIDxtYXR0aGlhcy5taWNoZWxAc2llbWVucy5jb20+DQo+IENjOiBSYW5keSBEdW5sYXAg
PHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogVG9ueSBMaW5kZ3JlbiA8
dG9ueUBhdG9taWRlLmNvbT4NCg0KTXkgYmFkISBUaGFua3MgZm9yIGZpeGluZyB0aGlzIQ0KUmV2
aWV3ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQHNpZW1lbnMu
Y29tPg0KDQo+IC0tLQ0KPiDCoGFyY2gvYXJtL21hY2gtb21hcDIvcHJtMzN4eC5jIHwgMjIgKysr
KysrKysrKystLS0tLS0tLS0tLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCsp
LCAxMSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLW9tYXAy
L3BybTMzeHguYyBiL2FyY2gvYXJtL21hY2gtb21hcDIvcHJtMzN4eC5jDQo+IC0tLSBhL2FyY2gv
YXJtL21hY2gtb21hcDIvcHJtMzN4eC5jDQo+ICsrKyBiL2FyY2gvYXJtL21hY2gtb21hcDIvcHJt
MzN4eC5jDQo+IEBAIC00OCw4ICs0OCw3IEBAIHN0YXRpYyB1MzIgYW0zM3h4X3BybV9ybXdfcmVn
X2JpdHModTMyIG1hc2ssIHUzMiBiaXRzLCBzMTYgaW5zdCwgczE2IGlkeCkNCj4gwqAgKiBAcGFy
dDogUFJNIHBhcnRpdGlvbiwgaWdub3JlZCBmb3IgQU0zM3h4DQo+IMKgICogQGluc3Q6IENNIGlu
c3RhbmNlIHJlZ2lzdGVyIG9mZnNldCAoKl9JTlNUIG1hY3JvKQ0KPiDCoCAqIEByc3RjdHJsX29m
ZnM6IFJNX1JTVENUUkwgcmVnaXN0ZXIgYWRkcmVzcyBvZmZzZXQgZm9yIHRoaXMgbW9kdWxlDQo+
IC0gKg0KPiAtICogUmV0dXJucyAxIGlmIHRoZSAoc3ViKW1vZHVsZSBoYXJkcmVzZXQgbGluZSBp
cyBjdXJyZW50bHkgYXNzZXJ0ZWQsDQo+ICsgKiBAcmV0dXJuOiAxIGlmIHRoZSAoc3ViKW1vZHVs
ZSBoYXJkcmVzZXQgbGluZSBpcyBjdXJyZW50bHkgYXNzZXJ0ZWQsDQo+IMKgICogMCBpZiB0aGUg
KHN1Yiltb2R1bGUgaGFyZHJlc2V0IGxpbmUgaXMgbm90IGN1cnJlbnRseSBhc3NlcnRlZCwgb3IN
Cj4gwqAgKiAtRUlOVkFMIHVwb24gcGFyYW1ldGVyIGVycm9yLg0KPiDCoCAqLw0KPiBAQCAtNzAs
MTQgKzY5LDE0IEBAIHN0YXRpYyBpbnQgYW0zM3h4X3BybV9pc19oYXJkcmVzZXRfYXNzZXJ0ZWQo
dTggc2hpZnQsIHU4IHBhcnQsIHMxNiBpbnN0LA0KPiDCoCAqIEBzaGlmdDogcmVnaXN0ZXIgYml0
IHNoaWZ0IGNvcnJlc3BvbmRpbmcgdG8gdGhlIHJlc2V0IGxpbmUgdG8gYXNzZXJ0DQo+IMKgICog
QHBhcnQ6IENNIHBhcnRpdGlvbiwgaWdub3JlZCBmb3IgQU0zM3h4DQo+IMKgICogQGluc3Q6IENN
IGluc3RhbmNlIHJlZ2lzdGVyIG9mZnNldCAoKl9JTlNUIG1hY3JvKQ0KPiAtICogQHJzdGN0cmxf
cmVnOiBSTV9SU1RDVFJMIHJlZ2lzdGVyIGFkZHJlc3MgZm9yIHRoaXMgbW9kdWxlDQo+ICsgKiBA
cnN0Y3RybF9vZmZzOiBSTV9SU1RDVFJMIHJlZ2lzdGVyIGFkZHJlc3Mgb2Zmc2V0IGZvciB0aGlz
IG1vZHVsZQ0KPiArICogQHJldHVybjogUmV0dXJucyAwIHVwb24gc3VjY2VzcyBvciAtRUlOVkFM
IHVwb24gYW4gYXJndW1lbnQgZXJyb3INCj4gwqAgKg0KPiDCoCAqIFNvbWUgSVBzIGxpa2UgZHNw
LCBpcHUgb3IgaXZhIGNvbnRhaW4gcHJvY2Vzc29ycyB0aGF0IHJlcXVpcmUgYW4gSFcNCj4gwqAg
KiByZXNldCBsaW5lIHRvIGJlIGFzc2VydGVkIC8gZGVhc3NlcnRlZCBpbiBvcmRlciB0byBmdWxs
eSBlbmFibGUgdGhlDQo+IMKgICogSVAuwqAgVGhlc2UgbW9kdWxlcyBtYXkgaGF2ZSBtdWx0aXBs
ZSBoYXJkLXJlc2V0IGxpbmVzIHRoYXQgcmVzZXQNCj4gwqAgKiBkaWZmZXJlbnQgJ3N1Ym1vZHVs
ZXMnIGluc2lkZSB0aGUgSVAgYmxvY2suwqAgVGhpcyBmdW5jdGlvbiB3aWxsDQo+IC0gKiBwbGFj
ZSB0aGUgc3VibW9kdWxlIGludG8gcmVzZXQuwqAgUmV0dXJucyAwIHVwb24gc3VjY2VzcyBvciAt
RUlOVkFMDQo+IC0gKiB1cG9uIGFuIGFyZ3VtZW50IGVycm9yLg0KPiArICogcGxhY2UgdGhlIHN1
Ym1vZHVsZSBpbnRvIHJlc2V0Lg0KPiDCoCAqLw0KPiDCoHN0YXRpYyBpbnQgYW0zM3h4X3BybV9h
c3NlcnRfaGFyZHJlc2V0KHU4IHNoaWZ0LCB1OCBwYXJ0LCBzMTYgaW5zdCwNCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB1MTYgcnN0Y3RybF9vZmZzKQ0KPiBAQCAtOTYsMTcgKzk1LDE4IEBAIHN0YXRp
YyBpbnQgYW0zM3h4X3BybV9hc3NlcnRfaGFyZHJlc2V0KHU4IHNoaWZ0LCB1OCBwYXJ0LCBzMTYg
aW5zdCwNCj4gwqAgKiBAc3Rfc2hpZnQ6IHJlc2V0IHN0YXR1cyByZWdpc3RlciBiaXQgc2hpZnQg
Y29ycmVzcG9uZGluZyB0byB0aGUgcmVzZXQgbGluZQ0KPiDCoCAqIEBwYXJ0OiBQUk0gcGFydGl0
aW9uLCBub3QgdXNlZCBmb3IgQU0zM3h4DQo+IMKgICogQGluc3Q6IENNIGluc3RhbmNlIHJlZ2lz
dGVyIG9mZnNldCAoKl9JTlNUIG1hY3JvKQ0KPiAtICogQHJzdGN0cmxfcmVnOiBSTV9SU1RDVFJM
IHJlZ2lzdGVyIGFkZHJlc3MgZm9yIHRoaXMgbW9kdWxlDQo+IC0gKiBAcnN0c3RfcmVnOiBSTV9S
U1RTVCByZWdpc3RlciBhZGRyZXNzIGZvciB0aGlzIG1vZHVsZQ0KPiArICogQHJzdGN0cmxfb2Zm
czogUk1fUlNUQ1RSTCByZWdpc3RlciBhZGRyZXNzIG9mZnNldCBmb3IgdGhpcyBtb2R1bGUNCj4g
KyAqIEByc3RzdF9vZmZzOiBSTV9SU1RTVCByZWdpc3RlciBhZGRyZXNzIG9mZnNldCBmb3IgdGhp
cyBtb2R1bGUNCj4gKyAqIEByZXR1cm46IFJldHVybnMgMCB1cG9uIHN1Y2Nlc3Mgb3IgLUVJTlZB
TCB1cG9uIGFuIGFyZ3VtZW50IGVycm9yLA0KPiArICogLUVFWElTVCBpZiB0aGUgc3VibW9kdWxl
IHdhcyBhbHJlYWR5IG91dCBvZiByZXNldCwgb3IgLUVCVVNZIGlmIHRoZQ0KPiArICogc3VibW9k
dWxlIGRpZCBub3QgZXhpdCByZXNldCBwcm9tcHRseQ0KPiDCoCAqDQo+IMKgICogU29tZSBJUHMg
bGlrZSBkc3AsIGlwdSBvciBpdmEgY29udGFpbiBwcm9jZXNzb3JzIHRoYXQgcmVxdWlyZSBhbiBI
Vw0KPiDCoCAqIHJlc2V0IGxpbmUgdG8gYmUgYXNzZXJ0ZWQgLyBkZWFzc2VydGVkIGluIG9yZGVy
IHRvIGZ1bGx5IGVuYWJsZSB0aGUNCj4gwqAgKiBJUC7CoCBUaGVzZSBtb2R1bGVzIG1heSBoYXZl
IG11bHRpcGxlIGhhcmQtcmVzZXQgbGluZXMgdGhhdCByZXNldA0KPiDCoCAqIGRpZmZlcmVudCAn
c3VibW9kdWxlcycgaW5zaWRlIHRoZSBJUCBibG9jay7CoCBUaGlzIGZ1bmN0aW9uIHdpbGwNCj4g
wqAgKiB0YWtlIHRoZSBzdWJtb2R1bGUgb3V0IG9mIHJlc2V0IGFuZCB3YWl0IHVudGlsIHRoZSBQ
UkNNIGluZGljYXRlcw0KPiAtICogdGhhdCB0aGUgcmVzZXQgaGFzIGNvbXBsZXRlZCBiZWZvcmUg
cmV0dXJuaW5nLsKgIFJldHVybnMgMCB1cG9uIHN1Y2Nlc3Mgb3INCj4gLSAqIC1FSU5WQUwgdXBv
biBhbiBhcmd1bWVudCBlcnJvciwgLUVFWElTVCBpZiB0aGUgc3VibW9kdWxlIHdhcyBhbHJlYWR5
IG91dA0KPiAtICogb2YgcmVzZXQsIG9yIC1FQlVTWSBpZiB0aGUgc3VibW9kdWxlIGRpZCBub3Qg
ZXhpdCByZXNldCBwcm9tcHRseS4NCj4gKyAqIHRoYXQgdGhlIHJlc2V0IGhhcyBjb21wbGV0ZWQg
YmVmb3JlIHJldHVybmluZy4NCj4gwqAgKi8NCj4gwqBzdGF0aWMgaW50IGFtMzN4eF9wcm1fZGVh
c3NlcnRfaGFyZHJlc2V0KHU4IHNoaWZ0LCB1OCBzdF9zaGlmdCwgdTggcGFydCwNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgczE2IGluc3QsIHUxNiByc3RjdHJsX29mZnMsDQo+IEBAIC0zMTUs
NyArMzE1LDcgQEAgc3RhdGljIGludCBhbTMzeHhfY2hlY2tfdmN2cCh2b2lkKQ0KPiDCoH0NCj4g
wqANCj4gwqAvKioNCj4gLSAqIGFtMzN4eF9wcm1fZ2xvYmFsX3dhcm1fc3dfcmVzZXQgLSByZWJv
b3QgdGhlIGRldmljZSB2aWEgd2FybSByZXNldA0KPiArICogYW0zM3h4X3BybV9nbG9iYWxfc3df
cmVzZXQgLSByZWJvb3QgdGhlIGRldmljZSB2aWEgd2FybSByZXNldA0KPiDCoCAqDQo+IMKgICog
SW1tZWRpYXRlbHkgcmVib290cyB0aGUgZGV2aWNlIHRocm91Z2ggd2FybSByZXNldC4NCj4gwqAg
Ki8NCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcNCnd3dy5zaWVtZW5zLmNv
bQ0K

