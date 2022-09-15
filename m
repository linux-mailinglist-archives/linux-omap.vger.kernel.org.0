Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B86905B9BA5
	for <lists+linux-omap@lfdr.de>; Thu, 15 Sep 2022 15:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbiIONNz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Sep 2022 09:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiIONNx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Sep 2022 09:13:53 -0400
X-Greylist: delayed 1868 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 15 Sep 2022 06:13:51 PDT
Received: from m1524.mail.126.com (m1524.mail.126.com [220.181.15.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A67254AD69
        for <linux-omap@vger.kernel.org>; Thu, 15 Sep 2022 06:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=bUqev
        mQkiasDs3rj+QQsV1i1zWnd/VIJCE87i0de9uY=; b=Qtrnai/RD8yyZGcOI8sLH
        P+FNDQX1VIHf8st9/9CDs79ktZoNJOPZrX/hFUuPqHnxGFQ8OCWv3p5ZGBkzrKeP
        9QBzro4fWf6E7DyFue1a8fsq601mCyLmePHK3yGYZvFYyBqTAvgjN4Rfn7YdYJkQ
        H06Re2zSe3YwqqQR1RUDuE=
Received: from windhl$126.com ( [8.219.73.50, 14.29.82.34] ) by
 ajax-webmail-wmsvr24 (Coremail) ; Thu, 15 Sep 2022 20:41:36 +0800 (CST)
X-Originating-IP: [8.219.73.50, 14.29.82.34]
Date:   Thu, 15 Sep 2022 20:41:36 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     tony@atomide.com, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, chenmengda2009@163.com
Subject: Re:Re: [PATCH] ARM: OMAP2+: Hold reference returned from
 of_find_xxx API
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <YyMMttSW97iYbkfL@shell.armlinux.org.uk>
References: <20220915014258.3999504-1-windhl@126.com>
 <YyMMttSW97iYbkfL@shell.armlinux.org.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <7b0dd7d7.76f8.183412b3f13.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GMqowACHjyeBHSNjemV2AA--.38320W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2hp9F1uwMvl-+gABsO
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

CgoKQXQgMjAyMi0wOS0xNSAxOToyOTo1OCwgIlJ1c3NlbGwgS2luZyAoT3JhY2xlKSIgPGxpbnV4
QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj5PbiBUaHUsIFNlcCAxNSwgMjAyMiBhdCAwOTo0Mjo1
OEFNICswODAwLCBMaWFuZyBIZSB3cm90ZToKPj4gSW4gb21hcDRfdHdsX2luaXQoKSwgd2Ugc2hv
dWxkIGhvbGQgdGhlIHJlZmVyZW5jZSByZXR1cm5lZCBmcm9tCj4+IG9mX2ZpbmRfY29tcGF0aWJs
ZV9ub2RlKCkgd2hpY2ggaGFzIGluY3JlYXNlZCB0aGUgcmVmY291bnQgYW5kCj4+IHRoZW4gY2Fs
bCBvZl9ub2RlX3B1dCgpIHdpdGggaXQgd2hlbiBkb25lLgo+PiAKPj4gRml4ZXM6IGNjZDM2OTQ1
NWEyMyAoIkFSTTogT01BUDIrOiBSZW1vdmUgYm9ndXMgd2FybmluZ3MgZm9yIG1hY2hpbmVzIHdp
dGhvdXQgdHdsIFBNSUMiKQo+PiBTaWduZWQtb2ZmLWJ5OiBMaWFuZyBIZSA8d2luZGhsQDEyNi5j
b20+Cj4+IFNpZ25lZC1vZmYtYnk6IE1lbmdkYSBDaGVuIDxjaGVubWVuZ2RhMjAwOUAxNjMuY29t
Pgo+PiAtLS0KPj4gIGFyY2gvYXJtL21hY2gtb21hcDIvb21hcF90d2wuYyB8IDYgKysrKy0tCj4+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+PiAKPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtb21hcDIvb21hcF90d2wuYyBiL2FyY2gvYXJtL21h
Y2gtb21hcDIvb21hcF90d2wuYwo+PiBpbmRleCBkNGRhYjA0MTMyNGQuLjA3YjVmMTcwNjZjZSAx
MDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vbWFjaC1vbWFwMi9vbWFwX3R3bC5jCj4+ICsrKyBiL2Fy
Y2gvYXJtL21hY2gtb21hcDIvb21hcF90d2wuYwo+PiBAQCAtMjEzLDExICsyMTMsMTMgQEAgc3Rh
dGljIHN0cnVjdCBvbWFwX3ZvbHRkbV9wbWljIG9tYXA0X2NvcmVfcG1pYyA9IHsKPj4gIGludCBf
X2luaXQgb21hcDRfdHdsX2luaXQodm9pZCkKPj4gIHsKPj4gIAlzdHJ1Y3Qgdm9sdGFnZWRvbWFp
biAqdm9sdGRtOwo+PiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7Cj4+ICAKPj4gIAlpZiAoIWNw
dV9pc19vbWFwNDR4eCgpIHx8Cj4+IC0JICAgIG9mX2ZpbmRfY29tcGF0aWJsZV9ub2RlKE5VTEws
IE5VTEwsICJtb3Rvcm9sYSxjcGNhcCIpKQo+PiArCSAgICAobnAgPSBvZl9maW5kX2NvbXBhdGli
bGVfbm9kZShOVUxMLCBOVUxMLCAibW90b3JvbGEsY3BjYXAiKSkpIHsKPj4gKwkJb2Zfbm9kZV9w
dXQobnApOwo+Cj5UaGlzIGlzIGJ1Z2d5IC0gaWYgY3B1X2lzX29tYXA0NHh4KCkgaXMgZmFsc2Us
IHRoZW4gbnAgd2lsbCBub3QgYmUKPmluaXRpYWxpc2VkLiBUaGUgc2ltcGxlIHNvbHV0aW9uIGlz
IHRvIGluaXRpYWxpc2UgbnAgdG8gTlVMTC4KPgoKVGhhbmtzLCBJIHdpbGwgc2VuZCBhIG5ldyB2
ZXJzaW9uIHNvb24uCgpMaWFuZwoKPi0tIAo+Uk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3
dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCj5GVFRQIGlzIGhlcmUhIDQwTWJw
cyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQo=
