Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74D9355DF9C
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 15:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245459AbiF1GY1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jun 2022 02:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245021AbiF1GY1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jun 2022 02:24:27 -0400
Received: from m1550.mail.126.com (m1550.mail.126.com [220.181.15.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 582CEE64
        for <linux-omap@vger.kernel.org>; Mon, 27 Jun 2022 23:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=3zZ42
        gcxDTQU0xnQDgA5lhfRbBeY8fJL6kbXAVZB5gQ=; b=Yxe+siL/XqYN3dQJz/WLo
        0zAEzMRxOjVmsMdcGD7spGDOPY6FQbSuwq4XDJCYn50E/UxFi/HXRw6yWBg8RlhC
        OtT0hpvGzedBIn8gBggSGhipzGPmWohs5I643CWQrVF4ZbYeE0eEGXVSLTrlNkDJ
        lLAH96r10WzNquZxh+cICw=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr50
 (Coremail) ; Tue, 28 Jun 2022 14:24:10 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Tue, 28 Jun 2022 14:24:10 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Tony Lindgren" <tony@atomide.com>
Cc:     p.zabel@pengutronix.de, linux-omap@vger.kernel.org
Subject: Re:Re:Re: [PATCH v2] bus/ti-sys: Fix refcount leak bugs
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <462f1827.4050.181a8edfab0.Coremail.windhl@126.com>
References: <20220620145619.4074665-1-windhl@126.com>
 <YrqZX+bwQYQNgZ6m@atomide.com>
 <462f1827.4050.181a8edfab0.Coremail.windhl@126.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <72f5a5a8.42a3.181a8fb4c13.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowADXLPGLnrpiU_k+AA--.21379W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgguF1-HZZWxUwADsi
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

CkF0IDIwMjItMDYtMjggMTQ6MDk6MzcsICJMaWFuZyBIZSIgPHdpbmRobEAxMjYuY29tPiB3cm90
ZToKPgo+Cj4KPkF0IDIwMjItMDYtMjggMTQ6MDI6MDcsICJUb255IExpbmRncmVuIiA8dG9ueUBh
dG9taWRlLmNvbT4gd3JvdGU6Cj4+KiBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+IFsyMjA2MjAg
MTc6NTFdOgo+Pj4gLS0tIGEvZHJpdmVycy9idXMvdGktc3lzYy5jCj4+PiArKysgYi9kcml2ZXJz
L2J1cy90aS1zeXNjLmMKPj4+IEBAIC03NTEsNiArNzUxLDcgQEAgc3RhdGljIHZvaWQgc3lzY19p
bml0X3N0ZG91dF9wYXRoKHN0cnVjdCBzeXNjICpkZGF0YSkKPj4+ICAJCWdvdG8gZXJyOwo+Pj4g
IAo+Pj4gIAl1YXJ0ID0gb2ZfZ2V0X3Byb3BlcnR5KG5wLCAic3Rkb3V0LXBhdGgiLCBOVUxMKTsK
Pj4+ICsJb2Zfbm9kZV9wdXQobnApOwo+Pj4gIAlpZiAoIXVhcnQpCj4+PiAgCQlnb3RvIGVycjsK
Pj4+ICAKPj4KPj5Mb29rcyBsaWtlIHlvdSBtaXNzZWQgYW5vdGhlciBvZl9ub2RlX3B1dCgpIGFm
dGVyIG9mX2ZpbmRfbm9kZV9ieV9wYXRoKCkKPj5pbiBzeXNjX2luaXRfc3Rkb3V0X3BhdGgoKS4g
UGxlYXNlIGFkZCBpdCBhbmQgcmVwb3N0Lgo+Pgo+PlRoYW5rcywKPj4KPj5Ub255Cj4KCj5UaGFu
a3MsIEkgd2lsbCByZXNlbmQgYSBuZXcgcGF0Y2ggc29vbi4KCgpTb3JyeSwgVG9ueS4KCgpJIGhh
dmUgcmUtY2hlY2tlZCB0aGUgc3lzY19pbml0X3N0ZG91dF9wYXRoKCksIEkgdGhpbmsgdGhlIHNl
Y29uZCBvZl9ub2RlX3B1dCAKaXMgbm90IG5lZWRlZCBhcyB0aGUgc2Vjb25kICducCcgd2lsbCBi
ZSBlc2NhcGVkIG91dCBpbnRvIGdsb2JhbCAnc3Rkb3V0X3BhdGgnLgoKCklmIG15IHVuZGVyc3Rh
bmRpbmcgaXMgd3JvbmcsIHBsZWFzZSBjb3JyZWN0IG1lLgoKClRoYW5rcy4KTGlhbmc=
