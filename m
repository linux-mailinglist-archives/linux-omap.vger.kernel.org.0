Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0F5340F16B
	for <lists+linux-omap@lfdr.de>; Fri, 17 Sep 2021 06:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244681AbhIQEmV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Sep 2021 00:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244727AbhIQElr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Sep 2021 00:41:47 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87114C061764
        for <linux-omap@vger.kernel.org>; Thu, 16 Sep 2021 21:40:26 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id k23so6132939pji.0
        for <linux-omap@vger.kernel.org>; Thu, 16 Sep 2021 21:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:mime-version:content-transfer-encoding:to
         :subject;
        bh=99dnI6Yiko9tOVotoU21jpfEqdw0Zz8tg9ozywxVMfo=;
        b=hKW4r2pCsnbykyLFChXVy6yhXOHKG0ohP5U2zv+rYdTT/7yJRqD5C45l3OzeWBGdpT
         nDZcH8c+Xijmj3YzCrzBA6Fwyql90XYQKFFeRXBPJxtQJvvMWMFN+KfnmIKgJFVvve7p
         BWdTMXa+yCWKmmqXcu+4+QNz2gNV/n7guvcsp7hWi2igi+cET4mot2bZ0gIbtKQ+M1/v
         vH2TMxBw/xEsyeaPmr5F13qP+MD2SF4ps5DjLWIbchWxwXn4gi+WQ92IRzVa3w3esU7h
         EAGNPG/Hp0WB6Twgucr129o50lj2y0MrHfGu01KXW9jJnYRpWbv1Pk/px+pauG5gaVmg
         8xuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:mime-version
         :content-transfer-encoding:to:subject;
        bh=99dnI6Yiko9tOVotoU21jpfEqdw0Zz8tg9ozywxVMfo=;
        b=DcFmF+leFQeh7pJ9Qbb0yfjvXCek/RckaDs/XA1Q/DylPCGLXwMUgo5HmuI4kyKp2C
         Q06MuLpveA3eYRVoVagdh2rdO5uXRdFksR/ozUkZkGxnk8h4HvPGT6Go/oZnEWEQdp/L
         iSNh8H4NrtVJY5G9oWv1lVPuIAgnreZGtj8repbrEZbmbjXG25FQo243MuxJu2MvqdyM
         spD3fnOS/9M+9ECBqmqLPt0AIwNOGClz8lR62/gpFedUagwPNC0HPjWlkH3mGHD2Lkrd
         19UWyKVug+ihBtNuJhIigGYnjL2jbTKhRrYVLcfn4Unn3izEY0xUOqQvoOyI2n4BzxWS
         5wtw==
X-Gm-Message-State: AOAM5302O4F6bR0LO93mnNAyeN+1+FOu6Xi3/dkckkM2STjW2sQjlGwc
        Wan3B0HnjzDbE+LmCOGZlLxGubi/SYQ=
X-Google-Smtp-Source: ABdhPJwt2HKHACShaNXNwVILD7/oh/Nz+omfMCvYHqm0LoYAcOjHhre++goWcXychvn47ojtwoV+1w==
X-Received: by 2002:a17:90b:198c:: with SMTP id mv12mr9950609pjb.223.1631853625622;
        Thu, 16 Sep 2021 21:40:25 -0700 (PDT)
Received: from [10.198.75.60] (211-20-175-1.hinet-ip.hinet.net. [211.20.175.1])
        by smtp.gmail.com with ESMTPSA id c15sm4488208pfl.181.2021.09.16.21.40.24
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 21:40:25 -0700 (PDT)
Message-ID: <61441c39.1c69fb81.72427.3001@mx.google.com>
Date:   Thu, 16 Sep 2021 21:40:25 -0700 (PDT)
From:   "=?utf-8?q?ellen?=" <denyscaldwell1@gmail.com>
X-Google-Original-From: =?utf-8?q?ellen?=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
To:     =?utf-8?q?linux-omap=40vger=2Ekernel=2Eorg?=@vger.kernel.org
Subject: =?utf-8?q?Blog_cooperation?=
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

CkhlbGxvLAoKSXQncyBncmVhdCB0byBoYXZlIHRoZSBvcHBvcnR1bml0eSB0byBlbmpveSByZWFk
aW5nIGJsb2dzLgoKVGhpcyBpcyBvdXIgd2Vic2l0ZTogaHR0cHM6ICAgICAgIC8vICAgICAgIHd3
dy4gICAgICAgICAgICBsZW50aW9uLiAgICAgICAgICAgICBjb20KCldlIHNpbmNlcmVseSBpbnZp
dGUgeW91IHRvIGNvb3BlcmF0ZSB3aXRoIHVzOgoKWW91IHdyaXRlIGEgaGlnaC1xdWFsaXR5IGFy
dGljbGUgb2YgODAwLTEwMDAgd29yZHMgZm9yIG1lIGFuZCBwdWJsaXNoIGl0IG9uIHlvdXIgd2Vi
c2l0ZS4gQWZ0ZXIgcHVibGlzaGluZywgeW91IGNhbiBwdWJsaXNoIGl0IG9uIHlvdXIgc29jaWFs
IGJsb2cgb3Igd2Vic2l0ZSBmb3IgcGVybWFuZW50IHJldGVudGlvbi4gSG93IG11Y2ggZG8gSSBu
ZWVkIHRvIHBheSBmb3IgdGhpcz8gPyBQbGVhc2UgZ2l2ZSBtZSBhIHF1b3RlIQoKT2YgY291cnNl
LCBJIGFsc28gYWNjZXB0IGludGVyc3RpdGlhbCBsaW5rcyBhbmQgYWR2ZXJ0aXNpbmcgYmFubmVy
cywgYnV0IEkgbmVlZCB0byBrbm93IHRoZWlyIHByaWNlcyEKCklmIHlvdSBoYXZlIG1vcmUgd2Vi
c2l0ZXMgYWJvdXQgQXBwbGUgY29tcHV0ZXIgYWNjZXNzb3JpZXMgb3IgZWxlY3Ryb25pYyBwcm9k
dWN0cywgeW91IGNhbiBzZW5kIHRoZW0gdG8gbWUgZm9yIGluc3BlY3Rpb24uCgpUaGlzIGlzIG15
IFNoYXJlYXNhbGUgSUQsIHdoaWNoIGlzIDEwMDk0My4gWW91IGNhbiBhbHNvIGpvaW4gb3VyIG1l
bWJlcnNoaXAgcGxhbiBmb3IgbG9uZy10ZXJtIGNvb3BlcmF0aW9uIQoKV2FpdGluZyBmb3IgeW91
ciBwb3NpdGl2ZSByZXBseS4KQmVzdCB3aXNoZXMh
