Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD9133B41C4
	for <lists+linux-omap@lfdr.de>; Fri, 25 Jun 2021 12:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbhFYKiD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 25 Jun 2021 06:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbhFYKiB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 25 Jun 2021 06:38:01 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A45C061767
        for <linux-omap@vger.kernel.org>; Fri, 25 Jun 2021 03:35:41 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id m9so3900885ybp.8
        for <linux-omap@vger.kernel.org>; Fri, 25 Jun 2021 03:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XuyawgNRHN+GNy+ExSdldcw4VdYfoXPvkpdvbIVsf8g=;
        b=kGLbpMdoeDkgYTJUKqEss8DtNEoyFnxR+aqHyX0q/hvfhKa4w/LBH9IwCrfwSup8Ib
         u0lipAxDRstRHB8jm0B07kTb9CBpvatmPgypyx6nBi1424R2pW9BvQm+bBgN/nDK6JTq
         LoTLj9TBsa+0gl8+CFrpizeHQGqiqUZ5Ec/4BPrD4YyrSqzU368UivvpKg1pbrPUOFdm
         M0mH5k53iYR4HBX5VYq41YiaduH+6x7ECMC3l5hpcohzz2MgJjeV6+qmeADhHAxcrKsT
         Lw3A8vRbIuIalO5TbhTohFHpzdKUiKiqtdHEFbbwN8pyL2S705tBsxJ4upPOwmVDyYTa
         OdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XuyawgNRHN+GNy+ExSdldcw4VdYfoXPvkpdvbIVsf8g=;
        b=UM3Lj8ong+VXNrb5p9b198ymH8QbDxsqZV18JOzDIcGWtXvtJXuF34KamgTfokVkmH
         daOW2kYdmOUzfSpPl8iHV9hWO3OLAywsfARFKpbYai30EKKc727ytK+6adEXZZq5SvJt
         hzvHdfo1kE4WAmGDupBIGaCx2Gq7Gpp+gEfdISRMi40pDi8SBFwv3QEdP5BAz1CiP3WF
         TmIYiaRZ10iSUoNQEa290gpBP51YqZGKUMdGwljIikBJymRfJY/BP6atYk8NCINH+e4K
         965fYcIRSTi43FFIk9ilYcOnqaMdIXAcpbIkXej7xiuNLtkhx6PdVi1bhCbRpwBROK0x
         I1wg==
X-Gm-Message-State: AOAM531TpWreGfiqiCjpAhU22BWNlxnjmt0grwmQOHW22UXIfWLEQDlA
        UcmQLlzYcNR8CiYulDhV/i/W5iSh8LvPjkqSKdkexg==
X-Google-Smtp-Source: ABdhPJxJT+QqliI2OJ1I6zfOUsy81qiwuujuaFIKa8tlrDFM9WKhADyT6txKHYMiDlQe21lr+h/nKAmhvA54nYdcrE0=
X-Received: by 2002:a25:d68e:: with SMTP id n136mr11403632ybg.302.1624617340272;
 Fri, 25 Jun 2021 03:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622560799.git.geert+renesas@glider.be> <7caa954add90255fc177e5dbabe17d62e0242861.1622560799.git.geert+renesas@glider.be>
In-Reply-To: <7caa954add90255fc177e5dbabe17d62e0242861.1622560799.git.geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 25 Jun 2021 12:35:29 +0200
Message-ID: <CAMpxmJWpPQZczvhEfzyjef9on1Lr-3zduxwmcEzdq__C3-kb4A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: gpio: pcf857x: Convert to json-schema
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>, x86@kernel.org,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 1, 2021 at 5:25 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Convert the PCF857x-compatible I/O expanders Device Tree binding
> documentation to json-schema.
>
> Document missing compatible values, properties, and gpio hogs.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied with Linus' and Rob's tags.

Bart
