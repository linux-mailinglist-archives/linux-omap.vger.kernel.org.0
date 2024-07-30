Return-Path: <linux-omap+bounces-1800-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3397940CFA
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jul 2024 11:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F0411F237CA
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jul 2024 09:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875941940A9;
	Tue, 30 Jul 2024 09:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="Gb0tI+6s"
X-Original-To: linux-omap@vger.kernel.org
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1428F189F53
	for <linux-omap@vger.kernel.org>; Tue, 30 Jul 2024 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722330462; cv=none; b=rgUJe3H+FURDfH5I1wQEeRsDnaQdUZt45pOmTJZsz4cup0ChIUMTm8B90VIHgPrQM3vx0Pcv2WpccxHmcOkKbb5l4mI0LHGJeO/ElSyErEZVxK9bD2SI25xSIUBi7e7iX5EiqOMDpwQPKIO4tLcUeTiX3psxnISerGMzaB9GgWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722330462; c=relaxed/simple;
	bh=PLhk1EpwlzHmkHgyj2Bqc9fWXJkejbFREOWukE5rPx0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MSoderlSs25UAYSXO5s+5GGzDnJKBxTJPX12EJn+C+FTZhFkom2MA3qqQXkl4hnV/4cebJ7C3nMlqb+Svpv7rT4qcJUBH3oo/UXkooUKQLLdMRKZ6mrJAfJkYy0ORtwaMII2z+GJkk/fAMpuNgPx0m6m5qurOQiSBEPicGxFebk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=Gb0tI+6s; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1722330449; x=1724922449;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PLhk1EpwlzHmkHgyj2Bqc9fWXJkejbFREOWukE5rPx0=;
	b=Gb0tI+6skL5UucebokqR/SAXVA6wP5qTOmEOhfHZTH7LNA9bY80lBsC+o6sipnTs
	MchKNPO9eedDvW4Opp7NBCIQr4hJZu1IvIZ9p9iHXHH7GjC7cmazmUQxOnK+lglK
	3c4woc1Wjnbh8FbEdsr85p24geq1rOH0eTu7weRGw2M=;
X-AuditID: ac14000a-03e52700000021bc-3d-66a8ad50f08d
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 3F.ED.08636.05DA8A66; Tue, 30 Jul 2024 11:07:28 +0200 (CEST)
Received: from Berlix.phytec.de (172.25.0.12) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 30 Jul
 2024 11:07:28 +0200
Received: from Berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4]) by
 berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4%4]) with mapi id 15.01.2507.006;
 Tue, 30 Jul 2024 11:07:28 +0200
From: Dominik Haller <D.Haller@phytec.de>
To: "tony@atomide.com" <tony@atomide.com>, Steffen Hemer <S.Hemer@phytec.de>,
	"khilman@baylibre.com" <khilman@baylibre.com>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>
CC: PHYTEC Upstream <upstream@lists.phytec.de>
Subject: Re: [PATCH 1/2] ARM: dts: ti: omap: am335x-regor: Fix RS485 settings
Thread-Topic: [PATCH 1/2] ARM: dts: ti: omap: am335x-regor: Fix RS485 settings
Thread-Index: AQHa3p29V27MaJC/SkyWgc1E0QcNdLIOCRyAgADX7gA=
Date: Tue, 30 Jul 2024 09:07:28 +0000
Message-ID: <25ebcbe75bc395c53d4756f3b8eff2c0c7ee3d3e.camel@phytec.de>
References: <20240725141952.81213-1-d.haller@phytec.de>
	 <7hbk2g3qhe.fsf@baylibre.com>
