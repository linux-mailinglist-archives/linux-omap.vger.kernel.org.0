Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7DA649CBD9
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jan 2022 15:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241408AbiAZOJA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Jan 2022 09:09:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235353AbiAZOJA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 Jan 2022 09:09:00 -0500
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F0BC06161C
        for <linux-omap@vger.kernel.org>; Wed, 26 Jan 2022 06:09:00 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id v192so14919207vkv.4
        for <linux-omap@vger.kernel.org>; Wed, 26 Jan 2022 06:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=GRybZZx/yAI+UIceFikNUm+eqIrA7gVuxPQPg37riLs=;
        b=OkkUkVnJpam4uRX0t7ug8kUFe7OcZUywiPC/+e/cSfbh0KVS7+fU/FixoUPt/CfHSp
         0slFtKWZ3CQjLj17+QmCbvIh2Kk/+Uyku7TOPNkDHzjT8Y3ShDv4tbKIAH4Qy7MRIzLG
         GYhl2898NJPC7jxazNPLH2Uu0wO5Z88zcg+YkartntCT827W4vWSW1ikZMsnXiImeycf
         c+jvwRHzbGyEfcMqffOJvLB/pz7Na5+8v6WaGHxC0Tnx6SJoaC0hJ7bHPr2djusCcbj5
         fKGc7ZCTYFTTAs+5H1kzUq/WU8y/hRRwYM8xBQMYYngheZoEDDuvxEf5lTolv6IEoyk7
         BAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=GRybZZx/yAI+UIceFikNUm+eqIrA7gVuxPQPg37riLs=;
        b=ygPzWCu/Q4rUSB4/mij9ooblT/IVbjOh2VuDFdDoKl3jcNJ4MdctHRvWtNCr+J27JZ
         m8Gvco2Z4z2H2sS3tApHt+BYtSzy2piprVWi5qDKdKpvLzd3Bs8ym5w0o1wacliJccNi
         TtiU8CGBQIsbFsa4k/w3STA9uaRyysW+nGssN6MUU74Ctk1X0gYPmmn21BUISiiSHWA9
         nxohCz5CyCwY1tB86pQyE5d3luaMVdbfBIl3+eV2gUNldaPK5MTBHdDI5F81YgWM3QXH
         fFhAhnpqGr96hZTO24dTSzdf3YARoAfeA5UMxqqiL5zINg07Qd4r3HFUyxEx1Tu+uCDb
         BflQ==
X-Gm-Message-State: AOAM532OmK3Sb2OBlWQWS34sE90G09tbKuyXdziIqqT1ACBagKd68zkl
        45arXgvGY6g1ekZoGgB660WbvWx2ou1OWmy899s=
X-Google-Smtp-Source: ABdhPJxtnqCkuTmcg2AZFOyHNVxDicTeglTh21C/hfVJA+Iz0ljCXuR5vtLtJ4FvqE93Ehgewk2SuM6rF/rEcVhkbUw=
X-Received: by 2002:a1f:2988:: with SMTP id p130mr8550647vkp.34.1643206139303;
 Wed, 26 Jan 2022 06:08:59 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9f:2c8a:0:0:0:0:0 with HTTP; Wed, 26 Jan 2022 06:08:59
 -0800 (PST)
Reply-To: orlandomoris56@gmail.com
From:   Orlando Moris <mrs.mitcheldelepeter01@gmail.com>
Date:   Wed, 26 Jan 2022 14:08:59 +0000
Message-ID: <CABmAZDirR3Wrkrbke_v3ntW6T4kFAaOWAimO1+5bQS-OBROZ6g@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

0JfQtNGA0LDQstC10LnRgtC1LCDQnNC+0LvRjyDQtNCwINCx0YrQtNC10YLQtSDQuNC90YTQvtGA
0LzQuNGA0LDQvdC4LCDRh9C1INGC0L7Qt9C4INC40LzQtdC50LssINC60L7QudGC0L4g0LTQvtC5
0LTQtSDQsg0K0L/QvtGJ0LXQvdGB0LrQsNGC0LAg0LLQuCDQutGD0YLQuNGPLCDQvdC1INC1INCz
0YDQtdGI0LrQsCwg0LAg0LUg0LDQtNGA0LXRgdC40YDQsNC9INGB0L/QtdGG0LjQsNC70L3QviDQ
tNC+INCy0LDRgSDQt9CwDQrQstCw0YjQtSDQstC90LjQvNCw0L3QuNC1LiDQmNC80LDQvCDQv9GA
0LXQtNC70L7QttC10L3QuNC1INCyINGA0LDQt9C80LXRgCDQvdCwICgkNy41MDAuMDAwLjAwKSwg
0L7RgdGC0LDQstC10L3Qvg0K0L7RgiDQvNC+0Y8g0L/QvtC60L7QudC10L0g0LrQu9C40LXQvdGC
INC40L3QttC10L3QtdGAINCa0LDRgNC70L7RgSwg0LrQvtC50YLQviDQvdC+0YHQuCDRgdGK0YnQ
vtGC0L4g0LjQvNC1INGBINCy0LDRgSwNCtC60L7QudGC0L4g0LUg0YDQsNCx0L7RgtC40Lsg0Lgg
0LbQuNCy0Y/QuyDRgtGD0Log0LIg0JvQvtC80LUg0KLQvtCz0L4uINCf0L7QutC+0LnQvdC40Y/R
giDQvNC4INC60LvQuNC10L3RgiDQuA0K0YHQtdC80LXQudGB0YLQstC+0YLQviDQvNC4INCx0Y/R
hdCwINC30LDQvNC10YHQtdC90Lgg0LIg0LDQstGC0L7QvNC+0LHQuNC70L3QsCDQutCw0YLQsNGB
0YLRgNC+0YTQsCwg0LrQvtGP0YLQviDQvtGC0L3QtQ0K0LbQuNCy0L7RgtCwINC40LwgLiDQodCy
0YrRgNC30LLQsNC8INGB0LUg0YEg0LLQsNGBINC60LDRgtC+INC90LDQuS3QsdC70LjQt9GK0Log
0YDQvtC00L3QuNC90LAg0L3QsCDQv9C+0YfQuNC90LDQu9C40Y8sINC30LANCtC00LAg0LzQvtC2
0LXRgtC1INC00LAg0L/QvtC70YPRh9C40YLQtSDRgdGA0LXQtNGB0YLQstCw0YLQsCDQv9C+INC4
0YHQutC+0LLQtS4g0J/RgNC4INCx0YrRgNC3INC+0YLQs9C+0LLQvtGAINGJ0LUg0LLQuA0K0LjQ
vdGE0L7RgNC80LjRgNCw0Lwg0LfQsCDRgNC10LbQuNC80LjRgtC1INC90LANCtC40LfQv9GK0LvQ
vdC10L3QuNC1INC90LAg0YLQvtC30Lgg0LTQvtCz0L7QstC+0YAuLCDRgdCy0YrRgNC20LXRgtC1
INGB0LUg0YEg0LzQtdC9INC90LAg0YLQvtC30Lgg0LjQvNC10LnQuw0KKG9ybGFuZG9tb3JpczU2
QGdtYWlsLmNvbSkNCg==
