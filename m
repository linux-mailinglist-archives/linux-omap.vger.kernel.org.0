Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C947D564F2B
	for <lists+linux-omap@lfdr.de>; Mon,  4 Jul 2022 09:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232817AbiGDH5X (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Jul 2022 03:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbiGDH5X (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Jul 2022 03:57:23 -0400
Received: from m151.mail.126.com (m151.mail.126.com [220.181.15.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 89284A46A
        for <linux-omap@vger.kernel.org>; Mon,  4 Jul 2022 00:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=ioGcx
        Y0ANtK4o+rbjfDAFIfaNracBOUAkwXcnYh1Dw4=; b=oAPuebUmY0hhM8Zm1w3c0
        W4kQkCrJA8++zWmZneQ/INOpm303FrUGm5KLResxN305lbadpsCx1y8QWFTCZFfl
        +BF57T6GewEMxbZUX9LWPo0QpBAwxOvA80ppTGSAu7cY+0hLN9Lz858tD8IXGyDx
        cu3a1u/huPOl5pWWLodsyc=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr1
 (Coremail) ; Mon, 4 Jul 2022 15:56:49 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Mon, 4 Jul 2022 15:56:49 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Tony Lindgren" <tony@atomide.com>
Cc:     linux@armlinux.org.uk, linux-omap@vger.kernel.org
Subject: Re:Re: [PATCH 3/3] arm: omap2: prm_common: Add the refcount for new
 reference creation
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <YsKa9czyRpYa7UDA@atomide.com>
References: <20220701112649.233322-1-windhl@126.com>
 <20220701112649.233322-3-windhl@126.com> <YsKa9czyRpYa7UDA@atomide.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <4345478.2c70.181c836488e.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AcqowADH2LBCncJixNceAA--.28748W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgI0F1-HZbsn8AAAsq
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

CgpBdCAyMDIyLTA3LTA0IDE1OjQ3OjAxLCAiVG9ueSBMaW5kZ3JlbiIgPHRvbnlAYXRvbWlkZS5j
b20+IHdyb3RlOgo+KiBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+IFsyMjA3MDEgMTQ6MjJdOgo+
PiBJbiBvbWFwMl9wcm1fYmFzZV9pbml0KCksIGZvcl9lYWNoX21hdGNoaW5nX25vZGVfYW5kX21h
dGNoKCkgY2FuCj4+IGF1dG9tYXRpY2FsbHkgaW5jcmVhc2UgYW5kIGRlY3JlYXNlIHRoZSByZWZj
b3VudGluZy4gSG93ZXZlciwgYQo+PiBuZXcgcmVmZXJlbmNlIGlzIGVzY2FwZWQgb3V0IGludG8g
J2RhdGEtPm5wJywgc28gd2UgbmVlZCB0byB1c2UKPj4gb2Zfbm9kZV9wdXQoKSBmb3IgdGhlIG9s
ZCByZWZlcmVuY2UgYW5kIHVzZSBvZl9ub2RlX2dldCgpIGZvciB0aGUKPj4gbmV3IG9uZS4KPj4g
Cj4+IFNpZ25lZC1vZmYtYnk6IExpYW5nIEhlIDx3aW5kaGxAMTI2LmNvbT4KPj4gLS0tCj4+ICBh
cmNoL2FybS9tYWNoLW9tYXAyL3BybV9jb21tb24uYyB8IDMgKystCj4+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vbWFjaC1vbWFwMi9wcm1fY29tbW9uLmMgYi9hcmNoL2FybS9tYWNoLW9tYXAyL3BybV9j
b21tb24uYwo+PiBpbmRleCBmYjJkNDhjZmU3NTYuLmJlZDE1MWUzZjE2NSAxMDA2NDQKPj4gLS0t
IGEvYXJjaC9hcm0vbWFjaC1vbWFwMi9wcm1fY29tbW9uLmMKPj4gKysrIGIvYXJjaC9hcm0vbWFj
aC1vbWFwMi9wcm1fY29tbW9uLmMKPj4gQEAgLTc2NCw3ICs3NjQsOCBAQCBpbnQgX19pbml0IG9t
YXAyX3BybV9iYXNlX2luaXQodm9pZCkKPj4gIAkJCXBybV9iYXNlLnBhID0gcmVzLnN0YXJ0ICsg
ZGF0YS0+b2Zmc2V0Owo+PiAgCQl9Cj4+ICAKPj4gLQkJZGF0YS0+bnAgPSBucDsKPj4gKwkJb2Zf
bm9kZV9wdXQoZGF0YS0+bnApOwo+PiArCQlkYXRhLT5ucCA9IG9mX25vZGVfZ2V0KG5wKTsKPj4g
IAo+PiAgCQlpZiAoZGF0YS0+aW5pdCkKPj4gIAkJCWRhdGEtPmluaXQoZGF0YSk7Cj4KPkhtbSBz
byBJIGRvbid0IGdldCBob3cgdGhpcyBpbXByb3ZlcyB0aGluZ3M/IERvbid0IHdlIGVuYWJsZSB3
aXRoCj50aGUgc2FtZSByZWZjb3VudGluZz8KPgo+UmVnYXJkcywKPgo+VG9ueQoKSGksIFRvbnku
CgpUaGFua3MgdmVyeSBtdWNoIGZvciByZXZpZXdpbmcgdGhpcyBwYXRjaC4KCkkgdHJ5IHRvIGV4
cGxhaW4gYXMgZm9sbG93aW5nOgoKRmlyc3QsIHRoZXJlIGlzIGFuIG9sZCByZWZlcmVuY2UgKHBv
aW50ZXIpICBwb2ludGluZyB0byBkZXZpY2Vfbm9kZSBBIGFuZCBzdG9yZWQgaW4gZGF0YS0+bnAu
ClRoZW4sIGluIHRoZSBmb3JfZWFjaF94eHggaXRlcmF0aW9uLCAnbnAnIGlzIGEgbmV3IHJlZmVy
ZW5jZSAocG9pbnRlcikgcG9pbnRpbmcgdG8gZGV2aWNlX25vZGUgQi4KCkFmdGVyICdkYXRhLT5u
cCA9IG5wJyBpcyBkb25lLCB0aGUgb2xkIHJlZmVyZW5jZSBpcyBkZXN0cm95ZWQgYW5kIGl0cyBy
ZWZjb3VudCBzaG91bGQgYmUgZGVjcmVhc2VkLgpTaW1pbGFybHksIGEgbmV3IHJlZmVyZW5jZSB0
byBkZXZjZV9ub2RlIEIgaXMgY3JlYXRlZCBpbiAnZGF0YS0+bnAnLCBzbyBpdHMgcmVmY291bnQg
c2hvdWxkIGJlIGluY3JlYXNlZC4KClNvcnJ5IGlmIG15IHVuZGVyc3RhbmRpbmcgaXMgd3Jvbmcg
b3IgaWYgSSBkbyBub3QgY2F0Y2ggeW91ciBwb2ludC4KClRoYW5zIGFnYWluLAoKTGlhbmcKCg==

