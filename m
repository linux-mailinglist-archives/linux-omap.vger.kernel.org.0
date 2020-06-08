Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF9001F1884
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jun 2020 14:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729620AbgFHMJn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Jun 2020 08:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729655AbgFHMJn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 8 Jun 2020 08:09:43 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2729EC08C5C3
        for <linux-omap@vger.kernel.org>; Mon,  8 Jun 2020 05:09:43 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id i27so9203728ljb.12
        for <linux-omap@vger.kernel.org>; Mon, 08 Jun 2020 05:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Csn8KyDxlJnuN8p2QHdR8JXGYy4Wt0VYt2wzsa2XpmM=;
        b=vfMDaX2zzlrSnow55/RVFfgZNvOQQIOlg0+UADwTfo8NoD4IcmMyMQETnO6jCYVH5P
         SIkK9gILG10+4Bo1Y8ZAraKkA7SBM818PZN7Nog3zHnz4wVaUFMpU8VlEpN68CfGac92
         NauAcX9ToavwhBOKNACj4SnUqWT1nMvI42llswTwsX+iEVUWjDoQ7zSbveBxVnGhdOxh
         oLaGn9rm5RYSFOgofUz0Geg4ejiSRgXg6f7vCaKwD+JSy0AM85Bn/82oonnqwweMAy5h
         Rdmj0/l0e3y0nucJdtRe3YoB6lvVGhQ1th8te9rvdbv7juBxxiHZ55PoRmpailYdihRJ
         DqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Csn8KyDxlJnuN8p2QHdR8JXGYy4Wt0VYt2wzsa2XpmM=;
        b=uKdAmIXlUMHbwAAk4E/U9uBXCt8VXsTiKOr4ah8zExMaLkCZvFBYDWMk9c2jrAImUd
         evjQ/HUPXYM64xJ2SXWDrHYYUctmaGA4QMv/f5CsMP3uyRPy/Z+5MVXJ+wuQcpsSAwv0
         8asdO5M0hZNYpqXEFuRcdeMtmBIhGDgyq4Hd+nhjZzmPzQIIq/tXxhOMGYosqq/tXr6n
         yklQIBI9XRpmlHH5ELuv00r27A3nPnYPBoGy7v+MazifeFNg82n8mV/3R67BtqKBpjpT
         jqqMuyam0S0LD13jWh4kD0+eRMxTGPtDXSRDOPhUNIdUWDXffORHxRa5RQA/y86qjxmp
         wxHg==
X-Gm-Message-State: AOAM531sDeapKNc/1Na6O6AgQdoF3LOz6EBIgPqhbCKCbo1zOcnkz3Bo
        G8uPuErIQcGCsLnsKs7fFVyCY6+srW1byASvqEESGQ==
X-Google-Smtp-Source: ABdhPJxygKDGdQRQPGBYKTQqKJCd6k5YRc6rzNmwz77L6cJGWdHonWxHMEo58eZaVq/HyScv9iBfqeevK9kAW96xKxo=
X-Received: by 2002:a2e:5304:: with SMTP id h4mr5424716ljb.293.1591618181290;
 Mon, 08 Jun 2020 05:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200526122133.GA1454440@x1> <20200529175544.GA3766151@x1> <20200531001709.GA168774@x1>
In-Reply-To: <20200531001709.GA168774@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 8 Jun 2020 14:09:30 +0200
Message-ID: <CACRpkdYox64qGhxu2ycd-18Q08cKjt=Z019qVfdFEdRdTxxq3g@mail.gmail.com>
Subject: Re: pinctrl-single: num_maps in generic pinconf support?
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, May 31, 2020 at 2:17 AM Drew Fustini <drew@beagleboard.org> wrote:

> Does this appear to be a reasonable solution?
>
> I would appreciate any comments.

Looks reasonable to me. I suggest you send a proper patch. Tony?

Yours,
Linus Walleij