In-Reply-To: <7hbk2g3qhe.fsf@baylibre.com>
Accept-Language: en-DE, de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8E8850EBBE85F42BD0BBBFF2A78CEAF@phytec.de>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsWyRpKBVzdw7Yo0g5XzmS1+tm9hspi9pJ/F
	Yv8VL4vud+oOLB7fvk5i8Xh/o5Xdo7+7hdXj8ya5AJYoLpuU1JzMstQifbsErozDDQoFMzgr
	7rUeZWxg/MHRxcjJISFgIvHr2g7mLkYuDiGBJUwSRycvYoRw7jNKzD3/ghXC2cAosWH+ZiaQ
	FjYBTYmXU2+zgtgiArsYJe5f9e9i5OBgFtCTuH7QGCQsLOArsXDVRSaIEj+Jvfdvs0PYVhIb
	Wh4wg9gsAqoSlz9/ZgOxeQXcJG4sucsIYgsJREg8ObMYLM4poCWx/O82sDmMAioSt1/+Aqth
	FhCX2PTsOyvEBwISS/acZ4awRSVePv4HFZeXOHFrGhPEaZoS63fpQ7RaSExZeZcFwlaUmNL9
	kB3iBEGJkzOfsExgFJ+FZMMshO5ZSLpnIemehaR7ASPrKkah3Mzk7NSizGy9gozKktRkvZTU
	TYygOBRh4NrB2DfH4xAjEwfjIUYJDmYlEd74K0vThHhTEiurUovy44tKc1KLDzFKc7AoifOu
	7ghOFRJITyxJzU5NLUgtgskycXBKNTDODlnroNa098LSWbwfVry+vGKJhzTblK8/y3Sj5S7v
	ZerIkvgces1t3my/5bOtJHdcTo9ad4VP/cTKY0v8mN6uEVB4bTlpZl7b8Ve7/8+Ie8r+S8ex
	XXr3cbETotcslN6qda6b7/t751ph9fikHeKN5/mZP1o/mnVV7cLCd6w7XxmlGC5dmMvcp8RS
	nJFoqMVcVJwIANuJGYGxAgAA

T24gTW9uLCAyMDI0LTA3LTI5IGF0IDEzOjE0IC0wNzAwLCBLZXZpbiBIaWxtYW4gd3JvdGU6DQo+
IERvbWluaWsgSGFsbGVyIDxkLmhhbGxlckBwaHl0ZWMuZGU+IHdyaXRlczoNCj4gDQo+ID4gRnJv
bTogU3RlZmZlbiBIZW1lciA8cy5oZW1lckBwaHl0ZWMuZGU+DQo+ID4gDQo+ID4gUlRTIHBpbiBz
ZWVtcyB0byBoYXZlIGludmVydGVkIGJlaGF2aW9yIG9uIGFtMzM1eCwgb3RoZXIgdGhhbg0KPiA+
IGV4cGVjdGVkDQo+ID4gd2l0aCBkZWZhdWx0ICJyczQ4NS1ydHMtYWN0aXZlLWhpZ2giIChpbnN0
ZWFkIG9mIGxvdyBvbiBpZGxlLCBoaWdoDQo+ID4gb24gc2VuZCwNCj4gPiBpdCBpcyB0aGUgb3Bw
b3NpdGUpLiBUcmFuc2NlaXZlciBkYXRhc2hlZXQgYWxzbyBzdWdnZXN0cyBhDQo+ID4gcHVsbGRv
d24uDQo+ID4gQWRkIGluY2x1ZGVzIHRvIHBpbiBkZWZpbml0aW9ucyB0aGF0IGFyZSB1c2VkLg0K
PiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFN0ZWZmZW4gSGVtZXIgPHMuaGVtZXJAcGh5dGVjLmRl
Pg0KPiANCj4gU2VyaWVzIExHVE0sIGJ1dCBhcyB0aGUgc2VuZGVyLCB3ZSBuZWVkIHlvdXIgU2ln
bmVkLW9mZi1ieSBoZXJlIHRvby4NCj4gU2VlIHRoZSBkb2NzIG9uIHN1Ym1pdHRpbmcgcGF0Y2hl
cyBmb3IgYWxsIHRoZSBkZXRhaWxzWzFdLg0KPiANCj4gS2V2aW4NCg0KU3VyZSwgSSdsbCBhZGQg
aXQgaW4gYSB2Mi4NCg0KVGhhbmtzDQoNCkRvbWluaWsNCj4gDQo+IFsxXSAgDQo+IGh0dHBzOi8v
d3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVz
Lmh0bWwjc2lnbi15b3VyLXdvcmstdGhlLWRldmVsb3Blci1zLWNlcnRpZmljYXRlLW9mLW9yaWdp
bg0K

