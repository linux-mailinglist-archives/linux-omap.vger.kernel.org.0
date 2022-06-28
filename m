Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4339D55DAFA
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 15:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231565AbiF1EGf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jun 2022 00:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbiF1EGe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jun 2022 00:06:34 -0400
Received: from m1550.mail.126.com (m1550.mail.126.com [220.181.15.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 823F92C119;
        Mon, 27 Jun 2022 21:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=XWeHT
        AWwOqeIwM0omsKO9lmRWk4etNQ5KQlcaSVkBdU=; b=mAwf6Q0zU1m5++ke0dgEN
        NpPj2G9FjnZxtPGf/1cMKj2qHoctUf1PPmzyXSvhr9mtW9+ZBb8+HEbnsn95nbdt
        DV7mGnH6eTd9Ld9N+vTtg9kTmT/3XNM37ngEYT1waUswukHpyKfwiUeT40t+JcAC
        qhz2SI3K33qwCe41cXIHEE=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr50
 (Coremail) ; Tue, 28 Jun 2022 12:05:45 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Tue, 28 Jun 2022 12:05:45 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Tony Lindgren" <tony@atomide.com>
Cc:     andre.przywara@arm.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
        "Krzysztof Kozlowski" <krzk@kernel.org>
Subject: Re:Re: [PATCH] arm/mach: Hold reference returned by of_find_xxx
 APIs
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <Yrp8sUMdmfYsiUsD@atomide.com>
References: <20220621091937.4082422-1-windhl@126.com>
 <Yrp8sUMdmfYsiUsD@atomide.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <45bb4c11.34fc.181a87c93dd.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowACn9fEafrpiDOY+AA--.21859W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhcuF18RPY+UrwADsk
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

CgoKCgpBdCAyMDIyLTA2LTI4IDExOjU5OjQ1LCAiVG9ueSBMaW5kZ3JlbiIgPHRvbnlAYXRvbWlk
ZS5jb20+IHdyb3RlOgo+KiBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+IFsyMjA2MjEgMTI6MTRd
Ogo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1vbWFwMi9wbWljLWNwY2FwLmMgYi9hcmNo
L2FybS9tYWNoLW9tYXAyL3BtaWMtY3BjYXAuYwo+PiBpbmRleCA2NjhkYzg0ZmQzMWUuLmE3MzY4
ZDY1N2FhOCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vbWFjaC1vbWFwMi9wbWljLWNwY2FwLmMK
Pj4gKysrIGIvYXJjaC9hcm0vbWFjaC1vbWFwMi9wbWljLWNwY2FwLmMKPj4gQEAgLTIzOCw4ICsy
MzgsMTEgQEAgc3RhdGljIHN0cnVjdCBvbWFwX3ZvbHRkbV9wbWljIG9tYXA0X2Zhbl9pdmEgPSB7
Cj4+ICBpbnQgX19pbml0IG9tYXA0X2NwY2FwX2luaXQodm9pZCkKPj4gIHsKPj4gIAlzdHJ1Y3Qg
dm9sdGFnZWRvbWFpbiAqdm9sdGRtOwo+PiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7Cj4+ICAK
Pj4gLQlpZiAoIW9mX2ZpbmRfY29tcGF0aWJsZV9ub2RlKE5VTEwsIE5VTEwsICJtb3Rvcm9sYSxj
cGNhcCIpKQo+PiArCW5wID0gb2ZfZmluZF9jb21wYXRpYmxlX25vZGUoTlVMTCwgTlVMTCwgIm1v
dG9yb2xhLGNwY2FwIik7Cj4+ICsJb2Zfbm9kZV9wdXQobnApOwo+PiArCWlmICghbnApCj4+ICAJ
CXJldHVybiAtRU5PREVWOwo+Cj5IbW0gc28gaGVyZSB5b3UgYXJlIGNoZWNraW5nIGZvciAhbnAg
YWZ0ZXIgb2Zfbm9kZV9wdXQoKT8KCkhpLCBUb255LgoKVGhhbmtzIHZlcnkgbXVjaCBmb3IgeW91
ciBlZmZvcnQgdG8gcmV2aWV3IG15IGNvZGUuCgpJIGp1c3Qgd2FudGVkIHRvIHVzZSB0aGlzICdj
aGVjay1hZnRlci1wdXQnIGNvZGluZyBzdHlsZSB0byBrZWVwIGNvbnNpc3RlbnQgd2l0aApleGlz
dGluZyBzdHlsZS4gCgpCdXQgYmFzZWQgb24gdGhlIGRpc2NjdXNzaW9uIHdpdGggR3JlZyBLSCwg
eWVzdGVyZGF5LCBJIGFtIG5vdyBwcmVwYXJpbmcgJ2NoZWNrLXRoZW4tcHV0JyAKY29kaW5nIHN0
eWxlIHBhdGNoLgoKTGluazogCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8xYmVkMDZlNS40
M2RhLjE4MWE1YmFjN2U1LkNvcmVtYWlsLndpbmRobEAxMjYuY29tLwoKPgo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0vbWFjaC10ZWdyYS9pcnEuYyBiL2FyY2gvYXJtL21hY2gtdGVncmEvaXJxLmMK
Pj4gaW5kZXggNGUxZWU3MGIyYTNmLi4yYWVhYzA0MWJjYjkgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gv
YXJtL21hY2gtdGVncmEvaXJxLmMKPj4gKysrIGIvYXJjaC9hcm0vbWFjaC10ZWdyYS9pcnEuYwo+
PiBAQCAtODgsNyArODgsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgdGVn
cmFfaWN0bHJfbWF0Y2hbXSBfX2luaXRjb25zdCA9IHsKPj4gIAo+PiAgdm9pZCBfX2luaXQgdGVn
cmFfaW5pdF9pcnEodm9pZCkKPj4gIHsKPj4gLQlpZiAoV0FSTl9PTighb2ZfZmluZF9tYXRjaGlu
Z19ub2RlKE5VTEwsIHRlZ3JhX2ljdGxyX21hdGNoKSkpCj4+ICsJc3RydWN0IGRldmljZV9ub2Rl
ICpucDsKPj4gKwo+PiArCW5wID0gb2ZfZmluZF9tYXRjaGluZ19ub2RlKE5VTEwsIHRlZ3JhX2lj
dGxyX21hdGNoKTsKPj4gKwlvZl9ub2RlX3B1dChucCk7Cj4+ICsJaWYgKFdBUk5fT04oIW5wKSkK
Pj4gIAkJcHJfd2FybigiT3V0ZGF0ZWQgRFQgZGV0ZWN0ZWQsIHN1c3BlbmQvcmVzdW1lIHdpbGwg
Tk9UIHdvcmtcbiIpOwo+PiAgCj4+ICAJdGVncmExMTRfZ2ljX2NwdV9wbV9yZWdpc3RyYXRpb24o
KTsKPgo+SGVyZSB0b28uCj4KPlJlZ2FyZHMsCj4KPlRvbnkKClRoYW5rcyBhZ2FpbiwgVG9ueS4K
Ckkgd2lsbCBzZW5kIGEgbmV3ICdjaGVjay1hbmQtcHV0JyBwYXRjaCBzb29uLgoKTGlhbmcK
