Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E93341FFB
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 10:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437418AbfFLIzK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 04:55:10 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46686 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731917AbfFLIzK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Jun 2019 04:55:10 -0400
Received: by mail-lf1-f65.google.com with SMTP id z15so8752453lfh.13
        for <linux-omap@vger.kernel.org>; Wed, 12 Jun 2019 01:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kYmy1iwC9fHd5KWLhp1RgKawKxO1mu1wxNioKBbyABA=;
        b=h6usaoQug8lDvGPga/GoFi0ROvWZSoFgoJtb4cGyFbDPe9GepaD4ZR88gxTxmAKSjc
         k0s72v3ZCuBZW4L7iF3K1umMYln6/dVvvGLdZu5CuzqWT8CynCANyyq3R3cltgLDim9e
         VHu5z3PS7r3qGy/XdpON1jH5mX+WY+z4Phh8ItRc8wbT0fCciV76wmJf7Ar7v8p8sOPd
         2wpDzzpluUdLY5pgT2SJWi/3bPsjuvRdWl+C76gGgK5BoOo3D3rV6GbR1NXnbpQq7d1H
         RuSbtTsf56z6dcb1ezTBGHpBPegXMwulv3qa5Hl+yfTXHsS54N+2Cs1S/qK5uNuGNNPw
         TfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kYmy1iwC9fHd5KWLhp1RgKawKxO1mu1wxNioKBbyABA=;
        b=NnS6Me7JuJu96V41TNKkRoPh5bE7VAOS4YnVcXHsb32MyeELx9waTaMkk0sLHHV+i/
         eIO76H85FCqxHOv3MpN0BMyT7qqhMeXPBkpdwICV0mI5fmtCrVGFixjpjg4iIm4uEJlD
         EDbCnOPBBKGUFdwbbTb6Se45vGysdh+l2bIJ3pI90aMFe/QJm1G/aO3lFNabHBC88Rtl
         Qis3bLZBBJaAIbQCcy9PvAv1t6NGJKcaqjFlmQWpHcAxt4kPpXJWFP8VEz4kmzedBRG+
         gQ/oKOZVmGwAUPHcc7+JdZ8EPzDa7FMP+qfzNdFPrkxdcsVFY50OhxeNdYuPTl+eyVKf
         69jw==
X-Gm-Message-State: APjAAAW7hmGY9IFM0SFM9Rn6P2vQqqaZ9qvvAeDFwZ7fPs6wq3Z36nz1
        vZXadbXajKfNHDrTRvBJWtYxHQEAIFRVQvWDzcz5pw==
X-Google-Smtp-Source: APXvYqzeDRSSKfvhmShyB+/P0FILzPLpf2pje3o4J+5k4U0J1a8BDmwLQm4k9Sil0KRtpRKe+JdwQr33hsfwQpyIN2g=
X-Received: by 2002:a19:dc0d:: with SMTP id t13mr16897617lfg.152.1560329708499;
 Wed, 12 Jun 2019 01:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-15-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-15-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 10:54:57 +0200
Message-ID: <CACRpkdZ0fwHuFr9f_QTn=gXGo56Vo1CUM7=zmiCaxfwjp_Pyxg@mail.gmail.com>
Subject: Re: [PATCH-next 14/20] gpio: gpio-omap: simplify omap_set_gpio_irqenable()
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Russell King <rmk@arm.linux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 10, 2019 at 7:12 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> From: Russell King <rmk+kernel@armlinux.org.uk>
>
> omap_set_gpio_irqenable() calls two helpers that are almost the same
> apart from whether they set or clear bits. We can consolidate these:
>
> - in the set/clear bit register case, we can perform the operation on
>   our saved context copy and write the appropriate set/clear register.
> - otherwise, we can use our read-modify-write helper and invert enable
>   if irqenable_inv is set.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
