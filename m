Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6DEB22AD97
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 13:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728666AbgGWLVX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 07:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728663AbgGWLVD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 07:21:03 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55882C0619E4
        for <linux-omap@vger.kernel.org>; Thu, 23 Jul 2020 04:20:59 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 9so4604143wmj.5
        for <linux-omap@vger.kernel.org>; Thu, 23 Jul 2020 04:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=cq5UFsGM4PwbW1qFMIEr855aXB0O6MiL01vlSKcAzk8=;
        b=KytZh9UnUDim2wAZoUN7fbP/fKy8ZwVeBJ7TWqNhWdU6W6uh7i+FtCKzmWvfvZv6hf
         ycZ+iBjEZXKTRlh7TBoQtDkDqBtdxwgQkYvwqMg/7Z5GbsNzD5ESatBd9U7qnNyvCHxZ
         Z6IGH15rdF5RQT7Le8IUI6uApoe0buZI5rZpvTKt86NHhVjGCbugtJKDGiuQcNyjI9ul
         hN+5sM564AX70iXZPGKeGTI+qS67b99sBbwG8TImeet8ePGbwWYbTxnVuPRe7Ei9v2aW
         58c/EXaheUL8ELQ/gx7wKA2xieBSgKIvWNF9PfnWbnj81e7K+K1v7yjo55WJ9TI+9Eg9
         ZoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=cq5UFsGM4PwbW1qFMIEr855aXB0O6MiL01vlSKcAzk8=;
        b=MSYTxhWh6ngV6xPkqBfB4XkOLn+e958+f5bweW/KkfNlpd0tNoGfTYJ7lN57XMy85p
         IMh+neB438EoshlwRZvK19erDEPnahlJC0pvtBh+YjwV5G1Pal2wAny/na1wnG5h1QLC
         wIAmIbHNBbLruj9gA+BTxrrx510OfLnFWLSukUgmYOui9KTtUHAObA/gZufpFGHKuKZ1
         anb8F/mguIGZtC89rxsWEKt/UctQQBjULdVOoehzXXtCEqQX56krBGI9O5zOk+FD1iNM
         QN0/7Z3bymVWPIJWuhhGa7v0hXUSe95rJ51zK9Op7cnVtmBqdZKH1eB0w1tdsnPj4DbF
         zcew==
X-Gm-Message-State: AOAM533QQBBt0x5YQ6SmroW53amr2Sno2LSp7xjBZ0b6u+54zkTx5BIb
        ZtoniKo16MlAFZlC1ESM0l/JU5Ly8kf1vjcv8xI=
X-Google-Smtp-Source: ABdhPJz59Y2v9g6RHFo0PIRwkSA3oiyMAeWQq5emT1enaUFqyrWZxeL/bP//act1bDBq3dUS0lrIsk/EqNGX1Svd8zQ=
X-Received: by 2002:a7b:c952:: with SMTP id i18mr4000116wml.65.1595503257912;
 Thu, 23 Jul 2020 04:20:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:9267:0:0:0:0:0 with HTTP; Thu, 23 Jul 2020 04:20:57
 -0700 (PDT)
Reply-To: godardchambers@yandex.com
From:   Luis Fernandez Godard <doran11karn@gmail.com>
Date:   Thu, 23 Jul 2020 13:20:57 +0200
Message-ID: <CAFyBfXJFn9QL6ukyOJ1e=6PKqG1SkMxYOcn_ubYmJSvFmRHNGA@mail.gmail.com>
Subject: =?UTF-8?B?TmFsw6loYXbDoSB6cHLDoXZhLA==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

TmFsw6loYXbDoSB6cHLDoXZhLA0KDQpKYWsgb2JlY27Emz8gRG91ZsOhbSwgxb5lIHNlIHRhdG8g
enByw6F2YSBzIHbDoW1pIGRvYsWZZSBzZXRrw6F2w6EuDQpOZXphcG9tZcWIdGUgcHJvc8OtbSB0
dXRvIHpwcsOhdnUgbmEgcm96ZMOtbCBvZCBkxZnDrXbEm2rFocOtY2gsIHByb3Rvxb5lIHbDocWh
DQpkxJtkaWNrw70gZm9uZCB2ZSB2w73FoWkgOSwyIG1pbGlvbnUgVVNEIG55bsOtIG9kaGFsdWpl
IHZhxaFpIG9rYW3Fvml0b3UNCnBveml0aXZuw60gb2Rwb3bEm8SPLiBWeXrDvXbDoW0gdsOhcyB2
xaFhaywgYWJ5c3RlIGxhc2thdsSbIHDFmWVkYWxpIHN2w6kgY2Vsw6kNCmptw6lubzogWmVtxJs6
IEFkcmVzYTogUG92b2zDoW7DrTogUm9kaW5uw70gc3RhdjogUG9obGF2w606IFbEm2s6IFNvdWty
b23DqQ0KxI3DrXNsbzoga29uZcSNbsSbLCBQbGF0bsOhIGtvcGllIGlkZW50aXR5Og0KDQpTIMO6
Y3RvdSBWw6HFoS4NCkJhcnJpc3RlciBMdWlzIEZlcm5hbmRleiBHb2RhcmQgKEVzcSkuDQo=
