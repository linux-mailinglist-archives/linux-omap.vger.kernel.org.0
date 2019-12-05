Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8104E11430B
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2019 15:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729587AbfLEOxG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Dec 2019 09:53:06 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:42255 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729099AbfLEOxG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Dec 2019 09:53:06 -0500
X-UUID: 86ed07e071ba49d8bf7c145295ada760-20191205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=6kQKQGw6gLI7hXnDOfChEvohmSGc02ZjJsmKqHdzu6I=;
        b=uCB06N5np6GGST9drgN1p/HxUt6ZwSW8hGcye0dW3wJIudqWGxtT4pVOKfNvApRrJSu+O4+UQlf/7NOOGycpKI1iUPERlgpxReUIQHHSi3XNWWJPfCI+/NCJ3ErKwUfOmMj4uWtZkTe+rlQbzC23NuygH79pa/hi0fybRaDVfq8=;
X-UUID: 86ed07e071ba49d8bf7c145295ada760-20191205
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <macpaul.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 628453250; Thu, 05 Dec 2019 22:52:59 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Dec 2019 22:52:46 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Dec 2019 22:52:25 +0800
Message-ID: <1575557578.6727.2.camel@mtkswgap22>
Subject: Re: [PATCH] usb: musb: replace all unsigned data type to unsigned
 int
From:   Macpaul Lin <macpaul.lin@mediatek.com>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
CC:     Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        "Chen-Yu Tsai" <wens@csie.org>,
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-omap@vger.kernel.org>, Bin Liu <b-liu@ti.com>,
        <linux-arm-kernel@lists.infradead.org>
Date:   Thu, 5 Dec 2019 22:52:58 +0800
In-Reply-To: <20191205101216.GC1337@shell.armlinux.org.uk>
References: <1575525677-20760-1-git-send-email-macpaul.lin@mediatek.com>
         <20191205101216.GC1337@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

T24gVGh1LCAyMDE5LTEyLTA1IGF0IDEwOjEyICswMDAwLCBSdXNzZWxsIEtpbmcgLSBBUk0gTGlu
dXggYWRtaW4gd3JvdGU6DQo+IE9uIFRodSwgRGVjIDA1LCAyMDE5IGF0IDAyOjAxOjE3UE0gKzA4
MDAsIE1hY3BhdWwgTGluIHdyb3RlOg0KPiA+IFNpbXBseSByZXBsYWNlIGFsbCAndW5zaWduZWQn
IGRhdGEgdHlwZSBpbiBtdXNiIGRyaXZlciB0bw0KPiA+ICd1bnNpZ25lZCBpbnQnIGJlY2F1c2Ug
aXQgaGFzIGJlZW4gY29tcGxhaW5lZCBieSBnZXJyaXQNCj4gPiBjaGVja3BhdGNoIHNlcnZpY2Uu
DQo+IA0KPiAidW5zaWduZWQiIGlzIHBlcmZlY3RseSBsZWdhbCBzdGFuZGFyZCBDLiAgVGhlIHBv
bGljeSBmb3IgbmV0IHJlbGF0ZWQNCj4gY29kZSBpcyB0byBhYmhvciBpdCwgYnV0IHRoZXJlIGlz
IG5vdGhpbmcgaW4gdGhlIGtlcm5lbCBzdHlsZQ0KPiBndWlkZWxpbmVzIHRoYXQgcHJldmVudHMg
aXRzIHVzZSBpbiB0aGUgcmVzdCBvZiB0aGUga2VybmVsLg0KPiANCj4gQUZBSUNTIHRoZXJlIGlz
IG5vIG5lZWQgZm9yIHRoaXMgY2h1cm4uDQoNClRoYW5rcyBmb3IgeW91ciByZXBseS4NCkknbGwg
YnJpbmcgdGhpcyBzdWdnZXN0aW9uIGJhY2sgdG8gb3VyIGludGVybmFsIGNoZWNrcGF0Y2gucGwg
b3duZXJzIHRvDQphbGlnbiB3aXRoIGtlcm5lbCdzIHJ1bGVzLg0KDQpSZWdhcmRzLA0KTWFjcGF1
bCBMaW4NCg==

