Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB721ECA86
	for <lists+linux-omap@lfdr.de>; Wed,  3 Jun 2020 09:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgFCH2n (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 3 Jun 2020 03:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgFCH2n (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 3 Jun 2020 03:28:43 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E95C05BD43
        for <linux-omap@vger.kernel.org>; Wed,  3 Jun 2020 00:28:42 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id f5so872185wmh.2
        for <linux-omap@vger.kernel.org>; Wed, 03 Jun 2020 00:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=vx88ON+UFkh4ABL4pG0NLQrIOYVxNTrYi/4Z1S6HqD0=;
        b=hCrkJTJWfBUV52aVTGVpRHJG44LK/LVRSC3DY3u2dKIeMTfwevh3sU7pclJOceR8SM
         48evXxGkiaFsg6e7/fpzqozMhwmOpCaFZw2uzkWfm2nFVhgtyMjnuRwp6ntzUjt6sjy+
         ELpdZwAqGZ8a6l8fxksM4LCTtR1718xF85Prj80teTw6cwbO0eQvp7eEVJurhktMpnKv
         NwpLrgOvbRhxxbWZ71U2QtBcvj+a/ZsNqHalByZJgQmhXRbwYiBK/IBw7aRv1xTE4POv
         NKA7s1gLfclVMYxs0nMx3woJc0SmTaE3I/31vSnvgh0MdcDiuU6vyQQPcCqKbYv/Mprn
         e77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=vx88ON+UFkh4ABL4pG0NLQrIOYVxNTrYi/4Z1S6HqD0=;
        b=RQ9dhSgGInQmPGQhZ43Lu8bVcBzy55wmGp49b5pAjesI/xX/AmtQxpk88rzvet/fsf
         rO/rNmkuSuzabOiIbfkWwT2t3hB/B7WxQUxraoG1cyT68qS1Q3lvfm2q7h5MwWstysIa
         hK2nto3mzgKsHzCPvdepm2bnyaZ4tHadINPZDjFZwc8/ldsZ9yVALDGdqkx/XMOkfqDx
         cIqUARUuSn2tz92k3HPfbNAyrCWxL6M2HcVJQ1/++XbEc5zsMs6ZtXdlqrywgMgKpCBY
         jUT31sdyYHHS0tt++rWAY/OUlCECuYV5sPRh/en3q8SEn24kqhKVgc3AeXQYhrkCnyH7
         eTSA==
X-Gm-Message-State: AOAM533R9KsN7V/ixv6DwsESr9rl0TrmPL22+A30WxwF5e8erDFC1boV
        ECvKnRVmJRqSRrRtZNzgDAo0kD/HtwTwUrxomok=
X-Google-Smtp-Source: ABdhPJwRJcii4ihsd1hlwCAcfc2YY5jqPaML6a6JW8BmFYit4rHaRpk8+X+oMwLaQmDKnBAS1jcYK5b/pARdEVHi7YQ=
X-Received: by 2002:a7b:c951:: with SMTP id i17mr7180873wml.44.1591169319225;
 Wed, 03 Jun 2020 00:28:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1c:7401:0:0:0:0:0 with HTTP; Wed, 3 Jun 2020 00:28:38 -0700 (PDT)
Reply-To: anitkwas@gmail.com
From:   "Ms. Anita Kwassou" <samolele25@gmail.com>
Date:   Wed, 3 Jun 2020 09:28:38 +0200
Message-ID: <CAC2D0BGOmGvCTHiSf46OQrLTG0f1M0JjNYu2-q5zS38sMvOFrQ@mail.gmail.com>
Subject: =?UTF-8?B?0KHQutGK0L8g0L/RgNC40Y/RgtC10LssIGhlbGxv?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

0KHQutGK0L8g0L/RgNC40Y/RgtC10LssDQoNCtCf0LjRiNCwINCy0Lgg0L7RgiDQn9Cw0YDQsNCz
0LLQsNC5INCyINC60L7QvNCw0L3QtNC40YDQvtCy0LrQsCDRgSDQvdC+0LLQsNGC0LAg0LzQuA0K
0L/QsNGA0YLQvdGM0L7RgCDRgdC70LXQtCDRg9GB0L/QtdGI0L3QvtGC0L4g0L/RgNC10LLQtdC2
0LTQsNC90LUg0L3QsCDRgdGA0LXQtNGB0YLQstCw0YLQsCDQsiDRgNCw0LfQvNC10YAg0L3QsCAk
DQo1LDUg0LzQuNC70LjQvtC90LAuDQoNCtCU0LAsINC60LDQutGC0L4g0LLQuCDQutCw0LfQsNGF
INC/0YDQtdC00LgsINC90LUg0YHRitC8INCw0LvRh9C10L0g0YfQvtCy0LXQuiDQuCDRgdGK0YnQ
viDQvtCx0LjRh9Cw0LwNCtGA0LDQt9C/0L7Qt9C90LDQudGC0LUg0YPRgdC40LvQuNGP0YLQsCDQ
vdCwINC90Y/QutC+0LPQviwg0LHQtdC3INC30L3QsNGH0LXQvdC40LUg0LrQsNC60YrQsiDQvNC+
0LbQtSDQtNCwINC1INC/0YDQvtCx0LvQtdC80YrRgiwNCtCp0LUg0LLQuCDQv9C+0LzQvtC70Y8g
0LTQsCDRgdC1INGB0LLRitGA0LbQtdGC0LUg0YEg0LzQvtGPINGB0LXQutGA0LXRgtCw0YA6DQoN
CtCTLdC20LAg0JDQvdC40YLQsCDQmtCy0LDRgdGDDQrQldC70LXQutGC0YDQvtC90L3QsCDQv9C+
0YnQsDogYW5pdGt3YXNAZ21haWwuY29tDQoNCtCTLdC20LAg0JDQvdC40YLQsCDRidC1INCy0Lgg
0LjQt9C/0YDQsNGC0Lgg0L7RgdC10LzQtNC10YHQtdGCINGF0LjQu9GP0LTQuCDQtNC+0LvQsNGA
0LAgKDgwIDAwMC4wMCDRidCw0YLRgdC60LgNCtC00L7Qu9Cw0YDQsCksINC60L7QuNGC0L4NCtGJ
0LUg0LHRitC00LUg0L/RgNC10YXQstGK0YDQu9C10L0g0LrRitC8INCy0LDRgSDQsiDQvNC10LbQ
tNGD0L3QsNGA0L7QtNC90LAg0LLQuNC30L7QstCwINC60LDRgNGC0LAg0LfQsCDQsdCw0L3QutC+
0LzQsNGCLA0KDQrQlNCw0LLQsNC8INCy0Lgg0YLQvtCy0LAg0L7QsdC10LfRidC10YLQtdC90LjQ
tSDQt9CwINCy0YHQuNGH0LrQuCDQstCw0YjQuCDQv9GA0LXQtNC40YjQvdC4INGD0YHQuNC70LjR
jyDQuCDRgdGD0LzQsNGC0LANCtC40L3QstC10YHRgtC40YDQsNGF0YLQtSDQsiDQv9GA0L7RhtC1
0YHQsCDQvdCwINC/0YDQtdCy0L7QtCwg0L3QviDQvdC1INC80L7QttCw0YXRgtC1INC00LAg0LfQ
sNCy0YrRgNGI0LjRgtC1DQrRgSDQvNC10L0g0LfQsNGA0LDQtNC4INGB0YLRgNCw0YUg0Lgg0L3Q
tdCy0LXRgNC40LUuDQoNCtCQ0Lcg0YHRitGJ0L4g0LLQuCDQtNCw0LLQsNC8INGC0LDQt9C4INC8
0LDQu9C60LAg0YHRg9C80LAg0LrQsNGC0L4g0L/RgNC40LfQvdCw0YLQtdC70L3QvtGB0YIg0LfQ
sCDQkdC+0LMNCtCx0LXQt9C60YDQsNC50L3QuCDQvNC40LvQvtGB0YLQuCDQtNCwINGB0LHRitC0
0L3QsCDQsiDRgtCw0LfQuCDQvNC+0Y8g0LzQtdGH0YLQsCwg0LAg0YHRitGJ0L4g0Lgg0LfQsA0K
0LLQvtC00LXQudC60Lgg0LzQtSDRgdC/0L7QutC+0LnQvdC+INCyINGC0LDQt9C4INGB0YLRgNCw
0L3QsC4NCg0K0KHQstGK0YDQttC10YLQtSDRgdC1INGBINCzLdC20LAg0JDQvdC40YLQsCDQuCDQ
vtCx0YHRitC00LXRgtC1INGBINC90LXQs9C+INC60LDQuiDQuNGB0LrQsNGC0LUg0LHQsNC90LrQ
vtC80LDRgtCwDQrQuNC30L/RgNCw0YLQtdC90L4g0LTQviDQstCw0YEg0Lgg0YHQtSDQvtC/0LjR
gtCw0LnRgtC1INC00LAg0LzQtSDQuNC90YTQvtGA0LzQuNGA0LDRgtC1INCy0LXQtNC90LDQs9Cw
INGJ0L7QvCDQv9C+0LvRg9GH0LjRgtC1INC60LDRgNGC0LDRgtCwLg0KDQrQndCw0Lkt0LTQvtCx
0YDQuCDQv9C+0LbQtdC70LDQvdC40Y8sDQrQk9C+0YHQv9C+0LTQuNC9INCh0LDQvCDQntC70LXQ
u9C1DQoNCg0KbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1t
bW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tbW1tDQoNCg0KRGVhciBmcmllbmQsDQoNCkkg
YW0gd3JpdGluZyB0byB5b3UgZnJvbSBQYXJhZ3VheSBvbiBhIGJ1c2luZXNzIHRyaXAgd2l0aCBt
eSBuZXcNCnBhcnRuZXIgYWZ0ZXIgdGhlIHN1Y2Nlc3NmdWwgdHJhbnNmZXIgb2YgdGhlIGZ1bmRz
IGluIHRoZSBhbW91bnQgb2YgJA0KNS41IG1pbGxpb24uDQoNClllcywgYXMgSSB0b2xkIHlvdSBi
ZWZvcmUsIEkgYW0gbm90IGEgZ3JlZWR5IHBlcnNvbiBhbmQgYWxzbyBsaWtlIHRvDQpyZWNvZ25p
emUgdGhlIGVmZm9ydHMgb2Ygc29tZW9uZSwgbm8gbWF0dGVyIHdoYXQgbWlnaHQgYmUgdGhlIHBy
b2JsZW0sDQpJIHdpbGwgcmVxdWVzdCB5b3UgdG8gY29udGFjdCBteSBzZWNyZXRhcnk6DQoNCk1z
LiBBbml0YSBLd2Fzc291DQpFLU1haWw6IGFuaXRrd2FzQGdtYWlsLmNvbQ0KDQpNcy4gQW5pdGEg
d2lsbCBzZW5kIHlvdSBFaWdodHkgVGhvdXNhbmQgZG9sbGFycyAoVVMkODAuMDAwLjAwKSB3aGlj
aA0KaXMgYmVlbiByb2xsZWQgdG8geW91IGludG8gYW4gaW50ZXJuYXRpb25hbCBBVE0gdmlzYSBj
YXJkLA0KDQpJIGdpdmUgeW91IHRoaXMgY29tcGVuc2F0aW9uIGZvciBhbGwgeW91ciBwYXN0IGVm
Zm9ydHMgYW5kIHRoZSBhbW91bnQNCnlvdSBpbnZlc3RlZCBpbiB0aGUgdHJhbnNsYXRpb24gcHJv
Y2VzcywgYnV0IHlvdSBjb3VsZG4ndCBjb21wbGV0ZQ0Kd2l0aCBtZSBiZWNhdXNlIG9mIGZlYXIg
YW5kIGRpc2JlbGlldmUuDQoNCkkgYW0gYWxzbyBnaXZpbmcgdG8geW91IHRoaXMgc21hbGwgYW1v
dW50IGFzIGFuIGFwcHJlY2lhdGlvbiBmb3IgR29kJ3MNCmVuZGxlc3MgbWVyY2llcyB0byBtYWtl
IGluIHRoaXMgbXkgZHJlYW0gY29tZSB0cnVlLCBhbmQgYWxzbyBmb3INCmxlYWRpbmcgbWUgcGVh
Y2VmdWxseSB0byB0aGlzIGNvdW50cnkuDQoNCkNvbnRhY3QgTXMuIEFuaXRhIGFuZCBkaXNjdXNz
IHdpdGggaGltIG9uIGhvdyB5b3Ugd2FudCB0aGUgQVRNIGNhcmQNCnNlbnQgdG8geW91IGFuZCB0
cnkgdG8gaW5mb3JtIG1lIGFzIHNvb24gYXMgeW91IHJlY2VpdmVkIHRoZSBjYXJkLg0KDQpCZXN0
IHdpc2hlcywNCk1yLiBTYW0gT2xlbGUNCg==
