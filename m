Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFB33623101
	for <lists+linux-omap@lfdr.de>; Wed,  9 Nov 2022 18:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbiKIRE3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Nov 2022 12:04:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231785AbiKIREH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Nov 2022 12:04:07 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46498CE10
        for <linux-omap@vger.kernel.org>; Wed,  9 Nov 2022 09:03:15 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id g12so26672358wrs.10
        for <linux-omap@vger.kernel.org>; Wed, 09 Nov 2022 09:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newflow-co-uk.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7G92ASLkDEj3WR74LeIL8CkjO77TIo2iLMTmhY7uzIs=;
        b=cFS+8bUPusCc9rZmvY4wocMkbGyjfdTvKCdg4DhL3Poo5EnbNkUIB9LfBqcOO2khzx
         oT3Laxk4/u2Go8Oq86ISZsQHo9KLq3LWVTSHP1SSzLSpN3GfvYQheQALxmiPdqhvRxxS
         xOA0BBvSj/91k3W1HtkbSLS94Aat9IRdJkMfZ4tg+1ebK466lgLjv/+TpRBG66WQKFWO
         AS9NZJeTWJI0X+nAJrFBCNqPXNZogj9Ss6vSms/w2dvzMM/CWP+zv1OLhM0Gt62GKe1o
         sF9V3gfZZRl5nNA+EErA0FEwj1iuU/W1lRaFBImU7Bk9mzXULLUdvDlkyDnMIo5UI9nF
         J5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7G92ASLkDEj3WR74LeIL8CkjO77TIo2iLMTmhY7uzIs=;
        b=N0bIn6KZaJLg/9aO1GpwZbrUR8D9B2B8mkAiTyezpxsEdFZTKxBttO+Mz24/kgz+0Z
         WirgRnKaoqe26QuqDg/ozQlyZYQU6o2XZTS4gqvHbI7dJc7lQv9liCWs04z4RGWrIhX2
         l/PuHHBYLEi4/hEqjWseikhHSizPfZWZiWefweYXRjdLHOGzjDnRRCE60A0cuNOBCNYX
         O1WZ4phc+S6WqqOpuZuFRlfum+pdIwMOCWzL7JBhWrLBvsboPAAEZ8ZpzEXhyInmN3BT
         L+hQRjRPKtOzeYkwxHqYoerwOlhDgri1WH95S3zWPug5gKo4OJBiZJYhZ6dJ6iW0LcKK
         RQsA==
X-Gm-Message-State: ACrzQf1HGQfYiKSJYdBW1zzHLe3sHf95MqNA9v1Lxc5d105O26udQLs0
        3h8tXUylP3za8pQR10xIhw5m2oCgx/ybuauK87eflQ==
X-Google-Smtp-Source: AMsMyM6nxJk2cKpqTddTA8Vw5W4rCmbadnXXSULNgsdBGYhgBjGZcqN5qYrQxlbV5kiC6JJT3UCle1XX7Nky9kCxxik=
X-Received: by 2002:adf:f88b:0:b0:236:7134:d4ec with SMTP id
 u11-20020adff88b000000b002367134d4ecmr37191544wrp.669.1668013393820; Wed, 09
 Nov 2022 09:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20221109160904.183147-1-mpfj@newflow.co.uk> <20221109160904.183147-2-mpfj@newflow.co.uk>
 <3c530543-6d89-bf63-8734-7ccb02aede84@linaro.org> <CAAbcLfjKxZfn8JW6h_k2S42_OHEU366xVm3U=3FWdacGTq6wZA@mail.gmail.com>
 <59ceb2d7-fb46-848e-163e-e0e54c9e6195@linaro.org>
In-Reply-To: <59ceb2d7-fb46-848e-163e-e0e54c9e6195@linaro.org>
From:   Mark Jackson <mpfj@newflow.co.uk>
Date:   Wed, 9 Nov 2022 17:03:02 +0000
Message-ID: <CAAbcLfgJxAKhWVVZr5Q0A+Z-pHD=RS293mZRqQNyOmaihPv01w@mail.gmail.com>
Subject: Re: [PATCH 1/5] ARM: dts: nanobone: Fix GPIO settings for RTS/CTS
 pins on UART3 & 4
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 9 Nov 2022 at 16:58, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 09/11/2022 17:57, Mark Jackson wrote:
> > On Wed, 9 Nov 2022 at 16:22, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 09/11/2022 17:09, Mark Jackson wrote:
> >>> The NanoBone platform uses GPIO pins for RTS/CTS control.
> >>> The DTS still uses the hardware RTS/CTS pins so this needs fixing.
> >>>
> >>> Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
> >>> ---
> >>>  arch/arm/boot/dts/am335x-nano.dts | 8 ++++----
> >>
> >> You still use a bit odd subject prefixes. What did the log tell you for
> >> am335x files?
> >
> > Aha, now I understand ... I need to change "nanobone" in the title to
> > "am335x-nano" to match our dts file, correct ?
>
> Yes, I think this is the most popular subject prefix. It allows
> sub-architecture maintainers to understand what is it about.

Seems reasonable ... I was almost correct with my first attempt.
I'll send myself off for re-training ...

Cheers
Mark J.
