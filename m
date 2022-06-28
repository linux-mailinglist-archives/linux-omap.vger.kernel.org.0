Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0687755DB11
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 15:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245378AbiF1GKL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jun 2022 02:10:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244245AbiF1GKK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jun 2022 02:10:10 -0400
Received: from m1550.mail.126.com (m1550.mail.126.com [220.181.15.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7788E255AC
        for <linux-omap@vger.kernel.org>; Mon, 27 Jun 2022 23:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=2RdSr
        sY+nJ5E6fa1l8uPHFyvEzRB7viHlj2G/FYvFF4=; b=IQHRnm7KyGZI/FSzgkuA4
        iQws80LX7t0sSOk6XTQRgodtMjnr8JeMWtswmXdRDoH0VVMnC3YlNpeof9ipYKfl
        ZF/s4oPoB8vlZ573vI1Xb3pw9bMgZM/psYKbhMi0eXgCQNzzjKP+hFnU03MHhlS2
        kQMfriwr/dzPJzPqvfskFg=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr50
 (Coremail) ; Tue, 28 Jun 2022 14:09:37 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Tue, 28 Jun 2022 14:09:37 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Tony Lindgren" <tony@atomide.com>
Cc:     p.zabel@pengutronix.de, linux-omap@vger.kernel.org
Subject: Re:Re: [PATCH v2] bus/ti-sys: Fix refcount leak bugs
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <YrqZX+bwQYQNgZ6m@atomide.com>
References: <20220620145619.4074665-1-windhl@126.com>
 <YrqZX+bwQYQNgZ6m@atomide.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <462f1827.4050.181a8edfab0.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowABHnfEhm7piHfY+AA--.22795W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgguF1-HZZWxUwABsg
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

CgoKQXQgMjAyMi0wNi0yOCAxNDowMjowNywgIlRvbnkgTGluZGdyZW4iIDx0b255QGF0b21pZGUu
Y29tPiB3cm90ZToKPiogTGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPiBbMjIwNjIwIDE3OjUxXToK
Pj4gLS0tIGEvZHJpdmVycy9idXMvdGktc3lzYy5jCj4+ICsrKyBiL2RyaXZlcnMvYnVzL3RpLXN5
c2MuYwo+PiBAQCAtNzUxLDYgKzc1MSw3IEBAIHN0YXRpYyB2b2lkIHN5c2NfaW5pdF9zdGRvdXRf
cGF0aChzdHJ1Y3Qgc3lzYyAqZGRhdGEpCj4+ICAJCWdvdG8gZXJyOwo+PiAgCj4+ICAJdWFydCA9
IG9mX2dldF9wcm9wZXJ0eShucCwgInN0ZG91dC1wYXRoIiwgTlVMTCk7Cj4+ICsJb2Zfbm9kZV9w
dXQobnApOwo+PiAgCWlmICghdWFydCkKPj4gIAkJZ290byBlcnI7Cj4+ICAKPgo+TG9va3MgbGlr
ZSB5b3UgbWlzc2VkIGFub3RoZXIgb2Zfbm9kZV9wdXQoKSBhZnRlciBvZl9maW5kX25vZGVfYnlf
cGF0aCgpCj5pbiBzeXNjX2luaXRfc3Rkb3V0X3BhdGgoKS4gUGxlYXNlIGFkZCBpdCBhbmQgcmVw
b3N0Lgo+Cj5UaGFua3MsCj4KPlRvbnkKClRoYW5rcywgSSB3aWxsIHJlc2VuZCBhIG5ldyBwYXRj
aCBzb29uLgo=
